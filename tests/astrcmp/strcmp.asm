; int astrcmp(const char *rdi, const char *rsi)
; via SSE2
section .text
global astrcmp

astrcmp:

    test rdi, rdi
    jz .null_pointer
    test rsi, rsi
    jz .null_pointer
    
    cmp rdi, rsi
    je .equal
    
    mov rax, rdi
    or rax, rsi
    and rax, 0x0F
    jz .aligned_fast
    
    mov ecx, 16
    cmp byte [b=rdi], 0
    je .check_second
    
.scalar_loop:
    mov al, [b=rdi]
    mov dl, [b=rsi]
    
    test al, al
    jz .scalar_end
    
    cmp al, dl
    jne .scalar_different
    
    inc rdi
    inc rsi
    jmp .scalar_loop
    
.scalar_end:
    test dl, dl
    jz .equal
    movzx eax, al
    movzx edx, dl
    sub eax, edx
    ret
    
.scalar_different:
    movzx eax, al
    movzx edx, dl
    sub eax, edx
    ret

.aligned_fast:

    xor ecx, ecx
    
.loop:
    movdqa xmm0, [b=rdi, i=rcx]
    movdqa xmm1, [b=rsi, i=rcx]
    
    movdqa xmm2, xmm0
    pcmpeqb xmm0, xmm1
    
    pxor xmm3, xmm3
    pcmpeqb xmm2, xmm3

    por xmm0, xmm2
    pmovmskb eax, xmm0
    
    cmp eax, 0xFFFF
    je .all_equal
    

    not eax
    bsf ecx, eax
    
    mov al, [b=rdi, i=rcx]
    test al, al
    jz .check_second_at_pos

    movzx eax, byte [b=rdi, i=rcx]
    movzx edx, byte [b=rsi, i=rcx]
    sub eax, edx
    ret
    
.check_second_at_pos:
    mov dl, [b=rsi, i=rcx]
    test dl, dl
    jz .equal
    movzx eax, al
    movzx edx, dl
    sub eax, edx
    ret
    
.all_equal:
    add rcx, 16
    jmp .loop

.null_pointer:

    xor eax, eax
    ret

.check_second:
    mov dl, [b=rsi]
    test dl, dl
    jz .equal
    movzx eax, byte [b=rdi]
    movzx edx, dl
    sub eax, edx
    ret

.equal:
    xor eax, eax
    ret