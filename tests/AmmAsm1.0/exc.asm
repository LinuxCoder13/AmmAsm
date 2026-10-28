; AmmAsm 1.0 - MOV stress test
; General-purpose registers, immediates, memory addressing.

; ============================================================
; 1. Register-to-register: 8-bit
; ============================================================

mov al, bl
mov cl, dl
mov bl, al
mov dl, cl

; ============================================================
; 2. Register-to-register: 16-bit
; ============================================================

mov ax, bx
mov cx, dx
mov bx, ax
mov dx, cx
mov si, di
mov di, si
mov bp, sp
mov sp, bp

; ============================================================
; 3. Register-to-register: 32-bit
; ============================================================

mov eax, ebx
mov ecx, edx
mov ebx, eax
mov edx, ecx
mov esi, edi
mov edi, esi
mov ebp, esp
mov esp, ebp

; ============================================================
; 4. Register-to-register: 64-bit
; ============================================================

mov rax, rbx
mov rcx, rdx
mov rbx, rax
mov rdx, rcx
mov rsi, rdi
mov rdi, rsi
mov rbp, rsp
mov rsp, rbp

; ============================================================
; 5. Immediate-to-register: 8-bit
; ============================================================

mov al, 0
mov bl, 1
mov cl, 0x7f
mov dl, 0xff

; ============================================================
; 6. Immediate-to-register: 16-bit
; ============================================================

mov ax, 0
mov bx, 1
mov cx, 0x1234
mov dx, 0xffff

; ============================================================
; 7. Immediate-to-register: 32-bit
; ============================================================

mov eax, 0
mov ebx, 1
mov ecx, 0x12345678
mov edx, 0xffffffff

; ============================================================
; 8. Immediate-to-register: 64-bit
; ============================================================

mov rax, 0
mov rbx, 1
mov rcx, 0x12345678
mov rdx, 0x123456789abcdef0
mov rsi, 0x7fffffffffffffff
mov rdi, 0xffffffffffffffff

; ============================================================
; 9. Load from memory: different widths
; ============================================================

mov al, [b=rbx]
mov ax, [b=rbx]
mov eax, [b=rbx]
mov rax, [b=rbx]

; ============================================================
; 10. Store to memory: different widths
; ============================================================

mov [b=rbx], al
mov [b=rbx], ax
mov [b=rbx], eax
mov [b=rbx], rax

; ============================================================
; 11. Base + displacement
; ============================================================

mov rax, [b=rbx, d=1]
mov rax, [b=rbx, d=127]
mov rax, [b=rbx, d=128]
mov rax, [b=rbx, d=255]
mov rax, [b=rbx, d=1024]

mov [b=rbx, d=1], rax
mov [b=rbx, d=127], rax
mov [b=rbx, d=128], rax
mov [b=rbx, d=255], rax
mov [b=rbx, d=1024], rax

; ============================================================
; 12. Base + index + scale
; ============================================================

mov rax, [b=rbx, i=rcx]
mov rax, [b=rbx, i=rcx, s=2]
mov rax, [b=rbx, i=rcx, s=4]
mov rax, [b=rbx, i=rcx, s=8]

mov rax, [b=rbx, i=rcx, s=2, d=8]
mov rax, [b=rbx, i=rcx, s=4, d=16]
mov rax, [b=rbx, i=rcx, s=8, d=32]

; ============================================================
; 13. Index-only addressing
; ============================================================

mov rax, [i=rcx, s=1, d=16]
mov rax, [i=rcx, s=2, d=32]
mov rax, [i=rcx, s=4, d=64]
mov rax, [i=rcx, s=8, d=128]

; ============================================================
; 14. Memory with immediate
; ============================================================

; Size not defined becouse AmmAsm 1.0 encodes imm as dword allways
mov [b=rbx], 0x12
mov [b=rbx], 0x1234
mov [b=rbx], 0x12345678
mov [b=rbx], 0x12345678

; ============================================================
; 15. Boundary values for immediate encoding
; ============================================================

mov rax, 0x7fffffff
mov rax, 0xffffffff
mov rax, 0x80000000
mov rax, 0x8000000000000000
mov rax, 0xffffffffffffffff