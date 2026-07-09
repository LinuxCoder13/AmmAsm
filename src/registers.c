#include "registers.h"

// 8-bit low registers
const char* regs8[] = {
    "al", "cl", "dl", "bl",
    "spl", "bpl", "sil", "dil",
    NULL
};

// 8-bit high registers (r8–r15)
const char* regs8GP[] = {
    "r8b", "r9b", "r10b", "r11b",
    "r12b", "r13b", "r14b", "r15b",
    NULL
};

// 16-bit registers
const char* regs16[] = {
    "ax", "cx", "dx", "bx",
    "sp", "bp", "si", "di",
    NULL
};

// 16-bit general-purpose (r8–r15)
const char* regs16GP[] = {
    "r8w", "r9w", "r10w", "r11w",
    "r12w", "r13w", "r14w", "r15w",
    NULL
};

// 32-bit registers
const char* regs32[] = {
    "eax", "ecx", "edx", "ebx",
    "esp", "ebp", "esi", "edi",
    NULL
};

// 32-bit general-purpose (r8–r15)
const char* regs32GP[] = {
    "r8d", "r9d", "r10d", "r11d",
    "r12d", "r13d", "r14d", "r15d",
    NULL
};

// 64-bit registers
const char* regs64[] = {
    "rax", "rcx", "rdx", "rbx",
    "rsp", "rbp", "rsi", "rdi",
    NULL 
};

// 64-bit general-purpose (r8–r15)
const char* regs64GP[] = {
    "r8", "r9", "r10", "r11",
    "r12", "r13", "r14", "r15",
    NULL
};