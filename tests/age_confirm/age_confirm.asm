msg: db "how old are you: " 
msg_len dq $ - msg

passed: db "you can go\n"
passed_len dq $ - passed    

fail: db "you cant go\n"
fail_len dq $ - fail

b: db "to long input (max 3 char)!\n"
b_len: dq $ - b 

trash: db 0
age: db 0, 0, 0, 0

; atoi()
atoi:
    mov r9, 10
    mov r8, 0
    mov rbx, rdi

.loop:
    mov rax, 0
    mov al, [b=rbx]

    cmp al, 0
    jz .done

    cmp al, '\n'
    jz .done

    imul r8, r9
    sub al, '0'
    add r8, rax

    add rbx, 1
    jmp .loop

.done:
    mov rax, r8
    ret


; flush()
flush:
    mov rdi, 0
    lea rsi, [b=trash]
    mov rdx, 1

.loop:
    mov rax, 0
    syscall

    cmp rax, 0
    jz .done

    mov r15b, [b=trash]
    cmp r15b, '\n'
    jz .done

    jmp .loop

.done:
    ret


_start:

    mov rax, 1
    mov rdi, 1
    lea rsi, [b=msg]
    mov rdx, [b=msg_len]
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [b=age]
    mov rdx, 4
    syscall

    mov r14, rax

    cmp r14, 0
    je .end


    cmp r14, 4
    jl .ok_input

    mov r15b, [b=age, d=3]
    cmp r15b, '\n'
    jne .warn

.ok_input:
    lea rdi, [b=age]
    call atoi
    
    cmp rax, 18
    jl .cantgo
    

.cango:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=passed]
    mov rdx, [b=passed_len]
    syscall

    jmp .end


.cantgo:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=fail]
    mov rdx, [b=fail_len]
    syscall

    jmp .end


.warn:
    call flush

    mov rax, 1
    mov rdi, 1
    lea rsi, [b=b]
    mov rdx, [b=b_len]
    syscall

    jmp .end


.end:
    mov rax, 60
    mov rdi, 0
    syscall