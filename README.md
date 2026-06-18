# AmmAsm - x86-64 Assembler

**Version:** 2.0.0       
**Author:** Ammar Najafli     
**License:** MIT         

AmmAsm a is handwritten x86-64 assembler designed for simplicity and clarity. It compiles assembly code directly to machine code and produces ELF executables, PIE binaries (Position-Independent Executables), and relocatable object files for Linux x86-64.

---

## What's New in v2.0.0

1) ### ELF64 Relocatable Object Files

AmmAsm v2.0.0 introduces support for generating valid ELF64 relocatable object files (`.o`).

Generated object files can be linked with `ld`, `gcc`, and other GNU binutils-compatible tools. This allows AmmAsm output to be used in normal Linux build pipelines together with C code and other object files.

This is a major step toward making AmmAsm a real toolchain component instead of only a direct-to-executable assembler.

### Object Files contain

AmmAsm-generated object files now include the core ELF64 sections required for relocation and linking:

- `.text` - executable machine code
- `.data` - initialized data
- `.strtab` - string table for symbol names
- `.shstrtab` - string table for section names
- `.symtab` - symbol table for labels and global symbols
- `.rela.text` - relocation entries for code references that must be resolved by the linker
- `.note.GNU-stack` - .note.GNU-stack - marks the stack as non-executable and avoid GNU linker warnings

References to labels in RIP-relative addressing generate .rela.text entries, resolved later by `ld`, `gcc`, or other compatible linkers.

This makes it possible to generate object files with symbols, sections, and relocation metadata instead of only raw executable output.

2) ### Global Symbols

AmmAsm v2.0.0 adds support for the `global` directive.

The directive marks one or more labels as externally visible symbols, allowing them to be used as entry points or referenced from other object files during linking

> Note: global is meaningful only for object files (.o). It is useless when generating raw executables directly.

Syntax:

```asm
global lab1, lab2, lab3, ...
```

Example:

**Hello, World in object file**

```ASM
section data
msg: db "Hello, World\n", 0
msg_len: dq $ - msg

section text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [b=msg]
    mov rdx, msg_len
    syscall

    mov rax, 60
    syscall
```

### Bootstrap Object Example

AmmAsm includes a small bootstrap object example: `strcmp.asm`.

This file implements a simple `strcmp`-like function written in AmmAsm, assembled into `strcmp.o`, and linked back with `Aasm.c` during the build.


3) New instructions: `push`, `pop` (currently register operands only)

4) Added more tests

# END
---

## Features

- Direct x86-64 encoding - No NASM/GAS dependencies
- Multiple operand sizes - 8/16/32/64-bit registers and immediates
- Memory addressing - Full SIB/ModRM support with explicit key-value syntax
- RIP-relative addressing - Automatic for label bases (v1.6)
- Label support - Global and local labels with two-pass symbol resolution
- Inline literals - Embed strings and data directly in .text
- Control flow - jmp, call, conditional jumps with relative addressing
- Two-pass linker - Built-in symbol resolution and relocation
- Numeric literals - 0xDEADBEEF, 0b1010, 0o777, decimal, negative
- **ELF output - Generates valid Linux x86-64 ET_EXEC, PIE and OBJ(v2.0.0) binary**

---


**Expression features:**

- `mov rax, msg+5` -> absolute address
- `jmp msg+10` -> relative jump with offset
- `lab: dq $-msg, msg+8, msg+16` -> data directives
- `add rax, $-_start` -> arithmetic with current address
- `mov rax, (((((10 * 2) << 2) + $) & 0xFF) | 0x100) - label` -> mixed all

**Expression examples:**

```asm
_start:
    mov rax, msg           ; address of msg (0x401000)
    mov rbx, $-_start      ; length from _start to current
    mov rcx, msg+5         ; address of 'W' in "Hello World"
    mov rdx, msg+8         ; address of 'r' in "World"
    
    .tmp: dq $-msg, msg+5, msg+8, 0xdeadbeef
    
    jmp _start
    
msg: db "Hello World", 0
```

---

**Backend Refactoring**

- resolve_expr() - New expression evaluator that supports:
- Label resolution (msg)
- Current address ($)
- Character literals ('A')
- Arithmetic (+, -, *, /, <<, >>, &, |, ^)
- Parentheses for grouping
- Mixed expressions with labels and constants

---

> Assembling x86-64 code → generating machine code → running binary

[![Demo](https://img.youtube.com/vi/P-bdMZXXyVg/0.jpg)](https://youtube.com/watch?v=P-bdMZXXyVg)

---

## Pipeline Stages

### 1. Lexer (LEXER)

Converts source text to a flat token stream.

- Recognizes instructions, registers (rax), literals, labels, directives
- Comments: //, ;, /* ... */
- Number bases: hex (0x), binary (0b), octal (0o), decimal
- Label scoping: global label:, local .label: (scoped to last global)
- Character literals: 'A', '\n', '\0'

### 2. Parser (PARSE)

Builds the Abstract Syntax Tree.

- Validates operand combinations per instruction
- Resolves operand types: O_REG8/16/32/64, O_IMM, O_MEM, O_LABEL, O_CHAR, O_EXPR
- Produces typed AST nodes: AST_INS, AST_LABEL, AST_U8/16/32/64, etc.

### 3. Code Generator (parseInst)

Emits x86-64 machine code per AST node.

- REX prefix construction
- ModR/M and SIB encoding via encode_inst_rm_rm()
- Displacement and immediate encoding (little-endian)
- Placeholder bytes (0x00000000) for unresolved label references

### 4. Linker (collect_labels + resolve_labels)

Two-pass symbol resolution.

- Pass 1 - Walks AST, assigns vaddr to each AST_LABEL (base 0x401000 or 0x1000(PIE))
- Pass 2 - Patches placeholders:
  - MOV r64, label -> absolute 64-bit address (8 bytes at mc[2])
  - JMP/CALL/JCC label -> rel32 = target - (current_pc + inst_size)
  - RIP-relative -> disp32 = target - (current_pc + inst_size) + user_disp

### 5. Compiler (compiler)

Orchestrates all passes and writes the final binary buffer.

---

## Syntax Reference

### Registers

```asm
mov rax, 42        ; 64-bit
mov eax, 42        ; 32-bit
mov ax,  42        ; 16-bit
mov al,  42        ; 8-bit
mov r8,  r15      ; Extended regs r8-r15
```

### Numeric Literals

```asm
mov rax, 42            ; Decimal
mov rax, 0xff          ; Hexadecimal
mov rax, 0b1010        ; Binary
mov rax, 0o777         ; Octal
mov rax, -10           ; Negative
mov al,  'A'           ; Character literal
```

### Memory Addressing

Unlike NASM, AmmAsm uses an explicit key-value format inside [...]:

| Key | Meaning | Example |
|-----|---------|---------|
| b=REG | Base register | b=rbx |
| i=REG | Index register | i=rcx |
| s=N | Scale (1/2/4/8) | s=4 |
| d=N | Displacement | d=0x10 |

```asm
mov rax, [b=rbx]                       ; [rbx]
mov rax, [b=rbx, d=16]                 ; [rbx + 16]
mov rax, [b=rbx, i=rcx, s=8]           ; [rbx + rcx*8]
mov rax, [b=rbx, i=rcx, s=8, d=0x10]   ; [rbx + rcx*8 + 16]
mov [b=rsp, d=8], rax                  ; store to [rsp+8]

mov rax, [b=msg]                       ; load from msg
mov rax, [b=msg, d=4]                  ; msg + 4
```

### Data Directives

```asm
msg:    db  "Hello, World!", 0x0A, 0
bytes:  db  0x01, 0x02, 0x03, 'A', 'B'
words:  dw 100, 200, 300, 0x1234
dwords: dd 0xDEADBEEF, 1000000
qwords: dq 0x123456789ABCDEF0, 0
```

### Comparison
```asm
cmp rax, 42        ; rax vs immediate (64-bit)
cmp eax, ebx       ; register vs register (32-bit)
cmp al,  'A'       ; 8-bit with char literal
```

### Conditional Jumps
```asm
cmp rax, 0
je  done            ; jump if equal
jne loop            ; jump if not equal
jl  less            ; jump if less (signed)
jg  greater         ; jump if greater (signed)
jb  below           ; jump if below (unsigned)
ja  above           ; jump if above (unsigned)
```

### Unconditional Control Flow
```asm
jmp  label         ; relative jump  (E9 rel32)
jmp  rax           ; indirect jump  (FF /4)
call func          ; relative call  (E8 rel32)
call rbx           ; indirect call  (FF /2)
```

### Load Label Address
```asm
mov rax, msg      ; load virtual address of 'msg' into rax(Does not work in PIE)
```

---

## Building & Usage

```bash
# Build
gcc -std=gnu99 -O2 -Os Aasm.c bootstrap/*.o -o aasm

# Compile assembly
./aasm input.asm
./aasm input.asm -o output
./aasm -pie input.asm -o prog
./aasm input.asm -c prog.o

# Run
chmod +x output && ./output
ld prog.o -o output && chmod +x output && ./output
```

---

## Known Limitations

- Limited instruction set - `mov`, `add`, `sub`, `imul`, `cmp`, `jmp`, `lea`, `call`, `jcc`, `push`, `pop`,`syscall` (more coming)
- No multi-file linking
- No `.data` / `.bss` sections for direct compiling to raw executable, however data/text exist for obj files
- No macro system
- No floating-point (FPU/SSE)
- No optimization passes (coming in ..., soon)

---

## Resources

- [Intel SDM - IA-32/x86-64 Developer Manual](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
- [x86-64 Instruction Encoding - OSDev Wiki](https://wiki.osdev.org/X86-64_Instruction_Encoding)
- [ELF Specification](https://refspecs.linuxfoundation.org/elf/elf.pdf)
- [System V AMD64 ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)

---

**Made by a 15 y.o. systems programmer.**