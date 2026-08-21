section .text

global _start

_start:

vcvtps2ph [b=rax, i=rbx, s=2]{k1}, zmm20, 0x7f
vcvtps2ph [b=rax, d=64]{k4}, zmm29, 0xff
