_start:
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    lea rsi, [b=msg]   ; buffer
    mov rdx, len - msg
    syscall

    mov rax, 60        ; sys_exit
    mov rdi, 0
    syscall

msg: db "Hello, World!", 0x0A
len: dq $ - msg