msg: u8 "how old are you: " ; 17
passed: u8 "you can go\n", 0 ;12
fail: u8 "you cant go\n", 0 ; 13
age: u8 0, 0, 0

_start:
    mov %rax, 1
    mov %rdi, 1
    mov %rsi, msg
    mov %rdx, 17
    syscall

    mov %rax, 0
    mov %rdi, 0
    mov %rsi, age
    mov %rdx, 3
    syscall

    mov [b=age, d=2], %r8b ; 0

    mov %al, [b=age]
    cmp %al, '1'
    jne .cantgo

    mov %al, [b=age, d=1]
    cmp %al, '8'
    jge .cango

    jmp .cantgo
    
.cango:

    mov %rax, 1
    mov %rdi, 1
    mov %rsi, passed
    mov %rdx, 12
    syscall
    jmp .end:

.cantgo:

    mov %rax, 1
    mov %rdi, 1
    mov %rsi, fail
    mov %rdx, 13
    syscall

.end:
    mov %rax, 60
    syscall
