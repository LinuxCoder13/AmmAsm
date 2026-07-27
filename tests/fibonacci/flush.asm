section data
    trash db 0

global flush 
section text
; flush()
flush:
    xor rdi, rdi
    lea rsi, [b=trash]
    mov rdx, 1

.loop:
    xor rax, rax
    syscall

    test rax, rax
    jz .done

    cmp [b=trash], byte '\n'
    jz .done

    jmp .loop

.done:
    ret