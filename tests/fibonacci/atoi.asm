section text
global atoi
; atoi()
atoi:
    push rbx
    mov r9, 10
    xor r8, r8
    mov rbx, rdi

.loop:
    xor rax, rax
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
    pop rbx
    ret
