global _start

section .data

vec1: dq 0x1122334455667788, 0x99aabbccddeeff00
vec2: dq 0x0123456789abcdef, 0xfedcba9876543210

section .text

_start:
lab:
label:

    cmove  rcx, rdx
    cmovne rcx, rdx
    cmovg  rcx, rdx
    cmovge rcx, rdx
    sete   al
    setne  bl
    setl   sil
    setle  dil

    movups xmm9,  [b=r15]
    movups xmm10, [b=r14,d=32]
    movups xmm11, [b=r13,i=r12,s=2]
    movups xmm12, [b=r11,i=r10,s=4,d=-96]
    movups xmm13, [b=r9,i=r8,s=8,d=511]
    movups xmm14, [b=vec1]
    movups xmm15, [b=vec2]

    movups [b=rsp], xmm9
    movups [b=rsp,i=rax,s=2], xmm10
    movups [b=r13,i=r12,s=2], xmm11
    movups [b=r11,i=r10,s=4,d=128], xmm12
    movups [b=r9,i=r8,s=8,d=-128], xmm13
    movups [b=vec1], xmm14
    movups [b=vec2], xmm15

    addps xmm9,  [b=r15]
    addps xmm10, [b=r14,d=64]
    addps xmm11, [b=r13,i=r12,s=2]
    addps xmm12, [b=r11,i=r10,s=4,d=-32]
    addps xmm13, [b=vec1]
    addps xmm14, [b=vec2]

    subps xmm15, [b=r9]
    subps xmm8,  [b=r8,d=-64]
    subps xmm7,  [b=rdi,i=rsi,s=2]
    subps xmm6,  [b=rbx,i=rax,s=8,d=256]

    mulps xmm5, [b=r10]
    mulps xmm4, [b=r11,d=255]
    mulps xmm3, [b=r12,i=r13,s=4]
    mulps xmm2, [b=r14,i=r15,s=8,d=-255]
    mulps xmm1, [b=vec1]
    mulps xmm0, [b=vec2]

    divps xmm15, [b=rax]
    divps xmm14, [b=rbx,d=96]
    divps xmm13, [b=rcx,i=rdx,s=2]
    divps xmm12, [b=r8,i=r9,s=4,d=-80]
    divps xmm11, [b=vec1]
    divps xmm10, [b=vec2]

    xorps xmm9,  [b=r15]
    xorps xmm8,  [b=r14,d=-16]
    xorps xmm7,  [b=r13,i=r12,s=8]
    xorps xmm6,  [b=vec1]

    andps xmm5, [b=r11]
    andps xmm4, [b=r10,d=127]
    andps xmm3, [b=r9,i=r8,s=2]
    andps xmm2, [b=vec2]

    andnps xmm1, [b=rax]
    andnps xmm0, [b=rbx,d=-127]
    andnps xmm15, [b=rcx,i=rdx,s=4]
    andnps xmm14, [b=vec1]

    orps xmm13, [b=r8]
    orps xmm12, [b=r9,d=80]
    orps xmm11, [b=r10,i=r11,s=8]
    orps xmm10, [b=vec2]

    movaps xmm9,  [b=r15]
    movaps xmm10, [b=r14,d=16]
    movaps xmm11, [b=r13,i=r12,s=2]
    movaps xmm12, [b=vec1]

    movaps [b=r15], xmm9
    movaps [b=r14,d=48], xmm10
    movaps [b=r13,i=r12,s=2,d=96], xmm11
    movaps [b=vec2], xmm12

    cmove r8,  r9
    cmovne r10, r11
    cmovg r12, r13
    cmovge r14, r15

    sete  r8b
    setne r9b
    setl  r10b
    setle r11b