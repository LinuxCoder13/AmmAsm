; this file made for finding fib number, wrote in asembly for High speed
; taken from AmmOS src code
; 64-bit version with macros

macro syscallWrite(std, msg, len) {
    mov rax, 1
    mov rdi, std
    mov rsi, msg
    mov rdx, len
    syscall
}

macro syscallRead(fd, buf, count) {
    mov rax, 0
    mov rdi, fd
    mov rsi, buf
    mov rdx, count
    syscall
}

macro syscallExit(code) {
    mov rax, 60
    mov rdi, code
    syscall
}

section .data 
    msg1 db "Enter number of iterations: "
    len1 dq $ - msg1
    msg2 db "Too big number, max '93' (64-bit limit)", 10, 0
    len2 dq $ - msg2
    nl db 10
    msg3 db "too long input(max 3)", 10, 0
    len3 dq $ - msg3

section .bss
    num_s resb 64 
    null resb 1 ; for \n

section .text
extern atoi, itoa, flush
global _start

strlen:
    xor rcx, rcx
.loop:
    cmp byte [b=rdi, i=rcx], 0
    jz .done

    add rcx, 1
    jmp .loop

.done:
    mov rax, rcx
    ret

_start:
fib:
    push r8
    push r9
    push r10
    push r11

    syscallWrite(1, msg1, [b=len1])
    syscallRead(0, num_s, 3)

    cmp rax, 3
    jg .warn

    xor r10d, r10d 
    cmp rax, 3
    jne .check_number
    cmp byte [b=num_s, d=2], 10
    je .check_number 
    mov r10b, 1               

.check_number:
    mov rdi, num_s
    call atoi

    mov rcx, rax        ; rcx = n (counter)
    cmp rcx, 0 
    jle .done
    cmp rcx, 94  
    jge .toooo_big

    ; 64-bit Fibonacci
    ; rax = prev (F(k-1))
    ; r8  = curr (F(k))
    
    xor rax, rax        ; prev = 0  (F(0))
    mov r8, 1           ; curr = 1  (F(1))


    cmp rcx, 1
    je .printnum

    sub rcx, 1

.next_num:
    ; tmp = curr
    mov r9, r8
    
    ; curr = curr + prev
    add r8, rax
    
    ; prev = tmp
    mov rax, r9
    
    sub rcx, 1
    jnz .next_num

.printnum:
    mov rdi, r8
    mov rsi, num_s
    call itoa

    mov rdi, num_s
    call strlen
    mov r15, rax

    syscallWrite(1, num_s, r15)

    syscallWrite(1, nl, 1)

    jmp .done

.toooo_big:
    test r10b, r10b
    jz .skip_flush
    call flush
.skip_flush:
    syscallWrite(1, msg2, [b=len2])
    jmp .done
    
.warn:
    call flush
    syscallWrite(1, msg3, [b=len3])

.done:
    pop r11
    pop r10
    pop r9
    pop r8

    syscallExit(0)