#include "instructions.h"

// .rodata            
const char *CMDS[] = {"mov", "cmp", "jmp", "lea", "push", "pop", "syscall", "call", "add", "sub", "imul", "div", "idiv",
               "je", "jne", "jg", "jl", "jge", "jle", "jz", "ja", "jb", "jnz", "jc", "jae", "jbe",
               "nop", "ret", NULL};

const char *JCC[] = { "je", "jne", "jg", "jl", "jge", "jae", "jbe", "jle", "jz", "ja", "jb", "jnz", "jc", NULL};

const char *HUMAN_AST[] = { "db", "dw", "dd", "dq", NULL};
const char *HUMAN_AST2[] = { "byte", "word", "dword", "qword", NULL};

// sign-extended immediate instructions
const char* short_imm_instructions[] = { "add", "sub", "cmp", NULL};