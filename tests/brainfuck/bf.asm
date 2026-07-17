; Brainfuck Interpreter for AmmAsm (x86-64 Linux)
; Via macro

macro syscallWrite(std, msg, len) {
    mov rax, 1
    mov rdi, std
    mov rsi, msg
    mov rdx, len
    syscall
}

macro syscallExit(code) {
    mov rax, 60
    mov rdi, code
    syscall
}

macro syscallOpen(path, flags) {
    mov rax, 2
    mov rdi, path
    mov rsi, flags
    mov rdx, 0
    syscall
}

macro syscallRead(fd, buf, count) {
    mov rax, 0
    mov rdi, fd
    mov rsi, buf
    mov rdx, count
    syscall
}

macro syscallClose(fd) {
    mov rax, 3
    mov rdi, fd
    syscall
}

macro mmap_anon(size) {
    mov rax, 9
    mov rdi, 0
    mov rsi, size
    mov rdx, 3               ; PROT_READ | PROT_WRITE
    mov r10, 0x22            ; MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1
    mov r9, 0
    syscall
}


section .data
    usage_msg: db "Usage: bf <file.bf>", 10
    usage_msg_len DQ $ - usage_msg

    msg_open: db "Error: cannot open file", 10
    msg_open_len DQ $ - msg_open

    msg_read: db "Error: cannot read file", 10
    msg_read_len DQ $ - msg_read

    msg_empty: db "Error: empty file", 10
    msg_empty_len DQ $ - msg_empty

    msg_overflow: db "Error: program too large", 10
    msg_overflow_len DQ $ - msg_overflow


section .text
global _start

_start:

    cmp qword [b=rsp], 2       ; argc
    jne print_usage_msg


    mmap_anon(32768)
    mov rbp, rax  
    mov r9, rbp
    add r9, 32767 


    push r9
    mmap_anon(256 * 1024)
    mov r15, rax 
    pop r9         


    mov rdi, [b=rsp, d=16]      ; argv[1]
    syscallOpen(rdi, 0)      ; O_RDONLY
    cmp rax, 0
    jl error_open
    mov r12, rax             ; fd


    syscallRead(r12, r15, 256 * 1024)
    test rax, rax
    jl error_read
    test rax, rax
    je error_empty
    cmp rax, 256 * 1024
    jge error_overflow
    mov r13, rax          

    syscallClose(r12)

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
    mov al,  [b=r14]
    add al, 1
    mov  [b=r14], al
    jmp next_byte

op_dec_val:
    mov al, [b=r14]
    sub al, 1
    mov byte [b=r14], al
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
    mov al,  [b=rbx]
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
    syscallExit(0)

print_usage_msg:
    syscallWrite(2, usage_msg, [b=usage_msg_len])
    syscallExit(6)

error_open:
    syscallWrite(2, msg_open, [b=msg_open_len]) 
    syscallExit(2)

error_read:
    syscallWrite(2, msg_read, [b=msg_read_len])
    syscallExit(3)

error_empty:
    syscallWrite(2, msg_empty, [b=msg_empty_len])
    syscallExit(4)

error_overflow:
    syscallWrite(2, msg_overflow, [b=msg_overflow_len])
    syscallExit(5)