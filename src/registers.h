#pragma once

#ifndef NULL
#define NULL ((void*)0)
#endif

// 8-bit low registers
extern const char* regs8[];

// 8-bit high registers (r8–r15)
extern const char* regs8GP[];

extern const char* regs8APX[];

// 16-bit registers
extern const char* regs16[];

// 16-bit general-purpose (r8–r15)
extern const char* regs16GP[];

extern const char* regs16APX[];

// 32-bit registers
extern const char* regs32[];

// 32-bit general-purpose (r8–r15)
extern const char* regs32GP[];

extern const char* regs32APX[];

// 64-bit registers
extern const char* regs64[];

extern const char* regs64APX[];

// 64-bit general-purpose (r8–r15)
extern const char* regs64GP[];

// XMM0 - XMM31  ---> XMM16 - XMM31 can be used only in avx-512
extern const char* Xmmregs[];

// YMM0 - YMM31  ---> YMM16 - YMM31 can be used only in avx-512
extern const char* Ymmregs[];

// ZMM0 - ZMM31  ---> ZMM16 - ZMM31 can be used only in avx-512
extern const char* Zmmregs[];