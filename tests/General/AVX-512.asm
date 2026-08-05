global _start

section text
_start:

    ;========================
    ; VSQRTPS
    ;========================

    vsqrtps xmm0, xmm19
    vsqrtps xmm16{k2}, [b=rax]{b}
    vsqrtps ymm7, [b=rbx, d=32]
    vsqrtps zmm20, [b=rcx]{b}
    vsqrtps zmm31{k3}{z}, [b=r8, i=r9, s=4, d=64]{b}

    ;========================
    ; VSQRTPD
    ;========================

    vsqrtpd xmm3, [b=r10]
    vsqrtpd ymm14, ymm15
    vsqrtpd zmm16, [b=r11]{b}
    vsqrtpd zmm31{k5}, [b=r12, d=128]{b}

    ;========================
    ; VADDPS
    ;========================

    vaddps xmm0, xmm1, xmm2
    vaddps ymm5, ymm6, [b=rax]
    vaddps zmm20, zmm21, [b=rbx]{b}
    vaddps zmm31{k2}{z}, zmm30, [b=rcx, i=rdx, s=8, d=32]{b}

    ;========================
    ; VDIVPS
    ;========================

    vdivps xmm2, xmm3, xmm4
    vdivps xmm5, xmm5, [b=r8]
    vdivps ymm8, ymm5, [b=r9, d=64]
    vdivps zmm17{k1}, zmm18, [b=r10]{b}

    ;========================
    ; VMULPD
    ;========================

    vmulpd xmm0, xmm1, xmm2
    vmulpd ymm15, ymm15, [b=r11]
    vmulpd zmm22, zmm23, [b=r12]{b}

    ;========================
    ; VMAXPS
    ;========================

    vmaxps xmm1, xmm2, xmm3
    vmaxps ymm7, ymm7, [b=r13]
    vmaxps zmm24{k6}{z}, zmm25, [b=r14]{b}

    ;========================
    ; VMINPD
    ;========================

    vminpd xmm6, xmm7, xmm8
    vminpd ymm10, ymm12, [b=r15]
    vminpd zmm26, zmm27, [b=rax, d=16]{b}

    ;========================
    ; VXORPS
    ;========================

    vxorps xmm0, xmm1, xmm2
    vxorps ymm4, ymm10, [b=rbx]
    vxorps zmm28, zmm29, [b=rcx]{b}

    ;========================
    ; VPADDD
    ;========================

    vpaddd xmm0, xmm1, xmm2
    vpaddd ymm5, ymm6, [b=rdx]
    vpaddd zmm30{k4}, zmm31, [b=r8]{b}

    ret