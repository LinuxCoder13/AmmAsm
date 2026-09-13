section text
global itoa

itoa:
    mov rax, rsi 
    mov r24, 10
    mov r25, rsi            

    cmp rdi, 0
    jne .convert

    mov byte [b=rsi], '0'
    add rsi, 1
    mov byte [b=rsi], 0
    ret

.convert:
.loop:
    mov rax, rdi
    xor rdx, rdx
    div r24

    add dl, '0'
    mov byte [b=rsi], dl
    add rsi, 1

    mov rdi, rax
    cmp rdi, 0
    jne .loop

    mov byte [b=rsi], 0


    mov rax, r25
    mov r23, r25         
    mov rcx, rsi
    sub rcx, 1

.rev:
    cmp r23, rcx
    jae .done

    mov dl, [b=r23]
    mov r26b, [b=rcx]

    mov [b=r23], r26b
    mov [b=rcx], dl

    add r23, 1
    sub rcx, 1
    jmpabs .rev

.done:
    mov rax, r25
    ret