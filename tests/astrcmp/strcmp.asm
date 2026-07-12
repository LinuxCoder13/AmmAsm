section text
global astrcmp

astrcmp:
    test rdi, rdi
    je .null

    test rsi, rdi
    je .null

    xor rcx, rcx

.loop:
    xor eax, eax
    xor edx, edx

    mov al, [b=rdi, i=rcx]
    mov dl, [b=rsi, i=rcx]

    cmp al, dl
    jne .done

    test al, al
    je .done

    add rcx, 1
    jmp .loop

.done:
    sub eax, edx
    ret

.null:
    mov eax, -1
    ret