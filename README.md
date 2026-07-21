# AmmAsm - x86-64 Assembler

![Version](https://img.shields.io/badge/version-v2.3.0-blue)
![Platform](https://img.shields.io/badge/platform-Linux_x86--64-success)
![Language](https://img.shields.io/badge/language-C-00599C)
![License](https://img.shields.io/badge/license-MIT-green)
![ELF](https://img.shields.io/badge/output-ELF64-important)
![Status](https://img.shields.io/badge/status-active-success)
![Assembler](https://img.shields.io/badge/x86--64-Assembler-red)
![Objects](https://img.shields.io/badge/ELF-relocatable-blueviolet)
![Executables](https://img.shields.io/badge/ET_EXEC-supported-success)
![PIE](https://img.shields.io/badge/PIE-supported-success)
[![AI](https://img.shields.io/badge/AI--assisted-blueviolet)](#)

![GitHub last commit](https://img.shields.io/github/last-commit/LinuxCoder13/AmmAsm)
     
**Author:** Ammar Najafli           

AmmAsm - Assembler that sucks less

AmmAsm is a handwritten x86-64 assembler designed for simplicity and clarity. It compiles assembly code directly to machine code and produces ELF executables, PIE binaries (Position-Independent Executables), and relocatable object files for Linux x86-64,`primarily tested on Debian GNU/Linux 12 (bookworm) x86-64`.

---

## What's New in v2.2.x

1) New macro system. Look doc/macro.txt in order to know it syntax

2) Added bss Section support for ET_REL

3) `-E` flag, that runs the preprocessor only and generate .i

4) Added new instructions: `not`, `neg`, `mul`, `inc`, `dec`, `movzx`, `movsx`, full `CMOVcc`, full `SETcc`, basic `SSE` support

5) Added XMM registers (XMM0–XMM15)

6) Added Fibonacci-test

---

## Object File Support (ELF64 Relocatable)

Starting from v2.0.0, AmmAsm can generate valid ELF64 relocatable object files (`.o`) in addition to executables.

Generated object files are compatible with the standard Linux toolchain and can be linked using `ld`, `gcc`, or other GNU binutils-compatible linkers.

This allows AmmAsm to participate in normal C/C++ build pipelines instead of being limited to standalone executable generation.

### Supported Sections

Generated object files contain:

- `.text` - executable code
- `.data` - initialized data
- `.symtab` - symbol table
- `.strtab` - symbol string table
- `.shstrtab` - section-name string table
- `.rela.text` - relocation records
- `.note.GNU-stack` - marks stack as non-executable

### Global and Extern Symbols

The `global` and `extern` directivies exports labels into the ELF symbol table.

```asm
global _start, strcmp
extern printf, __pthread_unregister_cancel_restore
```

Only object-file generation uses exported symbols. They have no effect when producing ET_EXEC.

### Relocations

References that cannot be resolved during assembly automatically generate relocation entries.

Currently supported relocations include:

- RIP-relative label references
- External/global symbols
- Symbol references requiring linker resolution

Relocations are emitted into `.rela.text` and are resolved later by `ld`, `gcc`, or compatible ELF linkers.

### Example

```bash
./aasm hello.asm -c hello.o
gcc hello.o -o hello
./hello
```

### Bootstrap Example

The repository contains `bootstrap/strcmp.asm`, which is assembled into `strcmp.o` and linked together with `Aasm.c` during the build process.

This demonstrates interoperability between AmmAsm-generated object files and ordinary C programs.


---


## Features

- Basic SSE support
- Macro system (v2.2.0)
- Compatible with GNU ld and GCC object-file linking
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

> Assembling x86-64 code -> generating object-files -> linking via `ld` -> running binary

[![Demo](https://img.youtube.com/vi/PPIjjfSJy1k/0.jpg)](https://www.youtube.com/watch?v=PPIjjfSJy1k)

---

## Pipeline Stages

### 1. Preprocess 

Parse all macro and replace them in called place.

- Parse macro body, store it args, content in memory.
- Parses all macros and expands them where they are called.
- Recursively expands nested macros.
- After finishing, creates file.asm.i file and gives this file to Lexer


### 2. Lexer (LEXER)

Converts source text to a flat token stream.

- Recognizes instructions, registers (rax), literals, labels, directives
- Comments: //, ;, /* ... */
- Number bases: hex (0x), binary (0b), octal (0o), decimal
- Label scoping: global label:, local .label: (scoped to last global)
- Character literals: 'A', '\n', '\0'

### 3. Parser (PARSE)

Builds the Abstract Syntax Tree.

- Validates operand combinations per instruction
- Resolves operand types: O_REG8/16/32/64, O_IMM, O_MEM, O_CHAR, O_EXPR
- Produces typed AST nodes: AST_INS, AST_LABEL, AST_U8/16/32/64, etc.

### 4. Code Generator (parseInst)

Emits x86-64 machine code per AST node.

- REX prefix construction
- ModR/M and SIB encoding via encode_inst_rm_rm()
- Displacement and immediate encoding (little-endian)
- Placeholder bytes (0x00000000) for unresolved label references

### 5. Linker (collect_labels + resolve_labels)

Two-pass symbol resolution.

- Pass 1 - Walks AST, assigns vaddr to each AST_LABEL (base 0x401000 or 0x1000(PIE))
- Pass 2 - Patches placeholders:
  - MOV r64, label -> absolute 64-bit address (8 bytes at mc[2])
  - JMP/CALL/JCC label -> rel32 = target - (current_pc + inst_size)
  - RIP-relative -> disp32 = target - (current_pc + inst_size) + user_disp

### 6. Compiler (compiler)

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
./build.sh

# Compile assembly
./aasm input.asm
./aasm input.asm -o output
./aasm -pie input.asm -o prog
./aasm input.asm -c prog.o -d
./aasm input.asm -c prog.o -E

# Run
chmod +x output && ./output
ld prog.o -o output && chmod +x output && ./output
```

---

## Known Limitations

- Limited instruction set - Only a subset of the x86-64 instruction set is currently implemented (look at `./src/instructions.c`)
- x87 FPU not implemented

---