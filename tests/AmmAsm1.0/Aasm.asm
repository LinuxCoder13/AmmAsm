; ============================================================================
;  AmmAsm 1.0  -  self-hosted port of Aasm.c  (lexer + parser + "mov" encoder)
; ============================================================================
;
;  Calling convention: System V AMD64 (libc is called through extern).
;  Only instructions from the cmds list are used:
;    mov push pop call jmp add sub mul div je jne jg jl jge jle jz ja jb
;    xor or cmp inc dec ret test lea not and shl shr
;  Conditional jumps: only je/jne/jg/jl/jge/jle/jz/ja/jb.
;  Everything is word-width explicit: byte/dword/qword on the immediate or
;  in front of the memory operand (like in your Aasm.asm).
; ============================================================================

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
;  AddrExpr (48 bytes, global "ae"):
;     +0  dd base_is_reg   +4  dd index_exists   +8  dd scale
;     +12 dd base_num      +16 dd index_num      +24 dq disp_val
;     +32 db base_reg[8]   +40 db index_reg[8]
; ============================================================================

section .data

tokens_count dd 0
ast_count    dd 0
pc           dd 0

; --- chars ---
let    db "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_", 0
letext db "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.", 0
DIGBIN db "01", 0

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
;  tiny helpers (leaf functions)
; ============================================================================

; skip_sp(rdi = ptr) -> rdi = first non-space char
skip_sp:
.l:
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, 32
    je .adv
    cmp rax, 9
    jb .done
    cmp rax, 13
    ja .done
.adv:
    inc rdi
    jmp .l
.done:
    ret

; is_sp(rax = char) -> rax = 1/0
is_sp:
    cmp rax, 32
    je .yes
    cmp rax, 9
    jb .no
    cmp rax, 13
    ja .no
.yes:
    mov rax, 1
    ret
.no:
    xor rax, rax
    ret

; is_dig(rax = char) -> rax = 1/0
is_dig:
    cmp rax, 48
    jb .no
    cmp rax, 57
    ja .no
    mov rax, 1
    ret
.no:
    xor rax, rax
    ret

; isin(char* rdi, rsi = char (zero extended))  -> rax = 1/0
isin:
.loop:
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, 0
    je .not_found
    cmp rax, rsi
    je .found
    inc rdi
    jmp .loop
.found:
    mov rax, 1
    ret
.not_found:
    xor rax, rax
    ret

; fatal(rdi = fmt, rsi = arg1, rdx = arg2)  - prints to stderr and exits(1)
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

; find_in_list(rdi = list of NUL separated strings, rsi = name) -> rax = index / -1
find_in_list:
    push r12
    push r13
    push r14
    mov r12, rdi
    mov r13, rsi
    xor r14, r14
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
    add r12, rax
    inc r12
    inc r14
    jmp .loop
.found:
    mov rax, r14
    jmp .done
.not_found:
    mov rax, -1
.done:
    pop r14
    pop r13
    pop r12
    ret

; is2arrin(rdi = list, rsi = str) -> rax = 1/0
is2arrin:
    sub rsp, 8
    call find_in_list
    add rsp, 8
    cmp rax, -1
    je .no
    mov rax, 1
    ret
.no:
    xor rax, rax
    ret

; reg_lookup(rdi = name) -> rax = size class (0 = not a register, 1/2/3/4 = 8/16/32/64 bit)
;                           rdx = hardware number 0..15 (255 for rip)
reg_lookup:
    push r12
    call skip_sp
    mov r12, rdi
    lea rdi, [b=regs8]
    mov rsi, r12
    call find_in_list
    cmp rax, -1
    je .none
    lea rcx, [b=regcls]
    add rcx, rax
    lea rsi, [b=regnum]
    add rsi, rax
    xor rdx, rdx
    mov dl, [b=rsi]
    xor rax, rax
    mov al, [b=rcx]
    jmp .out
.none:
    xor rax, rax
    xor rdx, rdx
.out:
    pop r12
    ret

; ============================================================================
;  expression evaluator:  + - * /  ( )  0x..   (same grammar as the C version)
; ============================================================================

; eval_expr(const char *rdi) -> rax
eval_expr:
    mov [b=p], rdi
    jmp parse_expr

; parse_number() -> rax
parse_number:
    push rbx
    mov rdi, [b=p]
    call skip_sp
    mov [b=p], rdi
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, '-'
    jne .not_neg
    inc rdi
    mov [b=p], rdi
    call parse_number
    not rax
    add rax, 1
    jmp .out
.not_neg:
    cmp rax, '('
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
    cmp rax, '0'
    jne .digits
    xor rax, rax
    mov al, [b=rdi, d=1]
    cmp rax, 'x'
    je .hex
    cmp rax, 'X'
    je .hex
    xor rax, rax
    jmp .out
.hex:
    lea rsi, [b=p]
    mov edx, 16
    call strtol
    jmp .out
.digits:
    xor rbx, rbx
.dl:
    mov rdi, [b=p]
    xor rax, rax
    mov al, [b=rdi]
    mov rcx, rax
    call is_dig
    cmp rax, 0
    je .dend
    mov rax, rbx
    mov rdx, 10
    mul rdx
    sub rcx, '0'
    add rax, rcx
    mov rbx, rax
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
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, '*'
    je .mul_p
    cmp rax, '/'
    je .div_p
    jmp .done
.mul_p:
    inc qword [b=p]
    call parse_number
    mul r12
    mov r12, rax
    jmp .loop
.div_p:
    inc qword [b=p]
    call parse_number
    cmp rax, 0
    jne .div_nz
    lea rdi, [b=m_divzero]
    xor rsi, rsi
    call fatal
.div_nz:
    cmp rax, -1                  ; x / -1 = -x   (LONG_MIN / -1 would raise SIGFPE)
    jne .div_go
    not r12
    add r12, 1
    jmp .loop
.div_go:
    mov rsi, rax
    mov rdi, r12
    call ldiv
    mov r12, rax
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
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, '+'
    je .add_p
    cmp rax, '-'
    je .sub_p
    jmp .done
.add_p:
    inc qword [b=p]
    call parse_term
    add r12, rax
    jmp .loop
.sub_p:
    inc qword [b=p]
    call parse_term
    sub r12, rax
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
    push r12
    push r13
    push r14
    mov r12, rdi
    mov r13, rsi
    mov r14, rdx
    mov eax, [b=tokens_count]
    cmp eax, 1024                ; MAX_TOKENS
    jl .ok
    lea rdi, [b=m_toomany]
    xor rsi, rsi
    call fatal
.ok:
    mov rdi, r13
    call strdup
    mov rcx, rax
    mov eax, [b=tokens_count]
    shl rax, 4
    lea rdx, [b=tokens]
    add rdx, rax
    mov [b=rdx], rcx
    mov [b=rdx, d=8], r12d
    mov [b=rdx, d=12], r14d
    inc dword [b=tokens_count]
    pop r14
    pop r13
    pop r12
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
; note: like in the C version the escape character is '/'  (/n /t /0 / //)
read_string:
    mov r9, rdx
    lea r8, [b=rsi, d=255]
.loop:
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, 0
    je .done
    cmp rax, 34
    je .done
    cmp rax, '/'
    jne .plain
    xor rcx, rcx
    mov cl, [b=rdi, d=1]
    cmp rcx, 'n'
    je .e_nl
    cmp rcx, 34
    je .e_q
    cmp rcx, '/'
    je .e_sl
    cmp rcx, 't'
    je .e_tab
    cmp rcx, '0'
    je .e_nul
    lea rdi, [b=m_escape]
    mov rsi, r9
    call fatal
.e_nl:
    mov rax, 10
    jmp .e_store
.e_q:
    mov rax, 34
    jmp .e_store
.e_sl:
    mov rax, 47                  ; '/'
    jmp .e_store
.e_tab:
    mov rax, 9
.e_store:
    call rs_put
    add rdi, 2
    jmp .loop
.e_nul:
    xor rax, rax
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

; read_ident: copies letext chars from r12 into idbuf (NUL terminated), advances r12.
; clobbers rax rbx rcx rdi rsi
read_ident:
    xor rbx, rbx
.l:
    xor rax, rax
    mov al, [b=r12]
    mov rsi, rax
    lea rdi, [b=letext]
    call isin
    cmp rax, 0
    je .done
    cmp rbx, 254
    ja .adv
    xor rax, rax
    mov al, [b=r12]
    lea rcx, [b=idbuf]
    mov [b=rcx, i=rbx, s=1], al
    inc rbx
.adv:
    inc r12
    jmp .l
.done:
    lea rcx, [b=idbuf]
    xor rax, rax
    mov [b=rcx, i=rbx, s=1], al
    ret

; ============================================================================
;  LEXER(rdi = FILE*) -> rax = number of lines
;     r12 = cursor in line   r13 = line number   r14 = FILE*   r15 = in_comment
;     rbx = scratch (free to use)
; ============================================================================
LEXER:
    push rbx
    push r12
    push r13
    push r14
    push r15
    mov r14, rdi
    cmp r14, 0
    jne .have_file
    lea rdi, [b=m_nofile]
    xor rsi, rsi
    call fatal
.have_file:
    xor r13, r13
    xor r15, r15
.next_line:
    lea rdi, [b=lexbuf]
    mov esi, 256
    mov rdx, r14
    call fgets
    cmp rax, 0
    je .eof
    inc r13
    lea r12, [b=lexbuf]

.scan:
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 0
    je .eol
    cmp rax, 10
    je .eol
    cmp rax, ';'
    je .eol
    cmp rax, '/'
    jne .c_chk
    cmp [b=r12, d=1], byte '/'
    je .eol
.c_chk:
    cmp r15, 0
    jne .in_comment
    cmp rax, '/'
    jne .br_a
    cmp [b=r12, d=1], byte '*'
    jne .br_a
    mov r15, 1
    add r12, 2
    jmp .scan
.in_comment:
    cmp rax, '*'
    jne .ic_adv
    cmp [b=r12, d=1], byte '/'
    jne .ic_adv
    xor r15, r15
    add r12, 2
    jmp .scan
.ic_adv:
    inc r12
    jmp .scan

; ---- (a) identifier / global label / instruction -----------------------
.br_a:
    xor rax, rax
    mov al, [b=r12]
    mov rsi, rax
    lea rdi, [b=let]
    call isin
    cmp rax, 0
    je .br_b
    call read_ident
    cmp [b=r12], byte ':'
    jne .a_nolabel
    inc r12
    lea rdi, [b=labelscope]
    lea rsi, [b=idbuf]
    mov edx, 256
    call strncpy
    mov edi, 2                   ; T_LAB
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .tail
.a_nolabel:
    lea rdi, [b=cmds]
    lea rsi, [b=idbuf]
    call is2arrin
    cmp rax, 0
    je .a_id
    mov edi, 0                   ; T_INS
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .tail
.a_id:
    ; bare register name (rax, r12d, ...) -> register token, same as "%rax"
    lea rdi, [b=idbuf]
    call reg_lookup
    cmp rax, 0
    je .a_plain_id
    mov rdi, rax
    add rdi, 2                   ; class 1..4 -> T_REG8..T_REG64
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .scan                    ; no "skip one char" here
.a_plain_id:
    mov edi, 10                  ; T_ID
    lea rsi, [b=idbuf]
    mov rdx, r13
    call add_token
    jmp .tail

; ---- (b) local label  .name -------------------------------------------
.br_b:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '.'
    jne .br_c
    inc r12
    call read_ident
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
    cmp rax, 0
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

; ---- (c) register  %rax -------------------------------------------------
.br_c:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '%'
    jne .br_d
    inc r12
    xor rbx, rbx
.c_cp:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 0
    je .c_end
    cmp rax, ','
    je .c_end
    mov rcx, rax
    call is_sp
    cmp rax, 0
    jne .c_end
    cmp rbx, 10
    ja .c_adv
    lea rdx, [b=regbuf]
    mov [b=rdx, i=rbx, s=1], cl
    inc rbx
.c_adv:
    inc r12
    jmp .c_cp
.c_end:
    lea rdx, [b=regbuf]
    xor rax, rax
    mov [b=rdx, i=rbx, s=1], al
    lea rdi, [b=regbuf]
    call reg_lookup
    cmp rax, 0
    je .scan
    mov rdi, rax
    add rdi, 2
    lea rsi, [b=regbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (d) number expression  -5   10+3*2 ---------------------------------
.br_d:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '-'
    je .d_go
    cmp rax, '+'
    je .d_go
    cmp rax, '0'
    je .br_g
    call is_dig
    cmp rax, 0
    je .br_e
.d_go:
    xor rbx, rbx
.d_cp:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 0
    je .d_end
    mov rcx, rax
    call is_dig
    cmp rax, 0
    jne .d_ok
    cmp rcx, '+'
    je .d_ok
    cmp rcx, '-'
    je .d_ok
    cmp rcx, '*'
    je .d_ok
    cmp rcx, '/'
    je .d_ok
    mov rax, rcx
    call is_sp
    cmp rax, 0
    je .d_end
.d_ok:
    cmp rbx, 126
    ja .d_adv
    lea rdx, [b=exprbuf]
    mov [b=rdx, i=rbx, s=1], cl
    inc rbx
.d_adv:
    inc r12
    jmp .d_cp
.d_end:
    lea rdx, [b=exprbuf]
    xor rax, rax
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

; ---- (e) string "..." ---------------------------------------------------
.br_e:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 34
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

; ---- (f) char literal 'a'  '\n' -----------------------------------------
.br_f:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 39
    jne .br_g
    inc r12
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 92
    jne .f_plain
    xor rax, rax
    mov al, [b=r12, d=1]
    cmp rax, 'n'
    je .f_n
    cmp rax, 'r'
    je .f_r
    cmp rax, 't'
    je .f_t
    cmp rax, '0'
    je .f_0
    cmp rax, 92
    je .f_bs
    cmp rax, 34
    je .f_dq
    cmp rax, 39
    je .f_sq
    lea rdi, [b=m_unk_esc]
    mov rsi, r13
    call fatal
.f_n:
    mov rbx, 10
    jmp .f_esc
.f_r:
    mov rbx, 13
    jmp .f_esc
.f_t:
    mov rbx, 9
    jmp .f_esc
.f_0:
    xor rbx, rbx
    jmp .f_esc
.f_bs:
    mov rbx, 92
    jmp .f_esc
.f_dq:
    mov rbx, 34
    jmp .f_esc
.f_sq:
    mov rbx, 39
.f_esc:
    add r12, 2
    jmp .f_close
.f_plain:
    mov rbx, rax
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
    mov rax, rbx
    mov [b=rdx], al
    xor rcx, rcx
    mov [b=rdx, d=1], cl
    mov edi, T_CHAR()
    lea rsi, [b=charbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (g) 0x.. 0b.. 0o.. 0 ------------------------------------------------
.br_g:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '0'
    jne .br_h
    xor rbx, rbx
    inc r12
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 'x'
    je .g_hex
    cmp rax, 'X'
    je .g_hex
    cmp rax, 'b'
    je .g_bin
    cmp rax, 'o'
    je .g_oct
    mov edi, T_INT()
    lea rsi, [b=s_zero]
    mov rdx, r13
    call add_token
    jmp .scan
.g_hex:
    inc r12
.g_hl:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '0'
    jb .g_end
    cmp rax, '9'
    jle .g_d09
    cmp rax, 'a'
    jb .g_chkA
    cmp rax, 'f'
    jle .g_laz
.g_chkA:
    cmp rax, 'A'
    jb .g_end
    cmp rax, 'F'
    ja .g_end
    sub rax, 'A'
    add rax, 10
    jmp .g_hacc
.g_laz:
    sub rax, 'a'
    add rax, 10
    jmp .g_hacc
.g_d09:
    sub rax, '0'
.g_hacc:
    shl rbx, 4
    add rbx, rax
    inc r12
    jmp .g_hl
.g_bin:
    inc r12
.g_bl:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '0'
    jb .g_end
    cmp rax, '1'
    ja .g_end
    sub rax, '0'
    shl rbx, 1
    add rbx, rax
    inc r12
    jmp .g_bl
.g_oct:
    inc r12
.g_ol:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '0'
    jb .g_end
    cmp rax, '7'
    ja .g_end
    sub rax, '0'
    shl rbx, 3
    add rbx, rax
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

; ---- (h) address expression [b=rax, d=8] ---------------------------------
.br_h:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '['
    jne .br_i
    inc r12
    xor rbx, rbx
.h_cp:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 0
    je .h_end
    cmp rax, ']'
    je .h_end
    mov rcx, rax
    call is_sp
    cmp rax, 0
    jne .h_adv
    cmp rbx, 126
    ja .h_adv
    lea rdx, [b=exprbuf]
    mov [b=rdx, i=rbx, s=1], cl
    inc rbx
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
    xor rax, rax
    mov [b=rdx, i=rbx, s=1], al
    mov edi, T_ADDR_EXPR()
    lea rsi, [b=exprbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (i) !section name ----------------------------------------------------
.br_i:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '!'
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
    cmp [b=r12], byte ' '
    je .i_sk_adv
    cmp [b=r12], byte 9
    jne .i_rd
.i_sk_adv:
    inc r12
    jmp .i_sk
.i_rd:
    xor rbx, rbx
.i_cp:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 0
    je .i_end
    cmp rax, 10
    je .i_end
    cmp rbx, 10
    ja .i_end
    lea rdx, [b=secbuf]
    mov [b=rdx, i=rbx, s=1], al
    inc rbx
    inc r12
    jmp .i_cp
.i_end:
    lea rdx, [b=secbuf]
    xor rax, rax
    mov [b=rdx, i=rbx, s=1], al
    mov edi, T_SEC()
    lea rsi, [b=secbuf]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (j) comma ------------------------------------------------------------
.br_j:
    xor rax, rax
    mov al, [b=r12]
    cmp rax, ','
    jne .br_k
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    mov edi, T_COMMA()
    lea rsi, [b=s_comma]
    mov rdx, r13
    call add_token
    jmp .scan

; ---- (k) garbage ----------------------------------------------------------
.br_k:
    lea rdi, [b=m_badchar]
    mov rsi, r13
    call fatal

.tail:
    cmp [b=r12], byte 0
    je .scan
    inc r12
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
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    ret

; ============================================================================
;  PARSER
; ============================================================================

; tokp: rax = &tokens[r12]
tokp:
    mov rax, r12
    shl rax, 4
    lea rcx, [b=tokens]
    add rax, rcx
    ret

; cur_node: rax = &ast[ast_count]
cur_node:
    mov eax, [b=ast_count]
    shl rax, 9
    lea rcx, [b=ast]
    add rax, rcx
    ret

; add_operand(rdi = otype, rsi = value)   node = r14
add_operand:
    push rbx
    mov eax, [b=r14, d=4]
    cmp eax, 3
    ja .full
    mov rbx, rax
    lea rcx, [b=r14, d=336]
    mov [b=rcx, i=rbx, s=4], edi
    mov rax, rbx
    shl rax, 6
    lea rdi, [b=r14, i=rax, s=1, d=80]
    mov edx, 63
    call strncpy
    inc dword [b=r14, d=4]
.full:
    pop rbx
    ret

; PARSE() -> rax = ast
;     r12 = pos   r13 = &tokens[pos]   r14 = current node
PARSE:
    push r12
    push r13
    push r14
    xor r12, r12
.main:
    mov eax, [b=tokens_count]
    cmp r12, rax
    jge .end
    call tokp
    mov r13, rax
    mov eax, [b=r13, d=8]
    cmp eax, T_EOF()
    je .end
    cmp eax, T_INS()
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
    jge .node_done
    call tokp
    mov r13, rax
    mov eax, [b=r13, d=8]
    cmp eax, T_COMMA()
    je .icomma
    cmp eax, T_REG8()
    jb .inotreg
    cmp eax, T_REG64()
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
    cmp eax, T_EOL()
    je .node_done
    cmp eax, T_EOF()
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

; ---- label ------------------------------------------------------------------
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

; ---- common tail: ast_count++, skip EOL ------------------------------------
.node_done:
    inc dword [b=ast_count]
    mov eax, [b=tokens_count]
    cmp r12, rax
    jge .main
    call tokp
    mov eax, [b=rax, d=8]
    cmp eax, T_EOL()
    jne .main
    inc r12
    jmp .main

.end:
    lea rax, [b=ast]
    pop r14
    pop r13
    pop r12
    ret

; ============================================================================
;  Address expressions   b=rbx, i=rcx, s=4, d=0x10
; ============================================================================

; copy_word(rdi = src, rsi = dst[8]) -> rax = new src.  stops at ',' / space / NUL
copy_word:
    xor rdx, rdx
.l:
    xor rax, rax
    mov al, [b=rdi]
    cmp rax, 0
    je .done
    cmp rax, ','
    je .done
    mov rcx, rax
    call is_sp
    cmp rax, 0
    jne .done
    cmp rdx, 6
    ja .skip
    mov [b=rsi, i=rdx, s=1], cl
    inc rdx
.skip:
    inc rdi
    jmp .l
.done:
    mov rax, rdi
    ret

; parse_addr_expr(rdi = expr, rsi = line)  -> fills global "ae"
parse_addr_expr:
    push r12
    push r13
    push r14
    mov r12, rdi
    mov r13, rsi
    xor r14, r14
    xor rax, rax
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
    xor rax, rax
    mov al, [b=r12]
    cmp rax, 0
    je .check
    cmp rax, 'b'
    je .key_b
    cmp rax, 'i'
    je .key_i
    cmp rax, 's'
    je .key_s
    cmp rax, 'd'
    je .key_d
.next:
    cmp [b=r12], byte 0
    je .loop
    inc r12
    jmp .loop

.key_b:
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    cmp [b=r12], byte '='
    jne .next
    inc r12
    mov rdi, r12
    call skip_sp
    lea rsi, [b=ae, d=32]
    call copy_word
    mov r12, rax
    mov [b=ae], dword 1
    jmp .next

.key_i:
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    cmp [b=r12], byte '='
    jne .next
    inc r12
    mov rdi, r12
    call skip_sp
    lea rsi, [b=ae, d=40]
    call copy_word
    mov r12, rax
    mov [b=ae, d=4], dword 1
    jmp .next

.key_s:
    or r14, 2
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    cmp [b=r12], byte '='
    jne .next
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    call atoi
    mov [b=ae, d=8], eax
.s_dig:
    xor rax, rax
    mov al, [b=r12]
    call is_dig
    cmp rax, 0
    je .next
    inc r12
    jmp .s_dig

.key_d:
    or r14, 1
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    cmp [b=r12], byte '='
    jne .next
    inc r12
    mov rdi, r12
    call skip_sp
    mov r12, rdi
    xor rax, rax
    mov al, [b=r12]
    cmp rax, '0'
    jne .d_dec
    xor rax, rax
    mov al, [b=r12, d=1]
    cmp rax, 'x'
    je .d_hex
    cmp rax, 'o'
    je .d_oct
    cmp rax, 'b'
    je .d_bin
.d_dec:
    mov rdi, r12
    mov edx, 10
    jmp .d_conv
.d_hex:
    mov rdi, r12
    mov edx, 16
    jmp .d_conv
.d_oct:
    lea rdi, [b=r12, d=2]
    mov edx, 8
    jmp .d_conv
.d_bin:
    lea rdi, [b=r12, d=2]
    mov edx, 2
.d_conv:
    lea rsi, [b=end_p]
    call strtol
    mov [b=ae, d=24], rax
    mov r12, [b=end_p]
    jmp .next

; ---- validation (same checks / same order as the C version) ----------------
.check:
    test r14, 2
    je .ck2
    cmp [b=ae, d=4], dword 0
    jne .ck2
    lea rdi, [b=m_scale_noix]
    mov rsi, r13
    call fatal
.ck2:
    cmp [b=ae, d=4], dword 0
    je .ck3
    lea rdi, [b=ae, d=40]
    lea rsi, [b=s_rsp]
    call strcasecmp
    test eax, eax
    jne .ck3
    lea rdi, [b=m_rsp_idx]
    mov rsi, r13
    call fatal
.ck3:
    mov eax, [b=ae, d=8]
    cmp eax, 1
    je .ck4
    cmp eax, 2
    je .ck4
    cmp eax, 4
    je .ck4
    cmp eax, 8
    je .ck4
    lea rdi, [b=m_bad_scale]
    mov rsi, r13
    mov rdx, rax
    call fatal
.ck4:
    cmp [b=ae], dword 0
    jne .ck5
    cmp [b=ae, d=4], dword 0
    jne .ck5
    test r14, 1
    jne .ck5
    lea rdi, [b=m_empty_addr]
    mov rsi, r13
    call fatal
.ck5:
    cmp [b=ae], dword 0
    je .ck6
    lea rdi, [b=ae, d=32]
    call reg_lookup
    cmp rax, 4
    jne .bad_base
    cmp rdx, 255
    je .bad_base
    mov [b=ae, d=12], edx
    jmp .ck6
.bad_base:
    lea rdi, [b=m_bad_base]
    mov rsi, r13
    lea rdx, [b=ae, d=32]
    call fatal
.ck6:
    cmp [b=ae, d=4], dword 0
    je .ret
    lea rdi, [b=ae, d=40]
    call reg_lookup
    cmp rax, 4
    jne .bad_index
    cmp rdx, 255
    je .bad_index
    mov [b=ae, d=16], edx
    jmp .ret
.bad_index:
    lea rdi, [b=m_bad_index]
    mov rsi, r13
    lea rdx, [b=ae, d=40]
    call fatal
.ret:
    pop r14
    pop r13
    pop r12
    ret

; gen_SIB_byte() -> rax   (uses "ae";  clobbers rcx)
gen_SIB_byte:
    mov eax, [b=ae, d=8]
    xor ecx, ecx
    cmp eax, 2
    jne .n2
    mov ecx, 1
.n2:
    cmp eax, 4
    jne .n4
    mov ecx, 2
.n4:
    cmp eax, 8
    jne .n8
    mov ecx, 3
.n8:
    shl ecx, 6
    mov eax, 4
    cmp [b=ae, d=4], dword 0
    je .noi
    mov eax, [b=ae, d=16]
    and eax, 7
.noi:
    shl eax, 3
    or ecx, eax
    mov eax, 5
    cmp [b=ae], dword 0
    je .nob
    mov eax, [b=ae, d=12]
    and eax, 7
.nob:
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

; put_rex(rdi = W/R/X/B bits, rsi = force flag)  - emits 0x40|bits if needed
put_rex:
    mov rax, rdi
    or rax, rsi
    cmp rax, 0
    je .no
    mov rax, rdi
    or rax, 0x40
    call put8
.no:
    ret

; emit_mem(rdi = opcode, rsi = reg field (0..15), rdx = size class 1..4)
;   [0x66] [REX] opcode modrm [sib] [disp8/32]     (address taken from "ae")
;   r8 = rex bits (0x10 = force plain 0x40)   r9 = mod   r10 = rm   r11 = disp size
emit_mem:
    push rbx
    xor r8, r8
    cmp rdx, 4
    jne .nw
    or r8, 8
.nw:
    cmp rsi, 7
    ja .set_r
    jmp .nr
.set_r:
    or r8, 4
.nr:
    cmp rdx, 1
    jne .nf
    cmp rsi, 4
    jb .nf
    cmp rsi, 7
    ja .nf
    or r8, 16
.nf:
    mov eax, [b=ae]
    cmp eax, 0
    je .nobase
    mov r10d, [b=ae, d=12]
    cmp r10, 7
    ja .set_b
    jmp .nb
.set_b:
    or r8, 1
.nb:
    and r10, 7
    cmp r10, 5
    jne .not_bp
    mov r9, 1
    mov r11, 1
    jmp .base_done
.not_bp:
    mov rax, [b=ae, d=24]
    cmp rax, 0
    jne .chk8
    xor r9, r9
    xor r11, r11
    jmp .base_done
.chk8:
    mov rcx, rax
    add rcx, 128
    cmp rcx, 255
    ja .d32
    mov r9, 1
    mov r11, 1
    jmp .base_done
.d32:
    mov r9, 2
    mov r11, 4
    jmp .base_done
.nobase:
    xor r9, r9
    mov r10, 5
    mov r11, 4
.base_done:
    xor rbx, rbx
    mov eax, [b=ae, d=4]
    cmp eax, 0
    je .no_idx
    mov rbx, 1
    mov eax, [b=ae, d=16]
    cmp rax, 7
    ja .set_x
    jmp .sib_chk
.set_x:
    or r8, 2
    jmp .sib_chk
.no_idx:
    cmp r10, 4
    jne .chk_nobase
    mov rbx, 1
    jmp .sib_chk
.chk_nobase:
    mov eax, [b=ae]
    cmp eax, 0
    jne .sib_chk
    mov rbx, 1
.sib_chk:
    cmp rdx, 2
    jne .no66
    mov rax, 0x66
    call put8
.no66:
    cmp r8, 0
    je .norex
    mov rax, r8
    and rax, 15
    or rax, 0x40
    call put8
.norex:
    mov rax, rdi
    call put8
    cmp rbx, 0
    je .rm_ok
    mov r10, 4
.rm_ok:
    mov rax, r9
    shl rax, 6
    mov rcx, rsi
    and rcx, 7
    shl rcx, 3
    or rax, rcx
    or rax, r10
    call put8
    cmp rbx, 0
    je .no_sib
    call gen_SIB_byte
    call put8
.no_sib:
    mov rax, [b=ae, d=24]
    cmp r11, 1
    jne .chk4
    call put8
    jmp .done
.chk4:
    cmp r11, 4
    jne .done
    call put32
.done:
    pop rbx
    ret

; ============================================================================
;  parseInst(rdi = AST node, rsi = int *pc, rdx = line)
;     only "mov" is encoded (like AmmAsm 1.0):
;       mov r, imm      mov r, r      mov r, [mem]     mov [mem], r     mov [mem], imm32
;     r12 = node   r13 = pc*   r14 = line   r15 = write cursor   rbx = imm
; ============================================================================
parseInst:
    push rbx
    push r12
    push r13
    push r14
    push r15
    mov r12, rdi
    mov r13, rsi
    mov r14, rdx
    cmp [b=r12], dword 0
    jne .ret
    xor rax, rax
    mov [b=r12, d=352], rax
    mov [b=r12, d=360], rax
    mov [b=r12, d=8], eax
    lea r15, [b=r12, d=352]
    lea rdi, [b=r12, d=16]
    lea rsi, [b=s_mov]
    call strcasecmp
    test eax, eax
    jne .ret

    ; ---- classify the operands -------------------------------------------
    xor rax, rax
    mov [b=g_c0], rax
    mov [b=g_n0], rax
    mov [b=g_c1], rax
    mov [b=g_n1], rax
    mov eax, [b=r12, d=336]
    cmp eax, O_REG8()
    jb .cl1
    cmp eax, O_REG64()
    ja .cl1
    lea rdi, [b=r12, d=80]
    call reg_lookup
    mov [b=g_c0], rax
    mov [b=g_n0], rdx
.cl1:
    mov eax, [b=r12, d=340]
    cmp eax, O_REG8()
    jb .cl2
    cmp eax, O_REG64()
    ja .cl2
    lea rdi, [b=r12, d=144]
    call reg_lookup
    mov [b=g_c1], rax
    mov [b=g_n1], rdx
.cl2:

    ; ---- dispatch ----------------------------------------------------------
    mov rax, [b=g_c0]
    cmp rax, 0
    je .dst_not_reg
    mov rcx, [b=g_n0]
    cmp rcx, 255
    je .ret
    mov eax, [b=r12, d=340]
    cmp eax, O_IMM()
    je .ri
    mov rax, [b=g_c1]
    cmp rax, 0
    jne .rr
    mov eax, [b=r12, d=340]
    cmp eax, O_MEM()
    je .rm
    jmp .ret
.dst_not_reg:
    mov eax, [b=r12, d=336]
    cmp eax, O_MEM()
    jne .ret
    mov rax, [b=g_c1]
    cmp rax, 0
    jne .mr
    mov eax, [b=r12, d=340]
    cmp eax, O_IMM()
    je .mi
    jmp .ret

; ---- mov r, imm ----------------------------------------------------------------
.ri:
    lea rdi, [b=r12, d=144]
    call atoll
    mov rbx, rax
    mov rax, [b=g_c0]
    mov rcx, [b=g_n0]
    cmp rax, 4
    je .ri64
    cmp rax, 3
    je .ri32
    cmp rax, 2
    je .ri16
    ; mov r8, imm8:   [REX] B0+r imm8
    xor rdi, rdi
    xor rsi, rsi
    cmp rcx, 7
    ja .ri8_gp
    cmp rcx, 4
    jb .ri8_go
    mov rsi, 1
    jmp .ri8_go
.ri8_gp:
    mov rdi, 1
.ri8_go:
    call put_rex
    mov rax, rcx
    and rax, 7
    add rax, 0xB0
    call put8
    mov rax, rbx
    call put8
    jmp .finish
.ri64:
    mov rax, 0x48
    cmp rcx, 7
    ja .ri64_b
    jmp .ri64_p
.ri64_b:
    or rax, 1
.ri64_p:
    call put8
    mov rax, rcx
    and rax, 7
    add rax, 0xB8
    call put8
    mov rax, rbx
    call put64
    jmp .finish
.ri32:
    cmp rcx, 7
    ja .ri32_b
    jmp .ri32_o
.ri32_b:
    mov rax, 0x41
    call put8
.ri32_o:
    mov rax, rcx
    and rax, 7
    add rax, 0xB8
    call put8
    mov rax, rbx
    call put32
    jmp .finish
.ri16:
    mov rax, 0x66
    call put8
    cmp rcx, 7
    ja .ri16_b
    jmp .ri16_o
.ri16_b:
    mov rax, 0x41
    call put8
.ri16_o:
    mov rax, rcx
    and rax, 7
    add rax, 0xB8
    call put8
    mov rax, rbx
    call put16
    jmp .finish

; ---- mov r, r --------------------------------------------------------------------
.rr:
    mov rax, [b=g_c0]
    cmp rax, [b=g_c1]
    jne .ret
    mov rcx, [b=g_n1]
    cmp rcx, 255
    je .ret
    mov rdx, [b=g_n0]
    xor rdi, rdi
    xor rsi, rsi
    cmp rcx, 7
    ja .rr_r
    jmp .rr1
.rr_r:
    or rdi, 4
.rr1:
    cmp rdx, 7
    ja .rr_b
    jmp .rr2
.rr_b:
    or rdi, 1
.rr2:
    cmp rax, 4
    jne .rr3
    or rdi, 8
.rr3:
    cmp rax, 1
    jne .rr5
    cmp rcx, 4
    jb .rr4
    cmp rcx, 7
    ja .rr4
    mov rsi, 1
.rr4:
    cmp rdx, 4
    jb .rr5
    cmp rdx, 7
    ja .rr5
    mov rsi, 1
.rr5:
    cmp rax, 2
    jne .rr6
    mov rax, 0x66
    call put8
.rr6:
    call put_rex
    mov rax, 0x89
    cmp [b=g_c0], qword 1
    jne .rr7
    mov rax, 0x88
.rr7:
    call put8
    mov rax, rcx
    and rax, 7
    shl rax, 3
    mov rcx, rdx
    and rcx, 7
    or rax, rcx
    or rax, 0xC0
    call put8
    jmp .finish

; ---- mov r, [mem] ------------------------------------------------------------------
.rm:
    lea rdi, [b=r12, d=144]
    mov rsi, r14
    call parse_addr_expr
    mov rdi, 0x8B
    mov rax, [b=g_c0]
    cmp rax, 1
    jne .rm1
    mov rdi, 0x8A
.rm1:
    mov rsi, [b=g_n0]
    mov rdx, [b=g_c0]
    call emit_mem
    jmp .finish

; ---- mov [mem], r ------------------------------------------------------------------
.mr:
    mov rcx, [b=g_n1]
    cmp rcx, 255
    je .ret
    lea rdi, [b=r12, d=80]
    mov rsi, r14
    call parse_addr_expr
    mov rdi, 0x89
    mov rax, [b=g_c1]
    cmp rax, 1
    jne .mr1
    mov rdi, 0x88
.mr1:
    mov rsi, [b=g_n1]
    mov rdx, [b=g_c1]
    call emit_mem
    jmp .finish

; ---- mov [mem], imm32 ---------------------------------------------------------------
.mi:
    lea rdi, [b=r12, d=80]
    mov rsi, r14
    call parse_addr_expr
    lea rdi, [b=r12, d=144]
    call atoll
    mov rbx, rax
    mov rcx, rbx
    mov rdx, 0x80000000
    add rcx, rdx
    mov rdx, 0xFFFFFFFF
    cmp rcx, rdx
    ja .toobig
    mov rdi, 0xC7
    xor rsi, rsi
    mov rdx, 3
    call emit_mem
    mov rax, rbx
    call put32
    jmp .finish
.toobig:
    lea rdi, [b=m_imm64]
    mov rsi, r14
    call fatal

.finish:
    mov rax, r15
    lea rcx, [b=r12, d=352]
    sub rax, rcx
    mov [b=r12, d=8], eax
    mov ecx, [b=r13]
    add ecx, eax
    mov [b=r13], ecx
.ret:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    ret

; ============================================================================
;  Ammcompiler(rdi = FILE *out)  - dumps machine code of every node
; ============================================================================
Ammcompiler:
    push rbx
    push r12
    push r13
    cmp rdi, 0
    je .out
    mov r12, rdi
    xor rbx, rbx
.l:
    mov eax, [b=ast_count]
    cmp rbx, rax
    jge .flush
    mov rcx, rbx
    shl rcx, 9
    lea rdx, [b=ast]
    add rcx, rdx
    mov eax, [b=rcx, d=8]
    cmp rax, 0
    je .next
    mov rdx, rax
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
    pop r13
    pop r12
    pop rbx
    ret

; ============================================================================
;  _start      (no libc startup code: argc = [rsp], argv = rsp+8)
;  rsp is 16-byte aligned here and stays aligned, because nothing is pushed
;  and _start never returns - it ends with exit().
;     rbx = argv   r12 = line count   r13 = input FILE*   r14 = output FILE*   r15 = i
; ============================================================================
_start:
    mov rax, [b=rsp]             ; argc
    lea rbx, [b=rsp, d=8]        ; argv
    cmp rax, 2
    jge .have_arg
    lea rdi, [b=fmt_usage]
    xor eax, eax
    call printf
    mov rdi, 1
    call exit
.have_arg:
    mov rdi, [b=rbx, d=8]        ; argv[1]
    lea rsi, [b=s_r]
    call fopen
    mov r13, rax
    mov rdi, r13
    call LEXER                   ; (fatal + exit(1) if fopen failed)
    mov r12, rax
    mov rdi, r13
    call fclose
    call PARSE
    xor r15, r15
.cl:
    mov eax, [b=ast_count]
    cmp r15, rax
    jge .cd
    mov rdi, r15
    shl rdi, 9
    lea rcx, [b=ast]
    add rdi, rcx
    lea rsi, [b=pc]
    mov rdx, r12
    call parseInst
    inc r15
    jmp .cl
.cd:
    lea rdi, [b=s_abin]
    lea rsi, [b=s_wb]
    call fopen
    mov r14, rax
    cmp r14, 0
    jne .out_ok
    lea rdi, [b=m_noout]
    xor rsi, rsi
    call fatal
.out_ok:
    mov rdi, r14
    call Ammcompiler
    mov rdi, r14
    call fclose
    lea rdi, [b=fmt_ok]
    mov esi, [b=pc]
    xor eax, eax
    call printf
    xor rdi, rdi
    call exit