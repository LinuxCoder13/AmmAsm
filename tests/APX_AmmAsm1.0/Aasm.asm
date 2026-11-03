; ===================================================================================
;                              AmmAsm 1.0 - APX build 
; ===================================================================================
;
;  Same program as Aasm.asm, rewritten with Intel APX:
;    EGPR r16-r31     scratch registers and register-resident state
;    NDD              three operand add / sub / and / or / shl / shr / cmov
;    NF               {nf} shifts that must not disturb live compare flags
;    ZU               {zu} setcc replaces xor + setcc and branchy boolean returns
;    CCMP / CTEST     whole condition chains collapse into one flags test
;    PUSH2 / POP2     prologues and epilogues
;    NDD cmovcc       branch-free selection tables
;    JMPABS           one absolute tail jump (eval_expr)
;  No CFCMOV: nothing here reads memory that may be invalid.
;
;  Calling convention: System V AMD64, libc through extern.
;  Entry point: _start (no crt: argc and argv are read from the stack).
;  Needs a CPU with APX (or Intel SDE):  sde64 -future -- ./aasm input.asm, else SIGILL
; ===================================================================================


extern strcasecmp
extern strncasecmp
extern strdup
extern strncpy
extern strlen
extern memset
extern strtol
extern atoi
extern atoll
extern ldiv
extern snprintf
extern printf
extern dprintf
extern exit
extern fopen
extern fclose
extern fgets
extern fwrite
extern fflush

global _start

; --- token types -----------------------------------------------------------
macro T_INS()       {0x00}
macro T_INT()       {0x01}
macro T_LAB()       {0x02}
macro T_REG8()      {0x03}
macro T_REG16()     {0x04}
macro T_REG32()     {0x05}
macro T_REG64()     {0x06}
macro T_ADDR_EXPR() {0x09}
macro T_ID()        {0x0a}
macro T_STR()       {0x0b}
macro T_EOL()       {0x0c}
macro T_EOF()       {0x0d}
macro T_SEC()       {0x0e}
macro T_CHAR()      {0x17}
macro T_COMMA()     {0x18}

; --- operand types (O_REG8..O_REG64 == T_REG8..T_REG64) ---------------------
macro O_REG8()      {3}
macro O_REG64()     {6}
macro O_IMM()       {7}
macro O_MEM()       {8}
macro O_LABEL()     {9}

macro MAX_TOKENS()  {1024}

; ============================================================================
;  Layouts
; ============================================================================
;  Token (16 bytes):   +0 char* value | +8 int type | +12 int line
;
;  AST node (512 bytes):
;     +0   dd  type            (0 = AST_INS, 1 = AST_LABEL)
;     +4   dd  oper_count
;     +8   dd  machine_code_size
;     +16  db  cmd[64]         (instruction name / label name)
;     +80  db  operands[4][64]
;     +336 dd  otype[4]
;     +352 db  machine_code[16]
;     +368 dq  label address
;
;  AddrExpr (48 bytes, global ae):
;     +0  dd base_is_reg   +4  dd index_exists   +8  dd scale
;     +12 dd base_num      +16 dd index_num      +24 dq disp_val
;     +32 db base_reg[8]   +40 db index_reg[8]
; ============================================================================

section .data

tokens_count dd 0
ast_count    dd 0
pc           dd 0


; --- instruction list: NUL separated strings, list ends with an empty string ---
cmds   db "mov", 0, "push", 0, "pop", 0, "syscall", 0, "call", 0, "jmp", 0, "add", 0, "sub", 0
cmds2  db "mul", 0, "div", 0, "je", 0, "jne", 0, "jg", 0, "jl", 0, "jge", 0, "jle", 0, "jz", 0, "ja", 0, "jb", 0
CMDS3  db "xor", 0, "or", 0, "cmp", 0, "inc", 0, "dec", 0, "nop", 0, "ret", 0, "leave", 0, "test", 0, "lea", 0, "not", 0
CMDS4  db "and", 0, "shl", 0, "shr", 0
CMDS5  db 0

; --- registers: one flat NUL separated list (65 names) --------------------
regs8    db "al",  0, "bl",  0, "cl",   0, "dl",   0, "sil",  0, "dil",  0, "spl",  0, "bpl",  0
regs8GP  db "r8b", 0, "r9b", 0, "r10b", 0, "r11b", 0, "r12b", 0, "r13b", 0, "r14b", 0, "r15b", 0
regs16   db "ax",  0, "bx",  0, "cx",   0, "dx",   0, "si",   0, "di",   0, "sp",   0, "bp",   0
regs16GP db "r8w", 0, "r9w", 0, "r10w", 0, "r11w", 0, "r12w", 0, "r13w", 0, "r14w", 0, "r15w", 0
regs32   db "eax", 0, "ebx", 0, "ecx",  0, "edx",  0, "esi",  0, "edi",  0, "esp",  0, "ebp",  0
regs32GP db "r8d", 0, "r9d", 0, "r10d", 0, "r11d", 0, "r12d", 0, "r13d", 0, "r14d", 0, "r15d", 0
regs64   db "rax", 0, "rbx", 0, "rcx",  0, "rdx",  0, "rsi",  0, "rdi",  0, "rsp",  0, "rbp",  0, "rip", 0
regs64GP db "r8",  0, "r9",  0, "r10",  0, "r11",  0, "r12",  0, "r13",  0, "r14",  0, "r15",  0
regs_end db 0

; size class of every name above: 1 = 8bit, 2 = 16bit, 3 = 32bit, 4 = 64bit
regcls  db 1, 1, 1, 1, 1, 1, 1, 1,   1, 1, 1, 1, 1, 1, 1, 1
regcls2 db 2, 2, 2, 2, 2, 2, 2, 2,   2, 2, 2, 2, 2, 2, 2, 2
regcls3 db 3, 3, 3, 3, 3, 3, 3, 3,   3, 3, 3, 3, 3, 3, 3, 3
regcls4 db 4, 4, 4, 4, 4, 4, 4, 4, 4,   4, 4, 4, 4, 4, 4, 4, 4

; hardware number (what goes into modrm / opcode / rex), 255 = rip (not encodable)
regnum  db 0, 3, 1, 2, 6, 7, 4, 5,       8, 9, 10, 11, 12, 13, 14, 15
regnum2 db 0, 3, 1, 2, 6, 7, 4, 5,       8, 9, 10, 11, 12, 13, 14, 15
regnum3 db 0, 3, 1, 2, 6, 7, 4, 5,       8, 9, 10, 11, 12, 13, 14, 15
regnum4 db 0, 3, 1, 2, 6, 7, 4, 5, 255,  8, 9, 10, 11, 12, 13, 14, 15

; --- strings ---------------------------------------------------------------
s_mov     db "mov", 0
s_rsp     db "rsp", 0
s_section db "section", 0
s_r       db "r", 0
s_wb      db "wb", 0
s_abin    db "a.bin", 0
s_empty   db 0
s_zero    db "0", 0
s_comma   db ",", 0
s_elf     db "ELF", 0
fmt_scope db "%s.%s", 0
fmt_lld   db "%lld", 0
fmt_ok    db "AmmAsm: Compiled successfully! Output: a.bin (%d bytes)", 10, 0
fmt_usage db "AmmAsm v1.0 ", 10, "Usage: ./aasm <input.asm> ", 10, 0

m_toomany    db "AmmAsm:", 27, "[;31m Fatal: Too mant tokens (max 1024)", 27, "[0m", 10, 0
m_nofile     db "AmmAsm:", 27, "[;31m Fatal: no such file or dir", 27, "[0m", 10, 0
m_localscope db "AmmAsm: Used local label with out global label on line ", 34, "%d", 34, 10, 0
m_escape     db "AmmAsm: invalid escape sequence on line %d", 10, 0
m_unterm_str db "AmmAsm: unterminated string literal at line %d", 10, 0
m_unk_esc    db "AmmAsm: Unknown escape sequence on line %d", 10, 0
m_unterm_chr db "AmmAsm: Unterminated character literal on line %d", 10, 0
m_bracket    db "AmmAsm: you fogot to close '[' at line %d", 10, 0
m_badchar    db "AmmAsm: unvalid syntax or char on line %d", 10, 0
m_unexp      db "AmmAsm: Unexpected token type %d at line %d", 10, 0
m_scale_noix db "AmmAsm: Line %d: scale used without index register", 10, 0
m_rsp_idx    db "AmmAsm: Line %d: rsp cannot be used as index register", 10, 0
m_bad_scale  db "AmmAsm: Line %d: invalid scale factor %d (must be 1,2,4,8)", 10, 0
m_empty_addr db "AmmAsm: Line %d: addressing mode must have at least base, index or displacement", 10, 0
m_bad_base   db "AmmAsm: Line %d: invalid base register name '%s'", 10, 0
m_bad_index  db "AmmAsm: Line %d: invalid index register name '%s'", 10, 0
m_imm64      db "AmmAsm: Cannot MOV imm64 to memory directly (no such opcode). On line '%d'", 10, 0
m_noout      db "AmmAsm: Failed to create output.bin", 10, 0
m_divzero    db "AmmAsm: division by zero in expression", 10, 0

section .bss

;  typedef struct { char* value; int type; int line; } Token;
tokens     resb 16384            ; 16 bytes * 1024 tokens
ast        resb 524288           ; 512 bytes * 1024 nodes

; pointer for eval_expr
p          resq 1
end_p      resq 1

labelscope resb 256
lexbuf     resb 256
idbuf      resb 256
fullbuf    resb 512
exprbuf    resb 128
strbuf     resb 256
valbuf     resb 32
regbuf     resb 16
secbuf     resb 16
charbuf    resb 4
ae         resb 48

; operand classification for parseInst
g_c0       resq 1
g_n0       resq 1
g_c1       resq 1
g_n1       resq 1

section .text

; ============================================================================
;  Register conventions of the APX build
;    r16-r23  scratch EGPRs.  Caller-saved: any call may clobber them, so no
;             value stays in r16-r23 across a call.
;    r24-r31  callee-saved EGPRs.  Used only for values that live across calls
;             (parseInst, _start).  Saved and restored with push2 / pop2.
;  push2 / pop2 need rsp aligned to 16.  Every function is entered with
;  rsp = 8 mod 16, so an odd number of saved registers is used: one plain
;  push first (aligns the stack), then push2 pairs.  pop2 reverses the pairs
;  and swaps the operands of each pair.
; ============================================================================

; ============================================================================
;  tiny leaf helpers
; ============================================================================

; skip_sp(rdi = ptr) -> rdi = first non-space char, eax = that char
;   space is 32 or 9..13.   c - 9 <= 4 (unsigned) is the 9..13 test.
skip_sp:
.l:
    movzx eax, byte [b=rdi]
    sub r16d, eax, 9
    cmp eax, 32
    ccmpne {dfv=zf} r16d, 4
    ja .done
    inc rdi
    jmp .l
.done:
    ret

; is_sp(eax = char) -> rax = 1 / 0
is_sp:
    sub r16d, eax, 9
    cmp eax, 32
    ccmpne {dfv=zf} r16d, 4
    {zu} setbe al
    ret

; is_dig(eax = char) -> rax = 1 / 0
is_dig:
    sub r16d, eax, 48
    cmp r16d, 9
    {zu} setbe al
    ret

; fatal(rdi = fmt, rsi = arg1, rdx = arg2)  - prints to stderr and exits with 1
fatal:
    and rsp, -16
    mov rcx, rdx
    mov rdx, rsi
    mov rsi, rdi
    mov rdi, 2
    xor eax, eax
    call dprintf
    mov rdi, 1
    call exit

; find_in_list(rdi = list of NUL separated strings, rsi = name) -> rax = index or -1
find_in_list:
    push r14
    push2 r13, r12
    mov r12, rdi
    mov r13, rsi
    xor r14d, r14d
.loop:
    cmp [b=r12], byte 0
    je .not_found
    mov rdi, r12
    mov rsi, r13
    call strcasecmp
    test eax, eax
    je .found
    mov rdi, r12
    call strlen
    lea r12, [b=r12, i=rax, s=1, d=1]
    inc r14
    jmp .loop
.found:
    mov rax, r14
    jmp .done
.not_found:
    mov rax, -1
.done:
    pop2 r12, r13
    pop r14
    ret

; is2arrin(rdi = list, rsi = str) -> rax = 1 / 0
is2arrin:
    sub rsp, 8
    call find_in_list
    add rsp, 8
    cmp rax, -1
    {zu} setne al
    ret

; reg_lookup(rdi = name) -> rax = size class (0 = not a register, 1..4 = 8/16/32/64 bit)
;                           rdx = hardware number 0..15 (255 for rip)
;   Both table bytes are loaded unconditionally.  Index -1 reads one byte
;   before the table, which is valid memory.  Then NDD cmove zeroes both
;   results when the name was not found.
reg_lookup:
    sub rsp, 8
    call skip_sp
    mov rsi, rdi
    lea rdi, [b=regs8]
    call find_in_list
    xor r16d, r16d
    cmp rax, -1
    lea rcx, [b=regcls]
    lea rsi, [b=regnum]
    movzx r17d, byte [b=rcx, i=rax, s=1]
    movzx r18d, byte [b=rsi, i=rax, s=1]
    cmove eax, r17d, r16d
    cmove edx, r18d, r16d
    add rsp, 8
    ret

; ============================================================================
;  expression evaluator:  + - * /  ( )  0x..
; ============================================================================

; eval_expr(const char *rdi) -> rax      (absolute tail jump, R_X86_64_64)
eval_expr:
    mov [b=p], rdi
    jmpabs parse_expr

; parse_number() -> rax
parse_number:
    push rbx
    mov rdi, [b=p]
    call skip_sp
    mov [b=p], rdi
    cmp eax, '-'
    jne .not_neg
    inc rdi
    mov [b=p], rdi
    call parse_number
    neg rax
    jmp .out
.not_neg:
    cmp eax, '('
    jne .not_paren
    inc rdi
    mov [b=p], rdi
    call parse_expr
    mov rbx, rax
    mov rdi, [b=p]
    cmp [b=rdi], byte ')'
    jne .paren_done
    inc qword [b=p]
.paren_done:
    mov rax, rbx
    jmp .out
.not_paren:
    cmp eax, '0'
    jne .digits
    movzx ecx, byte [b=rdi, d=1]
    cmp ecx, 120
    ccmpne {dfv=zf} ecx, 88
    je .hex
    xor eax, eax
    jmp .out
.hex:
    lea rsi, [b=p]
    mov edx, 16
    call strtol
    jmp .out
.digits:
    xor ebx, ebx
.dl:
    mov rdi, [b=p]
    movzx ecx, byte [b=rdi]
    sub r16d, ecx, 48
    cmp r16d, 9
    ja .dend
    imul rbx, rbx, 10
    add rbx, r16
    inc qword [b=p]
    jmp .dl
.dend:
    mov rax, rbx
.out:
    pop rbx
    ret

; parse_term()  level: * /
parse_term:
    push r12
    call parse_number
    mov r12, rax
.loop:
    mov rdi, [b=p]
    call skip_sp
    mov [b=p], rdi
    cmp eax, '*'
    je .mul_p
    cmp eax, '/'
    jne .done
    inc qword [b=p]
    call parse_number
    test rax, rax
    jne .div_nz
    lea rdi, [b=m_divzero]
    xor esi, esi
    call fatal
.div_nz:
    cmp rax, -1
    jne .div_go
    neg r12
    jmp .loop
.div_go:
    mov rsi, rax
    mov rdi, r12
    call ldiv
    mov r12, rax
    jmp .loop
.mul_p:
    inc qword [b=p]
    call parse_number
    imul r12, rax
    jmp .loop
.done:
    mov rax, r12
    pop r12
    ret

; parse_expr()  level: + -
parse_expr:
    push r12
    call parse_term
    mov r12, rax
.loop:
    mov rdi, [b=p]
    call skip_sp
    mov [b=p], rdi
    cmp eax, '+'
    je .add_p
    cmp eax, '-'
    jne .done
    inc qword [b=p]
    call parse_term
    sub r12, rax
    jmp .loop
.add_p:
    inc qword [b=p]
    call parse_term
    add r12, rax
    jmp .loop
.done:
    mov rax, r12
    pop r12
    ret

; ============================================================================
;  tokens
; ============================================================================

; add_token(rdi = type, rsi = value, rdx = line)
add_token:
    push r14
    push2 r13, r12
    mov r12, rdi
    mov r13, rsi
    mov r14, rdx
    mov eax, [b=tokens_count]
    cmp eax, 1024                ; MAX_TOKENS
    jl .ok
    lea rdi, [b=m_toomany]
    xor esi, esi
    call fatal
.ok:
    mov rdi, r13
    call strdup
    mov ecx, [b=tokens_count]
    shl r16d, ecx, 4
    lea rdx, [b=tokens]
    mov [b=rdx, i=r16, s=1], rax
    mov [b=rdx, i=r16, s=1, d=8], r12d
    mov [b=rdx, i=r16, s=1, d=12], r14d
    inc dword [b=tokens_count]
    pop2 r12, r13
    pop r14
    ret

; rs_put(rax = char, rsi = dest, r8 = dest end)   (helper of read_string)
rs_put:
    cmp rsi, r8
    jb .store
    ret
.store:
    mov [b=rsi], al
    inc rsi
    ret

; read_string(rdi = buff, rsi = dest, rdx = line) -> rax = new buff
; the escape character is the slash:  /n  /t  /0  /(quote)  //
; the escape letter is mapped with a chain of NDD cmov (no branches)
read_string:
    mov r9, rdx
    lea r8, [b=rsi, d=255]
.loop:
    movzx eax, byte [b=rdi]
    test eax, eax
    ccmpne {dfv=zf} eax, '"'
    je .done
    cmp eax, '/'
    jne .plain
    movzx ecx, byte [b=rdi, d=1]
    mov eax, -1
    mov r16d, 10
    mov r17d, 34
    mov r18d, 47
    mov r19d, 9
    cmp ecx, 'n'
    cmove eax, eax, r16d
    cmp ecx, '"'
    cmove eax, eax, r17d
    cmp ecx, '/'
    cmove eax, eax, r18d
    cmp ecx, 't'
    cmove eax, eax, r19d
    cmp ecx, '0'
    je .e_nul
    cmp eax, -1
    jne .e_store
    
    lea rdi, [b=m_escape]
    mov rsi, r9
    call fatal

.e_store:
    call rs_put
    add rdi, 2
    jmp .loop
.e_nul:
    xor eax, eax
    mov [b=rsi], al
    add rdi, 2
    mov rax, rdi
    ret
.plain:
    call rs_put
    inc rdi
    jmp .loop
.done:
    mov rax, rdi
    ret

; read_ident(rdi = src) -> rax = src after the identifier;  idbuf is filled
;   identifier char = letter, digit, dash, underscore or dot.
;   The whole class test is one ccmp chain (equalities first, then three
;   unsigned range tests).  Pure leaf: clobbers rax rcx rdx rdi r16-r18.
read_ident:
    xor ecx, ecx
    lea rdx, [b=idbuf]
.l:
    movzx eax, byte [b=rdi]
    sub r16d, eax, 48
    sub r17d, eax, 65
    sub r18d, eax, 97
    cmp eax, 45
    ccmpne {dfv=zf} eax, 95
    ccmpne {dfv=zf} eax, 46
    ccmpne {dfv=zf} r16d, 9
    ccmpa {dfv=zf} r17d, 25
    ccmpa {dfv=zf} r18d, 25
    ja .done
    cmp ecx, 254
    ja .adv
    mov [b=rdx, i=rcx, s=1], al
    inc ecx
.adv:
    inc rdi
    jmp .l
.done:
    xor eax, eax
    mov [b=rdx, i=rcx, s=1], al
    mov rax, rdi
    ret

; ============================================================================
;  LEXER(rdi = FILE*) -> rax = number of lines
;     r12 = cursor in line   r13 = line number   r14 = FILE*   r15 = in_comment
;     rbx = scratch index
;  After skip_sp, eax holds the current char for the whole branch chain.
; ============================================================================
LEXER:
    push r15
    push2 r14, r13
    push2 r12, rbx
    mov r14, rdi
    test r14, r14
    jne .have_file
    lea rdi, [b=m_nofile]
    xor esi, esi
    call fatal
.have_file:
    xor r13d, r13d
    xor r15d, r15d
.next_line:
    lea rdi, [b=lexbuf]
    mov esi, 256
    mov rdx, r14
    call fgets
    test rax, rax
    je .eof
    inc r13
    lea r12, [b=lexbuf]

.scan:
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    test eax, eax
    ccmpne {dfv=zf} eax, 10
    ccmpne {dfv=zf} eax, 59
    je .eol
    cmp eax, '/'
    jne .c_chk
    cmp [b=r12, d=1], byte '/'
    je .eol
.c_chk:
    test r15, r15
    jne .in_comment
    cmp eax, '/'
    jne .br_a
    cmp [b=r12, d=1], byte '*'
    jne .br_a
    mov r15d, 1
    add r12, 2
    jmp .scan
.in_comment:
    cmp eax, '*'
    jne .ic_adv
    cmp [b=r12, d=1], byte '/'
    jne .ic_adv
    xor r15d, r15d
    add r12, 2
    jmp .scan
.ic_adv:
    inc r12
    jmp .scan

; ---- (a) identifier, global label, instruction ----------------------------
;      first char: letter or underscore
.br_a:
    sub r17d, eax, 65
    sub r18d, eax, 97
    cmp eax, 95
    ccmpne {dfv=zf} r17d, 25
    ccmpa {dfv=zf} r18d, 25
    ja .br_b
    mov rdi, r12
    call read_ident
    mov r12, rax
    cmp [b=r12], byte ':'
    jne .a_nolabel
    inc r12
    lea rdi, [b=labelscope]
    lea rsi, [b=idbuf]
    mov edx, 256
    call strncpy
    mov edi, T_LAB()
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .tail
.a_nolabel:
    lea rdi, [b=cmds]
    lea rsi, [b=idbuf]
    call is2arrin
    test eax, eax
    je .a_id
    mov edi, T_INS()
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .tail
.a_id:
    lea rdi, [b=idbuf]
    call reg_lookup
    test eax, eax
    je .a_plain_id
    add edi, eax, 2              ; size class 1..4 -> T_REG8..T_REG64
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .scan
.a_plain_id:
    mov edi, T_ID()
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .tail

; ---- (b) local label  .name -----------------------------------------------
.br_b:
    cmp eax, '.'
    jne .br_c
    lea rdi, [b=r12, d=1]
    call read_ident
    mov r12, rax
    cmp [b=labelscope], byte 0
    jne .b_scope_ok
    lea rdi, [b=m_localscope]
    mov rsi, r13
    call fatal
.b_scope_ok:
    lea rdi, [b=fullbuf]
    mov esi, 512
    lea rdx, [b=fmt_scope]
    lea rcx, [b=labelscope]
    lea r8, [b=idbuf]
    xor eax, eax
    call snprintf
    cmp [b=r12], byte ':'
    jne .b_nolabel
    inc r12
    mov edi, T_LAB()
    lea rsi, [b=fullbuf]
    mov rdx, r13
    call add_token
    jmp .tail
.b_nolabel:
    lea rdi, [b=cmds]
    lea rsi, [b=idbuf]
    call is2arrin
    test eax, eax
    je .b_id
    mov edi, T_INS()
    lea rsi, [b=fullbuf]
    mov rdx, r13
    call add_token
    jmp .tail
.b_id:
    mov edi, T_ID()
    lea rsi, [b=fullbuf]
    mov rdx, r13
    call add_token
    jmp .tail

; ---- (c) register  %rax -----------------------------------------------------
;      the name ends at NUL, comma or white space
.br_c:
    cmp eax, '%'
    jne .br_d
    inc r12
    xor ebx, ebx
.c_cp:
    movzx eax, byte [b=r12]
    sub r16d, eax, 9
    test eax, eax
    ccmpne {dfv=zf} eax, 44
    ccmpne {dfv=zf} eax, 32
    ccmpne {dfv=zf} r16d, 4
    jbe .c_end
    cmp ebx, 10
    ja .c_adv
    lea rdx, [b=regbuf]
    mov [b=rdx, i=rbx, s=1], al
    inc ebx
.c_adv:
    inc r12
    jmp .c_cp
.c_end:
    lea rdx, [b=regbuf]
    xor eax, eax
    mov [b=rdx, i=rbx, s=1], al
    lea rdi, [b=regbuf]
    call reg_lookup
    test eax, eax
    je .scan
    add edi, eax, 2              ; size class 1..4 -> T_REG8..T_REG64
    lea rsi, [b=regbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (d) number expression  -5   10+3*2 ------------------------------------
.br_d:
    cmp eax, 45
    ccmpne {dfv=zf} eax, 43
    je .d_go
    cmp eax, 48
    je .br_g
    sub r16d, eax, 48
    cmp r16d, 9
    ja .br_e
.d_go:
    xor ebx, ebx
.d_cp:
    movzx eax, byte [b=r12]
    test eax, eax
    je .d_end
    sub r16d, eax, 48
    sub r17d, eax, 9
    cmp eax, 43
    ccmpne {dfv=zf} eax, 45
    ccmpne {dfv=zf} eax, 42
    ccmpne {dfv=zf} eax, 47
    ccmpne {dfv=zf} eax, 32
    ccmpne {dfv=zf} r16d, 9
    ccmpa {dfv=zf} r17d, 4
    ja .d_end
    cmp ebx, 126
    ja .d_adv
    lea rdx, [b=exprbuf]
    mov [b=rdx, i=rbx, s=1], al
    inc ebx
.d_adv:
    inc r12
    jmp .d_cp
.d_end:
    lea rdx, [b=exprbuf]
    xor eax, eax
    mov [b=rdx, i=rbx, s=1], al
    lea rdi, [b=exprbuf]
    call eval_expr
    mov rcx, rax
    lea rdi, [b=valbuf]
    mov esi, 32
    lea rdx, [b=fmt_lld]
    xor eax, eax
    call snprintf
    mov edi, T_INT()
    lea rsi, [b=valbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (e) string ---------------------------------------------------------------
.br_e:
    cmp eax, 34
    jne .br_f
    inc r12
    lea rdi, [b=strbuf]
    xor esi, esi
    mov edx, 256
    call memset
    mov rdi, r12
    lea rsi, [b=strbuf]
    mov rdx, r13
    call read_string
    mov r12, rax
    cmp [b=r12], byte 34
    je .e_ok
    lea rdi, [b=m_unterm_str]
    mov rsi, r13
    call fatal
.e_ok:
    inc r12
    mov edi, T_STR()
    lea rsi, [b=strbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (f) char literal ------------------------------------------------------------
;      the escape letter is mapped with a chain of NDD cmov, result in ebx
.br_f:
    cmp eax, 39
    jne .br_g
    inc r12
    movzx eax, byte [b=r12]
    cmp eax, 92
    jne .f_plain
    movzx eax, byte [b=r12, d=1]
    mov ebx, -1
    mov r16d, 10
    mov r17d, 13
    mov r18d, 9
    xor r19d, r19d
    mov r20d, 92
    mov r21d, 34
    mov r22d, 39
    cmp eax, 110
    cmove ebx, ebx, r16d
    cmp eax, 114
    cmove ebx, ebx, r17d
    cmp eax, 116
    cmove ebx, ebx, r18d
    cmp eax, 48
    cmove ebx, ebx, r19d
    cmp eax, 92
    cmove ebx, ebx, r20d
    cmp eax, 34
    cmove ebx, ebx, r21d
    cmp eax, 39
    cmove ebx, ebx, r22d
    cmp ebx, -1
    jne .f_esc
    lea rdi, [b=m_unk_esc]
    mov rsi, r13
    call fatal
.f_esc:
    add r12, 2
    jmp .f_close
.f_plain:
    mov ebx, eax
    inc r12
.f_close:
    cmp [b=r12], byte 39
    je .f_ok
    lea rdi, [b=m_unterm_chr]
    mov rsi, r13
    call fatal
.f_ok:
    inc r12
    lea rdx, [b=charbuf]
    mov [b=rdx], bl
    xor ecx, ecx
    mov [b=rdx, d=1], cl
    mov edi, T_CHAR()
    lea rsi, [b=charbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (g) 0x.. 0b.. 0o.. and plain 0 ------------------------------------------
.br_g:
    cmp eax, 48
    jne .br_h
    xor ebx, ebx
    inc r12
    movzx eax, byte [b=r12]
    cmp eax, 120
    ccmpne {dfv=zf} eax, 88
    je .g_hex
    cmp eax, 98
    je .g_bin
    cmp eax, 111
    je .g_oct
    mov edi, T_INT()
    lea rsi, [b=s_zero]
    mov rdx, r13
    call add_token
    jmp .scan
.g_hex:
    inc r12
.g_hl:
    movzx eax, byte [b=r12]
    sub r16d, eax, 48
    cmp r16d, 9
    jbe .g_dig
    sub r16d, eax, 97
    sub r17d, eax, 65
    cmp r16d, 5
    ccmpa {dfv=zf} r17d, 5
    ja .g_end
    cmp r16d, 5
    cmova r16d, r16d, r17d
    add eax, r16d, 10
    jmp .g_hacc
.g_dig:
    mov eax, r16d
.g_hacc:
    shl rbx, 4
    add rbx, rax
    inc r12
    jmp .g_hl
.g_bin:
    inc r12
.g_bl:
    movzx eax, byte [b=r12]
    sub r16d, eax, 48
    cmp r16d, 1
    ja .g_end
    lea rbx, [b=r16, i=rbx, s=2]
    inc r12
    jmp .g_bl
.g_oct:
    inc r12
.g_ol:
    movzx eax, byte [b=r12]
    sub r16d, eax, 48
    cmp r16d, 7
    ja .g_end
    lea rbx, [b=r16, i=rbx, s=8]
    inc r12
    jmp .g_ol
.g_end:
    mov rcx, rbx
    lea rdi, [b=valbuf]
    mov esi, 32
    lea rdx, [b=fmt_lld]
    xor eax, eax
    call snprintf
    mov edi, T_INT()
    lea rsi, [b=valbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (h) address expression  [b=rax, d=8] -------------------------------------
;      white space is dropped, the text ends at NUL or the closing bracket
.br_h:
    cmp eax, '['
    jne .br_i
    inc r12
    xor ebx, ebx
.h_cp:
    movzx eax, byte [b=r12]
    sub r16d, eax, 9
    test eax, eax
    ccmpne {dfv=zf} eax, 93
    je .h_end
    cmp eax, 32
    ccmpne {dfv=zf} r16d, 4
    jbe .h_adv
    cmp ebx, 126
    ja .h_adv
    lea rdx, [b=exprbuf]
    mov [b=rdx, i=rbx, s=1], al
    inc ebx
.h_adv:
    inc r12
    jmp .h_cp
.h_end:
    cmp [b=r12], byte ']'
    je .h_ok
    lea rdi, [b=m_bracket]
    mov rsi, r13
    call fatal
.h_ok:
    inc r12
    lea rdx, [b=exprbuf]
    xor eax, eax
    mov [b=rdx, i=rbx, s=1], al
    mov edi, T_ADDR_EXPR()
    lea rsi, [b=exprbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (i) !section name -----------------------------------------------------------
.br_i:
    cmp eax, '!'
    jne .br_j
    inc r12
    mov rdi, r12
    lea rsi, [b=s_section]
    mov edx, 7
    call strncasecmp
    test eax, eax
    jne .scan
    add r12, 7
.i_sk:
    movzx eax, byte [b=r12]
    cmp eax, 32
    ccmpne {dfv=zf} eax, 9
    jne .i_rd
    inc r12
    jmp .i_sk
.i_rd:
    xor ebx, ebx
.i_cp:
    movzx eax, byte [b=r12]
    test eax, eax
    ccmpne {dfv=zf} eax, 10
    je .i_end
    cmp ebx, 10
    ja .i_end
    lea rdx, [b=secbuf]
    mov [b=rdx, i=rbx, s=1], al
    inc ebx
    inc r12
    jmp .i_cp
.i_end:
    lea rdx, [b=secbuf]
    xor eax, eax
    mov [b=rdx, i=rbx, s=1], al
    mov edi, T_SEC()
    lea rsi, [b=secbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (j) comma ------------------------------------------------------------------------
.br_j:
    cmp eax, ','
    jne .br_k
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    mov edi, T_COMMA()
    lea rsi, [b=s_comma]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (k) garbage ------------------------------------------------------------------------
.br_k:
    lea rdi, [b=m_badchar]
    mov rsi, r13
    call fatal

; after an identifier one char is skipped, but never past the NUL
.tail:
    cmp [b=r12], byte 0
    {zu} setne al
    add r12, rax
    jmp .scan

.eol:
    mov edi, T_EOL()
    lea rsi, [b=s_empty]
    mov rdx, r13
    call add_token
    jmp .next_line

.eof:
    mov edi, T_EOF()
    lea rsi, [b=s_elf]
    mov rdx, r13
    call add_token
    mov rax, r13
    pop2 rbx, r12
    pop2 r13, r14
    pop r15
    ret

; ============================================================================
;  PARSER
; ============================================================================

; cur_node: rax = &ast[ast_count]
cur_node:
    mov eax, [b=ast_count]
    shl rax, 9
    lea rcx, [b=ast]
    add rax, rcx
    ret

; add_operand(rdi = otype, rsi = value)   node = r14
;   the shift is computed under the compare flags with {nf}; strncpy is a tail
;   call, so no stack frame is needed
add_operand:
    mov r16d, [b=r14, d=4]
    cmp r16d, 3
    {nf} shl r17d, r16d, 6
    ja .full
    lea r18, [b=r14, d=336]
    mov [b=r18, i=r16, s=4], edi
    lea rdi, [b=r14, i=r17, s=1, d=80]
    inc dword [b=r14, d=4]
    mov edx, 63
    jmp strncpy
.full:
    ret

; PARSE() -> rax = ast
;     r12 = pos   r13 = &tokens[pos]   r14 = current node
;     the token address is built with {nf} shl while the bounds compare is live
PARSE:
    push r14
    push2 r13, r12
    xor r12d, r12d
.main:
    mov eax, [b=tokens_count]
    cmp r12, rax
    {nf} shl r16, r12, 4
    jge .end
    lea r13, [b=tokens]
    add r13, r16
    mov eax, [b=r13, d=8]
    cmp eax, T_EOF()
    je .end
    test eax, eax                ; T_INS is 0
    je .ins
    cmp eax, T_LAB()
    je .lab
    inc r12
    jmp .main

; ---- instruction ------------------------------------------------------------
.ins:
    call cur_node
    mov r14, rax
    mov rdi, r14
    xor esi, esi
    mov edx, 512
    call memset
    lea rdi, [b=r14, d=16]
    mov rsi, [b=r13]
    mov edx, 63
    call strncpy
    inc r12
.iloop:
    mov eax, [b=tokens_count]
    cmp r12, rax
    {nf} shl r16, r12, 4
    jge .node_done
    lea r13, [b=tokens]
    add r13, r16
    mov eax, [b=r13, d=8]
    cmp eax, T_COMMA()
    je .icomma
    sub r17d, eax, 3             ; T_REG8
    cmp r17d, 3                  ; T_REG64 - T_REG8
    ja .inotreg
    mov edi, eax
    mov rsi, [b=r13]
    call add_operand
    inc r12
    jmp .iloop
.inotreg:
    cmp eax, T_ADDR_EXPR()
    je .iaddr
    cmp eax, T_LAB()
    je .ilab
    cmp eax, T_INT()
    je .iint
    cmp eax, 12                  ; T_EOL
    ccmpne {dfv=zf} eax, 13      ; T_EOF
    je .node_done
    mov edx, eax
    mov ecx, [b=r13, d=12]
    lea rsi, [b=m_unexp]
    mov edi, 2
    xor eax, eax
    call dprintf
    inc r12
    jmp .iloop
.icomma:
    inc r12
    jmp .iloop
.iaddr:
    mov edi, O_MEM()
    mov rsi, [b=r13]
    call add_operand
    inc r12
    jmp .iloop
.ilab:
    mov edi, O_LABEL()
    mov rsi, [b=r13]
    call add_operand
    inc r12
    jmp .iloop
.iint:
    mov edi, O_IMM()
    mov rsi, [b=r13]
    call add_operand
    inc r12
    jmp .iloop

; ---- label ----------------------------------------------------------------------
.lab:
    call cur_node
    mov r14, rax
    mov rdi, r14
    xor esi, esi
    mov edx, 512
    call memset
    mov [b=r14], dword 1
    lea rdi, [b=r14, d=16]
    mov rsi, [b=r13]
    mov edx, 63
    call strncpy
    inc r12

; ---- common tail: ast_count++, skip one EOL token without a branch -------------
.node_done:
    inc dword [b=ast_count]
    mov eax, [b=tokens_count]
    cmp r12, rax
    {nf} shl r16, r12, 4
    jge .main
    lea rcx, [b=tokens]
    cmp [b=rcx, i=r16, s=1, d=8], dword 12
    {zu} sete cl
    add r12, rcx
    jmp .main

.end:
    lea rax, [b=ast]
    pop2 r12, r13
    pop r14
    ret

; ============================================================================
;  Address expressions   b=rbx, i=rcx, s=4, d=0x10
; ============================================================================

; copy_word(rdi = src, rsi = dst[8]) -> rax = new src
;   stops at NUL, comma, space or 9..13.  One ccmp chain, no calls.
copy_word:
    xor edx, edx
.l:
    movzx eax, byte [b=rdi]
    sub r16d, eax, 9
    test eax, eax
    ccmpne {dfv=zf} eax, 44
    ccmpne {dfv=zf} eax, 32
    ccmpne {dfv=zf} r16d, 4
    jbe .done
    cmp edx, 6
    ja .skip
    mov [b=rsi, i=rdx, s=1], al
    inc edx
.skip:
    inc rdi
    jmp .l
.done:
    mov rax, rdi
    ret

; parse_addr_expr(rdi = expr, rsi = line)  -> fills global ae
;     r12 = cursor   r13 = line   r14 = flags (1 = d seen, 2 = s seen)
parse_addr_expr:
    push r14
    push2 r13, r12
    mov r12, rdi
    mov r13, rsi
    xor r14d, r14d
    xor eax, eax
    lea rcx, [b=ae]
    mov [b=rcx], rax
    mov [b=rcx, d=8], rax
    mov [b=rcx, d=16], rax
    mov [b=rcx, d=24], rax
    mov [b=rcx, d=32], rax
    mov [b=rcx, d=40], rax
    mov [b=ae, d=8], dword 1
.loop:
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    test eax, eax
    je .check
    cmp eax, 98
    je .key_b
    cmp eax, 105
    je .key_i
    cmp eax, 115
    je .key_s
    cmp eax, 100
    je .key_d
.next:
    cmp [b=r12], byte 0
    {zu} setne al
    add r12, rax
    jmp .loop

.key_b:
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    cmp eax, 61
    jne .next
    lea rdi, [b=r12, d=1]
    call skip_sp
    lea rsi, [b=ae, d=32]
    call copy_word
    mov r12, rax
    mov [b=ae], dword 1
    jmp .next

.key_i:
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    cmp eax, 61
    jne .next
    lea rdi, [b=r12, d=1]
    call skip_sp
    lea rsi, [b=ae, d=40]
    call copy_word
    mov r12, rax
    mov [b=ae, d=4], dword 1
    jmp .next

.key_s:
    or r14d, 2
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    cmp eax, 61
    jne .next
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    call atoi
    mov [b=ae, d=8], eax
.s_dig:
    movzx eax, byte [b=r12]
    sub r16d, eax, 48
    cmp r16d, 9
    ja .next
    inc r12
    jmp .s_dig

; d= value: decimal, 0x hex, 0o octal, 0b binary.
; base and start pointer are picked with NDD cmov, then one strtol call.
.key_d:
    or r14d, 1
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    cmp eax, 61
    jne .next
    lea rdi, [b=r12, d=1]
    call skip_sp
    mov r12, rdi
    mov edx, 10
    cmp eax, 48
    jne .d_conv
    movzx ecx, byte [b=r12, d=1]
    lea r16, [b=r12, d=2]
    mov r17d, 16
    mov r18d, 8
    mov r19d, 2
    cmp ecx, 120
    cmove edx, edx, r17d
    cmp ecx, 111
    cmove edx, edx, r18d
    cmove rdi, rdi, r16
    cmp ecx, 98
    cmove edx, edx, r19d
    cmove rdi, rdi, r16
.d_conv:
    lea rsi, [b=end_p]
    call strtol
    mov [b=ae, d=24], rax
    mov r12, [b=end_p]
    jmp .next

; ---- validation: same checks and same order as the C version ---------------------
.check:
    mov r16d, [b=ae, d=4]
    test r14d, 2
    ccmpne {dfv=} r16d, 0
    je .e_noix
    test r16d, r16d
    je .ck3
    lea rdi, [b=ae, d=40]
    lea rsi, [b=s_rsp]
    call strcasecmp
    test eax, eax
    je .e_rsp
.ck3:
    mov r16d, [b=ae, d=8]
    cmp r16d, 1
    ccmpne {dfv=zf} r16d, 2
    ccmpne {dfv=zf} r16d, 4
    ccmpne {dfv=zf} r16d, 8
    jne .e_scale
    mov r16d, [b=ae]
    mov r17d, [b=ae, d=4]
    test r16d, r16d
    ccmpe {dfv=} r17d, 0
    cteste {dfv=} r14d, 1
    je .e_empty
    test r16d, r16d
    je .ck6
    lea rdi, [b=ae, d=32]
    call reg_lookup
    cmp rax, 4
    ccmpe {dfv=zf} rdx, 255
    je .e_base
    mov [b=ae, d=12], edx
.ck6:
    mov r16d, [b=ae, d=4]
    test r16d, r16d
    je .ret
    lea rdi, [b=ae, d=40]
    call reg_lookup
    cmp rax, 4
    ccmpe {dfv=zf} rdx, 255
    je .e_index
    mov [b=ae, d=16], edx
.ret:
    pop2 r12, r13
    pop r14
    ret

.e_noix:
    lea rdi, [b=m_scale_noix]
    mov rsi, r13
    call fatal
.e_rsp:
    lea rdi, [b=m_rsp_idx]
    mov rsi, r13
    call fatal
.e_scale:
    lea rdi, [b=m_bad_scale]
    mov rsi, r13
    mov edx, [b=ae, d=8]
    call fatal
.e_empty:
    lea rdi, [b=m_empty_addr]
    mov rsi, r13
    call fatal
.e_base:
    lea rdi, [b=m_bad_base]
    mov rsi, r13
    lea rdx, [b=ae, d=32]
    call fatal
.e_index:
    lea rdi, [b=m_bad_index]
    mov rsi, r13
    lea rdx, [b=ae, d=40]
    call fatal

; gen_SIB_byte() -> eax     (uses ae;  clobbers ecx and r16-r23)
;   scale bits and the two defaults (index 4 = none, base 5 = disp32) are chosen
;   with NDD cmov.
gen_SIB_byte:
    mov r16d, [b=ae, d=8]
    mov r17d, [b=ae, d=4]
    mov r18d, [b=ae, d=16]
    mov r19d, [b=ae]
    mov r20d, [b=ae, d=12]
    mov r21d, 1
    mov r22d, 2
    mov r23d, 3
    xor eax, eax
    cmp r16d, 2
    cmove eax, eax, r21d
    cmp r16d, 4
    cmove eax, eax, r22d
    cmp r16d, 8
    cmove eax, eax, r23d
    shl eax, 6
    and r18d, 7
    and r20d, 7
    mov ecx, 4
    test r17d, r17d
    cmovne ecx, ecx, r18d
    shl ecx, 3
    or eax, ecx
    mov ecx, 5
    test r19d, r19d
    cmovne ecx, ecx, r20d
    or eax, ecx
    ret

; ============================================================================
;  machine code writers.  r15 = write cursor (owned by parseInst)
; ============================================================================
put8:
    mov [b=r15], al
    inc r15
    ret
put16:
    mov [b=r15], ax
    add r15, 2
    ret
put32:
    mov [b=r15], eax
    add r15, 4
    ret
put64:
    mov [b=r15], rax
    add r15, 8
    ret

; put_rex(rdi = W/R/X/B bits, rsi = force flag)  - emits 0x40 | bits when needed
put_rex:
    or eax, edi, esi
    je .no
    or eax, edi, 0x40
    jmp put8
.no:
    ret

; emit_mem(rdi = opcode, rsi = reg field 0..15, rdx = size class 1..4)
;   [0x66] [REX] opcode modrm [sib] [disp8 or disp32]      address comes from ae
;   r8 = rex bits (0x10 = force a plain 0x40)   r9 = mod   r10 = rm   r11 = disp size
;   rex bits W R force B X are built branch free with ZU setcc, ccmp, shifts.
;   No callee-saved register is used, so there is no frame.
emit_mem:
    cmp rdx, 4
    {zu} sete r16b
    shl r16d, 3
    cmp rsi, 7
    {zu} seta r17b
    shl r17d, 2
    or r8d, r16d, r17d
    sub r18d, esi, 4
    cmp edx, 1
    ccmpe {dfv=} r18d, 3
    {zu} setbe r18b
    shl r18d, 4
    or r8d, r18d
    mov r16d, [b=ae, d=12]
    cmp r16d, 7
    {zu} seta r16b
    or r8d, r16d
    mov r17d, [b=ae, d=16]
    cmp r17d, 7
    {zu} seta r17b
    shl r17d, 1
    or r8d, r17d

    mov eax, [b=ae]
    test eax, eax
    je .nobase
    mov r10d, [b=ae, d=12]
    and r10d, 7
    cmp r10d, 5
    jne .not_bp
    mov r9d, 1
    mov r11d, 1
    jmp .base_done
.not_bp:
    mov rax, [b=ae, d=24]
    test rax, rax
    jne .chk8
    xor r9d, r9d
    xor r11d, r11d
    jmp .base_done
.chk8:
    add rcx, rax, 128
    cmp rcx, 255
    ja .d32
    mov r9d, 1
    mov r11d, 1
    jmp .base_done
.d32:
    mov r9d, 2
    mov r11d, 4
    jmp .base_done
.nobase:
    xor r9d, r9d
    mov r10d, 4
    mov r11d, 4
.base_done:
    mov r16d, [b=ae, d=4]
    mov r17d, 4
    test r16d, r16d
    cmovne r10d, r10d, r17d

    cmp rdx, 2
    jne .no66
    mov eax, 0x66
    call put8
.no66:
    test r8d, r8d
    je .norex
    and eax, r8d, 15
    or eax, 0x40
    call put8
.norex:
    mov rax, rdi
    call put8
    shl eax, r9d, 6
    and ecx, esi, 7
    shl ecx, 3
    or eax, ecx
    or eax, r10d
    call put8
    cmp r10d, 4
    jne .no_sib
    call gen_SIB_byte
    call put8
.no_sib:
    mov rax, [b=ae, d=24]
    cmp r11d, 1
    jne .chk4
    jmp put8
.chk4:
    cmp r11d, 4
    jne .done
    jmp put32
.done:
    ret

; ============================================================================
;  parseInst(rdi = AST node, rsi = int *pc, rdx = line)
;     only mov is encoded (like AmmAsm 1.0):
;       mov r, imm      mov r, r      mov r, [mem]     mov [mem], r     mov [mem], imm32
;     r12 = node   r13 = pc*   r14 = line   r15 = write cursor
;     r24 = size class of operand 0   r25 = hardware number of operand 0
;     r26 = size class of operand 1   r27 = hardware number of operand 1
;     r28 = immediate
;     (the old g_c0 g_n0 g_c1 g_n1 memory variables live in registers now)
; ============================================================================
parseInst:
    push r15
    push2 r14, r13
    push2 r12, r24
    push2 r25, r26
    push2 r27, r28
    mov r12, rdi
    mov r13, rsi
    mov r14, rdx
    cmp [b=r12], dword 0
    jne .ret
    xor eax, eax
    mov [b=r12, d=352], rax
    mov [b=r12, d=360], rax
    mov [b=r12, d=8], eax
    lea r15, [b=r12, d=352]
    lea rdi, [b=r12, d=16]
    lea rsi, [b=s_mov]
    call strcasecmp
    test eax, eax
    jne .ret

    ; ---- classify the operands (register operands have otype 3..6) -----------
    xor r24d, r24d
    xor r25d, r25d
    xor r26d, r26d
    xor r27d, r27d
    mov eax, [b=r12, d=336]
    sub r16d, eax, 3
    cmp r16d, 3
    ja .cl1
    lea rdi, [b=r12, d=80]
    call reg_lookup
    mov r24, rax
    mov r25, rdx
.cl1:
    mov eax, [b=r12, d=340]
    sub r16d, eax, 3
    cmp r16d, 3
    ja .cl2
    lea rdi, [b=r12, d=144]
    call reg_lookup
    mov r26, rax
    mov r27, rdx
.cl2:

    ; ---- dispatch -----------------------------------------------------------------
    test r24, r24
    je .dst_not_reg
    cmp r25, 255
    je .ret
    mov eax, [b=r12, d=340]
    cmp eax, O_IMM()
    je .ri
    test r26, r26
    jne .rr
    cmp eax, O_MEM()
    je .rm
    jmp .ret
.dst_not_reg:
    mov eax, [b=r12, d=336]
    cmp eax, O_MEM()
    jne .ret
    test r26, r26
    jne .mr
    cmp [b=r12, d=340], dword 7
    je .mi
    jmp .ret

; ---- mov r, imm ----------------------------------------------------------------------
.ri:
    lea rdi, [b=r12, d=144]
    call atoll
    mov r28, rax
    cmp r24, 4
    je .ri64
    cmp r24, 3
    je .ri32
    cmp r24, 2
    je .ri16
    ; 8 bit: [REX] B0+r imm8.   REX.B for r8b..r15b, plain 0x40 for sil dil spl bpl
    shr edi, r25d, 3
    sub r16d, r25d, 4
    cmp r16d, 3
    {zu} setbe r17b
    mov esi, r17d
    call put_rex
    and eax, r25d, 7
    add eax, 0xB0
    call put8
    mov rax, r28
    call put8
    jmp .finish
.ri64:
    shr eax, r25d, 3
    or eax, 0x48
    call put8
    and eax, r25d, 7
    add eax, 0xB8
    call put8
    mov rax, r28
    call put64
    jmp .finish
.ri32:
    cmp r25, 7
    jbe .ri32_o
    mov eax, 0x41
    call put8
.ri32_o:
    and eax, r25d, 7
    add eax, 0xB8
    call put8
    mov rax, r28
    call put32
    jmp .finish
.ri16:
    mov eax, 0x66
    call put8
    cmp r25, 7
    jbe .ri16_o
    mov eax, 0x41
    call put8
.ri16_o:
    and eax, r25d, 7
    add eax, 0xB8
    call put8
    mov rax, r28
    call put16
    jmp .finish

; ---- mov r, r ----------------------------------------------------------------------------
;      bits  = W (class 4) | R (src >= 8) | B (dst >= 8)
;      force = class 1 and (src or dst in 4..7)   - one ccmp chain
.rr:
    cmp r24, r26
    jne .ret
    cmp r27, 255
    je .ret
    shr edi, r27d, 3
    shl edi, 2
    shr eax, r25d, 3
    or edi, eax
    cmp r24, 4
    {zu} sete r16b
    shl r16d, 3
    or edi, r16d
    sub r17d, r27d, 4
    sub r18d, r25d, 4
    cmp r17d, 3
    ccmpa {dfv=zf} r18d, 3
    ccmpbe {dfv=} r24d, 1
    {zu} sete r16b
    mov esi, r16d
    cmp r24, 2
    jne .rr6
    mov eax, 0x66
    call put8
.rr6:
    call put_rex
    mov eax, 0x89
    mov r16d, 0x88
    cmp r24, 1
    cmove eax, eax, r16d
    call put8
    and eax, r27d, 7
    shl eax, 3
    and ecx, r25d, 7
    or eax, ecx
    or eax, 0xC0
    call put8
    jmp .finish

; ---- mov r, [mem] ------------------------------------------------------------------------------
.rm:
    lea rdi, [b=r12, d=144]
    mov rsi, r14
    call parse_addr_expr
    mov edi, 0x8B
    mov r16d, 0x8A
    cmp r24, 1
    cmove edi, edi, r16d
    mov rsi, r25
    mov rdx, r24
    call emit_mem
    jmp .finish

; ---- mov [mem], r ------------------------------------------------------------------------------
.mr:
    cmp r27, 255
    je .ret
    lea rdi, [b=r12, d=80]
    mov rsi, r14
    call parse_addr_expr
    mov edi, 0x89
    mov r16d, 0x88
    cmp r26, 1
    cmove edi, edi, r16d
    mov rsi, r27
    mov rdx, r26
    call emit_mem
    jmp .finish

; ---- mov [mem], imm32 -----------------------------------------------------------------------------
.mi:
    lea rdi, [b=r12, d=80]
    mov rsi, r14
    call parse_addr_expr
    lea rdi, [b=r12, d=144]
    call atoll
    mov r28, rax
    mov rdx, 0x80000000
    add rcx, r28, rdx
    mov rdx, 0xFFFFFFFF
    cmp rcx, rdx
    ja .toobig
    mov edi, 0xC7
    xor esi, esi
    mov edx, 3
    call emit_mem
    mov rax, r28
    call put32
    jmp .finish
.toobig:
    lea rdi, [b=m_imm64]
    mov rsi, r14
    call fatal

.finish:
    lea rcx, [b=r12, d=352]
    sub rax, r15, rcx
    mov [b=r12, d=8], eax
    mov ecx, [b=r13]
    add ecx, eax
    mov [b=r13], ecx
.ret:
    pop2 r28, r27
    pop2 r26, r25
    pop2 r24, r12
    pop2 r13, r14
    pop r15
    ret

; ============================================================================
;  Ammcompiler(rdi = FILE *out)  - dumps machine code of every node
; ============================================================================
Ammcompiler:
    push rbx
    push2 r13, r12
    test rdi, rdi
    je .out
    mov r12, rdi
    xor ebx, ebx
.l:
    mov eax, [b=ast_count]
    cmp rbx, rax
    jge .flush
    shl rcx, rbx, 9
    lea rdx, [b=ast]
    add rcx, rdx
    mov eax, [b=rcx, d=8]
    test eax, eax
    je .next
    mov edx, eax
    lea rdi, [b=rcx, d=352]
    mov esi, 1
    mov rcx, r12
    call fwrite
.next:
    inc rbx
    jmp .l
.flush:
    mov rdi, r12
    call fflush
.out:
    pop2 r12, r13
    pop rbx
    ret

; ============================================================================
;  _start      (no libc startup code: argc = [rsp], argv = rsp + 8)
;  rsp is 16-byte aligned here and stays aligned, because nothing is pushed
;  and _start never returns - it ends with exit().
;     r24 = argv   r25 = line count   r26 = input FILE*   r27 = output FILE*
;     r28 = node index          (callee-saved EGPRs, nobody to save them for)
; ============================================================================
_start:
    mov rax, [b=rsp]
    lea r24, [b=rsp, d=8]
    cmp rax, 2
    jge .have_arg
    lea rdi, [b=fmt_usage]
    xor eax, eax
    call printf
    mov edi, 1
    call exit
.have_arg:
    mov rdi, [b=r24, d=8]
    lea rsi, [b=s_r]
    call fopen
    mov r26, rax
    mov rdi, r26
    call LEXER
    mov r25, rax
    mov rdi, r26
    call fclose
    call PARSE
    xor r28d, r28d
.cl:
    mov eax, [b=ast_count]
    cmp r28, rax
    jge .cd
    shl rdi, r28, 9
    lea rcx, [b=ast]
    add rdi, rcx
    lea rsi, [b=pc]
    mov rdx, r25
    call parseInst
    inc r28
    jmp .cl
.cd:
    lea rdi, [b=s_abin]
    lea rsi, [b=s_wb]
    call fopen
    mov r27, rax
    test r27, r27
    jne .out_ok
    lea rdi, [b=m_noout]
    xor esi, esi
    call fatal
.out_ok:
    mov rdi, r27
    call Ammcompiler
    mov rdi, r27
    call fclose
    lea rdi, [b=fmt_ok]
    mov esi, [b=pc]
    xor eax, eax
    call printf
    xor edi, edi
    call exit