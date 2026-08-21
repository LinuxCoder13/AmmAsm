section .text
global _start
_start:


add rax,rax,r16
add rax,rax,r23
add rax,rax,r24
sub rax,rax,r31
adc rax,rax,rax
add rax,rdi,rax
add rax,r8,rax
sub rax,r15,rax
add rax,r16,rax
sbb rax,r23,rax
add rax,r24,rax
adc rax,r31,rax
add rax,rax,rax
sbb rdi,rax,rax
add r8,rax,rax
adc r15,rax,rax
add r16,rax,rax
add r23,rax,rax
sub r24,rax,rax
or r31,rax,rax