AmmAsm - Minimal x86-64 Assembler 

Version: 1.0 (rewritten in AmmAsm 3.0.2)
Author: Ammar Najafli  
License: MIT

This is AmmAsm 1.0 which was rewriten on assembly and compiled via AmmAsm 3.0.2 (bootstraped) 

✨ Features

✅ Direct x86-64 encoding - No NASM/GAS dependencies  
✅ Multiple operand sizes - 8/16/32/64-bit registers and immediates  
✅ Memory addressing - Full SIB/ModRM support with explicit syntax  
✅ Hex/Binary/Octal literals - 0xDEADBEEF, 0b1010, 0o777  
✅ JIT-ready output - Produces executable binary code  
✅ Clean error messages - Line numbers and helpful diagnostics
🏗️ Architecture Overview

1) input.asm │ mov rax, 42

2) LEXER │ Tokenizes source → [T_INS, T_REG64, T_INT]

3) PARSER │ Builds AST → {cmd:"mov", operands:[rax, 42]}

4) CODEGEN │ Generates machine code → [48 b8 2a 00 00 00 00 00 00 00]

a.bin │ Raw executable bytes
🔄 Pipeline Stages
🔤 Lexer (LEXER) - Converts text to tokens

    Recognizes instructions, registers, literals, labels
    Handles comments (`//`, ;, `/* */`)
    Supports multiple number bases (hex, binary, octal)

🌳 Parser (PARSE) - Builds Abstract Syntax Tree

    Validates instruction operands
    Resolves operand types (REG/IMM/MEM/LABEL)
    Handles label scoping (global/local)

⚙️ Code Generator (parseInst) - Emits x86-64 bytes

    REX prefix generation
    ModR/M and SIB byte encoding
    Displacement and immediate value encoding

💾 Compiler (Ammcompiler) - Writes binary output
📝 Syntax
Registers

Prefix registers with %:

mov rax, 42        ; 64-bit
mov eax, 42        ; 32-bit  
mov ax, 42         ; 16-bit
mov al, 42         ; 8-bit
mov r8, r15        ; Extended registers (r8-r15)

Numeric Literals


mov rax, 42        ; Decimal
mov rax, 0xff      ; Hexadecimal
mov rax, 0b1010    ; Binary
mov rax, 0o777     ; Octal

Memory Addressing


; Format: [b=base, i=index, s=scale, d=displacement]
mov rax, [b=rbx]                     ; [rbx]
mov rax, [b=rbx, d=16]               ; [rbx + 16]
mov rax, [b=rbx, i=rcx, s=8]         ; [rbx + rcx*8]
mov rax, [b=rbx, i=rcx, s=8, d=0x10] ; [rbx + rcx*8 + 0x10]
mov [b=rsp, d=8], rax                ; Memory destination

Example Program

input.asm:


mov rax, 42
mov rbx, rax
mov [b=rsp, d=-8], rbx

a.bin:

```48 89 c3                        ; mov rbx, rax  ```
```48 89 5c 24 f8                  ; mov [rsp-8], rbx```

### Run:
```bash

./aasm input.asm
./jit a.bin

🎯 Design Philosophy

AmmAsm prioritizes:

**Clarity over brevity** - Explicit b=rbx instead of cryptic NASM syntax

**Zero dependencies** - Pure AmmAsm 3.0.2 + libc, no external libraries

**Educational value** - Readable code for learning x86-64 encoding

**JIT-friendly** - Direct memory execution without ELF overhead

⚠️ Known Limitations

**No ELF/PE output (raw binary only)**

**No relocations or linking**

**Limited instruction set (MOV only in v1.0)**

**No macro system**

**No floating-point support**
```
### Historical note

This version preserves the functionality of the original AmmAsm 1.0 implementation in assembly language. It was assembled by AmmAsm 3.0.2, demonstrating that the newer assembler can compile the assembly-language source of its predecessor.

build:
```sh
./aasm tests/AmmAsm1.0/Aasm.asm -c a.o
gcc -no-pie -nostartfiles a.o -lc -o aasm_asm
```
run:
```sh
./aasm_asm tests/AmmAsm1.0/exc.asm
```
dump:
```sh
objdump -D -b binary -m i386:x86-64 -Mintel a.bin 
```