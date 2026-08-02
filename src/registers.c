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

// XMM
const char* Xmmregs[] = {
    "xmm0",  "xmm1",  "xmm2",  "xmm3",
    "xmm4",  "xmm5",  "xmm6",  "xmm7",
    "xmm8",  "xmm9",  "xmm10", "xmm11",
    "xmm12", "xmm13", "xmm14", "xmm15",
    "xmm16", "xmm17", "xmm18", "xmm19",
    "xmm20", "xmm21", "xmm22", "xmm23",
    "xmm24", "xmm25", "xmm26", "xmm27",
    "xmm28", "xmm29", "xmm30", "xmm31",
    NULL
};

// YMM
const char* Ymmregs[] = {
    "ymm0",  "ymm1",  "ymm2",  "ymm3",
    "ymm4",  "ymm5",  "ymm6",  "ymm7",
    "ymm8",  "ymm9",  "ymm10", "ymm11",
    "ymm12", "ymm13", "ymm14", "ymm15",
    "ymm16", "ymm17", "ymm18", "ymm19",
    "ymm20", "ymm21", "ymm22", "ymm23",
    "ymm24", "ymm25", "ymm26", "ymm27",
    "ymm28", "ymm29", "ymm30", "ymm31",
    NULL
};

// ZMM
const char* Zmmregs[] = {
    "zmm0",  "zmm1",  "zmm2",  "zmm3",
    "zmm4",  "zmm5",  "zmm6",  "zmm7",
    "zmm8",  "zmm9",  "zmm10", "zmm11",
    "zmm12", "zmm13", "zmm14", "zmm15",
    "zmm16", "zmm17", "zmm18", "zmm19",
    "zmm20", "zmm21", "zmm22", "zmm23",
    "zmm24", "zmm25", "zmm26", "zmm27",
    "zmm28", "zmm29", "zmm30", "zmm31",
    NULL
};