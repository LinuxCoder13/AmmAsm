#include "instructions.h"

// .rodata            
const char *CMDS[] = {
    "mov", "cmp", "jmp", "lea", "push", "pop", "syscall", "call", "add", "sub", "imul", "div", "idiv",
    "cqo", "cdq", "cwd", "cdqe", "cwde", "cbw", "xor", "adc", "or", "sbb", "and",
    "rol", "ror", "rcl", "rcr", "shl", "shr", "sar", "sal",
    "test", "not", "neg", "mul", "inc", "dec", "movzx", "movsx",
    // cmovcc
    "cmovo", "cmovno", "cmovb", "cmovc", "cmovnae", "cmovae", "cmovnb", "cmovnc", "cmove", "cmovz",
    "cmovne", "cmovnz", "cmovbe", "cmovna", "cmova", "cmovnbe", "cmovs", "cmovns", "cmovp",
    "cmovpe", "cmovnp", "cmovpo", "cmovl", "cmovnge", "cmovge", "cmovnl", "cmovle", "cmovng",
    "cmovg", "cmovnle",
    // setcc
    "seto", "setno", "setb", "setc", "setnae", "setae", "setnb", "setnc", "sete", "setz",
    "setne", "setnz", "setbe", "setna", "seta", "setnbe", "sets", "setns", "setp",
    "setpe", "setnp", "setpo", "setl", "setnge", "setge", "setnl", "setle", "setng",
    "setg", "setnle",
    // SSE
    "movaps", "movups", "xorps", "andps", "andnps", "orps", "orps", "addps", "subps", "mulps", "divps",

    "je", "jne", "jg", "jl", "jge", "jle", "jz", "ja", "jb", "jnz", "jc", "jae", "jbe",
    "nop", "ret", NULL
};

const char *JCC[] = { "je", "jne", "jg", "jl", "jge", "jae", "jbe", "jle", "jz", "ja", "jb", "jnz", "jc", NULL};

const char *HUMAN_AST[] = { "db", "dw", "dd", "dq", NULL};
const char *HUMAN_AST2[] = { "byte", "word", "dword", "qword", NULL};
const char *Sign_extensions[] = { "cqo", "cdq", "cwd", "cdqe", "cwde", "cbw", NULL};

// sign-extended immediate instructions
const char* short_imm_instructions[] = { "add", "sub", "cmp", "xor", "adc", "or", "sbb", "and", NULL};