; LZMA (Lempel-Ziv-Markov chain Algorithm)
; This is GCCs v17 output rewriten for AmmAsm

section .text
global _start

_start:

.LFB0:
	.cfi_startproc
	mov	[b=rsp, d=-16], dword 1024
	mov	r25, rdi
	mov	r23, rsi
	mov	r9, rdx
	mov   [b=rsp, d=-12],dword  1024
	mov	r26, rcx
	mov   [b=rsp, d=-8], dword 1024
	mov   [b=rsp, d=-4], dword 1024
	test	rsi, rsi
	je	   .L12
	xor	r20d, r20d
	xor	r8d, r8d
	mov	esi, -1
	xor	edi, edi
	lea	r18, [b=rsp, d=-12]
	lea	r21, [b=rsp, d=-4]
	mov	r24, -6148914691236517205
	mov	r22d, 1024
	lea	r19, [b=rsp, d=-16]
   align 16, 0x90
.L11:
	mov	rax, r20
	movzx	r17d, BYTE  [b=r25, i=r20]
	mov	ecx, 7
	mul	r24
	sar	r11d, r17d, 7
	{nf} shr	r16, rdx, 1
	{nf} and	rdx, -2
	add	r16, rdx
	mov	rdx, r18
	sub	r16, r20, r16
	cmp	r16, 1
	je	.L14
   align 16, 0x90
.L21:
	cmp	r16, 2
	cmove	rdx, r21
	shr	r10d, esi, 11
	mov	eax,  [b=rdx]
	imul	r10d, eax
	test	r11d, r11d
	jne	.L6
.L22:
	sub	esi, r22d, eax
	shr	esi, 5
	add	eax, esi
	mov	esi, r10d
.L7:
	mov   [b=rdx], eax
	cmp	esi, 16777215
	ja	.L9
   align 16, 0x90
.L8:
	shr	rax, rdi, 24
	add	r8, 1
	sal	esi, 8
	mov   [b=r9, i=r8, d=-1], al
	sal	rdi, 8
	cmp	esi, 16777215
	jbe	.L8
.L9:
	test	ecx, ecx
	je	   .L20
	sub	ecx, 1
	sar	r11d, r17d, cl
	and	r11d, 1
	test	cl, 1
	cmove	rdx, r18, r19
	cmp	r16, 1
	jne	.L21
.L14:
	mov	eax, [b=rsp, d=-8]
	shr	r10d, esi, 11
	lea	rdx, [b=rsp, d=-8]
	imul	r10d, eax
	test	r11d, r11d
	je	.L22
.L6:
	mov	r11d, r10d
	sub	esi, r10d
	shr	r10d, eax, 5
	add	rdi, r11
	sub	eax, r10d
	jmp	.L7
	align 16, 0x90
.L20:
	add	r20, 1
	cmp	r23, r20
	jne	.L11
	mov	[b=r26], r8
	ret
.L12:
	xor	r8d, r8d
	mov	[b=r26], r8
	ret
	.cfi_endproc
.LFE0:

