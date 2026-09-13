# AmmAsm 3.0.0 (APX)

AmmAsm 3.0.0 delivers a completely independent, with **almost** complete native integration of Intel Advanced Performance Extensions (`APX`) and `AVX-512/AVX10.1` sub-systems.

---

1. [**EGPRs**](#1-egprs) - New `r16-r31` registers
2. [**NDD**](#2-ndd) - Non-destructive destination
3. [**NF**](#3-nf) - Status flags modification suppression
4. [**ZU**](#4-zu) - Zero Upper
5. [**CCMPcc / CTESTcc**](#5-ccmp--ctest) - Conditional `CMP` and `TEST` instructions
6. [**PUSH2 / POP2**](#6-push2--pop2) - Extended push/pop for two registers
7. [**JMPABS**](#7-jmpabs) - Absolute 64-bit jump (`jmp abs64`)
8. [**REX2**](#8-rex2) - Extended `REX` prefix
9. [**NDD-CMOVcc**](#9-ndd-cmovcc) - Non-destructive destination for `CMOVcc`
10. [**Syntax Sugar**](#10-syntax-sugar) - Exclusive AmmAsm syntax sugar
11. [**CFCMOVcc**](#11-cfcmov) - Conditionally Faulting Conditional Move

---


## 1. EGPRs
New extended registers `r16-r31` work the same as `r8-r15`, but uses [**REX2**](#REX2) and/or EVEX for [**NDD**](##NDD) forms of instructions. Supported registers:
    

`R16 - R31`  - 64 bit

`R16D - R31D` - 32 bit

`R16W - R31W` - 16 bit

`R16B - R31B` - 8 bit

## 2. NDD
NDD - defines as "Non-destruction destination" but in Intel/NASM documentation you can face with definition as "New destination", however, the first one seems more logical to me.

The NDD form of instructions introduces as `ndd, src1, src2` or `ndd, src`, ndd can't be a memory destination, only register. Encoded via EVEX prefix engine.

Example 1: 

for `add rax, rbx, rcx ; 6 byte` 

equivalent is 

```asm
   add rbx, rcx ; 3 byte
   mov rax, rbx ; 3 byte
   sub rbx, rcx ; 3 byte (return value back)
```

Example 2:

for `inc r30, rcx ; 6 byte`

equivalent is

```asm
    inc rcx ; 3 byte
    mov r30, rcx ; 4 byte
    dec rcx ; 3 byte
```

## 3. NF

The {nf} prefix on a supported instruction inhibits the update of the flags, for example:

```{nf} add rax, rbx```

... will add RAX and RBX together, storing the result in RAX, while leaving the flags register unchanged, also this decorator is valid for 2 and 3 operand instructions. Possible examples:

```asm
    ; You can write {nf} only at start of instruction
    {nf} add rax, rbx
    {nf}add rax, rbx
    {nf} add rax, rbx, rcx
    {nf}add rax, rbx, rcx
    ...
```

List of instructions that can't accept {nf} decorator and AmmAsm will give error: `adc, sbb, rcr, rcl, test, ...`. The {nf} prefix may be ignored on instructions that already don't modify the arithmetic flags.

## 4. ZU
The {zu} prefix can be used meaning - "zero-upper", which disables retaining the upper parts of the registers. Unlike NASMs sugar, AmmAsm support only 8 bit registers. For example: `{zu} setb al`, `{zu} imul r29, r28, 10`. **Important note!**: By combining [**NF**](##NF) and ZU, syntax will be `{nf|zu}` or `{zu|nf}` vs NASMs `{nf}{zu}` or `{zu}{nf}`. For example: `{zu|nf} imul r29, 10`

## 5. CCMP / CTEST
CCMPcc - Condition compare, CTESTcc - Condition test. I think this is one of the major updates for this instruction throughout the APX. This new instructions requires {dfv=} decorator. DFV - (default flags value) denote the 4-bit value of EVEX.[OF,SF,ZF,CF] that is assigned to the status flags when the source condition code “scc” evaluates to false in CCMPscc and CTESTscc instructions. So if condition (from scc) is false then instruction sets the certain EFLAGS from {dfv=} decorator. 

For example(CCMP): 

```asm
    ; Nasm 3.02 has bug here btw. He encodes the imm as WORD what can lead UB.
    ccmpe {dfv=of} [b=rax, i=rcx], byte 10 
```

Pseudo code:

```c
    if (ZF){
        if(*(char*)(rax + rcx) == (uint8_t)10){
            ZF = 1;
        }
        else{
            OF = 1; ZF = 0; SF = 0; CF = 0;
        }
    }
```

For example(CTEST): 

```asm
    cteste {dfv=} rax, 0x20
```

Pseudo code:

```c
    if (ZF){
        if(rax & 0x20){
            ZF = 1;
        }
        else{
            OF = 0; ZF = 0; SF = 0; CF = 0;
        }
    }
```

Possible syntaxes:
```asm
    ccmpge {dfv=of, sf, zf, cf} rax, rcx ; сomma is optionally
    ctestz rax, rax ; if dfv is not given, then of, sf, zf, cf will be zeroed if statment is false
```

## 6. PUSH2 / POP2

Many years compilers were pushing registers in order to follow ABI, example: 

```asm
push r10
push r9
push r8
push rbx
```

this is catastrophe because instruction is accessing to memory and moving data to rsp(memory) multi times, so intel desided finally to fix this by adding `push2` and `pop2`.

So I would explain "why PUSH2 is better than multi-push". Many people say that 2 pushs are better because their machine code is smaller in 3 times. Okay, I want to mention that acctully 2 pushs are 2 micro-ops and 1 push2 is 1 micro-ops, and 2 pushs are touching `rsp` 2 times, while push2 make it once. Nevertheless, people say that CPU can combine them in 1 operation by useing OoO ( Out-of-Order execution). No, he can't, because we have thing called `stack over flow`, it means that if cpu will combine them, and unxpectedly first push will receive segfault then he will not abile to roll back changes to stack wich will lead UB under the CPU level.

Syntax:
```asm
    push2 b64, v64
    pop2 b64, v64
```

Example:
```asm
    push2 rax, rbx
    push2 rcx, rdx
    ; pop symmetrically
    pop2 rdx, rcx
    pop2 rbx, rax
```

Important notes: `b64` and `v64` must be different registers, else #UD. Nether `b64` nor `v64` can be `rsp`, else #UD. NASM ignores this checks, why?? Idk. And for this insructions, stack must be aligned by 16, else #GP.

## 7. JMPABS

Defined as part of the APX specification, JMPABS is a new near jump instruction takes a 64-bit absolute address immediate. It is the only direct jump instruction that can jump anywhere in the address space in 64-bit mode.

AmmAsm follow syntax: `jmpabs label + addend(ocp)`

Also realocation (`R_X86_64_64`) supported for this instruction.

## 8. REX2
REX2 - Extended `REX`. This new prefix contains of REX2 it self `0xD5`(first byte) and clasic `REX`(second byte). This prefix mainly required when non-NDD form of instruction uses `r16-r31` registers and their lower bytes. For more details, see `src/encoder.h`

## 9. NDD-CMOVcc

NDD-CMOVCC - Non-destruction destination for `Cmovcc`, also this rule expands to [**CFCMOVcc**](#11-cfcmov)

For example:
```asm
    cmove rax, rbx, rcx
    cmovo rax, rbx, [b=r29, i=r30]
```

Pseudo code:
```c
    rax = (ZF) ? rcx : rbx
    rax = (OF) ? *(uint64_t*)(r29 + r30) : rbx
```

respectively

also AmmAsm supports [**Syntax-sugar**](#Syntax-sugar) for `cmovscc reg, mem, reg`

## 10. Syntax Sugar

10.1 Ndd-cmovcc/cfcmovcc

AmmAsm resolved one of the problem of cmovcc/cfcmovcc. Opcode for `cmovcc/cfcmovcc reg, mem, reg`  does not exist and you can't encode it derectly, but AmmAsm found solution with NASM 3.02 does not have.

So to eschew this limitation I inversed scc(condition) field by XORing(`^ 1`) last bit. Basically SCC consist of sc[0:3] - condition, and sc[4] - inversed condition.

Example:
```
    input:
        cmovb rax, [b=rcx, i=rdx], rax 
        cmovb rax, rax, [b=rcx, i=rdx]
        cfcmove rax, [b=rbx, i=rcx], rsi 
        cfcmove rax, rsi, [b=rbx, i=rcx]
    output(objdump):
        cmovae rax,rax,QWORD [rcx+rdx*1]
        cmovb  rax,rax,QWORD [rcx+rdx*1]
        cfcmovne rax,rsi,QWORD PTR [rbx+rcx*1]
        cfcmove rax,rsi,QWORD PTR [rbx+rcx*1]

```

10.2 CTEST

Opcode for `test/ctest [mem], reg` does not exists. So basically `test` instruction is doing `dest & src` with out saveing value of operation. NASM reverses operands for `test`, but for `ctest` it refuses(gives error of invalid opcode and operands). AmmAsm just accept this form and nothing else, as `test reg, mem` and `test mem, reg` has same machine code.

## 11. CFCMOV

In instruction `cmove reg, [mem]` because of OoO (Out-of-Order) Execution, CPU reads `[mem]` first, then it checks `ELAGS` in order to know the condition. But I have one question: What if the `[mem]` is NULL(0)? oups! segfault! CPU reads memory no matter the condition is either true or false. So in order to fix this Intel delivered `CFCMOV`, this instruction reads `EFLAGS` first, if condtion is true -> reads memory, else skip. 

Possible syntax:

```asm
    cfcmove r20, r20 
    cfcmove r20, [b=rbx, i=rcx] 
    cfcmove [b=rbx, i=rcx], r20
    cfcmove r20, rdx, [b=rbx, i=rcx]
    cfcmove r20, [b=rbx, i=rcx], rsi ; syntax sugar
    cfcmove r20, rbx, rcx
```

(Hand writen documentation, no AI used)
