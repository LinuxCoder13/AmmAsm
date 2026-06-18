section text
global astrcmp

astrcmp:
    cmp rdi, 0
    je .null

    cmp rsi, 0
    je .null

    mov rcx, 0

.loop:
    mov eax, 0
    mov edx, 0

    mov al, [b=rdi, i=rcx]
    mov dl, [b=rsi, i=rcx]

    cmp al, dl
    jne .done

    cmp al, 0
    je .done

    add rcx, 1
    jmp .loop

.done:
    sub eax, edx
    ret

.null:
    mov eax, -1
    ret