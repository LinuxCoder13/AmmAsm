# AmmAsm - x86-64 Assembler
     
<img align="left" src="logo/logo.png" width="140">

AmmAsm - Assembler that sucks less.

![GitHub last commit](https://img.shields.io/github/last-commit/LinuxCoder13/AmmAsm)
![Version](https://img.shields.io/badge/version-v2.4.7-blue)
![Platform](https://img.shields.io/badge/platform-Linux_x86--64-success)

![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-success)
[![AI](https://img.shields.io/badge/AI--assisted-blueviolet)](#)
<br clear="left"/>

**Author:** Ammar Najafli

AmmAsm is a handwritten x86-64 assembler designed for simplicity and clarity, educational and experimental purpuse. It compiles assembly code directly to machine code and produces ELF executables, PIE binaries (Position-Independent Executables), and relocatable object files for Linux x86-64. Successfully tested on Deban12, Kyronix, Windows(experimental).

---

## What's New in v2.4.x

1) Added new instructions: `SSE2`(45 instructions), `AVX/AVX2/AVX512`(~77 instructions), `AVX-512 FP16`(2 instructions), `bsf`, `bsr`, `cmc`, `clc`, `stc`, `cld`, `std`, `cli`, `sti`, `lahf`, `sahf`, `pushf`, `popf`, `popfq`, `iret`, `iretq`, `cpuid`, `hlt`, `wait`, `fwait`, `pause`, `ud2`, `xchg`, `movq`, `rdpru`, `rdtsc`, `rdtscp`, `lfence`

2) Added Float number for `SSE1`, IEEE-754

3) `align` symbol: `align <scale>, <8 bit number>: align 16, 0`

4) Added `XMM16-XMM31` registers
 
5) Added `YMM0-YMM31` registers

6) Added `ZMM0-ZMM31` registers (Fully supported via EVEX prefix engine)

7) Hardware check for the presence of SIMD instructions via `cpuid`

8) Full VEX/EVEX support (mask registers k0-k7, z, broatcast, ect.)

9) Backend refactoring

---

## Advanced AVX-512 Support (EVEX Prefix)

AmmAsm includes a fully handwritten, high-performance **EVEX prefix encoder** with zero external dependencies. It supports the core features of the modern Intel/AMD AVX-512 architecture.

### Key AVX-512 Features

* **32 Vector Registers:** Full access to `ZMM0-ZMM31` (as well as `XMM16-XMM31` and `YMM16-YMM31`).
* **Predicate Masking:** Dedicated hardware masking with `{k1}-{k7}` register selection.
* **Zeroing Masking:** Optional conditional zeroing via the `{z}` modifier.
* **Embedded Broadcast:** Built-in `{b}` flag support for memory operands (e.g., `DWORD BCST`).
* **Compressed Displacement:** Automatic scale matching (disp8 times N) based on data type, broadcast state, and vector size.

### Syntax Example

Unlike standard assemblers, AmmAsm uses an explicit, clean, and bulletproof Key-Value syntax for memory operands to make handwritten assembly robust and easy to parse:

```asm
_start:
    ; 512-bit vector add with masking {k1}, zeroing {z}, SIB-addressing, 
    ; and embedded 1-to-16 DWORD broadcast {b} enabled!
    vaddps zmm20{k1}{z}, zmm10, [b=rbp, i=rcx, s=1, d=64]{b}
```

also check tests/General/

### Verification (objdump)

Code generated directly by AmmAsm and disassembled using standard Linux `objdump -d -Mintel`:

```asm
0000000000000000 <_start>:
   0:	62 e1 2c d9 58 64 0d 	vaddps zmm20{k1}{z},zmm10,DWORD BCST [rbp+rcx*1+0x40]
   7:	10 
```


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


## Features

- Basic SSE/SSE2/AVX1/AVX2/AVX-512 support(VEX/EVEX fullsuport)
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
- Numeric literals - 0xDEADBEEF, 0b1010, 0o777, decimal, negative, float (beta)
- **ELF output - Generates valid Linux x86-64 ET_EXEC, PIE and OBJ(v2.0.0) binary**

---

## Honor Feature

AmmAsm supports RDPRU, an AMD-specific instruction currently not supported by NASM 3.02. (August 10 2026)

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
- SSE/SSE2

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
- No `ah, bh, ch, dh` registers (sorry)

---

```
Intel, what were you smoking when you designed VEX?
```
```
Intel... after implementing EVEX, I no longer want to know. :)
```

---