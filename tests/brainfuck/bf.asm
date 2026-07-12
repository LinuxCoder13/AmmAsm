; Brainfuck Interpreter for AmmAsm (x86-64 Linux)
; mmap version - tape and code buffer are allocated at runtime


section .data

msg_open: db "Error: cannot open file", 10
msg_read: db "Error: cannot read file", 10
msg_empty: db "Error: empty file", 10
msg_overflow: db "Error: program too large", 10
usage_msg: db "Usage: bf <file.bf>", 10
usage_msg_len: dq $ - usage_msg

section .text
global _start

_start:

    cmp [b=rsp], dword 2
    jnz print_usage_msg

    ;  mmap tape (32768 bytes, RW, anonymous private)
    mov rax, 9
    mov rdi, 0
    mov rsi, 32768
    mov rdx, 3              ; PROT_READ | PROT_WRITE
    mov r10, 0x22           ; MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1
    mov r9, 0
    syscall

    mov rbp, rax            ; tape base
    mov r9, rbp
    add r9, 32767           ; tape end

    ; mmap code_buf (256 KiB, RW, anonymous private)
    push r9                

    mov rax, 9
    mov rdi, 0
    mov rsi, 256 * 1024
    mov rdx, 3
    mov r10, 0x22
    mov r8, -1
    mov r9, 0
    syscall

    mov r15, rax            ; code_buf base

    pop r9          

    ; open 
    mov rax, 2
    mov rdi, [b=rsp, d=16]
    mov rsi, 0
    mov rdx, 0
    syscall
    cmp rax, 0
    jl error_open
    mov r12, rax

    ; read into code_buf
    mov rax, 0
    mov rdi, r12
    mov rsi, r15
    mov rdx, 256 * 1024
    syscall
    test rax, rax
    jl error_read
    test rax, rax
    je error_empty
    cmp rax, 256 * 1024
    jge error_overflow

    mov r13, rax

    ; close file
    mov rax, 3
    mov rdi, r12
    syscall

    ; setup pointers
    mov r12, r15
    add r12, r13
    mov rbx, r15         
    mov r14, rbp         

main_loop:
    cmp rbx, r12
    jge exit_program

    mov al, [b=rbx]

    cmp al, '>'
    je op_inc_ptr
    cmp al, '<'
    je op_dec_ptr
    cmp al, '+'
    je op_inc_val
    cmp al, '-'
    je op_dec_val
    cmp al, '.'
    je op_output
    cmp al, ','
    je op_input
    cmp al, '['
    je op_loop_start
    cmp al, ']'
    je op_loop_end
    jmp next_byte

op_inc_ptr:
    cmp r14, r9
    je next_byte
    add r14, 1
    jmp next_byte

op_dec_ptr:
    cmp r14, rbp
    je next_byte
    sub r14, 1
    jmp next_byte

op_inc_val:
    mov al, [b=r14]
    add al, 1
    mov [b=r14], al
    jmp next_byte

op_dec_val:
    mov al, [b=r14]
    sub al, 1
    mov [b=r14], al
    jmp next_byte

op_output:
    mov rax, 1
    mov rdi, 1
    mov rsi, r14
    mov rdx, 1
    syscall
    jmp next_byte

op_input:
    mov rax, 0
    mov rdi, 0
    mov rsi, r14
    mov rdx, 1
    syscall
    jmp next_byte

op_loop_start:
    mov al, [b=r14]
    cmp al, 0
    jne next_byte
    call find_matching_bracket_forward
    mov rbx, rax
    jmp main_loop

op_loop_end:
    mov al, [b=r14]
    test al, al
    je next_byte
    call find_matching_bracket_backward
    mov rbx, rax
    jmp main_loop

next_byte:
    add rbx, 1
    jmp main_loop

find_matching_bracket_forward:
    push rbx
    mov rcx, 1
    add rbx, 1
.search_fwd:
    cmp rbx, r12
    jge .error_fwd
    mov al, [b=rbx]
    cmp al, '['
    je .inc_fwd
    cmp al, ']'
    je .dec_fwd
    jmp .next_fwd
.inc_fwd:
    add rcx, 1
    jmp .next_fwd
.dec_fwd:
    sub rcx, 1
    test rcx, rcx
    je .found_fwd
.next_fwd:
    add rbx, 1
    jmp .search_fwd
.found_fwd:
    add rbx, 1
    mov rax, rbx
    pop rbx
    ret
.error_fwd:
    pop rbx
    xor rax, rax
    ret

find_matching_bracket_backward:
    push rbx
    mov rcx, 1
    sub rbx, 1
.search_bwd:
    cmp rbx, r15
    jl .error_bwd
    mov al, [b=rbx]
    cmp al, ']'
    je .inc_bwd
    cmp al, '['
    je .dec_bwd
    jmp .next_bwd
.inc_bwd:
    add rcx, 1
    jmp .next_bwd
.dec_bwd:
    sub rcx, 1
    test rcx, rcx
    je .found_bwd
.next_bwd:
    sub rbx, 1
    jmp .search_bwd
.found_bwd:
    add rbx, 1
    mov rax, rbx
    pop rbx
    ret
.error_bwd:
    pop rbx
    xor rax, rax
    ret

exit_program:
    mov rax, 60
    mov rdi, 0
    syscall

error_open:
    mov rax, 1
    mov rdi, 2
    mov rsi, [b=rsp, d=16]
    mov rdx, 24
    syscall
    mov rax, 60
    mov rdi, 2
    syscall

error_read:
    mov rax, 1
    mov rdi, 2
    mov rsi, msg_read
    mov rdx, 24
    syscall
    mov rax, 60
    mov rdi, 3
    syscall

error_empty:
    mov rax, 1
    mov rdi, 2
    mov rsi, msg_empty
    mov rdx, 18
    syscall
    mov rax, 60
    mov rdi, 4
    syscall

error_overflow:
    mov rax, 1
    mov rdi, 2
    mov rsi, msg_overflow
    mov rdx, 25
    syscall
    mov rax, 60
    mov rdi, 5
    syscall

print_usage_msg:
    mov rax, 1
    mov rdi, 2
    mov rsi, usage_msg
    mov rdx, [b=usage_msg_len]
    syscall
    mov rax, 60
    mov rdi, 6
    syscall
