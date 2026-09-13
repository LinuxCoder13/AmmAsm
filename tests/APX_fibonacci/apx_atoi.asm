section text
global atoi
; atoi()
atoi:
    mov r21, 10
    xor r22, r22
    mov r20, rdi

.loop:
    xor rax, rax
    mov al, [b=r20] 

    cmp al, 0
    jz .done

    cmp al, '\n'
    jz .done

    imul r22, r22, r21
    sub al, '0'
    add r22, r22, rax 

    add r20, 1
    jmpabs .loop

.done:
    mov rax, r22
    ret