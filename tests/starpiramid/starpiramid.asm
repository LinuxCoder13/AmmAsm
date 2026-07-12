section .data
    star db '*'
    nl   db 10

section .text
global _start
_start:
    mov rdi, 6
    call star_up

    mov rdi, 5
    call star_down

    mov rax, 60
    xor rdi, rdi
    syscall

star_up:
    mov r8, 1
    mov r9, rdi 
    
.loop:
    cmp r8, r9
    ja .done        
    
    mov r10, r8
    
.print_stars:
    test r10, r10
    je .print_nl
    
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=star]      
    mov rdx, 1
    syscall
    
    sub r10, 1     
    jmp .print_stars
    
.print_nl:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=nl]       
    mov rdx, 1
    syscall
    
    add r8, 1        
    jmp .loop
    
.done:
    ret

star_down:
    mov r8, rdi
.loop:
    test r8, r8
    je .done
    mov r9, r8 

.print_stars:
    test r9, r9
    jz .print_nl

    mov rax, 1
    mov rdi, 1
    lea rsi, [b=star]
    mov rdx, 1
    syscall

    sub r9, 1
    jmp .print_stars

.print_nl:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=nl]
    mov rdx, 1
    syscall

    sub r8, 1
    jmp .loop
    
.done:
    ret
