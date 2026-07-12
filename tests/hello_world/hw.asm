extern printf
global _start

section data
msg: db "Hello, World\n", 0
len: dq $ - msg + 5

section text
_start:
    
    lea rdi, [b=msg]
    call printf

    mov rax, 60
    xor rdi, rdi
    syscall
