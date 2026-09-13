; this file made for finding fib number, wrote in asembly for High speed
; taken from AmmOS src code
; 64-bit version with APX extensions

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
    xor r26, r26          

.loop:
    cmp byte [b=rdi, i=r26], 0
    jz .done

    {nf} add r26, 1
    jmpabs .loop

.done:
    mov rax, r26
    ret
    align 16, 0x90

_start:
fib:
    push2 r20, r21 ; demo
    push2 r22, r23
    push2 r24, r25

    syscallWrite(1, msg1, [b=len1])
    syscallRead(0, num_s, 3)

    cmp rax, 3
    jg .warn

    xor r18d, r18d
    cmp rax, 3
    jne .check_number
    cmp byte [b=num_s, d=2], 10
    je .check_number 
    mov r18b, 1

.check_number:
    mov rdi, num_s
    call atoi

    mov rcx, rax 
    cmp rcx, 0 
    jle .done
    cmp rcx, 94  
    jge .toooo_big

    ; rax = prev (F(k-1))
    ; r16 = curr (F(k))

    xor rax, rax            ; prev = 0  (F(0))
    mov r16, 1              ; curr = 1  (F(1))

    cmp rcx, 1
    je .printnum

    sub rcx, 1

.next_num:
    mov r17, r16            ; tmp = curr

    {nf} add r16, r16, rax       ; curr = curr + prev (трёхоперандная форма APX)

    mov rax, r17            ; prev = tmp

    sub rcx, 1
    jnz .next_num

.printnum:
    mov rdi, r16
    mov rsi, num_s
    call itoa

    mov rdi, num_s
    call strlen
    mov r27, rax

    syscallWrite(1, num_s, r27)
    syscallWrite(1, nl, 1)

    jmpabs .done
    align 16, 0x90

.toooo_big:
    test r18b, r18b
    jz .skip_flush
    call flush
.skip_flush:
    syscallWrite(1, msg2, [b=len2])
    jmpabs .done
    
.warn:
    call flush
    syscallWrite(1, msg3, [b=len3])

.done:
    pop2 r25, r24
    pop2 r23, r22
    pop2 r21, r20 ; demo
    syscallExit(0)