section .data
    chars       db " .:-=+*#%@"
    newline     db 10

    ; Forgot to add IEEE-754 for doubles
    x_start     dq 0xC000000000000000      ; -2.0
    y_start     dq 0xBFF3333333333333      ; -1.2
    x_step      dq 0x3FA47AE147AE147B      ; 0.04
    y_step      dq 0x3FAEB851EB851EB8      ; 0.06

    four        dq 0x4010000000000000      ; 4.0

    align 32, 0x00

section .bss

    ; 4 double = 1 YMM
    cr          resq 4
    ci          resq 4
    mag         resq 4

    iter0       resq 1
    iter1       resq 1
    iter2       resq 1
    iter3       resq 1


section .text
    global _start

_start:
    ; ymm0 = cr: [x0, x1, x2, x3]
    ; ymm1 = ci: [y,  y,  y,  y]
    ; ymm2 = zr
    ; ymm3 = zi
    ;
    ; xmm8 = X current group
    ; xmm9 = Y current line

    movsd xmm9, [b=y_start]
    xor r13d, r13d

.loop_y:
    movsd xmm8, [b=x_start]
    mov r12d, 20                    ; 20 group по 4 = 80 dot

.loop_batch:


    movsd xmm7, xmm8

    movsd [b=cr], xmm7

    addsd xmm7, [b=x_step]
    movsd [b=cr, d=8], xmm7

    addsd xmm7, [b=x_step]
    movsd [b=cr, d=16], xmm7

    addsd xmm7, [b=x_step]
    movsd [b=cr, d=24], xmm7

    ; X next group = X + 4 * x_step
    addsd xmm7, [b=x_step]
    movsd xmm8, xmm7

    movsd [b=ci], xmm9
    movsd [b=ci, d=8], xmm9
    movsd [b=ci, d=16], xmm9
    movsd [b=ci, d=24], xmm9

    vmovupd ymm0, [b=cr]
    vmovupd ymm1, [b=ci]

    ; z0 = 0 + 0i 
    vxorpd ymm2, ymm2, ymm2
    vxorpd ymm3, ymm3, ymm3

    mov qword [b=iter0], 100
    mov qword [b=iter1], 100
    mov qword [b=iter2], 100
    mov qword [b=iter3], 100

    xor r14d, r14d

.mandel_loop:
    cmp r14d, 100
    jae .render_batch

    ; 1. mag = zr*zr + zi*zi


    vmulpd ymm4, ymm2, ymm2
    vmulpd ymm5, ymm3, ymm3
    vaddpd ymm6, ymm4, ymm5

    vmovupd [b=mag], ymm6

    ; --- Точка 0 ---
    mov rax, [b=iter0]
    cmp rax, 100
    jne .check1

    movsd xmm7, [b=mag]
    ucomisd xmm7, [b=four]
    jbe .check1

    mov [b=iter0], r14

.check1:
    ; --- Точка 1 ---
    mov rax, [b=iter1]
    cmp rax, 100
    jne .check2

    movsd xmm7, [b=mag, d=8]
    ucomisd xmm7, [b=four]
    jbe .check2

    mov [b=iter1], r14

.check2:
    ; --- Точка 2 ---
    mov rax, [b=iter2]
    cmp rax, 100
    jne .check3

    movsd xmm7, [b=mag, d=16]
    ucomisd xmm7, [b=four]
    jbe .check3

    mov [b=iter2], r14

.check3:
    mov rax, [b=iter3]
    cmp rax, 100
    jne .update_z

    movsd xmm7, [b=mag, d=24]
    ucomisd xmm7, [b=four]
    jbe .update_z

    mov [b=iter3], r14

.update_z:
    ; 3. new_zr = zr^2 - zi^2 + cr


    vmulpd ymm4, ymm2, ymm2
    vmulpd ymm5, ymm3, ymm3

    vsubpd ymm4, ymm4, ymm5
    vaddpd ymm4, ymm4, ymm0

    ; new_zi = 2*zr*zi + ci

    vmulpd ymm5, ymm2, ymm3
    vaddpd ymm5, ymm5, ymm5
    vaddpd ymm5, ymm5, ymm1

    vmovupd ymm2, ymm4
    vmovupd ymm3, ymm5

    inc r14d
    jmp .mandel_loop


.render_batch:

    mov eax, [b=iter0]
    imul eax, 9
    xor edx, edx
    mov ecx, 100
    div ecx
    lea r8, [b=chars]         
    lea rsi, [b=r8, i=rax]      
    mov eax, 1
    mov edi, 1
    mov edx, 1
    syscall

    mov eax, [b=iter1]
    imul eax, 9
    xor edx, edx
    mov ecx, 100
    div ecx
    lea r8, [b=chars]         
    lea rsi, [b=r8, i=rax]       
    mov eax, 1
    mov edi, 1
    mov edx, 1
    syscall

    mov eax, [b=iter2]
    imul eax, 9
    xor edx, edx
    mov ecx, 100
    div ecx
    lea r8, [b=chars]    
    lea rsi, [b=r8, i=rax] 
    mov eax, 1
    mov edi, 1
    mov edx, 1
    syscall

    mov eax, [b=iter3]
    imul eax, 9
    xor edx, edx
    mov ecx, 100
    div ecx
    lea r8, [b=chars]
    lea rsi, [b=r8, i=rax]
    mov eax, 1
    mov edi, 1
    mov edx, 1
    syscall

    dec r12d
    jnz .loop_batch


    mov eax, 1
    mov edi, 1
    lea rsi, [b=newline]
    mov edx, 1
    syscall


    addsd xmm9, [b=y_step]

    inc r13d
    cmp r13d, 40
    jl .loop_y

    mov eax, 60
    xor edi, edi
    syscall