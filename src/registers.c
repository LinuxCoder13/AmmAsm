#include "registers.h"

// 8-bit low registers
const char* regs8[] = {
    "al", "bl", "bpl", "cl", "dil", "dl", "sil", "spl",
    NULL
};

// 8-bit high registers (r8–r15)
const char* regs8GP[] = {
    "r10b", "r11b", "r12b", "r13b", "r14b", "r15b", "r8b", "r9b",
    NULL
};

// 16-bit registers
const char* regs16[] = {
    "ax", "bp", "bx", "cx", "di", "dx", "si", "sp",
    NULL
};

// 16-bit general-purpose (r8–r15)
const char* regs16GP[] = {
    "r10w", "r11w", "r12w", "r13w", "r14w", "r15w", "r8w", "r9w",
    NULL
};

// 32-bit registers
const char* regs32[] = {
    "eax", "ebp", "ebx", "ecx", "edi", "edx", "esi", "esp",
    NULL
};

// 32-bit general-purpose (r8–r15)
const char* regs32GP[] = {
    "r10d", "r11d", "r12d", "r13d", "r14d", "r15d", "r8d", "r9d",
    NULL
};

// 64-bit registers
const char* regs64[] = {
    "rax", "rbp", "rbx", "rcx", "rdi", "rdx", "rsi", "rsp",
    NULL
};

// 64-bit general-purpose (r8–r15)
const char* regs64GP[] = {
    "r10", "r11", "r12", "r13", "r14", "r15", "r8", "r9",
    NULL
};

// XMM registers (0–31) in lexicographic order
const char* Xmmregs[] = {
    "xmm0", "xmm1", "xmm10", "xmm11", "xmm12", "xmm13", "xmm14", "xmm15",
    "xmm16", "xmm17", "xmm18", "xmm19", "xmm2", "xmm20", "xmm21", "xmm22",
    "xmm23", "xmm24", "xmm25", "xmm26", "xmm27", "xmm28", "xmm29", "xmm3",
    "xmm30", "xmm31", "xmm4", "xmm5", "xmm6", "xmm7", "xmm8", "xmm9",
    NULL
};

// YMM registers (0–31) in lexicographic order
const char* Ymmregs[] = {
    "ymm0", "ymm1", "ymm10", "ymm11", "ymm12", "ymm13", "ymm14", "ymm15",
    "ymm16", "ymm17", "ymm18", "ymm19", "ymm2", "ymm20", "ymm21", "ymm22",
    "ymm23", "ymm24", "ymm25", "ymm26", "ymm27", "ymm28", "ymm29", "ymm3",
    "ymm30", "ymm31", "ymm4", "ymm5", "ymm6", "ymm7", "ymm8", "ymm9",
    NULL
};

// ZMM registers (0–31) in lexicographic order
const char* Zmmregs[] = {
    "zmm0", "zmm1", "zmm10", "zmm11", "zmm12", "zmm13", "zmm14", "zmm15",
    "zmm16", "zmm17", "zmm18", "zmm19", "zmm2", "zmm20", "zmm21", "zmm22",
    "zmm23", "zmm24", "zmm25", "zmm26", "zmm27", "zmm28", "zmm29", "zmm3",
    "zmm30", "zmm31", "zmm4", "zmm5", "zmm6", "zmm7", "zmm8", "zmm9",
    NULL
};