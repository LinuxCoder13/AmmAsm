msg: db "Hello, World\n", 
len: dq $ - msg

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=msg]
    mov rdx, [b=len]
    syscall

    mov rax, 60
    syscall
