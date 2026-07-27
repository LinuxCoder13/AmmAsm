; itoa(uint64 value, char *buf)
; rdi = value
; rsi = buffer
; rax = buffer
section text
global itoa

itoa:   
    push rbx
    mov rax, rsi        ; return value
    mov r8, 10
    mov r9, rsi         ; save buffer start

    cmp rdi, 0
    jne .convert

    mov byte [b=rsi], '0'
    add rsi, 1
    mov byte [b=rsi], 0
    pop rbx
    ret

.convert:
    ; digits are written backwards
.loop:
    mov rax, rdi
    xor rdx, rdx
    div r8              ; rax=quotient, rdx=remainder

    add dl, '0'
    mov byte [b=rsi], dl
    add rsi, 1

    mov rdi, rax
    cmp rdi, 0
    jne .loop

    mov byte [b=rsi], 0

    ; reverse string
    mov rax, r9
    mov rbx, r9
    mov rcx, rsi
    sub rcx, 1

.rev:
    cmp rbx, rcx
    jae .done

    mov dl, [b=rbx]
    mov r8b, [b=rcx]

    mov [b=rbx], r8b
    mov [b=rcx], dl

    add rbx, 1
    sub rcx, 1
    jmp .rev

.done:
    mov rax, r9
    pop rbx
    ret