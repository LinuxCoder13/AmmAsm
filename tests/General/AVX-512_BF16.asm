section .text

global _start
_start:

vcvtneps2bf16 xmm1, xmm2
vcvtneps2bf16 xmm1{k4}{z}, [b=rax, i=rcx]{b}

vcvtneps2bf16 xmm1, ymm2
vcvtneps2bf16 ymm1{k4}{z}, [b=rax, i=rcx]{b}

vcvtneps2bf16 ymm1, zmm2
vcvtneps2bf16 zmm1{k4}{z}, [b=rax, i=rcx]{b}
