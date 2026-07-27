#pragma once

#ifndef NULL
#define NULL ((void*)0)
#endif

// 8-bit low registers
extern const char* regs8[];

// 8-bit high registers (r8–r15)
extern const char* regs8GP[];

// 16-bit registers
extern const char* regs16[];

// 16-bit general-purpose (r8–r15)
extern const char* regs16GP[];

// 32-bit registers
extern const char* regs32[];

// 32-bit general-purpose (r8–r15)
extern const char* regs32GP[];

// 64-bit registers
extern const char* regs64[];

// 64-bit general-purpose (r8–r15)
extern const char* regs64GP[];

// XMM0 - XMM16
extern const char* Xmmregs[];