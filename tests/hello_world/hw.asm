ptr: dq msg - $
msg: db "Hello, World\n", 
len: dq $ - msg

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=ptr]
    add rsi, [b=rsi]
    mov rdx, [b=len]
    syscall

    mov rax, 60
    syscall
