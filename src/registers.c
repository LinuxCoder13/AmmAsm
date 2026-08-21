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

// 8-bit APX(Advanced performance extension)
const char* regs8APX[] = {
    "r16b", "r17b", "r18b", "r19b", "r20b", 
    "r21b", "r22b", "r23b", "r24b", "r25b", 
    "r26b", "r27b", "r28b", "r29b",  "r30b", "r31b", NULL
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

// 16-bit APX(Advanced performance extension)
const char* regs16APX[] = {
    "r16w", "r17w", "r18w", "r19w", "r20w", 
    "r21w", "r22w", "r23w", "r24w", "r25w", 
    "r26w", "r27w", "r28w", "r29w",  "r30w", "r31w", NULL
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

// 32-bit APX(Advanced performance extension)
const char* regs32APX[] = {
    "r16d", "r17d", "r18d", "r19d", "r20d", 
    "r21d", "r22d", "r23d", "r24d", "r25d", 
    "r26d", "r27d", "r28d", "r29d", "r30d", "r31d", NULL
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

// 64-bit APX(Advanced performance extension)
const char* regs64APX[] = {
    "r16", "r17", "r18", "r19", "r20", 
    "r21", "r22", "r23", "r24", "r25", 
    "r26", "r27", "r28", "r29", "r30", "r31", NULL
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