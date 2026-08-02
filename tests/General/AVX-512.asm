global _start

section .text

_start:

vmaxsh xmm0,xmm1,xmm2
vmaxsh xmm10,xmm20,xmm30
vmaxsh xmm5,xmm31,xmm31
vmaxsh xmm31,xmm16,xmm2

vminsh xmm0,xmm1,xmm2
vminsh xmm10,xmm20,xmm30
vminsh xmm5,xmm31,xmm31
vminsh xmm31,xmm16,xmm2
