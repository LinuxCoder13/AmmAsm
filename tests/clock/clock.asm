extern localtime

macro syscallWrite(std, msg, len) {
    mov rax, 1
    mov rdi, std
    lea rsi, msg
    mov rdx, len
    syscall
}

macro syscallWriteReg(std, reg, len) {
    mov rax, 1
    mov rdi, std
    mov rsi, reg
    mov rdx, len
    syscall
}

macro syscallTime(tloc) {
    mov rax, 201
    mov rdi, tloc
    syscall
}

macro syscallNanosleep(req, rem) {
    mov rax, 35
    lea rdi, req
    mov rsi, rem
    syscall
}

section .bss
test: resq 1

section .data

face: db 27, "[2J", 27, "[H", 27, "[02;23Ho", 27, "[03;32Ho", 27, "[06;39Ho", 27, "[11;41Ho", 27, "[15;39Ho", 27
db "[19;32Ho", 27, "[20;23Ho", 27, "[19;14Ho", 27, "[16;07Ho", 27, "[11;05Ho", 27, "[06;07Ho", 27
db "[03;14Ho", 27, "[00;22H12", 27, "[11;45H3", 27, "[22;23H6", 27, "[11;01H9", 27, "[11;23H+", 27
db "[23;01H"

hour_row: db 7, 8, 9, 11, 13, 14, 15, 14, 13, 11, 9, 8
hour_col: db 23, 27, 31, 32, 31, 27, 23, 19, 15, 14, 15, 18

min_row: db 4, 4, 4, 4, 5, 5, 5, 6, 6, 7, 7, 8, 9, 10, 10, 11, 12, 12, 13, 14, 14, 15, 16, 16, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 17, 17, 17, 16, 16, 15, 15, 14, 13, 12, 12, 11, 10, 10, 9, 8, 7, 7, 6, 6, 5, 5, 5, 4, 4, 4
min_col: db 23, 25, 26, 28, 29, 30, 32, 33, 34, 35, 36, 37, 37, 38, 38, 38, 38, 38, 37, 37, 36, 35, 34, 33, 32, 30, 29, 28, 26, 25, 23, 21, 20, 18, 17, 16, 14, 13, 12, 11, 10, 9, 9, 8, 8, 8, 8, 8, 9, 9, 10, 11, 12, 13, 14, 16, 17, 18, 20, 21

sec_row: db 4, 4, 4, 4, 5, 5, 5, 6, 6, 7, 7, 8, 9, 10, 10, 11, 12, 12, 13, 14, 14, 15, 16, 16, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 17, 17, 17, 16, 16, 15, 15, 14, 13, 12, 12, 11, 10, 10, 9, 8, 7, 7, 6, 6, 5, 5, 5, 4, 4, 4
sec_col: db 23, 25, 26, 28, 29, 30, 32, 33, 34, 35, 36, 37, 37, 38, 38, 38, 38, 38, 37, 37, 36, 35, 34, 33, 32, 30, 29, 28, 26, 25, 23, 21, 20, 18, 17, 16, 14, 13, 12, 11, 10, 9, 9, 8, 8, 8, 8, 8, 9, 9, 10, 11, 12, 13, 14, 16, 17, 18, 20, 21

htmpl: db 27, "[00;00H#"
mtmpl: db 27, "[00;00H*"
stmpl: db 27, "[00;00H."

ts_sec: dq 1
ts_nsec: dq 0

time_var: dq 0

section .text
global _start

_start:
loop_frame:
    syscallWrite(1, [b=face], 169)

    syscallTime(0)

    mov [b=time_var], rax
    lea rdi, [b=time_var]
    call localtime
    mov rbx, rax

    ; hour
    mov eax, [b=rbx, d=8]
    mov rcx, rax
    ; minute
    mov eax, [b=rbx, d=4]
    mov r15, rax
    ; second
    mov eax, [b=rbx]
    mov rbx, rax

    cmp rcx, 12
    jl hour_ok
    sub rcx, 12
hour_ok:

    ; hour hand
    mov r9, rcx
    lea r10, [b=hour_row]
    lea r11, [b=hour_col]
    lea r12, [b=htmpl]
    call draw_hand

    ; minute hand
    mov r9, r15
    lea r10, [b=min_row]
    lea r11, [b=min_col]
    lea r12, [b=mtmpl]
    call draw_hand

    ; second hand
    mov r9, rbx
    lea r10, [b=sec_row]
    lea r11, [b=sec_col]
    lea r12, [b=stmpl]
    call draw_hand

    syscallNanosleep([b=ts_sec], 0)

    jmp loop_frame

draw_hand:
    mov r14b, [b=r10, i=r9]
    xor r13b, r13b
rowt:
    cmp r14b, 10
    jl rowd
    sub r14b, 10
    add r13b, 1
    jmp rowt
rowd:
    add r13b, 48
    add r14b, 48
    mov [b=r12, d=2], r13b
    mov [b=r12, d=3], r14b

    mov r14b, [b=r11, i=r9]
    xor r13b, r13b
colt:
    cmp r14b, 10
    jl cold
    sub r14b, 10
    add r13b, 1
    jmp colt
cold:
    add r13b, 48
    add r14b, 48
    mov [b=r12, d=5], r13b
    mov [b=r12, d=6], r14b

    syscallWriteReg(1, r12, 9)
    ret