
aasm5:     file format elf64-x86-64


Disassembly of section .init:

0000000000003000 <_init>:
    3000:	48 83 ec 08          	sub    rsp,0x8
    3004:	48 8b 05 c5 6f 01 00 	mov    rax,QWORD PTR [rip+0x16fc5]        # 19fd0 <__gmon_start__@Base>
    300b:	48 85 c0             	test   rax,rax
    300e:	74 02                	je     3012 <_init+0x12>
    3010:	ff d0                	call   rax
    3012:	48 83 c4 08          	add    rsp,0x8
    3016:	c3                   	ret

Disassembly of section .plt:

0000000000003020 <free@plt-0x10>:
    3020:	ff 35 ca 6f 01 00    	push   QWORD PTR [rip+0x16fca]        # 19ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    3026:	ff 25 cc 6f 01 00    	jmp    QWORD PTR [rip+0x16fcc]        # 19ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    302c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003030 <free@plt>:
    3030:	ff 25 ca 6f 01 00    	jmp    QWORD PTR [rip+0x16fca]        # 1a000 <free@GLIBC_2.2.5>
    3036:	68 00 00 00 00       	push   0x0
    303b:	e9 e0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003040 <putchar@plt>:
    3040:	ff 25 c2 6f 01 00    	jmp    QWORD PTR [rip+0x16fc2]        # 1a008 <putchar@GLIBC_2.2.5>
    3046:	68 01 00 00 00       	push   0x1
    304b:	e9 d0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003050 <strcasecmp@plt>:
    3050:	ff 25 ba 6f 01 00    	jmp    QWORD PTR [rip+0x16fba]        # 1a010 <strcasecmp@GLIBC_2.2.5>
    3056:	68 02 00 00 00       	push   0x2
    305b:	e9 c0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003060 <strncpy@plt>:
    3060:	ff 25 b2 6f 01 00    	jmp    QWORD PTR [rip+0x16fb2]        # 1a018 <strncpy@GLIBC_2.2.5>
    3066:	68 03 00 00 00       	push   0x3
    306b:	e9 b0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003070 <remove@plt>:
    3070:	ff 25 aa 6f 01 00    	jmp    QWORD PTR [rip+0x16faa]        # 1a020 <remove@GLIBC_2.2.5>
    3076:	68 04 00 00 00       	push   0x4
    307b:	e9 a0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003080 <strncmp@plt>:
    3080:	ff 25 a2 6f 01 00    	jmp    QWORD PTR [rip+0x16fa2]        # 1a028 <strncmp@GLIBC_2.2.5>
    3086:	68 05 00 00 00       	push   0x5
    308b:	e9 90 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003090 <puts@plt>:
    3090:	ff 25 9a 6f 01 00    	jmp    QWORD PTR [rip+0x16f9a]        # 1a030 <puts@GLIBC_2.2.5>
    3096:	68 06 00 00 00       	push   0x6
    309b:	e9 80 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030a0 <fread@plt>:
    30a0:	ff 25 92 6f 01 00    	jmp    QWORD PTR [rip+0x16f92]        # 1a038 <fread@GLIBC_2.2.5>
    30a6:	68 07 00 00 00       	push   0x7
    30ab:	e9 70 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030b0 <fclose@plt>:
    30b0:	ff 25 8a 6f 01 00    	jmp    QWORD PTR [rip+0x16f8a]        # 1a040 <fclose@GLIBC_2.2.5>
    30b6:	68 08 00 00 00       	push   0x8
    30bb:	e9 60 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030c0 <strlen@plt>:
    30c0:	ff 25 82 6f 01 00    	jmp    QWORD PTR [rip+0x16f82]        # 1a048 <strlen@GLIBC_2.2.5>
    30c6:	68 09 00 00 00       	push   0x9
    30cb:	e9 50 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030d0 <printf@plt>:
    30d0:	ff 25 7a 6f 01 00    	jmp    QWORD PTR [rip+0x16f7a]        # 1a050 <printf@GLIBC_2.2.5>
    30d6:	68 0a 00 00 00       	push   0xa
    30db:	e9 40 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030e0 <rewind@plt>:
    30e0:	ff 25 72 6f 01 00    	jmp    QWORD PTR [rip+0x16f72]        # 1a058 <rewind@GLIBC_2.2.5>
    30e6:	68 0b 00 00 00       	push   0xb
    30eb:	e9 30 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030f0 <snprintf@plt>:
    30f0:	ff 25 6a 6f 01 00    	jmp    QWORD PTR [rip+0x16f6a]        # 1a060 <snprintf@GLIBC_2.2.5>
    30f6:	68 0c 00 00 00       	push   0xc
    30fb:	e9 20 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003100 <strtof@plt>:
    3100:	ff 25 62 6f 01 00    	jmp    QWORD PTR [rip+0x16f62]        # 1a068 <strtof@GLIBC_2.2.5>
    3106:	68 0d 00 00 00       	push   0xd
    310b:	e9 10 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003110 <memset@plt>:
    3110:	ff 25 5a 6f 01 00    	jmp    QWORD PTR [rip+0x16f5a]        # 1a070 <memset@GLIBC_2.2.5>
    3116:	68 0e 00 00 00       	push   0xe
    311b:	e9 00 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003120 <fputc@plt>:
    3120:	ff 25 52 6f 01 00    	jmp    QWORD PTR [rip+0x16f52]        # 1a078 <fputc@GLIBC_2.2.5>
    3126:	68 0f 00 00 00       	push   0xf
    312b:	e9 f0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003130 <fgets@plt>:
    3130:	ff 25 4a 6f 01 00    	jmp    QWORD PTR [rip+0x16f4a]        # 1a080 <fgets@GLIBC_2.2.5>
    3136:	68 10 00 00 00       	push   0x10
    313b:	e9 e0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003140 <fprintf@plt>:
    3140:	ff 25 42 6f 01 00    	jmp    QWORD PTR [rip+0x16f42]        # 1a088 <fprintf@GLIBC_2.2.5>
    3146:	68 11 00 00 00       	push   0x11
    314b:	e9 d0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003150 <ftell@plt>:
    3150:	ff 25 3a 6f 01 00    	jmp    QWORD PTR [rip+0x16f3a]        # 1a090 <ftell@GLIBC_2.2.5>
    3156:	68 12 00 00 00       	push   0x12
    315b:	e9 c0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003160 <memcpy@plt>:
    3160:	ff 25 32 6f 01 00    	jmp    QWORD PTR [rip+0x16f32]        # 1a098 <memcpy@GLIBC_2.14>
    3166:	68 13 00 00 00       	push   0x13
    316b:	e9 b0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003170 <malloc@plt>:
    3170:	ff 25 2a 6f 01 00    	jmp    QWORD PTR [rip+0x16f2a]        # 1a0a0 <malloc@GLIBC_2.2.5>
    3176:	68 14 00 00 00       	push   0x14
    317b:	e9 a0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003180 <strncasecmp@plt>:
    3180:	ff 25 22 6f 01 00    	jmp    QWORD PTR [rip+0x16f22]        # 1a0a8 <strncasecmp@GLIBC_2.2.5>
    3186:	68 15 00 00 00       	push   0x15
    318b:	e9 90 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003190 <fseek@plt>:
    3190:	ff 25 1a 6f 01 00    	jmp    QWORD PTR [rip+0x16f1a]        # 1a0b0 <fseek@GLIBC_2.2.5>
    3196:	68 16 00 00 00       	push   0x16
    319b:	e9 80 fe ff ff       	jmp    3020 <_init+0x20>

00000000000031a0 <realloc@plt>:
    31a0:	ff 25 12 6f 01 00    	jmp    QWORD PTR [rip+0x16f12]        # 1a0b8 <realloc@GLIBC_2.2.5>
    31a6:	68 17 00 00 00       	push   0x17
    31ab:	e9 70 fe ff ff       	jmp    3020 <_init+0x20>

00000000000031b0 <chmod@plt>:
    31b0:	ff 25 0a 6f 01 00    	jmp    QWORD PTR [rip+0x16f0a]        # 1a0c0 <chmod@GLIBC_2.2.5>
    31b6:	68 18 00 00 00       	push   0x18
    31bb:	e9 60 fe ff ff       	jmp    3020 <_init+0x20>

00000000000031c0 <fopen@plt>:
    31c0:	ff 25 02 6f 01 00    	jmp    QWORD PTR [rip+0x16f02]        # 1a0c8 <fopen@GLIBC_2.2.5>
    31c6:	68 19 00 00 00       	push   0x19
    31cb:	e9 50 fe ff ff       	jmp    3020 <_init+0x20>

00000000000031d0 <exit@plt>:
    31d0:	ff 25 fa 6e 01 00    	jmp    QWORD PTR [rip+0x16efa]        # 1a0d0 <exit@GLIBC_2.2.5>
    31d6:	68 1a 00 00 00       	push   0x1a
    31db:	e9 40 fe ff ff       	jmp    3020 <_init+0x20>

00000000000031e0 <fwrite@plt>:
    31e0:	ff 25 f2 6e 01 00    	jmp    QWORD PTR [rip+0x16ef2]        # 1a0d8 <fwrite@GLIBC_2.2.5>
    31e6:	68 1b 00 00 00       	push   0x1b
    31eb:	e9 30 fe ff ff       	jmp    3020 <_init+0x20>

00000000000031f0 <strdup@plt>:
    31f0:	ff 25 ea 6e 01 00    	jmp    QWORD PTR [rip+0x16eea]        # 1a0e0 <strdup@GLIBC_2.2.5>
    31f6:	68 1c 00 00 00       	push   0x1c
    31fb:	e9 20 fe ff ff       	jmp    3020 <_init+0x20>

Disassembly of section .plt.got:

0000000000003200 <__cxa_finalize@plt>:
    3200:	ff 25 da 6d 01 00    	jmp    QWORD PTR [rip+0x16dda]        # 19fe0 <__cxa_finalize@GLIBC_2.2.5>
    3206:	66 90                	xchg   ax,ax

Disassembly of section .text:

0000000000003210 <_start>:
    3210:	31 ed                	xor    ebp,ebp
    3212:	49 89 d1             	mov    r9,rdx
    3215:	5e                   	pop    rsi
    3216:	48 89 e2             	mov    rdx,rsp
    3219:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    321d:	50                   	push   rax
    321e:	54                   	push   rsp
    321f:	45 31 c0             	xor    r8d,r8d
    3222:	31 c9                	xor    ecx,ecx
    3224:	48 8d 3d 04 d8 00 00 	lea    rdi,[rip+0xd804]        # 10a2f <main>
    322b:	ff 15 8f 6d 01 00    	call   QWORD PTR [rip+0x16d8f]        # 19fc0 <__libc_start_main@GLIBC_2.34>
    3231:	f4                   	hlt
    3232:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3239:	00 00 00 
    323c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003240 <deregister_tm_clones>:
    3240:	48 8d 3d 81 79 01 00 	lea    rdi,[rip+0x17981]        # 1abc8 <__TMC_END__>
    3247:	48 8d 05 7a 79 01 00 	lea    rax,[rip+0x1797a]        # 1abc8 <__TMC_END__>
    324e:	48 39 f8             	cmp    rax,rdi
    3251:	74 15                	je     3268 <deregister_tm_clones+0x28>
    3253:	48 8b 05 6e 6d 01 00 	mov    rax,QWORD PTR [rip+0x16d6e]        # 19fc8 <_ITM_deregisterTMCloneTable@Base>
    325a:	48 85 c0             	test   rax,rax
    325d:	74 09                	je     3268 <deregister_tm_clones+0x28>
    325f:	ff e0                	jmp    rax
    3261:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3268:	c3                   	ret
    3269:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000003270 <register_tm_clones>:
    3270:	48 8d 3d 51 79 01 00 	lea    rdi,[rip+0x17951]        # 1abc8 <__TMC_END__>
    3277:	48 8d 35 4a 79 01 00 	lea    rsi,[rip+0x1794a]        # 1abc8 <__TMC_END__>
    327e:	48 29 fe             	sub    rsi,rdi
    3281:	48 89 f0             	mov    rax,rsi
    3284:	48 c1 ee 3f          	shr    rsi,0x3f
    3288:	48 c1 f8 03          	sar    rax,0x3
    328c:	48 01 c6             	add    rsi,rax
    328f:	48 d1 fe             	sar    rsi,1
    3292:	74 14                	je     32a8 <register_tm_clones+0x38>
    3294:	48 8b 05 3d 6d 01 00 	mov    rax,QWORD PTR [rip+0x16d3d]        # 19fd8 <_ITM_registerTMCloneTable@Base>
    329b:	48 85 c0             	test   rax,rax
    329e:	74 08                	je     32a8 <register_tm_clones+0x38>
    32a0:	ff e0                	jmp    rax
    32a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    32a8:	c3                   	ret
    32a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000032b0 <__do_global_dtors_aux>:
    32b0:	f3 0f 1e fa          	endbr64
    32b4:	80 3d 2d 79 01 00 00 	cmp    BYTE PTR [rip+0x1792d],0x0        # 1abe8 <completed.0>
    32bb:	75 2b                	jne    32e8 <__do_global_dtors_aux+0x38>
    32bd:	55                   	push   rbp
    32be:	48 83 3d 1a 6d 01 00 	cmp    QWORD PTR [rip+0x16d1a],0x0        # 19fe0 <__cxa_finalize@GLIBC_2.2.5>
    32c5:	00 
    32c6:	48 89 e5             	mov    rbp,rsp
    32c9:	74 0c                	je     32d7 <__do_global_dtors_aux+0x27>
    32cb:	48 8b 3d 36 6e 01 00 	mov    rdi,QWORD PTR [rip+0x16e36]        # 1a108 <__dso_handle>
    32d2:	e8 29 ff ff ff       	call   3200 <__cxa_finalize@plt>
    32d7:	e8 64 ff ff ff       	call   3240 <deregister_tm_clones>
    32dc:	c6 05 05 79 01 00 01 	mov    BYTE PTR [rip+0x17905],0x1        # 1abe8 <completed.0>
    32e3:	5d                   	pop    rbp
    32e4:	c3                   	ret
    32e5:	0f 1f 00             	nop    DWORD PTR [rax]
    32e8:	c3                   	ret
    32e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000032f0 <frame_dummy>:
    32f0:	f3 0f 1e fa          	endbr64
    32f4:	e9 77 ff ff ff       	jmp    3270 <register_tm_clones>

00000000000032f9 <DEBUG_PRINT_TOKENS>:
    32f9:	80 3d ec 78 01 00 00 	cmp    BYTE PTR [rip+0x178ec],0x0        # 1abec <debug>
    3300:	75 01                	jne    3303 <DEBUG_PRINT_TOKENS+0xa>
    3302:	c3                   	ret
    3303:	53                   	push   rbx
    3304:	8b 35 ea 78 01 00    	mov    esi,DWORD PTR [rip+0x178ea]        # 1abf4 <toks_len>
    330a:	48 8d 3d 6f 1e 01 00 	lea    rdi,[rip+0x11e6f]        # 15180 <_IO_stdin_used+0x180>
    3311:	b8 00 00 00 00       	mov    eax,0x0
    3316:	e8 b5 fd ff ff       	call   30d0 <printf@plt>
    331b:	bb 00 00 00 00       	mov    ebx,0x0
    3320:	e9 03 02 00 00       	jmp    3528 <DEBUG_PRINT_TOKENS+0x22f>
    3325:	48 8d 15 4c 1d 01 00 	lea    rdx,[rip+0x11d4c]        # 15078 <_IO_stdin_used+0x78>
    332c:	e9 d5 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3331:	48 8d 15 9e 1f 01 00 	lea    rdx,[rip+0x11f9e]        # 152d6 <_IO_stdin_used+0x2d6>
    3338:	e9 c9 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    333d:	48 8d 15 3c 1d 01 00 	lea    rdx,[rip+0x11d3c]        # 15080 <_IO_stdin_used+0x80>
    3344:	e9 bd 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3349:	48 8d 15 37 1d 01 00 	lea    rdx,[rip+0x11d37]        # 15087 <_IO_stdin_used+0x87>
    3350:	e9 b1 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3355:	48 8d 15 33 1d 01 00 	lea    rdx,[rip+0x11d33]        # 1508f <_IO_stdin_used+0x8f>
    335c:	e9 a5 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3361:	48 8d 15 2e 1d 01 00 	lea    rdx,[rip+0x11d2e]        # 15096 <_IO_stdin_used+0x96>
    3368:	e9 99 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    336d:	48 8d 15 28 1d 01 00 	lea    rdx,[rip+0x11d28]        # 1509c <_IO_stdin_used+0x9c>
    3374:	e9 8d 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3379:	48 8d 15 21 1d 01 00 	lea    rdx,[rip+0x11d21]        # 150a1 <_IO_stdin_used+0xa1>
    3380:	e9 81 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3385:	48 8d 15 1b 1d 01 00 	lea    rdx,[rip+0x11d1b]        # 150a7 <_IO_stdin_used+0xa7>
    338c:	e9 75 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3391:	48 8d 15 15 1d 01 00 	lea    rdx,[rip+0x11d15]        # 150ad <_IO_stdin_used+0xad>
    3398:	e9 69 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    339d:	48 8d 15 12 1d 01 00 	lea    rdx,[rip+0x11d12]        # 150b6 <_IO_stdin_used+0xb6>
    33a4:	e9 5d 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33a9:	48 8d 15 0f 1d 01 00 	lea    rdx,[rip+0x11d0f]        # 150bf <_IO_stdin_used+0xbf>
    33b0:	e9 51 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33b5:	48 8d 15 09 1d 01 00 	lea    rdx,[rip+0x11d09]        # 150c5 <_IO_stdin_used+0xc5>
    33bc:	e9 45 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33c1:	48 8d 15 04 1d 01 00 	lea    rdx,[rip+0x11d04]        # 150cc <_IO_stdin_used+0xcc>
    33c8:	e9 39 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33cd:	48 8d 15 00 1d 01 00 	lea    rdx,[rip+0x11d00]        # 150d4 <_IO_stdin_used+0xd4>
    33d4:	e9 2d 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33d9:	48 8d 15 fc 1c 01 00 	lea    rdx,[rip+0x11cfc]        # 150dc <_IO_stdin_used+0xdc>
    33e0:	e9 21 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33e5:	48 8d 15 f8 1c 01 00 	lea    rdx,[rip+0x11cf8]        # 150e4 <_IO_stdin_used+0xe4>
    33ec:	e9 15 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33f1:	48 8d 15 08 1f 01 00 	lea    rdx,[rip+0x11f08]        # 15300 <_IO_stdin_used+0x300>
    33f8:	e9 09 01 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    33fd:	48 8d 15 e6 1c 01 00 	lea    rdx,[rip+0x11ce6]        # 150ea <_IO_stdin_used+0xea>
    3404:	e9 fd 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3409:	48 8d 15 af 1e 01 00 	lea    rdx,[rip+0x11eaf]        # 152bf <_IO_stdin_used+0x2bf>
    3410:	e9 f1 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3415:	48 8d 15 d6 1c 01 00 	lea    rdx,[rip+0x11cd6]        # 150f2 <_IO_stdin_used+0xf2>
    341c:	e9 e5 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3421:	48 8d 15 cf 1c 01 00 	lea    rdx,[rip+0x11ccf]        # 150f7 <_IO_stdin_used+0xf7>
    3428:	e9 d9 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    342d:	48 8d 15 c9 1c 01 00 	lea    rdx,[rip+0x11cc9]        # 150fd <_IO_stdin_used+0xfd>
    3434:	e9 cd 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3439:	48 8d 15 c3 1c 01 00 	lea    rdx,[rip+0x11cc3]        # 15103 <_IO_stdin_used+0x103>
    3440:	e9 c1 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3445:	48 8d 15 bd 1c 01 00 	lea    rdx,[rip+0x11cbd]        # 15109 <_IO_stdin_used+0x109>
    344c:	e9 b5 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3451:	48 8d 15 32 1e 01 00 	lea    rdx,[rip+0x11e32]        # 1528a <_IO_stdin_used+0x28a>
    3458:	e9 a9 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    345d:	48 8d 15 2d 1e 01 00 	lea    rdx,[rip+0x11e2d]        # 15291 <_IO_stdin_used+0x291>
    3464:	e9 9d 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3469:	48 8d 15 29 1e 01 00 	lea    rdx,[rip+0x11e29]        # 15299 <_IO_stdin_used+0x299>
    3470:	e9 91 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3475:	48 8d 15 25 1e 01 00 	lea    rdx,[rip+0x11e25]        # 152a1 <_IO_stdin_used+0x2a1>
    347c:	e9 85 00 00 00       	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3481:	48 8d 15 87 1c 01 00 	lea    rdx,[rip+0x11c87]        # 1510f <_IO_stdin_used+0x10f>
    3488:	eb 7c                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    348a:	48 8d 15 85 1c 01 00 	lea    rdx,[rip+0x11c85]        # 15116 <_IO_stdin_used+0x116>
    3491:	eb 73                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    3493:	48 8d 15 83 1c 01 00 	lea    rdx,[rip+0x11c83]        # 1511d <_IO_stdin_used+0x11d>
    349a:	eb 6a                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    349c:	48 8d 15 82 1c 01 00 	lea    rdx,[rip+0x11c82]        # 15125 <_IO_stdin_used+0x125>
    34a3:	eb 61                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34a5:	48 8d 15 21 1e 01 00 	lea    rdx,[rip+0x11e21]        # 152cd <_IO_stdin_used+0x2cd>
    34ac:	eb 58                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34ae:	48 8d 15 78 1c 01 00 	lea    rdx,[rip+0x11c78]        # 1512d <_IO_stdin_used+0x12d>
    34b5:	eb 4f                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34b7:	48 8d 15 77 1c 01 00 	lea    rdx,[rip+0x11c77]        # 15135 <_IO_stdin_used+0x135>
    34be:	eb 46                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34c0:	48 8d 15 77 1c 01 00 	lea    rdx,[rip+0x11c77]        # 1513e <_IO_stdin_used+0x13e>
    34c7:	eb 3d                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34c9:	48 8d 15 77 1c 01 00 	lea    rdx,[rip+0x11c77]        # 15147 <_IO_stdin_used+0x147>
    34d0:	eb 34                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34d2:	48 8d 15 75 1c 01 00 	lea    rdx,[rip+0x11c75]        # 1514e <_IO_stdin_used+0x14e>
    34d9:	eb 2b                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34db:	48 8d 15 73 1c 01 00 	lea    rdx,[rip+0x11c73]        # 15155 <_IO_stdin_used+0x155>
    34e2:	eb 22                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34e4:	48 8d 15 71 1c 01 00 	lea    rdx,[rip+0x11c71]        # 1515c <_IO_stdin_used+0x15c>
    34eb:	eb 19                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34ed:	48 8d 15 ea 1d 01 00 	lea    rdx,[rip+0x11dea]        # 152de <_IO_stdin_used+0x2de>
    34f4:	eb 10                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34f6:	48 8d 15 f8 1d 01 00 	lea    rdx,[rip+0x11df8]        # 152f5 <_IO_stdin_used+0x2f5>
    34fd:	eb 07                	jmp    3506 <DEBUG_PRINT_TOKENS+0x20d>
    34ff:	48 8d 15 7c 1d 01 00 	lea    rdx,[rip+0x11d7c]        # 15282 <_IO_stdin_used+0x282>
    3506:	44 8b 40 08          	mov    r8d,DWORD PTR [rax+0x8]
    350a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    350d:	48 85 c9             	test   rcx,rcx
    3510:	74 4a                	je     355c <DEBUG_PRINT_TOKENS+0x263>
    3512:	89 de                	mov    esi,ebx
    3514:	48 8d 3d 8d 1c 01 00 	lea    rdi,[rip+0x11c8d]        # 151a8 <_IO_stdin_used+0x1a8>
    351b:	b8 00 00 00 00       	mov    eax,0x0
    3520:	e8 ab fb ff ff       	call   30d0 <printf@plt>
    3525:	83 c3 01             	add    ebx,0x1
    3528:	39 1d c6 76 01 00    	cmp    DWORD PTR [rip+0x176c6],ebx        # 1abf4 <toks_len>
    352e:	7e 35                	jle    3565 <DEBUG_PRINT_TOKENS+0x26c>
    3530:	48 63 c3             	movsxd rax,ebx
    3533:	48 c1 e0 04          	shl    rax,0x4
    3537:	48 03 05 ba 76 01 00 	add    rax,QWORD PTR [rip+0x176ba]        # 1abf8 <toks>
    353e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
    3541:	83 fa 2a             	cmp    edx,0x2a
    3544:	0f 87 db fd ff ff    	ja     3325 <DEBUG_PRINT_TOKENS+0x2c>
    354a:	89 d2                	mov    edx,edx
    354c:	48 8d 0d 81 1c 01 00 	lea    rcx,[rip+0x11c81]        # 151d4 <_IO_stdin_used+0x1d4>
    3553:	48 63 14 91          	movsxd rdx,DWORD PTR [rcx+rdx*4]
    3557:	48 01 ca             	add    rdx,rcx
    355a:	ff e2                	jmp    rdx
    355c:	48 8d 0d 00 1c 01 00 	lea    rcx,[rip+0x11c00]        # 15163 <_IO_stdin_used+0x163>
    3563:	eb ad                	jmp    3512 <DEBUG_PRINT_TOKENS+0x219>
    3565:	48 8d 3d fe 1b 01 00 	lea    rdi,[rip+0x11bfe]        # 1516a <_IO_stdin_used+0x16a>
    356c:	e8 1f fb ff ff       	call   3090 <puts@plt>
    3571:	5b                   	pop    rbx
    3572:	c3                   	ret

0000000000003573 <DEBUG_PRINT_AST>:
    3573:	80 3d 72 76 01 00 00 	cmp    BYTE PTR [rip+0x17672],0x0        # 1abec <debug>
    357a:	75 01                	jne    357d <DEBUG_PRINT_AST+0xa>
    357c:	c3                   	ret
    357d:	41 56                	push   r14
    357f:	41 55                	push   r13
    3581:	41 54                	push   r12
    3583:	55                   	push   rbp
    3584:	53                   	push   rbx
    3585:	8b 35 79 7a 01 00    	mov    esi,DWORD PTR [rip+0x17a79]        # 1b004 <ast_len>
    358b:	48 8d 3d 80 1d 01 00 	lea    rdi,[rip+0x11d80]        # 15312 <_IO_stdin_used+0x312>
    3592:	b8 00 00 00 00       	mov    eax,0x0
    3597:	e8 34 fb ff ff       	call   30d0 <printf@plt>
    359c:	41 bd 00 00 00 00    	mov    r13d,0x0
    35a2:	e9 33 04 00 00       	jmp    39da <DEBUG_PRINT_AST+0x467>
    35a7:	48 8d 15 ca 1a 01 00 	lea    rdx,[rip+0x11aca]        # 15078 <_IO_stdin_used+0x78>
    35ae:	44 89 ee             	mov    esi,r13d
    35b1:	48 8d 3d 78 1d 01 00 	lea    rdi,[rip+0x11d78]        # 15330 <_IO_stdin_used+0x330>
    35b8:	b8 00 00 00 00       	mov    eax,0x0
    35bd:	e8 0e fb ff ff       	call   30d0 <printf@plt>
    35c2:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    35c5:	3c 10                	cmp    al,0x10
    35c7:	0f 87 f1 03 00 00    	ja     39be <DEBUG_PRINT_AST+0x44b>
    35cd:	0f b6 c0             	movzx  eax,al
    35d0:	48 8d 15 d5 1e 01 00 	lea    rdx,[rip+0x11ed5]        # 154ac <_IO_stdin_used+0x4ac>
    35d7:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
    35db:	48 01 d0             	add    rax,rdx
    35de:	ff e0                	jmp    rax
    35e0:	48 8d 15 a1 1c 01 00 	lea    rdx,[rip+0x11ca1]        # 15288 <_IO_stdin_used+0x288>
    35e7:	eb c5                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    35e9:	48 8d 15 9f 1c 01 00 	lea    rdx,[rip+0x11c9f]        # 1528f <_IO_stdin_used+0x28f>
    35f0:	eb bc                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    35f2:	48 8d 15 9e 1c 01 00 	lea    rdx,[rip+0x11c9e]        # 15297 <_IO_stdin_used+0x297>
    35f9:	eb b3                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    35fb:	48 8d 15 9d 1c 01 00 	lea    rdx,[rip+0x11c9d]        # 1529f <_IO_stdin_used+0x29f>
    3602:	eb aa                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3604:	48 8d 15 9c 1c 01 00 	lea    rdx,[rip+0x11c9c]        # 152a7 <_IO_stdin_used+0x2a7>
    360b:	eb a1                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    360d:	48 8d 15 9f 1c 01 00 	lea    rdx,[rip+0x11c9f]        # 152b3 <_IO_stdin_used+0x2b3>
    3614:	eb 98                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3616:	48 8d 15 a0 1c 01 00 	lea    rdx,[rip+0x11ca0]        # 152bd <_IO_stdin_used+0x2bd>
    361d:	eb 8f                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    361f:	48 8d 15 a5 1c 01 00 	lea    rdx,[rip+0x11ca5]        # 152cb <_IO_stdin_used+0x2cb>
    3626:	eb 86                	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3628:	48 8d 15 a5 1c 01 00 	lea    rdx,[rip+0x11ca5]        # 152d4 <_IO_stdin_used+0x2d4>
    362f:	e9 7a ff ff ff       	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3634:	48 8d 15 a1 1c 01 00 	lea    rdx,[rip+0x11ca1]        # 152dc <_IO_stdin_used+0x2dc>
    363b:	e9 6e ff ff ff       	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3640:	48 8d 15 a0 1c 01 00 	lea    rdx,[rip+0x11ca0]        # 152e7 <_IO_stdin_used+0x2e7>
    3647:	e9 62 ff ff ff       	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    364c:	48 8d 15 a0 1c 01 00 	lea    rdx,[rip+0x11ca0]        # 152f3 <_IO_stdin_used+0x2f3>
    3653:	e9 56 ff ff ff       	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3658:	48 8d 15 9f 1c 01 00 	lea    rdx,[rip+0x11c9f]        # 152fe <_IO_stdin_used+0x2fe>
    365f:	e9 4a ff ff ff       	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3664:	48 8d 15 15 1c 01 00 	lea    rdx,[rip+0x11c15]        # 15280 <_IO_stdin_used+0x280>
    366b:	e9 3e ff ff ff       	jmp    35ae <DEBUG_PRINT_AST+0x3b>
    3670:	48 8d 73 01          	lea    rsi,[rbx+0x1]
    3674:	8b 93 90 01 00 00    	mov    edx,DWORD PTR [rbx+0x190]
    367a:	48 8d 3d c3 1c 01 00 	lea    rdi,[rip+0x11cc3]        # 15344 <_IO_stdin_used+0x344>
    3681:	b8 00 00 00 00       	mov    eax,0x0
    3686:	e8 45 fa ff ff       	call   30d0 <printf@plt>
    368b:	bd 00 00 00 00       	mov    ebp,0x0
    3690:	e9 ce 00 00 00       	jmp    3763 <DEBUG_PRINT_AST+0x1f0>
    3695:	48 8d 35 6c 1c 01 00 	lea    rsi,[rip+0x11c6c]        # 15308 <_IO_stdin_used+0x308>
    369c:	eb 58                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    369e:	48 8d 35 29 1a 01 00 	lea    rsi,[rip+0x11a29]        # 150ce <_IO_stdin_used+0xce>
    36a5:	eb 4f                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36a7:	48 8d 35 28 1a 01 00 	lea    rsi,[rip+0x11a28]        # 150d6 <_IO_stdin_used+0xd6>
    36ae:	eb 46                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36b0:	48 8d 35 27 1a 01 00 	lea    rsi,[rip+0x11a27]        # 150de <_IO_stdin_used+0xde>
    36b7:	eb 3d                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36b9:	48 8d 35 26 1a 01 00 	lea    rsi,[rip+0x11a26]        # 150e6 <_IO_stdin_used+0xe6>
    36c0:	eb 34                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36c2:	48 8d 35 41 1c 01 00 	lea    rsi,[rip+0x11c41]        # 1530a <_IO_stdin_used+0x30a>
    36c9:	eb 2b                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36cb:	48 8d 35 3c 1c 01 00 	lea    rsi,[rip+0x11c3c]        # 1530e <_IO_stdin_used+0x30e>
    36d2:	eb 22                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36d4:	48 8d 35 eb 1b 01 00 	lea    rsi,[rip+0x11beb]        # 152c6 <_IO_stdin_used+0x2c6>
    36db:	eb 19                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36dd:	48 8d 35 eb 1b 01 00 	lea    rsi,[rip+0x11beb]        # 152cf <_IO_stdin_used+0x2cf>
    36e4:	eb 10                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36e6:	48 8d 35 07 1a 01 00 	lea    rsi,[rip+0x11a07]        # 150f4 <_IO_stdin_used+0xf4>
    36ed:	eb 07                	jmp    36f6 <DEBUG_PRINT_AST+0x183>
    36ef:	48 8d 35 d1 19 01 00 	lea    rsi,[rip+0x119d1]        # 150c7 <_IO_stdin_used+0xc7>
    36f6:	48 8d 3d 5d 1c 01 00 	lea    rdi,[rip+0x11c5d]        # 1535a <_IO_stdin_used+0x35a>
    36fd:	b8 00 00 00 00       	mov    eax,0x0
    3702:	e8 c9 f9 ff ff       	call   30d0 <printf@plt>
    3707:	48 63 c5             	movsxd rax,ebp
    370a:	48 8d 04 40          	lea    rax,[rax+rax*2]
    370e:	48 c1 e0 05          	shl    rax,0x5
    3712:	0f b6 44 03 10       	movzx  eax,BYTE PTR [rbx+rax*1+0x10]
    3717:	83 e8 0b             	sub    eax,0xb
    371a:	3c 09                	cmp    al,0x9
    371c:	0f 87 75 02 00 00    	ja     3997 <DEBUG_PRINT_AST+0x424>
    3722:	0f b6 c0             	movzx  eax,al
    3725:	48 8d 15 c4 1d 01 00 	lea    rdx,[rip+0x11dc4]        # 154f0 <_IO_stdin_used+0x4f0>
    372c:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
    3730:	48 01 d0             	add    rax,rdx
    3733:	ff e0                	jmp    rax
    3735:	48 63 c5             	movsxd rax,ebp
    3738:	48 8d 04 40          	lea    rax,[rax+rax*2]
    373c:	48 c1 e0 05          	shl    rax,0x5
    3740:	48 8d 74 03 18       	lea    rsi,[rbx+rax*1+0x18]
    3745:	48 8d 3d 14 1c 01 00 	lea    rdi,[rip+0x11c14]        # 15360 <_IO_stdin_used+0x360>
    374c:	b8 00 00 00 00       	mov    eax,0x0
    3751:	e8 7a f9 ff ff       	call   30d0 <printf@plt>
    3756:	bf 5d 00 00 00       	mov    edi,0x5d
    375b:	e8 e0 f8 ff ff       	call   3040 <putchar@plt>
    3760:	83 c5 01             	add    ebp,0x1
    3763:	39 ab 90 01 00 00    	cmp    DWORD PTR [rbx+0x190],ebp
    3769:	0f 8e 37 02 00 00    	jle    39a6 <DEBUG_PRINT_AST+0x433>
    376f:	48 63 c5             	movsxd rax,ebp
    3772:	48 8d 04 40          	lea    rax,[rax+rax*2]
    3776:	48 c1 e0 05          	shl    rax,0x5
    377a:	0f b6 44 03 10       	movzx  eax,BYTE PTR [rbx+rax*1+0x10]
    377f:	83 e8 0b             	sub    eax,0xb
    3782:	3c 09                	cmp    al,0x9
    3784:	0f 87 0b ff ff ff    	ja     3695 <DEBUG_PRINT_AST+0x122>
    378a:	0f b6 c0             	movzx  eax,al
    378d:	48 8d 15 84 1d 01 00 	lea    rdx,[rip+0x11d84]        # 15518 <_IO_stdin_used+0x518>
    3794:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
    3798:	48 01 d0             	add    rax,rdx
    379b:	ff e0                	jmp    rax
    379d:	48 63 c5             	movsxd rax,ebp
    37a0:	48 8d 04 40          	lea    rax,[rax+rax*2]
    37a4:	48 c1 e0 05          	shl    rax,0x5
    37a8:	48 8b 74 03 18       	mov    rsi,QWORD PTR [rbx+rax*1+0x18]
    37ad:	48 8d 3d b1 1b 01 00 	lea    rdi,[rip+0x11bb1]        # 15365 <_IO_stdin_used+0x365>
    37b4:	b8 00 00 00 00       	mov    eax,0x0
    37b9:	e8 12 f9 ff ff       	call   30d0 <printf@plt>
    37be:	eb 96                	jmp    3756 <DEBUG_PRINT_AST+0x1e3>
    37c0:	48 63 c5             	movsxd rax,ebp
    37c3:	48 8d 04 40          	lea    rax,[rax+rax*2]
    37c7:	48 c1 e0 05          	shl    rax,0x5
    37cb:	0f b6 74 03 18       	movzx  esi,BYTE PTR [rbx+rax*1+0x18]
    37d0:	48 8d 3d 94 1b 01 00 	lea    rdi,[rip+0x11b94]        # 1536b <_IO_stdin_used+0x36b>
    37d7:	b8 00 00 00 00       	mov    eax,0x0
    37dc:	e8 ef f8 ff ff       	call   30d0 <printf@plt>
    37e1:	e9 70 ff ff ff       	jmp    3756 <DEBUG_PRINT_AST+0x1e3>
    37e6:	0f b7 73 0a          	movzx  esi,WORD PTR [rbx+0xa]
    37ea:	48 8b bb 98 01 00 00 	mov    rdi,QWORD PTR [rbx+0x198]
    37f1:	48 83 ec 20          	sub    rsp,0x20
    37f5:	48 63 c5             	movsxd rax,ebp
    37f8:	48 8d 04 40          	lea    rax,[rax+rax*2]
    37fc:	48 c1 e0 05          	shl    rax,0x5
    3800:	48 8d 44 03 10       	lea    rax,[rbx+rax*1+0x10]
    3805:	f3 0f 6f 40 08       	movdqu xmm0,XMMWORD PTR [rax+0x8]
    380a:	0f 11 04 24          	movups XMMWORD PTR [rsp],xmm0
    380e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    3812:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    3817:	e8 a0 c5 00 00       	call   fdbc <resolve_expr>
    381c:	48 89 c6             	mov    rsi,rax
    381f:	48 83 c4 20          	add    rsp,0x20
    3823:	48 8d 3d 3b 1b 01 00 	lea    rdi,[rip+0x11b3b]        # 15365 <_IO_stdin_used+0x365>
    382a:	b8 00 00 00 00       	mov    eax,0x0
    382f:	e8 9c f8 ff ff       	call   30d0 <printf@plt>
    3834:	e9 1d ff ff ff       	jmp    3756 <DEBUG_PRINT_AST+0x1e3>
    3839:	bf 28 00 00 00       	mov    edi,0x28
    383e:	e8 fd f7 ff ff       	call   3040 <putchar@plt>
    3843:	41 bc 00 00 00 00    	mov    r12d,0x0
    3849:	eb 19                	jmp    3864 <DEBUG_PRINT_AST+0x2f1>
    384b:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    384f:	48 8d 3d 0a 1b 01 00 	lea    rdi,[rip+0x11b0a]        # 15360 <_IO_stdin_used+0x360>
    3856:	b8 00 00 00 00       	mov    eax,0x0
    385b:	e8 70 f8 ff ff       	call   30d0 <printf@plt>
    3860:	41 83 c4 01          	add    r12d,0x1
    3864:	48 63 c5             	movsxd rax,ebp
    3867:	48 8d 04 40          	lea    rax,[rax+rax*2]
    386b:	48 c1 e0 05          	shl    rax,0x5
    386f:	0f b6 44 03 18       	movzx  eax,BYTE PTR [rbx+rax*1+0x18]
    3874:	44 39 e0             	cmp    eax,r12d
    3877:	7e 33                	jle    38ac <DEBUG_PRINT_AST+0x339>
    3879:	48 63 c5             	movsxd rax,ebp
    387c:	48 8d 14 40          	lea    rdx,[rax+rax*2]
    3880:	48 c1 e2 05          	shl    rdx,0x5
    3884:	49 63 c4             	movsxd rax,r12d
    3887:	48 c1 e0 04          	shl    rax,0x4
    388b:	48 03 44 13 20       	add    rax,QWORD PTR [rbx+rdx*1+0x20]
    3890:	80 38 1e             	cmp    BYTE PTR [rax],0x1e
    3893:	74 b6                	je     384b <DEBUG_PRINT_AST+0x2d8>
    3895:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    3899:	48 8d 3d 9e 25 01 00 	lea    rdi,[rip+0x1259e]        # 15e3e <_IO_stdin_used+0xe3e>
    38a0:	b8 00 00 00 00       	mov    eax,0x0
    38a5:	e8 26 f8 ff ff       	call   30d0 <printf@plt>
    38aa:	eb b4                	jmp    3860 <DEBUG_PRINT_AST+0x2ed>
    38ac:	bf 29 00 00 00       	mov    edi,0x29
    38b1:	e8 8a f7 ff ff       	call   3040 <putchar@plt>
    38b6:	e9 9b fe ff ff       	jmp    3756 <DEBUG_PRINT_AST+0x1e3>
    38bb:	48 63 c5             	movsxd rax,ebp
    38be:	48 8d 04 40          	lea    rax,[rax+rax*2]
    38c2:	48 c1 e0 05          	shl    rax,0x5
    38c6:	80 7c 03 23 00       	cmp    BYTE PTR [rbx+rax*1+0x23],0x0
    38cb:	75 6f                	jne    393c <DEBUG_PRINT_AST+0x3c9>
    38cd:	4c 63 f5             	movsxd r14,ebp
    38d0:	4f 8d 24 36          	lea    r12,[r14+r14*1]
    38d4:	4b 8d 04 34          	lea    rax,[r12+r14*1]
    38d8:	48 c1 e0 05          	shl    rax,0x5
    38dc:	0f b6 74 03 18       	movzx  esi,BYTE PTR [rbx+rax*1+0x18]
    38e1:	48 8d 3d 8d 1a 01 00 	lea    rdi,[rip+0x11a8d]        # 15375 <_IO_stdin_used+0x375>
    38e8:	b8 00 00 00 00       	mov    eax,0x0
    38ed:	e8 de f7 ff ff       	call   30d0 <printf@plt>
    38f2:	4d 01 f4             	add    r12,r14
    38f5:	49 c1 e4 05          	shl    r12,0x5
    38f9:	42 80 7c 23 21 00    	cmp    BYTE PTR [rbx+r12*1+0x21],0x0
    38ff:	75 51                	jne    3952 <DEBUG_PRINT_AST+0x3df>
    3901:	48 63 c5             	movsxd rax,ebp
    3904:	48 8d 04 40          	lea    rax,[rax+rax*2]
    3908:	48 c1 e0 05          	shl    rax,0x5
    390c:	80 7c 03 22 00       	cmp    BYTE PTR [rbx+rax*1+0x22],0x0
    3911:	0f 84 3f fe ff ff    	je     3756 <DEBUG_PRINT_AST+0x1e3>
    3917:	48 63 c5             	movsxd rax,ebp
    391a:	48 8d 04 40          	lea    rax,[rax+rax*2]
    391e:	48 c1 e0 05          	shl    rax,0x5
    3922:	8b 74 03 1c          	mov    esi,DWORD PTR [rbx+rax*1+0x1c]
    3926:	48 8d 3d 5b 1a 01 00 	lea    rdi,[rip+0x11a5b]        # 15388 <_IO_stdin_used+0x388>
    392d:	b8 00 00 00 00       	mov    eax,0x0
    3932:	e8 99 f7 ff ff       	call   30d0 <printf@plt>
    3937:	e9 1a fe ff ff       	jmp    3756 <DEBUG_PRINT_AST+0x1e3>
    393c:	48 8d 3d 2d 1a 01 00 	lea    rdi,[rip+0x11a2d]        # 15370 <_IO_stdin_used+0x370>
    3943:	b8 00 00 00 00       	mov    eax,0x0
    3948:	e8 83 f7 ff ff       	call   30d0 <printf@plt>
    394d:	e9 7b ff ff ff       	jmp    38cd <DEBUG_PRINT_AST+0x35a>
    3952:	4f 8d 24 36          	lea    r12,[r14+r14*1]
    3956:	4b 8d 04 34          	lea    rax,[r12+r14*1]
    395a:	48 c1 e0 05          	shl    rax,0x5
    395e:	0f b6 74 03 19       	movzx  esi,BYTE PTR [rbx+rax*1+0x19]
    3963:	48 8d 3d 10 1a 01 00 	lea    rdi,[rip+0x11a10]        # 1537a <_IO_stdin_used+0x37a>
    396a:	b8 00 00 00 00       	mov    eax,0x0
    396f:	e8 5c f7 ff ff       	call   30d0 <printf@plt>
    3974:	4d 01 f4             	add    r12,r14
    3977:	49 c1 e4 05          	shl    r12,0x5
    397b:	42 0f b6 74 23 1a    	movzx  esi,BYTE PTR [rbx+r12*1+0x1a]
    3981:	48 8d 3d f9 19 01 00 	lea    rdi,[rip+0x119f9]        # 15381 <_IO_stdin_used+0x381>
    3988:	b8 00 00 00 00       	mov    eax,0x0
    398d:	e8 3e f7 ff ff       	call   30d0 <printf@plt>
    3992:	e9 6a ff ff ff       	jmp    3901 <DEBUG_PRINT_AST+0x38e>
    3997:	bf 3f 00 00 00       	mov    edi,0x3f
    399c:	e8 9f f6 ff ff       	call   3040 <putchar@plt>
    39a1:	e9 b0 fd ff ff       	jmp    3756 <DEBUG_PRINT_AST+0x1e3>
    39a6:	48 8b b3 a8 01 00 00 	mov    rsi,QWORD PTR [rbx+0x1a8]
    39ad:	48 8d 3d dd 19 01 00 	lea    rdi,[rip+0x119dd]        # 15391 <_IO_stdin_used+0x391>
    39b4:	b8 00 00 00 00       	mov    eax,0x0
    39b9:	e8 12 f7 ff ff       	call   30d0 <printf@plt>
    39be:	48 83 bb a8 01 00 00 	cmp    QWORD PTR [rbx+0x1a8],0x0
    39c5:	00 
    39c6:	0f 85 9f 03 00 00    	jne    3d6b <DEBUG_PRINT_AST+0x7f8>
    39cc:	bf 0a 00 00 00       	mov    edi,0xa
    39d1:	e8 6a f6 ff ff       	call   3040 <putchar@plt>
    39d6:	41 83 c5 01          	add    r13d,0x1
    39da:	44 39 2d 23 76 01 00 	cmp    DWORD PTR [rip+0x17623],r13d        # 1b004 <ast_len>
    39e1:	0f 8e f4 03 00 00    	jle    3ddb <DEBUG_PRINT_AST+0x868>
    39e7:	49 63 dd             	movsxd rbx,r13d
    39ea:	48 69 db b8 01 00 00 	imul   rbx,rbx,0x1b8
    39f1:	48 03 1d 10 76 01 00 	add    rbx,QWORD PTR [rip+0x17610]        # 1b008 <ast>
    39f8:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    39fb:	3c 10                	cmp    al,0x10
    39fd:	0f 87 a4 fb ff ff    	ja     35a7 <DEBUG_PRINT_AST+0x34>
    3a03:	0f b6 c0             	movzx  eax,al
    3a06:	48 8d 15 33 1b 01 00 	lea    rdx,[rip+0x11b33]        # 15540 <_IO_stdin_used+0x540>
    3a0d:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
    3a11:	48 01 d0             	add    rax,rdx
    3a14:	ff e0                	jmp    rax
    3a16:	48 8d 3d fb 19 01 00 	lea    rdi,[rip+0x119fb]        # 15418 <_IO_stdin_used+0x418>
    3a1d:	b8 00 00 00 00       	mov    eax,0x0
    3a22:	e8 a9 f6 ff ff       	call   30d0 <printf@plt>
    3a27:	b8 00 00 00 00       	mov    eax,0x0
    3a2c:	eb 25                	jmp    3a53 <DEBUG_PRINT_AST+0x4e0>
    3a2e:	ba 00 00 00 00       	mov    edx,0x0
    3a33:	48 98                	cdqe
    3a35:	48 c1 e0 03          	shl    rax,0x3
    3a39:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
    3a3d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
    3a40:	48 8d 3d 58 19 01 00 	lea    rdi,[rip+0x11958]        # 1539f <_IO_stdin_used+0x39f>
    3a47:	b8 00 00 00 00       	mov    eax,0x0
    3a4c:	e8 7f f6 ff ff       	call   30d0 <printf@plt>
    3a51:	89 e8                	mov    eax,ebp
    3a53:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
    3a56:	39 c2                	cmp    edx,eax
    3a58:	7e 0e                	jle    3a68 <DEBUG_PRINT_AST+0x4f5>
    3a5a:	8d 68 01             	lea    ebp,[rax+0x1]
    3a5d:	39 d5                	cmp    ebp,edx
    3a5f:	74 cd                	je     3a2e <DEBUG_PRINT_AST+0x4bb>
    3a61:	ba 2c 00 00 00       	mov    edx,0x2c
    3a66:	eb cb                	jmp    3a33 <DEBUG_PRINT_AST+0x4c0>
    3a68:	bf 5d 00 00 00       	mov    edi,0x5d
    3a6d:	e8 ce f5 ff ff       	call   3040 <putchar@plt>
    3a72:	e9 47 ff ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3a77:	48 8d 3d ba 19 01 00 	lea    rdi,[rip+0x119ba]        # 15438 <_IO_stdin_used+0x438>
    3a7e:	b8 00 00 00 00       	mov    eax,0x0
    3a83:	e8 48 f6 ff ff       	call   30d0 <printf@plt>
    3a88:	b8 00 00 00 00       	mov    eax,0x0
    3a8d:	eb 25                	jmp    3ab4 <DEBUG_PRINT_AST+0x541>
    3a8f:	ba 00 00 00 00       	mov    edx,0x0
    3a94:	48 98                	cdqe
    3a96:	48 c1 e0 03          	shl    rax,0x3
    3a9a:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
    3a9e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
    3aa1:	48 8d 3d f7 18 01 00 	lea    rdi,[rip+0x118f7]        # 1539f <_IO_stdin_used+0x39f>
    3aa8:	b8 00 00 00 00       	mov    eax,0x0
    3aad:	e8 1e f6 ff ff       	call   30d0 <printf@plt>
    3ab2:	89 e8                	mov    eax,ebp
    3ab4:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
    3ab7:	39 c2                	cmp    edx,eax
    3ab9:	7e 0e                	jle    3ac9 <DEBUG_PRINT_AST+0x556>
    3abb:	8d 68 01             	lea    ebp,[rax+0x1]
    3abe:	39 d5                	cmp    ebp,edx
    3ac0:	74 cd                	je     3a8f <DEBUG_PRINT_AST+0x51c>
    3ac2:	ba 2c 00 00 00       	mov    edx,0x2c
    3ac7:	eb cb                	jmp    3a94 <DEBUG_PRINT_AST+0x521>
    3ac9:	bf 5d 00 00 00       	mov    edi,0x5d
    3ace:	e8 6d f5 ff ff       	call   3040 <putchar@plt>
    3ad3:	e9 e6 fe ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3ad8:	48 8b 73 10          	mov    rsi,QWORD PTR [rbx+0x10]
    3adc:	48 8b 53 18          	mov    rdx,QWORD PTR [rbx+0x18]
    3ae0:	48 8d 3d be 18 01 00 	lea    rdi,[rip+0x118be]        # 153a5 <_IO_stdin_used+0x3a5>
    3ae7:	b8 00 00 00 00       	mov    eax,0x0
    3aec:	e8 df f5 ff ff       	call   30d0 <printf@plt>
    3af1:	e9 c8 fe ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3af6:	48 8d 73 10          	lea    rsi,[rbx+0x10]
    3afa:	48 8b 8b 98 00 00 00 	mov    rcx,QWORD PTR [rbx+0x98]
    3b01:	48 8b 93 90 00 00 00 	mov    rdx,QWORD PTR [rbx+0x90]
    3b08:	44 8b 83 a0 00 00 00 	mov    r8d,DWORD PTR [rbx+0xa0]
    3b0f:	48 8d 3d 42 19 01 00 	lea    rdi,[rip+0x11942]        # 15458 <_IO_stdin_used+0x458>
    3b16:	b8 00 00 00 00       	mov    eax,0x0
    3b1b:	e8 b0 f5 ff ff       	call   30d0 <printf@plt>
    3b20:	e9 99 fe ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3b25:	48 8d 73 10          	lea    rsi,[rbx+0x10]
    3b29:	48 8b 4b 58          	mov    rcx,QWORD PTR [rbx+0x58]
    3b2d:	48 8b 53 50          	mov    rdx,QWORD PTR [rbx+0x50]
    3b31:	48 8d 3d 50 19 01 00 	lea    rdi,[rip+0x11950]        # 15488 <_IO_stdin_used+0x488>
    3b38:	b8 00 00 00 00       	mov    eax,0x0
    3b3d:	e8 8e f5 ff ff       	call   30d0 <printf@plt>
    3b42:	e9 77 fe ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3b47:	8b 73 18             	mov    esi,DWORD PTR [rbx+0x18]
    3b4a:	48 8d 3d 5f 18 01 00 	lea    rdi,[rip+0x1185f]        # 153b0 <_IO_stdin_used+0x3b0>
    3b51:	b8 00 00 00 00       	mov    eax,0x0
    3b56:	e8 75 f5 ff ff       	call   30d0 <printf@plt>
    3b5b:	bd 00 00 00 00       	mov    ebp,0x0
    3b60:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
    3b63:	7e 30                	jle    3b95 <DEBUG_PRINT_AST+0x622>
    3b65:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
    3b69:	48 63 c5             	movsxd rax,ebp
    3b6c:	0f b6 34 02          	movzx  esi,BYTE PTR [rdx+rax*1]
    3b70:	48 8d 3d 49 18 01 00 	lea    rdi,[rip+0x11849]        # 153c0 <_IO_stdin_used+0x3c0>
    3b77:	b8 00 00 00 00       	mov    eax,0x0
    3b7c:	e8 4f f5 ff ff       	call   30d0 <printf@plt>
    3b81:	83 c5 01             	add    ebp,0x1
    3b84:	3b 6b 18             	cmp    ebp,DWORD PTR [rbx+0x18]
    3b87:	74 d7                	je     3b60 <DEBUG_PRINT_AST+0x5ed>
    3b89:	bf 20 00 00 00       	mov    edi,0x20
    3b8e:	e8 ad f4 ff ff       	call   3040 <putchar@plt>
    3b93:	eb cb                	jmp    3b60 <DEBUG_PRINT_AST+0x5ed>
    3b95:	bf 5d 00 00 00       	mov    edi,0x5d
    3b9a:	e8 a1 f4 ff ff       	call   3040 <putchar@plt>
    3b9f:	e9 1a fe ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3ba4:	48 63 73 18          	movsxd rsi,DWORD PTR [rbx+0x18]
    3ba8:	48 01 f6             	add    rsi,rsi
    3bab:	48 8d 3d 13 18 01 00 	lea    rdi,[rip+0x11813]        # 153c5 <_IO_stdin_used+0x3c5>
    3bb2:	b8 00 00 00 00       	mov    eax,0x0
    3bb7:	e8 14 f5 ff ff       	call   30d0 <printf@plt>
    3bbc:	bd 00 00 00 00       	mov    ebp,0x0
    3bc1:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
    3bc4:	7e 30                	jle    3bf6 <DEBUG_PRINT_AST+0x683>
    3bc6:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
    3bca:	48 63 d5             	movsxd rdx,ebp
    3bcd:	0f b7 34 50          	movzx  esi,WORD PTR [rax+rdx*2]
    3bd1:	48 8d 3d fe 17 01 00 	lea    rdi,[rip+0x117fe]        # 153d6 <_IO_stdin_used+0x3d6>
    3bd8:	b8 00 00 00 00       	mov    eax,0x0
    3bdd:	e8 ee f4 ff ff       	call   30d0 <printf@plt>
    3be2:	83 c5 01             	add    ebp,0x1
    3be5:	3b 6b 18             	cmp    ebp,DWORD PTR [rbx+0x18]
    3be8:	74 d7                	je     3bc1 <DEBUG_PRINT_AST+0x64e>
    3bea:	bf 20 00 00 00       	mov    edi,0x20
    3bef:	e8 4c f4 ff ff       	call   3040 <putchar@plt>
    3bf4:	eb cb                	jmp    3bc1 <DEBUG_PRINT_AST+0x64e>
    3bf6:	bf 5d 00 00 00       	mov    edi,0x5d
    3bfb:	e8 40 f4 ff ff       	call   3040 <putchar@plt>
    3c00:	e9 b9 fd ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3c05:	48 63 73 18          	movsxd rsi,DWORD PTR [rbx+0x18]
    3c09:	48 c1 e6 02          	shl    rsi,0x2
    3c0d:	48 8d 3d b1 17 01 00 	lea    rdi,[rip+0x117b1]        # 153c5 <_IO_stdin_used+0x3c5>
    3c14:	b8 00 00 00 00       	mov    eax,0x0
    3c19:	e8 b2 f4 ff ff       	call   30d0 <printf@plt>
    3c1e:	bd 00 00 00 00       	mov    ebp,0x0
    3c23:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
    3c26:	7e 32                	jle    3c5a <DEBUG_PRINT_AST+0x6e7>
    3c28:	48 63 c5             	movsxd rax,ebp
    3c2b:	48 c1 e0 02          	shl    rax,0x2
    3c2f:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
    3c33:	8b 30                	mov    esi,DWORD PTR [rax]
    3c35:	48 8d 3d 9f 17 01 00 	lea    rdi,[rip+0x1179f]        # 153db <_IO_stdin_used+0x3db>
    3c3c:	b8 00 00 00 00       	mov    eax,0x0
    3c41:	e8 8a f4 ff ff       	call   30d0 <printf@plt>
    3c46:	83 c5 01             	add    ebp,0x1
    3c49:	3b 6b 18             	cmp    ebp,DWORD PTR [rbx+0x18]
    3c4c:	74 d5                	je     3c23 <DEBUG_PRINT_AST+0x6b0>
    3c4e:	bf 20 00 00 00       	mov    edi,0x20
    3c53:	e8 e8 f3 ff ff       	call   3040 <putchar@plt>
    3c58:	eb c9                	jmp    3c23 <DEBUG_PRINT_AST+0x6b0>
    3c5a:	bf 5d 00 00 00       	mov    edi,0x5d
    3c5f:	e8 dc f3 ff ff       	call   3040 <putchar@plt>
    3c64:	e9 55 fd ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3c69:	48 63 73 18          	movsxd rsi,DWORD PTR [rbx+0x18]
    3c6d:	48 c1 e6 03          	shl    rsi,0x3
    3c71:	48 8d 3d 4d 17 01 00 	lea    rdi,[rip+0x1174d]        # 153c5 <_IO_stdin_used+0x3c5>
    3c78:	b8 00 00 00 00       	mov    eax,0x0
    3c7d:	e8 4e f4 ff ff       	call   30d0 <printf@plt>
    3c82:	41 be 00 00 00 00    	mov    r14d,0x0
    3c88:	44 39 73 18          	cmp    DWORD PTR [rbx+0x18],r14d
    3c8c:	0f 8e b0 00 00 00    	jle    3d42 <DEBUG_PRINT_AST+0x7cf>
    3c92:	4d 63 e6             	movsxd r12,r14d
    3c95:	49 c1 e4 05          	shl    r12,0x5
    3c99:	4c 89 e0             	mov    rax,r12
    3c9c:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
    3ca0:	83 38 00             	cmp    DWORD PTR [rax],0x0
    3ca3:	75 32                	jne    3cd7 <DEBUG_PRINT_AST+0x764>
    3ca5:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    3ca9:	48 8d 3d 30 17 01 00 	lea    rdi,[rip+0x11730]        # 153e0 <_IO_stdin_used+0x3e0>
    3cb0:	b8 00 00 00 00       	mov    eax,0x0
    3cb5:	e8 16 f4 ff ff       	call   30d0 <printf@plt>
    3cba:	41 83 c6 01          	add    r14d,0x1
    3cbe:	44 3b 73 18          	cmp    r14d,DWORD PTR [rbx+0x18]
    3cc2:	74 c4                	je     3c88 <DEBUG_PRINT_AST+0x715>
    3cc4:	48 8d 3d 1d 17 01 00 	lea    rdi,[rip+0x1171d]        # 153e8 <_IO_stdin_used+0x3e8>
    3ccb:	b8 00 00 00 00       	mov    eax,0x0
    3cd0:	e8 fb f3 ff ff       	call   30d0 <printf@plt>
    3cd5:	eb b1                	jmp    3c88 <DEBUG_PRINT_AST+0x715>
    3cd7:	bf 28 00 00 00       	mov    edi,0x28
    3cdc:	e8 5f f3 ff ff       	call   3040 <putchar@plt>
    3ce1:	bd 00 00 00 00       	mov    ebp,0x0
    3ce6:	4c 89 e2             	mov    rdx,r12
    3ce9:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
    3ced:	0f b6 42 08          	movzx  eax,BYTE PTR [rdx+0x8]
    3cf1:	39 e8                	cmp    eax,ebp
    3cf3:	7e 3e                	jle    3d33 <DEBUG_PRINT_AST+0x7c0>
    3cf5:	48 63 c5             	movsxd rax,ebp
    3cf8:	48 c1 e0 04          	shl    rax,0x4
    3cfc:	48 03 42 10          	add    rax,QWORD PTR [rdx+0x10]
    3d00:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    3d04:	48 8d 3d 33 21 01 00 	lea    rdi,[rip+0x12133]        # 15e3e <_IO_stdin_used+0xe3e>
    3d0b:	b8 00 00 00 00       	mov    eax,0x0
    3d10:	e8 bb f3 ff ff       	call   30d0 <printf@plt>
    3d15:	83 c5 01             	add    ebp,0x1
    3d18:	4c 89 e0             	mov    rax,r12
    3d1b:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
    3d1f:	0f b6 40 08          	movzx  eax,BYTE PTR [rax+0x8]
    3d23:	39 c5                	cmp    ebp,eax
    3d25:	74 bf                	je     3ce6 <DEBUG_PRINT_AST+0x773>
    3d27:	bf 20 00 00 00       	mov    edi,0x20
    3d2c:	e8 0f f3 ff ff       	call   3040 <putchar@plt>
    3d31:	eb b3                	jmp    3ce6 <DEBUG_PRINT_AST+0x773>
    3d33:	bf 29 00 00 00       	mov    edi,0x29
    3d38:	e8 03 f3 ff ff       	call   3040 <putchar@plt>
    3d3d:	e9 78 ff ff ff       	jmp    3cba <DEBUG_PRINT_AST+0x747>
    3d42:	bf 5d 00 00 00       	mov    edi,0x5d
    3d47:	e8 f4 f2 ff ff       	call   3040 <putchar@plt>
    3d4c:	e9 6d fc ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3d51:	48 8b 73 10          	mov    rsi,QWORD PTR [rbx+0x10]
    3d55:	48 8d 3d 8f 16 01 00 	lea    rdi,[rip+0x1168f]        # 153eb <_IO_stdin_used+0x3eb>
    3d5c:	b8 00 00 00 00       	mov    eax,0x0
    3d61:	e8 6a f3 ff ff       	call   30d0 <printf@plt>
    3d66:	e9 53 fc ff ff       	jmp    39be <DEBUG_PRINT_AST+0x44b>
    3d6b:	48 8d 3d 83 16 01 00 	lea    rdi,[rip+0x11683]        # 153f5 <_IO_stdin_used+0x3f5>
    3d72:	b8 00 00 00 00       	mov    eax,0x0
    3d77:	e8 54 f3 ff ff       	call   30d0 <printf@plt>
    3d7c:	41 bc 00 00 00 00    	mov    r12d,0x0
    3d82:	eb 04                	jmp    3d88 <DEBUG_PRINT_AST+0x815>
    3d84:	41 83 c4 01          	add    r12d,0x1
    3d88:	49 63 ec             	movsxd rbp,r12d
    3d8b:	48 3b ab a8 01 00 00 	cmp    rbp,QWORD PTR [rbx+0x1a8]
    3d92:	73 38                	jae    3dcc <DEBUG_PRINT_AST+0x859>
    3d94:	48 8b 83 a0 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a0]
    3d9b:	0f b6 34 28          	movzx  esi,BYTE PTR [rax+rbp*1]
    3d9f:	48 8d 3d 1a 16 01 00 	lea    rdi,[rip+0x1161a]        # 153c0 <_IO_stdin_used+0x3c0>
    3da6:	b8 00 00 00 00       	mov    eax,0x0
    3dab:	e8 20 f3 ff ff       	call   30d0 <printf@plt>
    3db0:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    3db7:	48 83 e8 01          	sub    rax,0x1
    3dbb:	48 39 c5             	cmp    rbp,rax
    3dbe:	73 c4                	jae    3d84 <DEBUG_PRINT_AST+0x811>
    3dc0:	bf 20 00 00 00       	mov    edi,0x20
    3dc5:	e8 76 f2 ff ff       	call   3040 <putchar@plt>
    3dca:	eb b8                	jmp    3d84 <DEBUG_PRINT_AST+0x811>
    3dcc:	bf 5d 00 00 00       	mov    edi,0x5d
    3dd1:	e8 6a f2 ff ff       	call   3040 <putchar@plt>
    3dd6:	e9 f1 fb ff ff       	jmp    39cc <DEBUG_PRINT_AST+0x459>
    3ddb:	48 8d 3d 23 16 01 00 	lea    rdi,[rip+0x11623]        # 15405 <_IO_stdin_used+0x405>
    3de2:	e8 a9 f2 ff ff       	call   3090 <puts@plt>
    3de7:	5b                   	pop    rbx
    3de8:	5d                   	pop    rbp
    3de9:	41 5c                	pop    r12
    3deb:	41 5d                	pop    r13
    3ded:	41 5e                	pop    r14
    3def:	c3                   	ret

0000000000003df0 <GenObjElfFile>:
    3df0:	48 85 ff             	test   rdi,rdi
    3df3:	0f 84 15 18 00 00    	je     560e <GenObjElfFile+0x181e>
    3df9:	41 57                	push   r15
    3dfb:	41 56                	push   r14
    3dfd:	41 55                	push   r13
    3dff:	41 54                	push   r12
    3e01:	55                   	push   rbp
    3e02:	53                   	push   rbx
    3e03:	48 81 ec f8 43 20 00 	sub    rsp,0x2043f8
    3e0a:	48 89 fd             	mov    rbp,rdi
    3e0d:	49 89 f4             	mov    r12,rsi
    3e10:	41 bd 00 00 00 00    	mov    r13d,0x0
    3e16:	c7 44 24 18 ff ff ff 	mov    DWORD PTR [rsp+0x18],0xffffffff
    3e1d:	ff 
    3e1e:	41 bf ff ff ff ff    	mov    r15d,0xffffffff
    3e24:	41 be ff ff ff ff    	mov    r14d,0xffffffff
    3e2a:	eb 07                	jmp    3e33 <GenObjElfFile+0x43>
    3e2c:	45 89 ee             	mov    r14d,r13d
    3e2f:	41 83 c5 01          	add    r13d,0x1
    3e33:	44 39 2d ca 71 01 00 	cmp    DWORD PTR [rip+0x171ca],r13d        # 1b004 <ast_len>
    3e3a:	0f 8e bc 00 00 00    	jle    3efc <GenObjElfFile+0x10c>
    3e40:	49 63 c5             	movsxd rax,r13d
    3e43:	48 69 c0 b8 01 00 00 	imul   rax,rax,0x1b8
    3e4a:	48 03 05 b7 71 01 00 	add    rax,QWORD PTR [rip+0x171b7]        # 1b008 <ast>
    3e51:	80 38 0b             	cmp    BYTE PTR [rax],0xb
    3e54:	75 d9                	jne    3e2f <GenObjElfFile+0x3f>
    3e56:	48 8d 58 10          	lea    rbx,[rax+0x10]
    3e5a:	48 8d 35 2e 17 01 00 	lea    rsi,[rip+0x1172e]        # 1558f <_IO_stdin_used+0x58f>
    3e61:	48 89 df             	mov    rdi,rbx
    3e64:	e8 e7 f1 ff ff       	call   3050 <strcasecmp@plt>
    3e69:	85 c0                	test   eax,eax
    3e6b:	74 bf                	je     3e2c <GenObjElfFile+0x3c>
    3e6d:	48 8d 35 1c 17 01 00 	lea    rsi,[rip+0x1171c]        # 15590 <_IO_stdin_used+0x590>
    3e74:	48 89 df             	mov    rdi,rbx
    3e77:	e8 d4 f1 ff ff       	call   3050 <strcasecmp@plt>
    3e7c:	85 c0                	test   eax,eax
    3e7e:	74 5a                	je     3eda <GenObjElfFile+0xea>
    3e80:	48 8d 35 0e 17 01 00 	lea    rsi,[rip+0x1170e]        # 15595 <_IO_stdin_used+0x595>
    3e87:	48 89 df             	mov    rdi,rbx
    3e8a:	e8 c1 f1 ff ff       	call   3050 <strcasecmp@plt>
    3e8f:	85 c0                	test   eax,eax
    3e91:	74 4f                	je     3ee2 <GenObjElfFile+0xf2>
    3e93:	48 8d 35 fc 16 01 00 	lea    rsi,[rip+0x116fc]        # 15596 <_IO_stdin_used+0x596>
    3e9a:	48 89 df             	mov    rdi,rbx
    3e9d:	e8 ae f1 ff ff       	call   3050 <strcasecmp@plt>
    3ea2:	85 c0                	test   eax,eax
    3ea4:	74 44                	je     3eea <GenObjElfFile+0xfa>
    3ea6:	48 8d 35 ee 16 01 00 	lea    rsi,[rip+0x116ee]        # 1559b <_IO_stdin_used+0x59b>
    3ead:	48 89 df             	mov    rdi,rbx
    3eb0:	e8 9b f1 ff ff       	call   3050 <strcasecmp@plt>
    3eb5:	85 c0                	test   eax,eax
    3eb7:	74 39                	je     3ef2 <GenObjElfFile+0x102>
    3eb9:	48 8d 35 dc 16 01 00 	lea    rsi,[rip+0x116dc]        # 1559c <_IO_stdin_used+0x59c>
    3ec0:	48 89 df             	mov    rdi,rbx
    3ec3:	e8 88 f1 ff ff       	call   3050 <strcasecmp@plt>
    3ec8:	85 c0                	test   eax,eax
    3eca:	0f 85 5f ff ff ff    	jne    3e2f <GenObjElfFile+0x3f>
    3ed0:	44 89 6c 24 18       	mov    DWORD PTR [rsp+0x18],r13d
    3ed5:	e9 55 ff ff ff       	jmp    3e2f <GenObjElfFile+0x3f>
    3eda:	45 89 ee             	mov    r14d,r13d
    3edd:	e9 4d ff ff ff       	jmp    3e2f <GenObjElfFile+0x3f>
    3ee2:	45 89 ef             	mov    r15d,r13d
    3ee5:	e9 45 ff ff ff       	jmp    3e2f <GenObjElfFile+0x3f>
    3eea:	45 89 ef             	mov    r15d,r13d
    3eed:	e9 3d ff ff ff       	jmp    3e2f <GenObjElfFile+0x3f>
    3ef2:	44 89 6c 24 18       	mov    DWORD PTR [rsp+0x18],r13d
    3ef7:	e9 33 ff ff ff       	jmp    3e2f <GenObjElfFile+0x3f>
    3efc:	45 85 f6             	test   r14d,r14d
    3eff:	0f 88 8d 00 00 00    	js     3f92 <GenObjElfFile+0x1a2>
    3f05:	45 8d 6e 01          	lea    r13d,[r14+0x1]
    3f09:	b8 00 00 00 00       	mov    eax,0x0
    3f0e:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
    3f13:	89 c5                	mov    ebp,eax
    3f15:	eb 04                	jmp    3f1b <GenObjElfFile+0x12b>
    3f17:	41 83 c5 01          	add    r13d,0x1
    3f1b:	44 39 2d e2 70 01 00 	cmp    DWORD PTR [rip+0x170e2],r13d        # 1b004 <ast_len>
    3f22:	7e 63                	jle    3f87 <GenObjElfFile+0x197>
    3f24:	49 63 dd             	movsxd rbx,r13d
    3f27:	48 69 db b8 01 00 00 	imul   rbx,rbx,0x1b8
    3f2e:	48 89 da             	mov    rdx,rbx
    3f31:	48 03 15 d0 70 01 00 	add    rdx,QWORD PTR [rip+0x170d0]        # 1b008 <ast>
    3f38:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    3f3b:	3c 0b                	cmp    al,0xb
    3f3d:	74 77                	je     3fb6 <GenObjElfFile+0x1c6>
    3f3f:	48 8b 8a a8 01 00 00 	mov    rcx,QWORD PTR [rdx+0x1a8]
    3f46:	48 85 c9             	test   rcx,rcx
    3f49:	74 cc                	je     3f17 <GenObjElfFile+0x127>
    3f4b:	83 e8 02             	sub    eax,0x2
    3f4e:	3c 04                	cmp    al,0x4
    3f50:	77 c5                	ja     3f17 <GenObjElfFile+0x127>
    3f52:	89 e8                	mov    eax,ebp
    3f54:	48 8d 34 01          	lea    rsi,[rcx+rax*1]
    3f58:	48 81 fe 00 00 10 00 	cmp    rsi,0x100000
    3f5f:	77 60                	ja     3fc1 <GenObjElfFile+0x1d1>
    3f61:	48 8b b2 a0 01 00 00 	mov    rsi,QWORD PTR [rdx+0x1a0]
    3f68:	48 8d bc 04 f0 43 10 	lea    rdi,[rsp+rax*1+0x1043f0]
    3f6f:	00 
    3f70:	48 89 ca             	mov    rdx,rcx
    3f73:	e8 e8 f1 ff ff       	call   3160 <memcpy@plt>
    3f78:	48 03 1d 89 70 01 00 	add    rbx,QWORD PTR [rip+0x17089]        # 1b008 <ast>
    3f7f:	03 ab a8 01 00 00    	add    ebp,DWORD PTR [rbx+0x1a8]
    3f85:	eb 90                	jmp    3f17 <GenObjElfFile+0x127>
    3f87:	89 6c 24 40          	mov    DWORD PTR [rsp+0x40],ebp
    3f8b:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
    3f90:	eb 08                	jmp    3f9a <GenObjElfFile+0x1aa>
    3f92:	c7 44 24 40 00 00 00 	mov    DWORD PTR [rsp+0x40],0x0
    3f99:	00 
    3f9a:	45 85 ff             	test   r15d,r15d
    3f9d:	0f 88 c3 00 00 00    	js     4066 <GenObjElfFile+0x276>
    3fa3:	45 8d 6f 01          	lea    r13d,[r15+0x1]
    3fa7:	b8 00 00 00 00       	mov    eax,0x0
    3fac:	44 89 74 24 08       	mov    DWORD PTR [rsp+0x8],r14d
    3fb1:	41 89 c6             	mov    r14d,eax
    3fb4:	eb 53                	jmp    4009 <GenObjElfFile+0x219>
    3fb6:	89 6c 24 40          	mov    DWORD PTR [rsp+0x40],ebp
    3fba:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
    3fbf:	eb d9                	jmp    3f9a <GenObjElfFile+0x1aa>
    3fc1:	89 6c 24 40          	mov    DWORD PTR [rsp+0x40],ebp
    3fc5:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
    3fca:	eb ce                	jmp    3f9a <GenObjElfFile+0x1aa>
    3fcc:	44 89 f0             	mov    eax,r14d
    3fcf:	48 8d 34 01          	lea    rsi,[rcx+rax*1]
    3fd3:	48 81 fe 00 00 10 00 	cmp    rsi,0x100000
    3fda:	0f 87 ac 00 00 00    	ja     408c <GenObjElfFile+0x29c>
    3fe0:	48 8b b2 a0 01 00 00 	mov    rsi,QWORD PTR [rdx+0x1a0]
    3fe7:	48 8d bc 04 f0 43 00 	lea    rdi,[rsp+rax*1+0x43f0]
    3fee:	00 
    3fef:	48 89 ca             	mov    rdx,rcx
    3ff2:	e8 69 f1 ff ff       	call   3160 <memcpy@plt>
    3ff7:	48 03 1d 0a 70 01 00 	add    rbx,QWORD PTR [rip+0x1700a]        # 1b008 <ast>
    3ffe:	44 03 b3 a8 01 00 00 	add    r14d,DWORD PTR [rbx+0x1a8]
    4005:	41 83 c5 01          	add    r13d,0x1
    4009:	44 39 2d f4 6f 01 00 	cmp    DWORD PTR [rip+0x16ff4],r13d        # 1b004 <ast_len>
    4010:	7e 48                	jle    405a <GenObjElfFile+0x26a>
    4012:	49 63 dd             	movsxd rbx,r13d
    4015:	48 69 db b8 01 00 00 	imul   rbx,rbx,0x1b8
    401c:	48 89 da             	mov    rdx,rbx
    401f:	48 03 15 e2 6f 01 00 	add    rdx,QWORD PTR [rip+0x16fe2]        # 1b008 <ast>
    4026:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    4029:	3c 0b                	cmp    al,0xb
    402b:	74 53                	je     4080 <GenObjElfFile+0x290>
    402d:	48 8b 8a a8 01 00 00 	mov    rcx,QWORD PTR [rdx+0x1a8]
    4034:	48 85 c9             	test   rcx,rcx
    4037:	74 04                	je     403d <GenObjElfFile+0x24d>
    4039:	3c 01                	cmp    al,0x1
    403b:	74 8f                	je     3fcc <GenObjElfFile+0x1dc>
    403d:	3c 02                	cmp    al,0x2
    403f:	74 8b                	je     3fcc <GenObjElfFile+0x1dc>
    4041:	3c 03                	cmp    al,0x3
    4043:	74 87                	je     3fcc <GenObjElfFile+0x1dc>
    4045:	3c 04                	cmp    al,0x4
    4047:	74 83                	je     3fcc <GenObjElfFile+0x1dc>
    4049:	3c 05                	cmp    al,0x5
    404b:	0f 84 7b ff ff ff    	je     3fcc <GenObjElfFile+0x1dc>
    4051:	3c 06                	cmp    al,0x6
    4053:	75 b0                	jne    4005 <GenObjElfFile+0x215>
    4055:	e9 72 ff ff ff       	jmp    3fcc <GenObjElfFile+0x1dc>
    405a:	44 89 74 24 48       	mov    DWORD PTR [rsp+0x48],r14d
    405f:	44 8b 74 24 08       	mov    r14d,DWORD PTR [rsp+0x8]
    4064:	eb 08                	jmp    406e <GenObjElfFile+0x27e>
    4066:	c7 44 24 48 00 00 00 	mov    DWORD PTR [rsp+0x48],0x0
    406d:	00 
    406e:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
    4072:	85 c0                	test   eax,eax
    4074:	78 58                	js     40ce <GenObjElfFile+0x2de>
    4076:	8d 50 01             	lea    edx,[rax+0x1]
    4079:	be 00 00 00 00       	mov    esi,0x0
    407e:	eb 1b                	jmp    409b <GenObjElfFile+0x2ab>
    4080:	44 89 74 24 48       	mov    DWORD PTR [rsp+0x48],r14d
    4085:	44 8b 74 24 08       	mov    r14d,DWORD PTR [rsp+0x8]
    408a:	eb e2                	jmp    406e <GenObjElfFile+0x27e>
    408c:	44 89 74 24 48       	mov    DWORD PTR [rsp+0x48],r14d
    4091:	44 8b 74 24 08       	mov    r14d,DWORD PTR [rsp+0x8]
    4096:	eb d6                	jmp    406e <GenObjElfFile+0x27e>
    4098:	83 c2 01             	add    edx,0x1
    409b:	39 15 63 6f 01 00    	cmp    DWORD PTR [rip+0x16f63],edx        # 1b004 <ast_len>
    40a1:	7e 24                	jle    40c7 <GenObjElfFile+0x2d7>
    40a3:	48 63 c2             	movsxd rax,edx
    40a6:	48 69 c0 b8 01 00 00 	imul   rax,rax,0x1b8
    40ad:	48 03 05 54 6f 01 00 	add    rax,QWORD PTR [rip+0x16f54]        # 1b008 <ast>
    40b4:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    40b7:	80 f9 0b             	cmp    cl,0xb
    40ba:	74 5c                	je     4118 <GenObjElfFile+0x328>
    40bc:	80 f9 10             	cmp    cl,0x10
    40bf:	75 d7                	jne    4098 <GenObjElfFile+0x2a8>
    40c1:	48 03 70 10          	add    rsi,QWORD PTR [rax+0x10]
    40c5:	eb d1                	jmp    4098 <GenObjElfFile+0x2a8>
    40c7:	48 89 74 24 60       	mov    QWORD PTR [rsp+0x60],rsi
    40cc:	eb 09                	jmp    40d7 <GenObjElfFile+0x2e7>
    40ce:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
    40d5:	00 00 
    40d7:	45 85 ff             	test   r15d,r15d
    40da:	78 4a                	js     4126 <GenObjElfFile+0x336>
    40dc:	41 8d 47 01          	lea    eax,[r15+0x1]
    40e0:	be 00 00 00 00       	mov    esi,0x0
    40e5:	39 05 19 6f 01 00    	cmp    DWORD PTR [rip+0x16f19],eax        # 1b004 <ast_len>
    40eb:	7e 32                	jle    411f <GenObjElfFile+0x32f>
    40ed:	48 8b 0d 14 6f 01 00 	mov    rcx,QWORD PTR [rip+0x16f14]        # 1b008 <ast>
    40f4:	48 63 d0             	movsxd rdx,eax
    40f7:	48 69 d2 b8 01 00 00 	imul   rdx,rdx,0x1b8
    40fe:	80 3c 11 0b          	cmp    BYTE PTR [rcx+rdx*1],0xb
    4102:	74 3b                	je     413f <GenObjElfFile+0x34f>
    4104:	49 63 d7             	movsxd rdx,r15d
    4107:	48 69 d2 b8 01 00 00 	imul   rdx,rdx,0x1b8
    410e:	48 8b 74 11 58       	mov    rsi,QWORD PTR [rcx+rdx*1+0x58]
    4113:	83 c0 01             	add    eax,0x1
    4116:	eb cd                	jmp    40e5 <GenObjElfFile+0x2f5>
    4118:	48 89 74 24 60       	mov    QWORD PTR [rsp+0x60],rsi
    411d:	eb b8                	jmp    40d7 <GenObjElfFile+0x2e7>
    411f:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
    4124:	eb 09                	jmp    412f <GenObjElfFile+0x33f>
    4126:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    412d:	00 00 
    412f:	45 85 f6             	test   r14d,r14d
    4132:	78 5e                	js     4192 <GenObjElfFile+0x3a2>
    4134:	41 8d 4e 01          	lea    ecx,[r14+0x1]
    4138:	be 00 00 00 00       	mov    esi,0x0
    413d:	eb 15                	jmp    4154 <GenObjElfFile+0x364>
    413f:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
    4144:	eb e9                	jmp    412f <GenObjElfFile+0x33f>
    4146:	89 f7                	mov    edi,esi
    4148:	48 89 b8 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdi
    414f:	eb 29                	jmp    417a <GenObjElfFile+0x38a>
    4151:	83 c1 01             	add    ecx,0x1
    4154:	39 0d aa 6e 01 00    	cmp    DWORD PTR [rip+0x16eaa],ecx        # 1b004 <ast_len>
    415a:	7e 36                	jle    4192 <GenObjElfFile+0x3a2>
    415c:	48 63 c1             	movsxd rax,ecx
    415f:	48 69 c0 b8 01 00 00 	imul   rax,rax,0x1b8
    4166:	48 03 05 9b 6e 01 00 	add    rax,QWORD PTR [rip+0x16e9b]        # 1b008 <ast>
    416d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    4170:	80 fa 0b             	cmp    dl,0xb
    4173:	74 1d                	je     4192 <GenObjElfFile+0x3a2>
    4175:	80 fa 08             	cmp    dl,0x8
    4178:	74 cc                	je     4146 <GenObjElfFile+0x356>
    417a:	48 8b 80 a8 01 00 00 	mov    rax,QWORD PTR [rax+0x1a8]
    4181:	48 85 c0             	test   rax,rax
    4184:	74 cb                	je     4151 <GenObjElfFile+0x361>
    4186:	83 ea 02             	sub    edx,0x2
    4189:	80 fa 04             	cmp    dl,0x4
    418c:	77 c3                	ja     4151 <GenObjElfFile+0x361>
    418e:	01 c6                	add    esi,eax
    4190:	eb bf                	jmp    4151 <GenObjElfFile+0x361>
    4192:	45 85 ff             	test   r15d,r15d
    4195:	78 47                	js     41de <GenObjElfFile+0x3ee>
    4197:	41 8d 57 01          	lea    edx,[r15+0x1]
    419b:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
    41a0:	eb 03                	jmp    41a5 <GenObjElfFile+0x3b5>
    41a2:	83 c2 01             	add    edx,0x1
    41a5:	39 15 59 6e 01 00    	cmp    DWORD PTR [rip+0x16e59],edx        # 1b004 <ast_len>
    41ab:	7e 31                	jle    41de <GenObjElfFile+0x3ee>
    41ad:	48 63 c2             	movsxd rax,edx
    41b0:	48 69 c0 b8 01 00 00 	imul   rax,rax,0x1b8
    41b7:	48 03 05 4a 6e 01 00 	add    rax,QWORD PTR [rip+0x16e4a]        # 1b008 <ast>
    41be:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    41c1:	80 f9 0b             	cmp    cl,0xb
    41c4:	74 18                	je     41de <GenObjElfFile+0x3ee>
    41c6:	80 f9 08             	cmp    cl,0x8
    41c9:	75 d7                	jne    41a2 <GenObjElfFile+0x3b2>
    41cb:	48 8b 88 98 00 00 00 	mov    rcx,QWORD PTR [rax+0x98]
    41d2:	48 29 f1             	sub    rcx,rsi
    41d5:	48 89 88 90 00 00 00 	mov    QWORD PTR [rax+0x90],rcx
    41dc:	eb c4                	jmp    41a2 <GenObjElfFile+0x3b2>
    41de:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
    41e2:	85 c0                	test   eax,eax
    41e4:	78 48                	js     422e <GenObjElfFile+0x43e>
    41e6:	8d 50 01             	lea    edx,[rax+0x1]
    41e9:	be 00 00 00 00       	mov    esi,0x0
    41ee:	eb 0e                	jmp    41fe <GenObjElfFile+0x40e>
    41f0:	89 f7                	mov    edi,esi
    41f2:	48 89 b8 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdi
    41f9:	eb 29                	jmp    4224 <GenObjElfFile+0x434>
    41fb:	83 c2 01             	add    edx,0x1
    41fe:	39 15 00 6e 01 00    	cmp    DWORD PTR [rip+0x16e00],edx        # 1b004 <ast_len>
    4204:	7e 28                	jle    422e <GenObjElfFile+0x43e>
    4206:	48 63 c2             	movsxd rax,edx
    4209:	48 69 c0 b8 01 00 00 	imul   rax,rax,0x1b8
    4210:	48 03 05 f1 6d 01 00 	add    rax,QWORD PTR [rip+0x16df1]        # 1b008 <ast>
    4217:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    421a:	80 f9 0b             	cmp    cl,0xb
    421d:	74 0f                	je     422e <GenObjElfFile+0x43e>
    421f:	80 f9 08             	cmp    cl,0x8
    4222:	74 cc                	je     41f0 <GenObjElfFile+0x400>
    4224:	80 f9 10             	cmp    cl,0x10
    4227:	75 d2                	jne    41fb <GenObjElfFile+0x40b>
    4229:	03 70 10             	add    esi,DWORD PTR [rax+0x10]
    422c:	eb cd                	jmp    41fb <GenObjElfFile+0x40b>
    422e:	c6 84 24 f0 1b 00 00 	mov    BYTE PTR [rsp+0x1bf0],0x0
    4235:	00 
    4236:	48 8d 94 24 f0 2b 00 	lea    rdx,[rsp+0x2bf0]
    423d:	00 
    423e:	b9 00 03 00 00       	mov    ecx,0x300
    4243:	b8 00 00 00 00       	mov    eax,0x0
    4248:	48 89 d7             	mov    rdi,rdx
    424b:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    424e:	4c 89 e7             	mov    rdi,r12
    4251:	e8 6a ee ff ff       	call   30c0 <strlen@plt>
    4256:	48 89 c3             	mov    rbx,rax
    4259:	48 8d bc 24 f1 1b 00 	lea    rdi,[rsp+0x1bf1]
    4260:	00 
    4261:	8d 50 01             	lea    edx,[rax+0x1]
    4264:	4c 89 e6             	mov    rsi,r12
    4267:	e8 f4 ee ff ff       	call   3160 <memcpy@plt>
    426c:	8d 43 02             	lea    eax,[rbx+0x2]
    426f:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    4273:	c7 84 24 f0 2b 00 00 	mov    DWORD PTR [rsp+0x2bf0],0x1
    427a:	01 00 00 00 
    427e:	c6 84 24 f4 2b 00 00 	mov    BYTE PTR [rsp+0x2bf4],0x4
    4285:	04 
    4286:	66 c7 84 24 f6 2b 00 	mov    WORD PTR [rsp+0x2bf6],0xfff1
    428d:	00 f1 ff 
    4290:	c6 84 24 0c 2c 00 00 	mov    BYTE PTR [rsp+0x2c0c],0x3
    4297:	03 
    4298:	44 89 f0             	mov    eax,r14d
    429b:	f7 d0                	not    eax
    429d:	c1 e8 1f             	shr    eax,0x1f
    42a0:	66 89 84 24 0e 2c 00 	mov    WORD PTR [rsp+0x2c0e],ax
    42a7:	00 
    42a8:	c6 84 24 24 2c 00 00 	mov    BYTE PTR [rsp+0x2c24],0x3
    42af:	03 
    42b0:	45 85 ff             	test   r15d,r15d
    42b3:	78 4b                	js     4300 <GenObjElfFile+0x510>
    42b5:	b8 02 00 00 00       	mov    eax,0x2
    42ba:	66 89 84 24 26 2c 00 	mov    WORD PTR [rsp+0x2c26],ax
    42c1:	00 
    42c2:	c6 84 24 3c 2c 00 00 	mov    BYTE PTR [rsp+0x2c3c],0x3
    42c9:	03 
    42ca:	83 7c 24 18 00       	cmp    DWORD PTR [rsp+0x18],0x0
    42cf:	78 36                	js     4307 <GenObjElfFile+0x517>
    42d1:	b8 03 00 00 00       	mov    eax,0x3
    42d6:	66 89 84 24 3e 2c 00 	mov    WORD PTR [rsp+0x2c3e],ax
    42dd:	00 
    42de:	41 bd 00 00 00 00    	mov    r13d,0x0
    42e4:	bb 04 00 00 00       	mov    ebx,0x4
    42e9:	44 89 74 24 30       	mov    DWORD PTR [rsp+0x30],r14d
    42ee:	44 89 7c 24 20       	mov    DWORD PTR [rsp+0x20],r15d
    42f3:	48 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],rbp
    42f8:	44 89 ed             	mov    ebp,r13d
    42fb:	e9 ef 03 00 00       	jmp    46ef <GenObjElfFile+0x8ff>
    4300:	b8 00 00 00 00       	mov    eax,0x0
    4305:	eb b3                	jmp    42ba <GenObjElfFile+0x4ca>
    4307:	b8 00 00 00 00       	mov    eax,0x0
    430c:	eb c8                	jmp    42d6 <GenObjElfFile+0x4e6>
    430e:	44 8b 64 24 08       	mov    r12d,DWORD PTR [rsp+0x8]
    4313:	41 83 c4 01          	add    r12d,0x1
    4317:	44 39 25 e6 6c 01 00 	cmp    DWORD PTR [rip+0x16ce6],r12d        # 1b004 <ast_len>
    431e:	0f 8e ce 00 00 00    	jle    43f2 <GenObjElfFile+0x602>
    4324:	49 63 f4             	movsxd rsi,r12d
    4327:	48 69 ee b8 01 00 00 	imul   rbp,rsi,0x1b8
    432e:	48 89 e8             	mov    rax,rbp
    4331:	48 03 05 d0 6c 01 00 	add    rax,QWORD PTR [rip+0x16cd0]        # 1b008 <ast>
    4338:	80 38 0f             	cmp    BYTE PTR [rax],0xf
    433b:	75 d6                	jne    4313 <GenObjElfFile+0x523>
    433d:	41 be 00 00 00 00    	mov    r14d,0x0
    4343:	44 89 64 24 08       	mov    DWORD PTR [rsp+0x8],r12d
    4348:	48 89 ea             	mov    rdx,rbp
    434b:	48 03 15 b6 6c 01 00 	add    rdx,QWORD PTR [rip+0x16cb6]        # 1b008 <ast>
    4352:	44 39 72 18          	cmp    DWORD PTR [rdx+0x18],r14d
    4356:	7e b6                	jle    430e <GenObjElfFile+0x51e>
    4358:	81 fb ff 00 00 00    	cmp    ebx,0xff
    435e:	7f 72                	jg     43d2 <GenObjElfFile+0x5e2>
    4360:	49 63 c6             	movsxd rax,r14d
    4363:	48 c1 e0 03          	shl    rax,0x3
    4367:	48 03 42 10          	add    rax,QWORD PTR [rdx+0x10]
    436b:	4c 8b 38             	mov    r15,QWORD PTR [rax]
    436e:	4c 89 ff             	mov    rdi,r15
    4371:	e8 4a ed ff ff       	call   30c0 <strlen@plt>
    4376:	44 8d 60 01          	lea    r12d,[rax+0x1]
    437a:	44 89 e8             	mov    eax,r13d
    437d:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    4384:	00 
    4385:	44 89 e2             	mov    edx,r12d
    4388:	4c 89 fe             	mov    rsi,r15
    438b:	e8 d0 ed ff ff       	call   3160 <memcpy@plt>
    4390:	48 63 d3             	movsxd rdx,ebx
    4393:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    4397:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
    439b:	44 89 ac cc f0 2b 00 	mov    DWORD PTR [rsp+rcx*8+0x2bf0],r13d
    43a2:	00 
    43a3:	c6 84 cc f4 2b 00 00 	mov    BYTE PTR [rsp+rcx*8+0x2bf4],0x10
    43aa:	10 
    43ab:	66 c7 84 cc f6 2b 00 	mov    WORD PTR [rsp+rcx*8+0x2bf6],0x0
    43b2:	00 00 00 
    43b5:	48 c7 84 cc f8 2b 00 	mov    QWORD PTR [rsp+rcx*8+0x2bf8],0x0
    43bc:	00 00 00 00 00 
    43c1:	83 c3 01             	add    ebx,0x1
    43c4:	41 83 c6 01          	add    r14d,0x1
    43c8:	47 8d 6c 25 00       	lea    r13d,[r13+r12*1+0x0]
    43cd:	e9 76 ff ff ff       	jmp    4348 <GenObjElfFile+0x558>
    43d2:	44 8b 64 24 08       	mov    r12d,DWORD PTR [rsp+0x8]
    43d7:	e9 37 ff ff ff       	jmp    4313 <GenObjElfFile+0x523>
    43dc:	b9 00 00 00 00       	mov    ecx,0x0
    43e1:	44 8b 6c 24 08       	mov    r13d,DWORD PTR [rsp+0x8]
    43e6:	89 6c 24 50          	mov    DWORD PTR [rsp+0x50],ebp
    43ea:	41 89 cc             	mov    r12d,ecx
    43ed:	e9 25 ff ff ff       	jmp    4317 <GenObjElfFile+0x527>
    43f2:	44 89 6c 24 08       	mov    DWORD PTR [rsp+0x8],r13d
    43f7:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    43fb:	e9 07 03 00 00       	jmp    4707 <GenObjElfFile+0x917>
    4400:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
    4404:	44 8d 60 01          	lea    r12d,[rax+0x1]
    4408:	89 6c 24 50          	mov    DWORD PTR [rsp+0x50],ebp
    440c:	eb 47                	jmp    4455 <GenObjElfFile+0x665>
    440e:	be 00 00 00 00       	mov    esi,0x0
    4413:	48 63 d3             	movsxd rdx,ebx
    4416:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    441a:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
    441e:	40 88 b4 cc f4 2b 00 	mov    BYTE PTR [rsp+rcx*8+0x2bf4],sil
    4425:	00 
    4426:	66 c7 84 cc f6 2b 00 	mov    WORD PTR [rsp+rcx*8+0x2bf6],0x1
    442d:	00 01 00 
    4430:	48 03 2d d1 6b 01 00 	add    rbp,QWORD PTR [rip+0x16bd1]        # 1b008 <ast>
    4437:	48 8b 8d 90 00 00 00 	mov    rcx,QWORD PTR [rbp+0x90]
    443e:	48 01 d0             	add    rax,rdx
    4441:	48 89 8c c4 f8 2b 00 	mov    QWORD PTR [rsp+rax*8+0x2bf8],rcx
    4448:	00 
    4449:	83 c3 01             	add    ebx,0x1
    444c:	44 89 74 24 08       	mov    DWORD PTR [rsp+0x8],r14d
    4451:	41 83 c4 01          	add    r12d,0x1
    4455:	44 39 25 a8 6b 01 00 	cmp    DWORD PTR [rip+0x16ba8],r12d        # 1b004 <ast_len>
    445c:	0f 8e 86 00 00 00    	jle    44e8 <GenObjElfFile+0x6f8>
    4462:	49 63 ec             	movsxd rbp,r12d
    4465:	48 69 ed b8 01 00 00 	imul   rbp,rbp,0x1b8
    446c:	49 89 ed             	mov    r13,rbp
    446f:	4c 03 2d 92 6b 01 00 	add    r13,QWORD PTR [rip+0x16b92]        # 1b008 <ast>
    4476:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
    447b:	3c 0b                	cmp    al,0xb
    447d:	74 72                	je     44f1 <GenObjElfFile+0x701>
    447f:	3c 08                	cmp    al,0x8
    4481:	75 ce                	jne    4451 <GenObjElfFile+0x661>
    4483:	45 8b bd a0 00 00 00 	mov    r15d,DWORD PTR [r13+0xa0]
    448a:	44 39 7c 24 10       	cmp    DWORD PTR [rsp+0x10],r15d
    448f:	75 c0                	jne    4451 <GenObjElfFile+0x661>
    4491:	81 fb ff 00 00 00    	cmp    ebx,0xff
    4497:	7f 61                	jg     44fa <GenObjElfFile+0x70a>
    4499:	49 83 c5 10          	add    r13,0x10
    449d:	4c 89 ef             	mov    rdi,r13
    44a0:	e8 1b ec ff ff       	call   30c0 <strlen@plt>
    44a5:	44 8d 70 01          	lea    r14d,[rax+0x1]
    44a9:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
    44ad:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    44b4:	00 
    44b5:	44 89 f2             	mov    edx,r14d
    44b8:	4c 89 ee             	mov    rsi,r13
    44bb:	e8 a0 ec ff ff       	call   3160 <memcpy@plt>
    44c0:	8b 4c 24 08          	mov    ecx,DWORD PTR [rsp+0x8]
    44c4:	41 01 ce             	add    r14d,ecx
    44c7:	48 63 c3             	movsxd rax,ebx
    44ca:	48 8d 04 40          	lea    rax,[rax+rax*2]
    44ce:	89 8c c4 f0 2b 00 00 	mov    DWORD PTR [rsp+rax*8+0x2bf0],ecx
    44d5:	45 85 ff             	test   r15d,r15d
    44d8:	0f 84 30 ff ff ff    	je     440e <GenObjElfFile+0x61e>
    44de:	be 10 00 00 00       	mov    esi,0x10
    44e3:	e9 2b ff ff ff       	jmp    4413 <GenObjElfFile+0x623>
    44e8:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    44ec:	e9 21 02 00 00       	jmp    4712 <GenObjElfFile+0x922>
    44f1:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    44f5:	e9 18 02 00 00       	jmp    4712 <GenObjElfFile+0x922>
    44fa:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    44fe:	e9 0f 02 00 00       	jmp    4712 <GenObjElfFile+0x922>
    4503:	8b 44 24 20          	mov    eax,DWORD PTR [rsp+0x20]
    4507:	44 8d 60 01          	lea    r12d,[rax+0x1]
    450b:	89 6c 24 50          	mov    DWORD PTR [rsp+0x50],ebp
    450f:	eb 47                	jmp    4558 <GenObjElfFile+0x768>
    4511:	be 00 00 00 00       	mov    esi,0x0
    4516:	48 63 d3             	movsxd rdx,ebx
    4519:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    451d:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
    4521:	40 88 b4 cc f4 2b 00 	mov    BYTE PTR [rsp+rcx*8+0x2bf4],sil
    4528:	00 
    4529:	66 c7 84 cc f6 2b 00 	mov    WORD PTR [rsp+rcx*8+0x2bf6],0x2
    4530:	00 02 00 
    4533:	48 03 2d ce 6a 01 00 	add    rbp,QWORD PTR [rip+0x16ace]        # 1b008 <ast>
    453a:	48 8b 8d 90 00 00 00 	mov    rcx,QWORD PTR [rbp+0x90]
    4541:	48 01 d0             	add    rax,rdx
    4544:	48 89 8c c4 f8 2b 00 	mov    QWORD PTR [rsp+rax*8+0x2bf8],rcx
    454b:	00 
    454c:	83 c3 01             	add    ebx,0x1
    454f:	44 89 74 24 08       	mov    DWORD PTR [rsp+0x8],r14d
    4554:	41 83 c4 01          	add    r12d,0x1
    4558:	44 39 25 a5 6a 01 00 	cmp    DWORD PTR [rip+0x16aa5],r12d        # 1b004 <ast_len>
    455f:	0f 8e 86 00 00 00    	jle    45eb <GenObjElfFile+0x7fb>
    4565:	49 63 ec             	movsxd rbp,r12d
    4568:	48 69 ed b8 01 00 00 	imul   rbp,rbp,0x1b8
    456f:	49 89 ed             	mov    r13,rbp
    4572:	4c 03 2d 8f 6a 01 00 	add    r13,QWORD PTR [rip+0x16a8f]        # 1b008 <ast>
    4579:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
    457e:	3c 0b                	cmp    al,0xb
    4580:	74 72                	je     45f4 <GenObjElfFile+0x804>
    4582:	3c 08                	cmp    al,0x8
    4584:	75 ce                	jne    4554 <GenObjElfFile+0x764>
    4586:	45 8b bd a0 00 00 00 	mov    r15d,DWORD PTR [r13+0xa0]
    458d:	44 39 7c 24 10       	cmp    DWORD PTR [rsp+0x10],r15d
    4592:	75 c0                	jne    4554 <GenObjElfFile+0x764>
    4594:	81 fb ff 00 00 00    	cmp    ebx,0xff
    459a:	7f 61                	jg     45fd <GenObjElfFile+0x80d>
    459c:	49 83 c5 10          	add    r13,0x10
    45a0:	4c 89 ef             	mov    rdi,r13
    45a3:	e8 18 eb ff ff       	call   30c0 <strlen@plt>
    45a8:	44 8d 70 01          	lea    r14d,[rax+0x1]
    45ac:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
    45b0:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    45b7:	00 
    45b8:	44 89 f2             	mov    edx,r14d
    45bb:	4c 89 ee             	mov    rsi,r13
    45be:	e8 9d eb ff ff       	call   3160 <memcpy@plt>
    45c3:	8b 4c 24 08          	mov    ecx,DWORD PTR [rsp+0x8]
    45c7:	41 01 ce             	add    r14d,ecx
    45ca:	48 63 c3             	movsxd rax,ebx
    45cd:	48 8d 04 40          	lea    rax,[rax+rax*2]
    45d1:	89 8c c4 f0 2b 00 00 	mov    DWORD PTR [rsp+rax*8+0x2bf0],ecx
    45d8:	45 85 ff             	test   r15d,r15d
    45db:	0f 84 30 ff ff ff    	je     4511 <GenObjElfFile+0x721>
    45e1:	be 10 00 00 00       	mov    esi,0x10
    45e6:	e9 2b ff ff ff       	jmp    4516 <GenObjElfFile+0x726>
    45eb:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    45ef:	e9 29 01 00 00       	jmp    471d <GenObjElfFile+0x92d>
    45f4:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    45f8:	e9 20 01 00 00       	jmp    471d <GenObjElfFile+0x92d>
    45fd:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    4601:	e9 17 01 00 00       	jmp    471d <GenObjElfFile+0x92d>
    4606:	be 01 00 00 00       	mov    esi,0x1
    460b:	48 63 d3             	movsxd rdx,ebx
    460e:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    4612:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
    4616:	40 88 b4 cc f4 2b 00 	mov    BYTE PTR [rsp+rcx*8+0x2bf4],sil
    461d:	00 
    461e:	66 c7 84 cc f6 2b 00 	mov    WORD PTR [rsp+rcx*8+0x2bf6],0x3
    4625:	00 03 00 
    4628:	48 03 2d d9 69 01 00 	add    rbp,QWORD PTR [rip+0x169d9]        # 1b008 <ast>
    462f:	48 8b 8d 90 00 00 00 	mov    rcx,QWORD PTR [rbp+0x90]
    4636:	48 01 d0             	add    rax,rdx
    4639:	48 89 8c c4 f8 2b 00 	mov    QWORD PTR [rsp+rax*8+0x2bf8],rcx
    4640:	00 
    4641:	83 c3 01             	add    ebx,0x1
    4644:	44 89 74 24 08       	mov    DWORD PTR [rsp+0x8],r14d
    4649:	41 83 c4 01          	add    r12d,0x1
    464d:	44 39 25 b0 69 01 00 	cmp    DWORD PTR [rip+0x169b0],r12d        # 1b004 <ast_len>
    4654:	0f 8e 8e 00 00 00    	jle    46e8 <GenObjElfFile+0x8f8>
    465a:	49 63 ec             	movsxd rbp,r12d
    465d:	48 69 ed b8 01 00 00 	imul   rbp,rbp,0x1b8
    4664:	49 89 ed             	mov    r13,rbp
    4667:	4c 03 2d 9a 69 01 00 	add    r13,QWORD PTR [rip+0x1699a]        # 1b008 <ast>
    466e:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
    4673:	3c 0b                	cmp    al,0xb
    4675:	0f 84 ba 00 00 00    	je     4735 <GenObjElfFile+0x945>
    467b:	3c 08                	cmp    al,0x8
    467d:	75 ca                	jne    4649 <GenObjElfFile+0x859>
    467f:	45 8b bd a0 00 00 00 	mov    r15d,DWORD PTR [r13+0xa0]
    4686:	44 39 7c 24 10       	cmp    DWORD PTR [rsp+0x10],r15d
    468b:	75 bc                	jne    4649 <GenObjElfFile+0x859>
    468d:	81 fb ff 00 00 00    	cmp    ebx,0xff
    4693:	0f 8f a2 00 00 00    	jg     473b <GenObjElfFile+0x94b>
    4699:	49 83 c5 10          	add    r13,0x10
    469d:	4c 89 ef             	mov    rdi,r13
    46a0:	e8 1b ea ff ff       	call   30c0 <strlen@plt>
    46a5:	44 8d 70 01          	lea    r14d,[rax+0x1]
    46a9:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
    46ad:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    46b4:	00 
    46b5:	44 89 f2             	mov    edx,r14d
    46b8:	4c 89 ee             	mov    rsi,r13
    46bb:	e8 a0 ea ff ff       	call   3160 <memcpy@plt>
    46c0:	8b 4c 24 08          	mov    ecx,DWORD PTR [rsp+0x8]
    46c4:	41 01 ce             	add    r14d,ecx
    46c7:	48 63 c3             	movsxd rax,ebx
    46ca:	48 8d 04 40          	lea    rax,[rax+rax*2]
    46ce:	89 8c c4 f0 2b 00 00 	mov    DWORD PTR [rsp+rax*8+0x2bf0],ecx
    46d5:	45 85 ff             	test   r15d,r15d
    46d8:	0f 84 28 ff ff ff    	je     4606 <GenObjElfFile+0x816>
    46de:	be 11 00 00 00       	mov    esi,0x11
    46e3:	e9 23 ff ff ff       	jmp    460b <GenObjElfFile+0x81b>
    46e8:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    46ec:	83 c5 01             	add    ebp,0x1
    46ef:	83 fd 01             	cmp    ebp,0x1
    46f2:	7f 4d                	jg     4741 <GenObjElfFile+0x951>
    46f4:	83 fd 01             	cmp    ebp,0x1
    46f7:	0f 94 c0             	sete   al
    46fa:	0f b6 c0             	movzx  eax,al
    46fd:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
    4701:	0f 84 d5 fc ff ff    	je     43dc <GenObjElfFile+0x5ec>
    4707:	83 7c 24 30 00       	cmp    DWORD PTR [rsp+0x30],0x0
    470c:	0f 89 ee fc ff ff    	jns    4400 <GenObjElfFile+0x610>
    4712:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
    4717:	0f 89 e6 fd ff ff    	jns    4503 <GenObjElfFile+0x713>
    471d:	83 7c 24 18 00       	cmp    DWORD PTR [rsp+0x18],0x0
    4722:	78 c8                	js     46ec <GenObjElfFile+0x8fc>
    4724:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
    4728:	44 8d 60 01          	lea    r12d,[rax+0x1]
    472c:	89 6c 24 50          	mov    DWORD PTR [rsp+0x50],ebp
    4730:	e9 18 ff ff ff       	jmp    464d <GenObjElfFile+0x85d>
    4735:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    4739:	eb b1                	jmp    46ec <GenObjElfFile+0x8fc>
    473b:	8b 6c 24 50          	mov    ebp,DWORD PTR [rsp+0x50]
    473f:	eb ab                	jmp    46ec <GenObjElfFile+0x8fc>
    4741:	44 8b 7c 24 20       	mov    r15d,DWORD PTR [rsp+0x20]
    4746:	89 da                	mov    edx,ebx
    4748:	89 5c 24 10          	mov    DWORD PTR [rsp+0x10],ebx
    474c:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
    4751:	bb 00 00 00 00       	mov    ebx,0x0
    4756:	eb 03                	jmp    475b <GenObjElfFile+0x96b>
    4758:	83 c3 01             	add    ebx,0x1
    475b:	39 da                	cmp    edx,ebx
    475d:	7e 18                	jle    4777 <GenObjElfFile+0x987>
    475f:	48 63 c3             	movsxd rax,ebx
    4762:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4766:	0f b6 84 c4 f4 2b 00 	movzx  eax,BYTE PTR [rsp+rax*8+0x2bf4]
    476d:	00 
    476e:	c0 e8 04             	shr    al,0x4
    4771:	3c 01                	cmp    al,0x1
    4773:	75 e3                	jne    4758 <GenObjElfFile+0x968>
    4775:	eb 04                	jmp    477b <GenObjElfFile+0x98b>
    4777:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
    477b:	45 85 ff             	test   r15d,r15d
    477e:	0f 88 4f 0a 00 00    	js     51d3 <GenObjElfFile+0x13e3>
    4784:	45 8d 77 01          	lea    r14d,[r15+0x1]
    4788:	41 bf 00 00 00 00    	mov    r15d,0x0
    478e:	89 5c 24 20          	mov    DWORD PTR [rsp+0x20],ebx
    4792:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
    4797:	e9 a1 07 00 00       	jmp    4f3d <GenObjElfFile+0x114d>
    479c:	48 63 c5             	movsxd rax,ebp
    479f:	48 8d 04 40          	lea    rax,[rax+rax*2]
    47a3:	48 c1 e0 05          	shl    rax,0x5
    47a7:	80 7c 03 23 00       	cmp    BYTE PTR [rbx+rax*1+0x23],0x0
    47ac:	0f 84 71 03 00 00    	je     4b23 <GenObjElfFile+0xd33>
    47b2:	48 8d 3d 48 16 01 00 	lea    rdi,[rip+0x11648]        # 15e01 <_IO_stdin_used+0xe01>
    47b9:	e8 d2 e8 ff ff       	call   3090 <puts@plt>
    47be:	48 63 c5             	movsxd rax,ebp
    47c1:	48 8d 04 40          	lea    rax,[rax+rax*2]
    47c5:	48 c1 e0 05          	shl    rax,0x5
    47c9:	48 8d 44 03 10       	lea    rax,[rbx+rax*1+0x10]
    47ce:	48 8d 50 14          	lea    rdx,[rax+0x14]
    47d2:	80 78 14 00          	cmp    BYTE PTR [rax+0x14],0x0
    47d6:	0f 85 83 00 00 00    	jne    485f <GenObjElfFile+0xa6f>
    47dc:	41 bd 00 00 00 00    	mov    r13d,0x0
    47e2:	4c 89 e2             	mov    rdx,r12
    47e5:	48 03 15 1c 68 01 00 	add    rdx,QWORD PTR [rip+0x1681c]        # 1b008 <ast>
    47ec:	0f b6 82 c8 00 00 00 	movzx  eax,BYTE PTR [rdx+0xc8]
    47f3:	3c 08                	cmp    al,0x8
    47f5:	0f 84 92 00 00 00    	je     488d <GenObjElfFile+0xa9d>
    47fb:	84 c0                	test   al,al
    47fd:	0f 85 8f 00 00 00    	jne    4892 <GenObjElfFile+0xaa2>
    4803:	48 8b b2 98 01 00 00 	mov    rsi,QWORD PTR [rdx+0x198]
    480a:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
    480f:	48 29 ce             	sub    rsi,rcx
    4812:	48 03 b2 a8 01 00 00 	add    rsi,QWORD PTR [rdx+0x1a8]
    4819:	48 83 ee 04          	sub    rsi,0x4
    481d:	e9 91 00 00 00       	jmp    48b3 <GenObjElfFile+0xac3>
    4822:	41 83 c5 01          	add    r13d,0x1
    4826:	44 39 eb             	cmp    ebx,r13d
    4829:	7e 4d                	jle    4878 <GenObjElfFile+0xa88>
    482b:	49 63 c5             	movsxd rax,r13d
    482e:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4832:	8b 84 c4 f0 2b 00 00 	mov    eax,DWORD PTR [rsp+rax*8+0x2bf0]
    4839:	85 c0                	test   eax,eax
    483b:	74 e5                	je     4822 <GenObjElfFile+0xa32>
    483d:	89 c0                	mov    eax,eax
    483f:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    4846:	00 
    4847:	4c 89 e6             	mov    rsi,r12
    484a:	e8 f1 ff 00 00       	call   14840 <astrcmp>
    484f:	85 c0                	test   eax,eax
    4851:	75 cf                	jne    4822 <GenObjElfFile+0xa32>
    4853:	4c 8b 64 24 18       	mov    r12,QWORD PTR [rsp+0x18]
    4858:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
    485d:	eb 83                	jmp    47e2 <GenObjElfFile+0x9f2>
    485f:	41 bd 00 00 00 00    	mov    r13d,0x0
    4865:	4c 89 64 24 18       	mov    QWORD PTR [rsp+0x18],r12
    486a:	48 89 5c 24 38       	mov    QWORD PTR [rsp+0x38],rbx
    486f:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
    4873:	49 89 d4             	mov    r12,rdx
    4876:	eb ae                	jmp    4826 <GenObjElfFile+0xa36>
    4878:	4c 8b 64 24 18       	mov    r12,QWORD PTR [rsp+0x18]
    487d:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
    4882:	41 bd 00 00 00 00    	mov    r13d,0x0
    4888:	e9 55 ff ff ff       	jmp    47e2 <GenObjElfFile+0x9f2>
    488d:	b8 04 00 00 00       	mov    eax,0x4
    4892:	48 8b 8a 98 01 00 00 	mov    rcx,QWORD PTR [rdx+0x198]
    4899:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
    489e:	48 29 f1             	sub    rcx,rsi
    48a1:	48 8b 92 a8 01 00 00 	mov    rdx,QWORD PTR [rdx+0x1a8]
    48a8:	0f b6 f0             	movzx  esi,al
    48ab:	48 29 f2             	sub    rdx,rsi
    48ae:	48 8d 74 11 fc       	lea    rsi,[rcx+rdx*1-0x4]
    48b3:	49 63 ff             	movsxd rdi,r15d
    48b6:	48 8d 14 3f          	lea    rdx,[rdi+rdi*1]
    48ba:	48 8d 0c 3a          	lea    rcx,[rdx+rdi*1]
    48be:	48 89 b4 cc f0 03 00 	mov    QWORD PTR [rsp+rcx*8+0x3f0],rsi
    48c5:	00 
    48c6:	49 c1 e5 20          	shl    r13,0x20
    48ca:	49 83 cd 02          	or     r13,0x2
    48ce:	4c 89 ac cc f8 03 00 	mov    QWORD PTR [rsp+rcx*8+0x3f8],r13
    48d5:	00 
    48d6:	48 63 cd             	movsxd rcx,ebp
    48d9:	48 8d 0c 49          	lea    rcx,[rcx+rcx*2]
    48dd:	48 c1 e1 05          	shl    rcx,0x5
    48e1:	48 63 4c 0b 1c       	movsxd rcx,DWORD PTR [rbx+rcx*1+0x1c]
    48e6:	48 83 e9 04          	sub    rcx,0x4
    48ea:	0f b6 c0             	movzx  eax,al
    48ed:	48 29 c1             	sub    rcx,rax
    48f0:	48 01 fa             	add    rdx,rdi
    48f3:	48 89 8c d4 00 04 00 	mov    QWORD PTR [rsp+rdx*8+0x400],rcx
    48fa:	00 
    48fb:	41 8d 5f 01          	lea    ebx,[r15+0x1]
    48ff:	c7 84 34 f0 43 00 00 	mov    DWORD PTR [rsp+rsi*1+0x43f0],0x0
    4906:	00 00 00 00 
    490a:	85 ed                	test   ebp,ebp
    490c:	0f 85 61 06 00 00    	jne    4f73 <GenObjElfFile+0x1183>
    4912:	4c 89 e0             	mov    rax,r12
    4915:	48 03 05 ec 66 01 00 	add    rax,QWORD PTR [rip+0x166ec]        # 1b008 <ast>
    491c:	83 b8 90 01 00 00 01 	cmp    DWORD PTR [rax+0x190],0x1
    4923:	0f 8e 4f 06 00 00    	jle    4f78 <GenObjElfFile+0x1188>
    4929:	80 78 70 10          	cmp    BYTE PTR [rax+0x70],0x10
    492d:	74 08                	je     4937 <GenObjElfFile+0xb47>
    492f:	41 89 df             	mov    r15d,ebx
    4932:	e9 02 06 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4937:	48 8d 78 78          	lea    rdi,[rax+0x78]
    493b:	e8 1c ef 00 00       	call   1385c <expr_label_count>
    4940:	89 44 24 18          	mov    DWORD PTR [rsp+0x18],eax
    4944:	83 f8 01             	cmp    eax,0x1
    4947:	74 08                	je     4951 <GenObjElfFile+0xb61>
    4949:	41 89 df             	mov    r15d,ebx
    494c:	e9 e8 05 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4951:	4c 89 e0             	mov    rax,r12
    4954:	48 03 05 ad 66 01 00 	add    rax,QWORD PTR [rip+0x166ad]        # 1b008 <ast>
    495b:	80 78 78 01          	cmp    BYTE PTR [rax+0x78],0x1
    495f:	74 08                	je     4969 <GenObjElfFile+0xb79>
    4961:	41 89 df             	mov    r15d,ebx
    4964:	e9 d0 05 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4969:	48 83 ec 20          	sub    rsp,0x20
    496d:	f3 0f 6f 58 78       	movdqu xmm3,XMMWORD PTR [rax+0x78]
    4972:	0f 11 1c 24          	movups XMMWORD PTR [rsp],xmm3
    4976:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
    497d:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    4982:	e8 69 f0 00 00       	call   139f0 <get_label_from_expr>
    4987:	49 89 c5             	mov    r13,rax
    498a:	48 83 c4 20          	add    rsp,0x20
    498e:	48 85 c0             	test   rax,rax
    4991:	0f 84 e6 05 00 00    	je     4f7d <GenObjElfFile+0x118d>
    4997:	80 38 00             	cmp    BYTE PTR [rax],0x0
    499a:	0f 84 e2 05 00 00    	je     4f82 <GenObjElfFile+0x1192>
    49a0:	4c 89 e2             	mov    rdx,r12
    49a3:	48 03 15 5e 66 01 00 	add    rdx,QWORD PTR [rip+0x1665e]        # 1b008 <ast>
    49aa:	0f b6 82 c8 00 00 00 	movzx  eax,BYTE PTR [rdx+0xc8]
    49b1:	3c 04                	cmp    al,0x4
    49b3:	74 48                	je     49fd <GenObjElfFile+0xc0d>
    49b5:	3c 01                	cmp    al,0x1
    49b7:	74 3b                	je     49f4 <GenObjElfFile+0xc04>
    49b9:	3c 02                	cmp    al,0x2
    49bb:	74 2e                	je     49eb <GenObjElfFile+0xbfb>
    49bd:	48 8d 0d c0 0b 01 00 	lea    rcx,[rip+0x10bc0]        # 15584 <_IO_stdin_used+0x584>
    49c4:	0f b7 52 0a          	movzx  edx,WORD PTR [rdx+0xa]
    49c8:	4d 89 e8             	mov    r8,r13
    49cb:	48 8d 35 d6 0b 01 00 	lea    rsi,[rip+0x10bd6]        # 155a8 <_IO_stdin_used+0x5a8>
    49d2:	48 8b 3d 07 62 01 00 	mov    rdi,QWORD PTR [rip+0x16207]        # 1abe0 <stderr@GLIBC_2.2.5>
    49d9:	b8 00 00 00 00       	mov    eax,0x0
    49de:	e8 5d e7 ff ff       	call   3140 <fprintf@plt>
    49e3:	41 89 df             	mov    r15d,ebx
    49e6:	e9 4e 05 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    49eb:	48 8d 0d 93 0b 01 00 	lea    rcx,[rip+0x10b93]        # 15585 <_IO_stdin_used+0x585>
    49f2:	eb d0                	jmp    49c4 <GenObjElfFile+0xbd4>
    49f4:	48 8d 0d 8f 0b 01 00 	lea    rcx,[rip+0x10b8f]        # 1558a <_IO_stdin_used+0x58a>
    49fb:	eb c7                	jmp    49c4 <GenObjElfFile+0xbd4>
    49fd:	81 fb ff 00 00 00    	cmp    ebx,0xff
    4a03:	7e 0b                	jle    4a10 <GenObjElfFile+0xc20>
    4a05:	41 89 df             	mov    r15d,ebx
    4a08:	e9 2c 05 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4a0d:	83 c5 01             	add    ebp,0x1
    4a10:	39 6c 24 10          	cmp    DWORD PTR [rsp+0x10],ebp
    4a14:	7e 2a                	jle    4a40 <GenObjElfFile+0xc50>
    4a16:	48 63 c5             	movsxd rax,ebp
    4a19:	48 6b c0 18          	imul   rax,rax,0x18
    4a1d:	8b 84 04 f0 2b 00 00 	mov    eax,DWORD PTR [rsp+rax*1+0x2bf0]
    4a24:	85 c0                	test   eax,eax
    4a26:	74 e5                	je     4a0d <GenObjElfFile+0xc1d>
    4a28:	89 c0                	mov    eax,eax
    4a2a:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    4a31:	00 
    4a32:	4c 89 ee             	mov    rsi,r13
    4a35:	e8 06 fe 00 00       	call   14840 <astrcmp>
    4a3a:	85 c0                	test   eax,eax
    4a3c:	75 cf                	jne    4a0d <GenObjElfFile+0xc1d>
    4a3e:	eb 04                	jmp    4a44 <GenObjElfFile+0xc54>
    4a40:	8b 6c 24 18          	mov    ebp,DWORD PTR [rsp+0x18]
    4a44:	4c 03 25 bd 65 01 00 	add    r12,QWORD PTR [rip+0x165bd]        # 1b008 <ast>
    4a4b:	49 8b 84 24 98 01 00 	mov    rax,QWORD PTR [r12+0x198]
    4a52:	00 
    4a53:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
    4a58:	48 29 c8             	sub    rax,rcx
    4a5b:	49 03 84 24 a8 01 00 	add    rax,QWORD PTR [r12+0x1a8]
    4a62:	00 
    4a63:	48 83 e8 04          	sub    rax,0x4
    4a67:	48 63 d3             	movsxd rdx,ebx
    4a6a:	48 6b d2 18          	imul   rdx,rdx,0x18
    4a6e:	48 89 84 14 f0 03 00 	mov    QWORD PTR [rsp+rdx*1+0x3f0],rax
    4a75:	00 
    4a76:	48 89 e9             	mov    rcx,rbp
    4a79:	48 c1 e1 20          	shl    rcx,0x20
    4a7d:	48 83 c9 0a          	or     rcx,0xa
    4a81:	48 89 8c 14 f8 03 00 	mov    QWORD PTR [rsp+rdx*1+0x3f8],rcx
    4a88:	00 
    4a89:	48 c7 84 14 00 04 00 	mov    QWORD PTR [rsp+rdx*1+0x400],0x0
    4a90:	00 00 00 00 00 
    4a95:	41 83 c7 02          	add    r15d,0x2
    4a99:	c7 84 04 f0 43 00 00 	mov    DWORD PTR [rsp+rax*1+0x43f0],0x0
    4aa0:	00 00 00 00 
    4aa4:	e9 90 04 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4aa9:	4c 89 e0             	mov    rax,r12
    4aac:	48 03 05 55 65 01 00 	add    rax,QWORD PTR [rip+0x16555]        # 1b008 <ast>
    4ab3:	80 78 10 10          	cmp    BYTE PTR [rax+0x10],0x10
    4ab7:	0f 84 b4 00 00 00    	je     4b71 <GenObjElfFile+0xd81>
    4abd:	4c 89 e7             	mov    rdi,r12
    4ac0:	48 03 3d 41 65 01 00 	add    rdi,QWORD PTR [rip+0x16541]        # 1b008 <ast>
    4ac7:	80 7f 70 10          	cmp    BYTE PTR [rdi+0x70],0x10
    4acb:	0f 84 fa 01 00 00    	je     4ccb <GenObjElfFile+0xedb>
    4ad1:	48 63 c5             	movsxd rax,ebp
    4ad4:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4ad8:	48 c1 e0 05          	shl    rax,0x5
    4adc:	80 7c 03 10 10       	cmp    BYTE PTR [rbx+rax*1+0x10],0x10
    4ae1:	0f 84 08 03 00 00    	je     4def <GenObjElfFile+0xfff>
    4ae7:	83 c5 01             	add    ebp,0x1
    4aea:	4c 89 e3             	mov    rbx,r12
    4aed:	48 03 1d 14 65 01 00 	add    rbx,QWORD PTR [rip+0x16514]        # 1b008 <ast>
    4af4:	39 ab 90 01 00 00    	cmp    DWORD PTR [rbx+0x190],ebp
    4afa:	0f 8e 39 04 00 00    	jle    4f39 <GenObjElfFile+0x1149>
    4b00:	41 81 ff ff 00 00 00 	cmp    r15d,0xff
    4b07:	0f 8f 2c 04 00 00    	jg     4f39 <GenObjElfFile+0x1149>
    4b0d:	48 63 c5             	movsxd rax,ebp
    4b10:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4b14:	48 c1 e0 05          	shl    rax,0x5
    4b18:	80 7c 03 10 14       	cmp    BYTE PTR [rbx+rax*1+0x10],0x14
    4b1d:	0f 84 79 fc ff ff    	je     479c <GenObjElfFile+0x9ac>
    4b23:	4c 8d 6b 01          	lea    r13,[rbx+0x1]
    4b27:	48 8d 35 72 0a 01 00 	lea    rsi,[rip+0x10a72]        # 155a0 <_IO_stdin_used+0x5a0>
    4b2e:	4c 89 ef             	mov    rdi,r13
    4b31:	e8 1a e5 ff ff       	call   3050 <strcasecmp@plt>
    4b36:	85 c0                	test   eax,eax
    4b38:	0f 84 6b ff ff ff    	je     4aa9 <GenObjElfFile+0xcb9>
    4b3e:	48 8d 35 c1 12 01 00 	lea    rsi,[rip+0x112c1]        # 15e06 <_IO_stdin_used+0xe06>
    4b45:	4c 89 ef             	mov    rdi,r13
    4b48:	e8 03 e5 ff ff       	call   3050 <strcasecmp@plt>
    4b4d:	85 c0                	test   eax,eax
    4b4f:	0f 84 54 ff ff ff    	je     4aa9 <GenObjElfFile+0xcb9>
    4b55:	4c 89 ee             	mov    rsi,r13
    4b58:	48 8d 3d 01 57 01 00 	lea    rdi,[rip+0x15701]        # 1a260 <JCC>
    4b5f:	e8 42 ec 00 00       	call   137a6 <is2arrin>
    4b64:	85 c0                	test   eax,eax
    4b66:	0f 84 51 ff ff ff    	je     4abd <GenObjElfFile+0xccd>
    4b6c:	e9 38 ff ff ff       	jmp    4aa9 <GenObjElfFile+0xcb9>
    4b71:	48 8d 3d 69 26 01 00 	lea    rdi,[rip+0x12669]        # 171e1 <_IO_stdin_used+0x21e1>
    4b78:	e8 13 e5 ff ff       	call   3090 <puts@plt>
    4b7d:	4c 89 e0             	mov    rax,r12
    4b80:	48 03 05 81 64 01 00 	add    rax,QWORD PTR [rip+0x16481]        # 1b008 <ast>
    4b87:	48 8b a8 98 01 00 00 	mov    rbp,QWORD PTR [rax+0x198]
    4b8e:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
    4b93:	48 29 cd             	sub    rbp,rcx
    4b96:	48 03 a8 a8 01 00 00 	add    rbp,QWORD PTR [rax+0x1a8]
    4b9d:	48 83 ed 04          	sub    rbp,0x4
    4ba1:	48 83 ec 20          	sub    rsp,0x20
    4ba5:	f3 0f 6f 48 18       	movdqu xmm1,XMMWORD PTR [rax+0x18]
    4baa:	0f 11 0c 24          	movups XMMWORD PTR [rsp],xmm1
    4bae:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    4bb2:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    4bb7:	e8 34 ee 00 00       	call   139f0 <get_label_from_expr>
    4bbc:	49 89 c5             	mov    r13,rax
    4bbf:	48 83 c4 20          	add    rsp,0x20
    4bc3:	48 85 c0             	test   rax,rax
    4bc6:	74 16                	je     4bde <GenObjElfFile+0xdee>
    4bc8:	80 38 00             	cmp    BYTE PTR [rax],0x0
    4bcb:	74 11                	je     4bde <GenObjElfFile+0xdee>
    4bcd:	bb 00 00 00 00       	mov    ebx,0x0
    4bd2:	4c 89 64 24 18       	mov    QWORD PTR [rsp+0x18],r12
    4bd7:	44 8b 64 24 10       	mov    r12d,DWORD PTR [rsp+0x10]
    4bdc:	eb 32                	jmp    4c10 <GenObjElfFile+0xe20>
    4bde:	4c 03 25 23 64 01 00 	add    r12,QWORD PTR [rip+0x16423]        # 1b008 <ast>
    4be5:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    4beb:	48 8d 35 36 0a 01 00 	lea    rsi,[rip+0x10a36]        # 15628 <_IO_stdin_used+0x628>
    4bf2:	48 8b 3d e7 5f 01 00 	mov    rdi,QWORD PTR [rip+0x15fe7]        # 1abe0 <stderr@GLIBC_2.2.5>
    4bf9:	b8 00 00 00 00       	mov    eax,0x0
    4bfe:	e8 3d e5 ff ff       	call   3140 <fprintf@plt>
    4c03:	bf 01 00 00 00       	mov    edi,0x1
    4c08:	e8 c3 e5 ff ff       	call   31d0 <exit@plt>
    4c0d:	83 c3 01             	add    ebx,0x1
    4c10:	41 39 dc             	cmp    r12d,ebx
    4c13:	7e 2f                	jle    4c44 <GenObjElfFile+0xe54>
    4c15:	48 63 c3             	movsxd rax,ebx
    4c18:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4c1c:	8b 84 c4 f0 2b 00 00 	mov    eax,DWORD PTR [rsp+rax*8+0x2bf0]
    4c23:	85 c0                	test   eax,eax
    4c25:	74 e6                	je     4c0d <GenObjElfFile+0xe1d>
    4c27:	89 c0                	mov    eax,eax
    4c29:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    4c30:	00 
    4c31:	4c 89 ee             	mov    rsi,r13
    4c34:	e8 07 fc 00 00       	call   14840 <astrcmp>
    4c39:	85 c0                	test   eax,eax
    4c3b:	75 d0                	jne    4c0d <GenObjElfFile+0xe1d>
    4c3d:	4c 8b 64 24 18       	mov    r12,QWORD PTR [rsp+0x18]
    4c42:	eb 0a                	jmp    4c4e <GenObjElfFile+0xe5e>
    4c44:	4c 8b 64 24 18       	mov    r12,QWORD PTR [rsp+0x18]
    4c49:	bb 02 00 00 00       	mov    ebx,0x2
    4c4e:	4c 89 ef             	mov    rdi,r13
    4c51:	e8 4e ee 00 00       	call   13aa4 <find_lab_addr>
    4c56:	49 89 c5             	mov    r13,rax
    4c59:	4c 03 25 a8 63 01 00 	add    r12,QWORD PTR [rip+0x163a8]        # 1b008 <ast>
    4c60:	41 0f b7 74 24 0a    	movzx  esi,WORD PTR [r12+0xa]
    4c66:	49 8b bc 24 98 01 00 	mov    rdi,QWORD PTR [r12+0x198]
    4c6d:	00 
    4c6e:	48 83 ec 20          	sub    rsp,0x20
    4c72:	f3 41 0f 6f 54 24 18 	movdqu xmm2,XMMWORD PTR [r12+0x18]
    4c79:	0f 11 14 24          	movups XMMWORD PTR [rsp],xmm2
    4c7d:	49 8b 44 24 28       	mov    rax,QWORD PTR [r12+0x28]
    4c82:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    4c87:	e8 30 b1 00 00       	call   fdbc <resolve_expr>
    4c8c:	4c 29 e8             	sub    rax,r13
    4c8f:	49 63 cf             	movsxd rcx,r15d
    4c92:	48 8d 14 09          	lea    rdx,[rcx+rcx*1]
    4c96:	48 8d 34 0a          	lea    rsi,[rdx+rcx*1]
    4c9a:	48 89 ac f4 10 04 00 	mov    QWORD PTR [rsp+rsi*8+0x410],rbp
    4ca1:	00 
    4ca2:	48 c1 e3 20          	shl    rbx,0x20
    4ca6:	48 83 cb 02          	or     rbx,0x2
    4caa:	48 89 9c f4 18 04 00 	mov    QWORD PTR [rsp+rsi*8+0x418],rbx
    4cb1:	00 
    4cb2:	48 83 e8 04          	sub    rax,0x4
    4cb6:	48 89 84 f4 20 04 00 	mov    QWORD PTR [rsp+rsi*8+0x420],rax
    4cbd:	00 
    4cbe:	41 83 c7 01          	add    r15d,0x1
    4cc2:	48 83 c4 20          	add    rsp,0x20
    4cc6:	e9 6e 02 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4ccb:	48 83 c7 78          	add    rdi,0x78
    4ccf:	e8 88 eb 00 00       	call   1385c <expr_label_count>
    4cd4:	83 f8 01             	cmp    eax,0x1
    4cd7:	0f 85 f4 fd ff ff    	jne    4ad1 <GenObjElfFile+0xce1>
    4cdd:	4c 89 e2             	mov    rdx,r12
    4ce0:	48 03 15 21 63 01 00 	add    rdx,QWORD PTR [rip+0x16321]        # 1b008 <ast>
    4ce7:	80 7a 78 01          	cmp    BYTE PTR [rdx+0x78],0x1
    4ceb:	0f 85 e0 fd ff ff    	jne    4ad1 <GenObjElfFile+0xce1>
    4cf1:	0f b6 4a 10          	movzx  ecx,BYTE PTR [rdx+0x10]
    4cf5:	80 f9 14             	cmp    cl,0x14
    4cf8:	74 4a                	je     4d44 <GenObjElfFile+0xf54>
    4cfa:	80 f9 0d             	cmp    cl,0xd
    4cfd:	0f 85 ce fd ff ff    	jne    4ad1 <GenObjElfFile+0xce1>
    4d03:	41 89 c5             	mov    r13d,eax
    4d06:	48 83 ec 20          	sub    rsp,0x20
    4d0a:	f3 0f 6f 62 78       	movdqu xmm4,XMMWORD PTR [rdx+0x78]
    4d0f:	0f 11 24 24          	movups XMMWORD PTR [rsp],xmm4
    4d13:	48 8b 82 88 00 00 00 	mov    rax,QWORD PTR [rdx+0x88]
    4d1a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    4d1f:	e8 cc ec 00 00       	call   139f0 <get_label_from_expr>
    4d24:	48 89 c5             	mov    rbp,rax
    4d27:	48 83 c4 20          	add    rsp,0x20
    4d2b:	48 85 c0             	test   rax,rax
    4d2e:	0f 84 05 02 00 00    	je     4f39 <GenObjElfFile+0x1149>
    4d34:	80 38 00             	cmp    BYTE PTR [rax],0x0
    4d37:	0f 84 fc 01 00 00    	je     4f39 <GenObjElfFile+0x1149>
    4d3d:	bb 00 00 00 00       	mov    ebx,0x0
    4d42:	eb 0b                	jmp    4d4f <GenObjElfFile+0xf5f>
    4d44:	80 7a 23 00          	cmp    BYTE PTR [rdx+0x23],0x0
    4d48:	75 b0                	jne    4cfa <GenObjElfFile+0xf0a>
    4d4a:	eb b7                	jmp    4d03 <GenObjElfFile+0xf13>
    4d4c:	83 c3 01             	add    ebx,0x1
    4d4f:	39 5c 24 10          	cmp    DWORD PTR [rsp+0x10],ebx
    4d53:	7e 2a                	jle    4d7f <GenObjElfFile+0xf8f>
    4d55:	48 63 c3             	movsxd rax,ebx
    4d58:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4d5c:	8b 84 c4 f0 2b 00 00 	mov    eax,DWORD PTR [rsp+rax*8+0x2bf0]
    4d63:	85 c0                	test   eax,eax
    4d65:	74 e5                	je     4d4c <GenObjElfFile+0xf5c>
    4d67:	89 c0                	mov    eax,eax
    4d69:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    4d70:	00 
    4d71:	48 89 ee             	mov    rsi,rbp
    4d74:	e8 c7 fa 00 00       	call   14840 <astrcmp>
    4d79:	85 c0                	test   eax,eax
    4d7b:	75 cf                	jne    4d4c <GenObjElfFile+0xf5c>
    4d7d:	eb 03                	jmp    4d82 <GenObjElfFile+0xf92>
    4d7f:	44 89 eb             	mov    ebx,r13d
    4d82:	4c 03 25 7f 62 01 00 	add    r12,QWORD PTR [rip+0x1627f]        # 1b008 <ast>
    4d89:	49 8b 94 24 98 01 00 	mov    rdx,QWORD PTR [r12+0x198]
    4d90:	00 
    4d91:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
    4d96:	48 29 c2             	sub    rdx,rax
    4d99:	49 03 94 24 a8 01 00 	add    rdx,QWORD PTR [r12+0x1a8]
    4da0:	00 
    4da1:	48 83 ea 04          	sub    rdx,0x4
    4da5:	49 63 f7             	movsxd rsi,r15d
    4da8:	48 8d 0c 36          	lea    rcx,[rsi+rsi*1]
    4dac:	48 8d 04 31          	lea    rax,[rcx+rsi*1]
    4db0:	48 89 94 c4 f0 03 00 	mov    QWORD PTR [rsp+rax*8+0x3f0],rdx
    4db7:	00 
    4db8:	48 89 d8             	mov    rax,rbx
    4dbb:	48 c1 e0 20          	shl    rax,0x20
    4dbf:	48 83 c8 0a          	or     rax,0xa
    4dc3:	48 8d 3c 31          	lea    rdi,[rcx+rsi*1]
    4dc7:	48 89 84 fc f8 03 00 	mov    QWORD PTR [rsp+rdi*8+0x3f8],rax
    4dce:	00 
    4dcf:	48 c7 84 fc 00 04 00 	mov    QWORD PTR [rsp+rdi*8+0x400],0x0
    4dd6:	00 00 00 00 00 
    4ddb:	41 83 c7 01          	add    r15d,0x1
    4ddf:	c7 84 14 f0 43 00 00 	mov    DWORD PTR [rsp+rdx*1+0x43f0],0x0
    4de6:	00 00 00 00 
    4dea:	e9 4a 01 00 00       	jmp    4f39 <GenObjElfFile+0x1149>
    4def:	48 8d 3d e8 18 01 00 	lea    rdi,[rip+0x118e8]        # 166de <_IO_stdin_used+0x16de>
    4df6:	e8 95 e2 ff ff       	call   3090 <puts@plt>
    4dfb:	ba 00 00 00 00       	mov    edx,0x0
    4e00:	48 63 c5             	movsxd rax,ebp
    4e03:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4e07:	48 c1 e0 05          	shl    rax,0x5
    4e0b:	0f b6 44 03 18       	movzx  eax,BYTE PTR [rbx+rax*1+0x18]
    4e10:	39 d0                	cmp    eax,edx
    4e12:	7e 27                	jle    4e3b <GenObjElfFile+0x104b>
    4e14:	48 63 c5             	movsxd rax,ebp
    4e17:	48 8d 0c 40          	lea    rcx,[rax+rax*2]
    4e1b:	48 c1 e1 05          	shl    rcx,0x5
    4e1f:	48 63 c2             	movsxd rax,edx
    4e22:	48 c1 e0 04          	shl    rax,0x4
    4e26:	48 03 44 0b 20       	add    rax,QWORD PTR [rbx+rcx*1+0x20]
    4e2b:	80 38 0e             	cmp    BYTE PTR [rax],0xe
    4e2e:	74 05                	je     4e35 <GenObjElfFile+0x1045>
    4e30:	83 c2 01             	add    edx,0x1
    4e33:	eb cb                	jmp    4e00 <GenObjElfFile+0x1010>
    4e35:	48 8b 68 08          	mov    rbp,QWORD PTR [rax+0x8]
    4e39:	eb 05                	jmp    4e40 <GenObjElfFile+0x1050>
    4e3b:	bd 00 00 00 00       	mov    ebp,0x0
    4e40:	48 85 ed             	test   rbp,rbp
    4e43:	74 12                	je     4e57 <GenObjElfFile+0x1067>
    4e45:	80 7d 00 00          	cmp    BYTE PTR [rbp+0x0],0x0
    4e49:	74 0c                	je     4e57 <GenObjElfFile+0x1067>
    4e4b:	bb 00 00 00 00       	mov    ebx,0x0
    4e50:	44 8b 6c 24 10       	mov    r13d,DWORD PTR [rsp+0x10]
    4e55:	eb 32                	jmp    4e89 <GenObjElfFile+0x1099>
    4e57:	4c 03 25 aa 61 01 00 	add    r12,QWORD PTR [rip+0x161aa]        # 1b008 <ast>
    4e5e:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    4e64:	48 8d 35 ed 07 01 00 	lea    rsi,[rip+0x107ed]        # 15658 <_IO_stdin_used+0x658>
    4e6b:	48 8b 3d 6e 5d 01 00 	mov    rdi,QWORD PTR [rip+0x15d6e]        # 1abe0 <stderr@GLIBC_2.2.5>
    4e72:	b8 00 00 00 00       	mov    eax,0x0
    4e77:	e8 c4 e2 ff ff       	call   3140 <fprintf@plt>
    4e7c:	bf 01 00 00 00       	mov    edi,0x1
    4e81:	e8 4a e3 ff ff       	call   31d0 <exit@plt>
    4e86:	83 c3 01             	add    ebx,0x1
    4e89:	41 39 dd             	cmp    r13d,ebx
    4e8c:	7e 2a                	jle    4eb8 <GenObjElfFile+0x10c8>
    4e8e:	48 63 c3             	movsxd rax,ebx
    4e91:	48 8d 04 40          	lea    rax,[rax+rax*2]
    4e95:	8b 84 c4 f0 2b 00 00 	mov    eax,DWORD PTR [rsp+rax*8+0x2bf0]
    4e9c:	85 c0                	test   eax,eax
    4e9e:	74 e6                	je     4e86 <GenObjElfFile+0x1096>
    4ea0:	89 c0                	mov    eax,eax
    4ea2:	48 8d bc 04 f0 1b 00 	lea    rdi,[rsp+rax*1+0x1bf0]
    4ea9:	00 
    4eaa:	48 89 ee             	mov    rsi,rbp
    4ead:	e8 8e f9 00 00       	call   14840 <astrcmp>
    4eb2:	85 c0                	test   eax,eax
    4eb4:	75 d0                	jne    4e86 <GenObjElfFile+0x1096>
    4eb6:	eb 05                	jmp    4ebd <GenObjElfFile+0x10cd>
    4eb8:	bb 01 00 00 00       	mov    ebx,0x1
    4ebd:	48 89 ef             	mov    rdi,rbp
    4ec0:	e8 df eb 00 00       	call   13aa4 <find_lab_addr>
    4ec5:	48 89 c6             	mov    rsi,rax
    4ec8:	4c 03 25 39 61 01 00 	add    r12,QWORD PTR [rip+0x16139]        # 1b008 <ast>
    4ecf:	49 8b 94 24 a8 01 00 	mov    rdx,QWORD PTR [r12+0x1a8]
    4ed6:	00 
    4ed7:	48 8d 42 f8          	lea    rax,[rdx-0x8]
    4edb:	49 03 84 24 a0 01 00 	add    rax,QWORD PTR [r12+0x1a0]
    4ee2:	00 
    4ee3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    4ee6:	49 8b 84 24 98 01 00 	mov    rax,QWORD PTR [r12+0x198]
    4eed:	00 
    4eee:	48 8b 7c 24 28       	mov    rdi,QWORD PTR [rsp+0x28]
    4ef3:	48 29 f8             	sub    rax,rdi
    4ef6:	48 8d 7c 02 f8       	lea    rdi,[rdx+rax*1-0x8]
    4efb:	49 63 d7             	movsxd rdx,r15d
    4efe:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    4f02:	4c 8d 04 10          	lea    r8,[rax+rdx*1]
    4f06:	4a 89 bc c4 f0 03 00 	mov    QWORD PTR [rsp+r8*8+0x3f0],rdi
    4f0d:	00 
    4f0e:	48 c1 e3 20          	shl    rbx,0x20
    4f12:	48 83 cb 01          	or     rbx,0x1
    4f16:	4a 89 9c c4 f8 03 00 	mov    QWORD PTR [rsp+r8*8+0x3f8],rbx
    4f1d:	00 
    4f1e:	48 29 f1             	sub    rcx,rsi
    4f21:	4a 89 8c c4 00 04 00 	mov    QWORD PTR [rsp+r8*8+0x400],rcx
    4f28:	00 
    4f29:	41 83 c7 01          	add    r15d,0x1
    4f2d:	48 c7 84 3c f0 43 00 	mov    QWORD PTR [rsp+rdi*1+0x43f0],0x0
    4f34:	00 00 00 00 00 
    4f39:	41 83 c6 01          	add    r14d,0x1
    4f3d:	44 39 35 c0 60 01 00 	cmp    DWORD PTR [rip+0x160c0],r14d        # 1b004 <ast_len>
    4f44:	7e 41                	jle    4f87 <GenObjElfFile+0x1197>
    4f46:	4d 63 e6             	movsxd r12,r14d
    4f49:	4d 69 e4 b8 01 00 00 	imul   r12,r12,0x1b8
    4f50:	4c 89 e0             	mov    rax,r12
    4f53:	48 03 05 ae 60 01 00 	add    rax,QWORD PTR [rip+0x160ae]        # 1b008 <ast>
    4f5a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    4f5d:	3c 0b                	cmp    al,0xb
    4f5f:	0f 84 79 02 00 00    	je     51de <GenObjElfFile+0x13ee>
    4f65:	3c 01                	cmp    al,0x1
    4f67:	75 d0                	jne    4f39 <GenObjElfFile+0x1149>
    4f69:	bd 00 00 00 00       	mov    ebp,0x0
    4f6e:	e9 77 fb ff ff       	jmp    4aea <GenObjElfFile+0xcfa>
    4f73:	41 89 df             	mov    r15d,ebx
    4f76:	eb c1                	jmp    4f39 <GenObjElfFile+0x1149>
    4f78:	41 89 df             	mov    r15d,ebx
    4f7b:	eb bc                	jmp    4f39 <GenObjElfFile+0x1149>
    4f7d:	41 89 df             	mov    r15d,ebx
    4f80:	eb b7                	jmp    4f39 <GenObjElfFile+0x1149>
    4f82:	41 89 df             	mov    r15d,ebx
    4f85:	eb b2                	jmp    4f39 <GenObjElfFile+0x1149>
    4f87:	8b 5c 24 20          	mov    ebx,DWORD PTR [rsp+0x20]
    4f8b:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
    4f90:	8b 35 6e 60 01 00    	mov    esi,DWORD PTR [rip+0x1606e]        # 1b004 <ast_len>
    4f96:	48 8b 3d 6b 60 01 00 	mov    rdi,QWORD PTR [rip+0x1606b]        # 1b008 <ast>
    4f9d:	e8 60 f7 00 00       	call   14702 <free_ast>
    4fa2:	c6 84 24 f0 02 00 00 	mov    BYTE PTR [rsp+0x2f0],0x0
    4fa9:	00 
    4faa:	c7 84 24 f1 02 00 00 	mov    DWORD PTR [rsp+0x2f1],0x7461642e
    4fb1:	2e 64 61 74 
    4fb5:	66 c7 84 24 f5 02 00 	mov    WORD PTR [rsp+0x2f5],0x61
    4fbc:	00 61 00 
    4fbf:	c7 84 24 f7 02 00 00 	mov    DWORD PTR [rsp+0x2f7],0x7865742e
    4fc6:	2e 74 65 78 
    4fca:	66 c7 84 24 fb 02 00 	mov    WORD PTR [rsp+0x2fb],0x74
    4fd1:	00 74 00 
    4fd4:	c7 84 24 fd 02 00 00 	mov    DWORD PTR [rsp+0x2fd],0x7373622e
    4fdb:	2e 62 73 73 
    4fdf:	c6 84 24 01 03 00 00 	mov    BYTE PTR [rsp+0x301],0x0
    4fe6:	00 
    4fe7:	48 b8 2e 73 68 73 74 	movabs rax,0x617472747368732e
    4fee:	72 74 61 
    4ff1:	48 89 84 24 02 03 00 	mov    QWORD PTR [rsp+0x302],rax
    4ff8:	00 
    4ff9:	66 c7 84 24 0a 03 00 	mov    WORD PTR [rsp+0x30a],0x62
    5000:	00 62 00 
    5003:	48 b8 2e 73 79 6d 74 	movabs rax,0x6261746d79732e
    500a:	61 62 00 
    500d:	48 89 84 24 0c 03 00 	mov    QWORD PTR [rsp+0x30c],rax
    5014:	00 
    5015:	48 8d 80 00 00 fb 04 	lea    rax,[rax+0x4fb0000]
    501c:	48 89 84 24 14 03 00 	mov    QWORD PTR [rsp+0x314],rax
    5023:	00 
    5024:	48 b8 2e 72 65 6c 61 	movabs rax,0x65742e616c65722e
    502b:	2e 74 65 
    502e:	48 89 84 24 1c 03 00 	mov    QWORD PTR [rsp+0x31c],rax
    5035:	00 
    5036:	c7 84 24 23 03 00 00 	mov    DWORD PTR [rsp+0x323],0x747865
    503d:	65 78 74 00 
    5041:	48 b8 2e 6e 6f 74 65 	movabs rax,0x4e472e65746f6e2e
    5048:	2e 47 4e 
    504b:	48 ba 55 2d 73 74 61 	movabs rdx,0x6b636174732d55
    5052:	63 6b 00 
    5055:	48 89 84 24 27 03 00 	mov    QWORD PTR [rsp+0x327],rax
    505c:	00 
    505d:	48 89 94 24 2f 03 00 	mov    QWORD PTR [rsp+0x32f],rdx
    5064:	00 
    5065:	8b 44 24 40          	mov    eax,DWORD PTR [rsp+0x40]
    5069:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
    506e:	48 83 c0 4f          	add    rax,0x4f
    5072:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
    5076:	49 89 c5             	mov    r13,rax
    5079:	8b 44 24 48          	mov    eax,DWORD PTR [rsp+0x48]
    507d:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
    5082:	4e 8d 64 28 0f       	lea    r12,[rax+r13*1+0xf]
    5087:	49 83 e4 f0          	and    r12,0xfffffffffffffff0
    508b:	49 8d 44 24 50       	lea    rax,[r12+0x50]
    5090:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
    5095:	48 63 44 24 10       	movsxd rax,DWORD PTR [rsp+0x10]
    509a:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
    509f:	48 8d 04 40          	lea    rax,[rax+rax*2]
    50a3:	48 c1 e0 03          	shl    rax,0x3
    50a7:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
    50ac:	49 8d 44 04 5f       	lea    rax,[r12+rax*1+0x5f]
    50b1:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
    50b5:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    50ba:	8b 4c 24 08          	mov    ecx,DWORD PTR [rsp+0x8]
    50be:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
    50c3:	48 8d 44 01 0f       	lea    rax,[rcx+rax*1+0xf]
    50c8:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
    50cc:	48 89 c1             	mov    rcx,rax
    50cf:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
    50d4:	49 63 c7             	movsxd rax,r15d
    50d7:	48 89 44 24 68       	mov    QWORD PTR [rsp+0x68],rax
    50dc:	48 8d 04 40          	lea    rax,[rax+rax*2]
    50e0:	48 c1 e0 03          	shl    rax,0x3
    50e4:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
    50e9:	48 8d 44 01 0f       	lea    rax,[rcx+rax*1+0xf]
    50ee:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
    50f2:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
    50f7:	48 8d bc 24 b0 02 00 	lea    rdi,[rsp+0x2b0]
    50fe:	00 
    50ff:	66 0f ef c0          	pxor   xmm0,xmm0
    5103:	0f 29 84 24 b0 02 00 	movaps XMMWORD PTR [rsp+0x2b0],xmm0
    510a:	00 
    510b:	0f 29 84 24 c0 02 00 	movaps XMMWORD PTR [rsp+0x2c0],xmm0
    5112:	00 
    5113:	0f 29 84 24 d0 02 00 	movaps XMMWORD PTR [rsp+0x2d0],xmm0
    511a:	00 
    511b:	0f 29 84 24 e0 02 00 	movaps XMMWORD PTR [rsp+0x2e0],xmm0
    5122:	00 
    5123:	c6 84 24 b0 02 00 00 	mov    BYTE PTR [rsp+0x2b0],0x7f
    512a:	7f 
    512b:	c6 84 24 b1 02 00 00 	mov    BYTE PTR [rsp+0x2b1],0x45
    5132:	45 
    5133:	c6 84 24 b2 02 00 00 	mov    BYTE PTR [rsp+0x2b2],0x4c
    513a:	4c 
    513b:	c6 84 24 b3 02 00 00 	mov    BYTE PTR [rsp+0x2b3],0x46
    5142:	46 
    5143:	c6 84 24 b4 02 00 00 	mov    BYTE PTR [rsp+0x2b4],0x2
    514a:	02 
    514b:	c6 84 24 b5 02 00 00 	mov    BYTE PTR [rsp+0x2b5],0x1
    5152:	01 
    5153:	c6 84 24 b6 02 00 00 	mov    BYTE PTR [rsp+0x2b6],0x1
    515a:	01 
    515b:	66 c7 84 24 c0 02 00 	mov    WORD PTR [rsp+0x2c0],0x1
    5162:	00 01 00 
    5165:	66 c7 84 24 c2 02 00 	mov    WORD PTR [rsp+0x2c2],0x3e
    516c:	00 3e 00 
    516f:	c7 84 24 c4 02 00 00 	mov    DWORD PTR [rsp+0x2c4],0x1
    5176:	01 00 00 00 
    517a:	48 89 84 24 d8 02 00 	mov    QWORD PTR [rsp+0x2d8],rax
    5181:	00 
    5182:	66 c7 84 24 e4 02 00 	mov    WORD PTR [rsp+0x2e4],0x40
    5189:	00 40 00 
    518c:	66 c7 84 24 e6 02 00 	mov    WORD PTR [rsp+0x2e6],0x38
    5193:	00 38 00 
    5196:	66 c7 84 24 ea 02 00 	mov    WORD PTR [rsp+0x2ea],0x40
    519d:	00 40 00 
    51a0:	66 c7 84 24 ec 02 00 	mov    WORD PTR [rsp+0x2ec],0x9
    51a7:	00 09 00 
    51aa:	66 c7 84 24 ee 02 00 	mov    WORD PTR [rsp+0x2ee],0x4
    51b1:	00 04 00 
    51b4:	48 89 e9             	mov    rcx,rbp
    51b7:	ba 01 00 00 00       	mov    edx,0x1
    51bc:	be 40 00 00 00       	mov    esi,0x40
    51c1:	e8 1a e0 ff ff       	call   31e0 <fwrite@plt>
    51c6:	48 89 ef             	mov    rdi,rbp
    51c9:	e8 82 df ff ff       	call   3150 <ftell@plt>
    51ce:	49 89 c6             	mov    r14,rax
    51d1:	eb 2a                	jmp    51fd <GenObjElfFile+0x140d>
    51d3:	41 bf 00 00 00 00    	mov    r15d,0x0
    51d9:	e9 b2 fd ff ff       	jmp    4f90 <GenObjElfFile+0x11a0>
    51de:	8b 5c 24 20          	mov    ebx,DWORD PTR [rsp+0x20]
    51e2:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
    51e7:	e9 a4 fd ff ff       	jmp    4f90 <GenObjElfFile+0x11a0>
    51ec:	48 89 ee             	mov    rsi,rbp
    51ef:	bf 00 00 00 00       	mov    edi,0x0
    51f4:	e8 27 df ff ff       	call   3120 <fputc@plt>
    51f9:	49 83 c6 01          	add    r14,0x1
    51fd:	49 83 fe 3f          	cmp    r14,0x3f
    5201:	7e e9                	jle    51ec <GenObjElfFile+0x13fc>
    5203:	48 8d bc 24 f0 43 10 	lea    rdi,[rsp+0x1043f0]
    520a:	00 
    520b:	48 89 e9             	mov    rcx,rbp
    520e:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    5213:	be 01 00 00 00       	mov    esi,0x1
    5218:	e8 c3 df ff ff       	call   31e0 <fwrite@plt>
    521d:	48 89 ef             	mov    rdi,rbp
    5220:	e8 2b df ff ff       	call   3150 <ftell@plt>
    5225:	49 89 c6             	mov    r14,rax
    5228:	eb 11                	jmp    523b <GenObjElfFile+0x144b>
    522a:	48 89 ee             	mov    rsi,rbp
    522d:	bf 00 00 00 00       	mov    edi,0x0
    5232:	e8 e9 de ff ff       	call   3120 <fputc@plt>
    5237:	49 83 c6 01          	add    r14,0x1
    523b:	4d 39 f5             	cmp    r13,r14
    523e:	7f ea                	jg     522a <GenObjElfFile+0x143a>
    5240:	48 8d bc 24 f0 43 00 	lea    rdi,[rsp+0x43f0]
    5247:	00 
    5248:	48 89 e9             	mov    rcx,rbp
    524b:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
    5250:	be 01 00 00 00       	mov    esi,0x1
    5255:	e8 86 df ff ff       	call   31e0 <fwrite@plt>
    525a:	48 89 ef             	mov    rdi,rbp
    525d:	e8 ee de ff ff       	call   3150 <ftell@plt>
    5262:	49 89 c6             	mov    r14,rax
    5265:	eb 11                	jmp    5278 <GenObjElfFile+0x1488>
    5267:	48 89 ee             	mov    rsi,rbp
    526a:	bf 00 00 00 00       	mov    edi,0x0
    526f:	e8 ac de ff ff       	call   3120 <fputc@plt>
    5274:	49 83 c6 01          	add    r14,0x1
    5278:	4d 39 f4             	cmp    r12,r14
    527b:	7f ea                	jg     5267 <GenObjElfFile+0x1477>
    527d:	48 8d bc 24 f0 02 00 	lea    rdi,[rsp+0x2f0]
    5284:	00 
    5285:	48 89 e9             	mov    rcx,rbp
    5288:	ba 47 00 00 00       	mov    edx,0x47
    528d:	be 01 00 00 00       	mov    esi,0x1
    5292:	e8 49 df ff ff       	call   31e0 <fwrite@plt>
    5297:	48 89 ef             	mov    rdi,rbp
    529a:	e8 b1 de ff ff       	call   3150 <ftell@plt>
    529f:	49 89 c6             	mov    r14,rax
    52a2:	89 5c 24 5c          	mov    DWORD PTR [rsp+0x5c],ebx
    52a6:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
    52ab:	eb 11                	jmp    52be <GenObjElfFile+0x14ce>
    52ad:	48 89 ee             	mov    rsi,rbp
    52b0:	bf 00 00 00 00       	mov    edi,0x0
    52b5:	e8 66 de ff ff       	call   3120 <fputc@plt>
    52ba:	49 83 c6 01          	add    r14,0x1
    52be:	4c 39 f3             	cmp    rbx,r14
    52c1:	7f ea                	jg     52ad <GenObjElfFile+0x14bd>
    52c3:	8b 5c 24 5c          	mov    ebx,DWORD PTR [rsp+0x5c]
    52c7:	48 8d bc 24 f0 2b 00 	lea    rdi,[rsp+0x2bf0]
    52ce:	00 
    52cf:	48 89 e9             	mov    rcx,rbp
    52d2:	48 8b 54 24 40       	mov    rdx,QWORD PTR [rsp+0x40]
    52d7:	be 18 00 00 00       	mov    esi,0x18
    52dc:	e8 ff de ff ff       	call   31e0 <fwrite@plt>
    52e1:	48 89 ef             	mov    rdi,rbp
    52e4:	e8 67 de ff ff       	call   3150 <ftell@plt>
    52e9:	49 89 c6             	mov    r14,rax
    52ec:	89 5c 24 40          	mov    DWORD PTR [rsp+0x40],ebx
    52f0:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
    52f5:	eb 11                	jmp    5308 <GenObjElfFile+0x1518>
    52f7:	48 89 ee             	mov    rsi,rbp
    52fa:	bf 00 00 00 00       	mov    edi,0x0
    52ff:	e8 1c de ff ff       	call   3120 <fputc@plt>
    5304:	49 83 c6 01          	add    r14,0x1
    5308:	4c 39 f3             	cmp    rbx,r14
    530b:	7f ea                	jg     52f7 <GenObjElfFile+0x1507>
    530d:	8b 5c 24 40          	mov    ebx,DWORD PTR [rsp+0x40]
    5311:	48 8d bc 24 f0 1b 00 	lea    rdi,[rsp+0x1bf0]
    5318:	00 
    5319:	48 89 e9             	mov    rcx,rbp
    531c:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
    5321:	be 01 00 00 00       	mov    esi,0x1
    5326:	e8 b5 de ff ff       	call   31e0 <fwrite@plt>
    532b:	48 89 ef             	mov    rdi,rbp
    532e:	e8 1d de ff ff       	call   3150 <ftell@plt>
    5333:	49 89 c6             	mov    r14,rax
    5336:	89 5c 24 40          	mov    DWORD PTR [rsp+0x40],ebx
    533a:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
    533f:	eb 11                	jmp    5352 <GenObjElfFile+0x1562>
    5341:	48 89 ee             	mov    rsi,rbp
    5344:	bf 00 00 00 00       	mov    edi,0x0
    5349:	e8 d2 dd ff ff       	call   3120 <fputc@plt>
    534e:	49 83 c6 01          	add    r14,0x1
    5352:	4c 39 f3             	cmp    rbx,r14
    5355:	7f ea                	jg     5341 <GenObjElfFile+0x1551>
    5357:	8b 5c 24 40          	mov    ebx,DWORD PTR [rsp+0x40]
    535b:	45 85 ff             	test   r15d,r15d
    535e:	7f 12                	jg     5372 <GenObjElfFile+0x1582>
    5360:	48 89 ef             	mov    rdi,rbp
    5363:	e8 e8 dd ff ff       	call   3150 <ftell@plt>
    5368:	49 89 c6             	mov    r14,rax
    536b:	4c 8b 7c 24 38       	mov    r15,QWORD PTR [rsp+0x38]
    5370:	eb 2d                	jmp    539f <GenObjElfFile+0x15af>
    5372:	48 8d bc 24 f0 03 00 	lea    rdi,[rsp+0x3f0]
    5379:	00 
    537a:	48 89 e9             	mov    rcx,rbp
    537d:	48 8b 54 24 68       	mov    rdx,QWORD PTR [rsp+0x68]
    5382:	be 18 00 00 00       	mov    esi,0x18
    5387:	e8 54 de ff ff       	call   31e0 <fwrite@plt>
    538c:	eb d2                	jmp    5360 <GenObjElfFile+0x1570>
    538e:	48 89 ee             	mov    rsi,rbp
    5391:	bf 00 00 00 00       	mov    edi,0x0
    5396:	e8 85 dd ff ff       	call   3120 <fputc@plt>
    539b:	49 83 c6 01          	add    r14,0x1
    539f:	4d 39 f7             	cmp    r15,r14
    53a2:	7f ea                	jg     538e <GenObjElfFile+0x159e>
    53a4:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
    53a9:	b9 48 00 00 00       	mov    ecx,0x48
    53ae:	b8 00 00 00 00       	mov    eax,0x0
    53b3:	4c 89 c7             	mov    rdi,r8
    53b6:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    53b9:	c7 84 24 b0 00 00 00 	mov    DWORD PTR [rsp+0xb0],0x1
    53c0:	01 00 00 00 
    53c4:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x1
    53cb:	01 00 00 00 
    53cf:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x3
    53d6:	00 03 00 00 00 
    53db:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x40
    53e2:	00 40 00 00 00 
    53e7:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
    53ec:	48 89 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],rax
    53f3:	00 
    53f4:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x4
    53fb:	00 04 00 00 00 
    5400:	c7 84 24 f0 00 00 00 	mov    DWORD PTR [rsp+0xf0],0x7
    5407:	07 00 00 00 
    540b:	c7 84 24 f4 00 00 00 	mov    DWORD PTR [rsp+0xf4],0x1
    5412:	01 00 00 00 
    5416:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x6
    541d:	00 06 00 00 00 
    5422:	4c 89 ac 24 08 01 00 	mov    QWORD PTR [rsp+0x108],r13
    5429:	00 
    542a:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
    542f:	48 89 84 24 10 01 00 	mov    QWORD PTR [rsp+0x110],rax
    5436:	00 
    5437:	48 c7 84 24 20 01 00 	mov    QWORD PTR [rsp+0x120],0x10
    543e:	00 10 00 00 00 
    5443:	c7 84 24 30 01 00 00 	mov    DWORD PTR [rsp+0x130],0xd
    544a:	0d 00 00 00 
    544e:	c7 84 24 34 01 00 00 	mov    DWORD PTR [rsp+0x134],0x8
    5455:	08 00 00 00 
    5459:	48 c7 84 24 38 01 00 	mov    QWORD PTR [rsp+0x138],0x3
    5460:	00 03 00 00 00 
    5465:	4c 89 a4 24 48 01 00 	mov    QWORD PTR [rsp+0x148],r12
    546c:	00 
    546d:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
    5472:	48 89 84 24 50 01 00 	mov    QWORD PTR [rsp+0x150],rax
    5479:	00 
    547a:	48 c7 84 24 60 01 00 	mov    QWORD PTR [rsp+0x160],0x4
    5481:	00 04 00 00 00 
    5486:	c7 84 24 70 01 00 00 	mov    DWORD PTR [rsp+0x170],0x12
    548d:	12 00 00 00 
    5491:	c7 84 24 74 01 00 00 	mov    DWORD PTR [rsp+0x174],0x3
    5498:	03 00 00 00 
    549c:	4c 89 a4 24 88 01 00 	mov    QWORD PTR [rsp+0x188],r12
    54a3:	00 
    54a4:	48 c7 84 24 90 01 00 	mov    QWORD PTR [rsp+0x190],0x47
    54ab:	00 47 00 00 00 
    54b0:	48 c7 84 24 a0 01 00 	mov    QWORD PTR [rsp+0x1a0],0x1
    54b7:	00 01 00 00 00 
    54bc:	c7 84 24 b0 01 00 00 	mov    DWORD PTR [rsp+0x1b0],0x1c
    54c3:	1c 00 00 00 
    54c7:	c7 84 24 b4 01 00 00 	mov    DWORD PTR [rsp+0x1b4],0x2
    54ce:	02 00 00 00 
    54d2:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
    54d7:	48 89 84 24 c8 01 00 	mov    QWORD PTR [rsp+0x1c8],rax
    54de:	00 
    54df:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
    54e4:	48 89 84 24 d0 01 00 	mov    QWORD PTR [rsp+0x1d0],rax
    54eb:	00 
    54ec:	c7 84 24 d8 01 00 00 	mov    DWORD PTR [rsp+0x1d8],0x6
    54f3:	06 00 00 00 
    54f7:	89 9c 24 dc 01 00 00 	mov    DWORD PTR [rsp+0x1dc],ebx
    54fe:	48 c7 84 24 e0 01 00 	mov    QWORD PTR [rsp+0x1e0],0x8
    5505:	00 08 00 00 00 
    550a:	48 c7 84 24 e8 01 00 	mov    QWORD PTR [rsp+0x1e8],0x18
    5511:	00 18 00 00 00 
    5516:	c7 84 24 f0 01 00 00 	mov    DWORD PTR [rsp+0x1f0],0x24
    551d:	24 00 00 00 
    5521:	c7 84 24 f4 01 00 00 	mov    DWORD PTR [rsp+0x1f4],0x3
    5528:	03 00 00 00 
    552c:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    5531:	48 89 84 24 08 02 00 	mov    QWORD PTR [rsp+0x208],rax
    5538:	00 
    5539:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    553e:	48 89 84 24 10 02 00 	mov    QWORD PTR [rsp+0x210],rax
    5545:	00 
    5546:	48 c7 84 24 20 02 00 	mov    QWORD PTR [rsp+0x220],0x1
    554d:	00 01 00 00 00 
    5552:	c7 84 24 30 02 00 00 	mov    DWORD PTR [rsp+0x230],0x2c
    5559:	2c 00 00 00 
    555d:	c7 84 24 34 02 00 00 	mov    DWORD PTR [rsp+0x234],0x4
    5564:	04 00 00 00 
    5568:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
    556d:	48 89 84 24 48 02 00 	mov    QWORD PTR [rsp+0x248],rax
    5574:	00 
    5575:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
    557a:	48 89 84 24 50 02 00 	mov    QWORD PTR [rsp+0x250],rax
    5581:	00 
    5582:	c7 84 24 58 02 00 00 	mov    DWORD PTR [rsp+0x258],0x5
    5589:	05 00 00 00 
    558d:	c7 84 24 5c 02 00 00 	mov    DWORD PTR [rsp+0x25c],0x2
    5594:	02 00 00 00 
    5598:	48 c7 84 24 60 02 00 	mov    QWORD PTR [rsp+0x260],0x8
    559f:	00 08 00 00 00 
    55a4:	48 c7 84 24 68 02 00 	mov    QWORD PTR [rsp+0x268],0x18
    55ab:	00 18 00 00 00 
    55b0:	c7 84 24 70 02 00 00 	mov    DWORD PTR [rsp+0x270],0x37
    55b7:	37 00 00 00 
    55bb:	c7 84 24 74 02 00 00 	mov    DWORD PTR [rsp+0x274],0x1
    55c2:	01 00 00 00 
    55c6:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
    55cb:	48 89 84 24 88 02 00 	mov    QWORD PTR [rsp+0x288],rax
    55d2:	00 
    55d3:	48 c7 84 24 a0 02 00 	mov    QWORD PTR [rsp+0x2a0],0x1
    55da:	00 01 00 00 00 
    55df:	48 89 e9             	mov    rcx,rbp
    55e2:	ba 09 00 00 00       	mov    edx,0x9
    55e7:	be 40 00 00 00       	mov    esi,0x40
    55ec:	4c 89 c7             	mov    rdi,r8
    55ef:	e8 ec db ff ff       	call   31e0 <fwrite@plt>
    55f4:	48 89 ef             	mov    rdi,rbp
    55f7:	e8 54 db ff ff       	call   3150 <ftell@plt>
    55fc:	48 81 c4 f8 43 20 00 	add    rsp,0x2043f8
    5603:	5b                   	pop    rbx
    5604:	5d                   	pop    rbp
    5605:	41 5c                	pop    r12
    5607:	41 5d                	pop    r13
    5609:	41 5e                	pop    r14
    560b:	41 5f                	pop    r15
    560d:	c3                   	ret
    560e:	b8 ff ff ff ff       	mov    eax,0xffffffff
    5613:	c3                   	ret

0000000000005614 <ELFgenfile>:
    5614:	48 85 ff             	test   rdi,rdi
    5617:	0f 84 ff 01 00 00    	je     581c <ELFgenfile+0x208>
    561d:	41 55                	push   r13
    561f:	41 54                	push   r12
    5621:	55                   	push   rbp
    5622:	53                   	push   rbx
    5623:	48 81 ec 18 10 00 00 	sub    rsp,0x1018
    562a:	48 89 fd             	mov    rbp,rdi
    562d:	49 89 d5             	mov    r13,rdx
    5630:	48 89 cb             	mov    rbx,rcx
    5633:	45 89 c4             	mov    r12d,r8d
    5636:	66 0f ef c0          	pxor   xmm0,xmm0
    563a:	0f 29 84 24 d0 0f 00 	movaps XMMWORD PTR [rsp+0xfd0],xmm0
    5641:	00 
    5642:	0f 29 84 24 e0 0f 00 	movaps XMMWORD PTR [rsp+0xfe0],xmm0
    5649:	00 
    564a:	0f 29 84 24 f0 0f 00 	movaps XMMWORD PTR [rsp+0xff0],xmm0
    5651:	00 
    5652:	0f 29 84 24 00 10 00 	movaps XMMWORD PTR [rsp+0x1000],xmm0
    5659:	00 
    565a:	0f 29 84 24 90 0f 00 	movaps XMMWORD PTR [rsp+0xf90],xmm0
    5661:	00 
    5662:	0f 29 84 24 a0 0f 00 	movaps XMMWORD PTR [rsp+0xfa0],xmm0
    5669:	00 
    566a:	0f 29 84 24 b0 0f 00 	movaps XMMWORD PTR [rsp+0xfb0],xmm0
    5671:	00 
    5672:	48 c7 84 24 c0 0f 00 	mov    QWORD PTR [rsp+0xfc0],0x0
    5679:	00 00 00 00 00 
    567e:	c6 84 24 d0 0f 00 00 	mov    BYTE PTR [rsp+0xfd0],0x7f
    5685:	7f 
    5686:	c6 84 24 d1 0f 00 00 	mov    BYTE PTR [rsp+0xfd1],0x45
    568d:	45 
    568e:	c6 84 24 d2 0f 00 00 	mov    BYTE PTR [rsp+0xfd2],0x4c
    5695:	4c 
    5696:	c6 84 24 d3 0f 00 00 	mov    BYTE PTR [rsp+0xfd3],0x46
    569d:	46 
    569e:	c6 84 24 d4 0f 00 00 	mov    BYTE PTR [rsp+0xfd4],0x2
    56a5:	02 
    56a6:	c6 84 24 d5 0f 00 00 	mov    BYTE PTR [rsp+0xfd5],0x1
    56ad:	01 
    56ae:	c6 84 24 d6 0f 00 00 	mov    BYTE PTR [rsp+0xfd6],0x1
    56b5:	01 
    56b6:	45 85 c0             	test   r8d,r8d
    56b9:	0f 84 49 01 00 00    	je     5808 <ELFgenfile+0x1f4>
    56bf:	b8 03 00 00 00       	mov    eax,0x3
    56c4:	66 89 84 24 e0 0f 00 	mov    WORD PTR [rsp+0xfe0],ax
    56cb:	00 
    56cc:	66 c7 84 24 e2 0f 00 	mov    WORD PTR [rsp+0xfe2],0x3e
    56d3:	00 3e 00 
    56d6:	c7 84 24 e4 0f 00 00 	mov    DWORD PTR [rsp+0xfe4],0x1
    56dd:	01 00 00 00 
    56e1:	48 89 b4 24 e8 0f 00 	mov    QWORD PTR [rsp+0xfe8],rsi
    56e8:	00 
    56e9:	48 c7 84 24 f0 0f 00 	mov    QWORD PTR [rsp+0xff0],0x40
    56f0:	00 40 00 00 00 
    56f5:	66 c7 84 24 04 10 00 	mov    WORD PTR [rsp+0x1004],0x40
    56fc:	00 40 00 
    56ff:	66 c7 84 24 06 10 00 	mov    WORD PTR [rsp+0x1006],0x38
    5706:	00 38 00 
    5709:	66 c7 84 24 08 10 00 	mov    WORD PTR [rsp+0x1008],0x1
    5710:	00 01 00 
    5713:	48 8d bc 24 d0 0f 00 	lea    rdi,[rsp+0xfd0]
    571a:	00 
    571b:	48 89 e9             	mov    rcx,rbp
    571e:	ba 01 00 00 00       	mov    edx,0x1
    5723:	be 40 00 00 00       	mov    esi,0x40
    5728:	e8 b3 da ff ff       	call   31e0 <fwrite@plt>
    572d:	45 85 e4             	test   r12d,r12d
    5730:	0f 84 dc 00 00 00    	je     5812 <ELFgenfile+0x1fe>
    5736:	b8 00 00 00 00       	mov    eax,0x0
    573b:	c7 84 24 90 0f 00 00 	mov    DWORD PTR [rsp+0xf90],0x1
    5742:	01 00 00 00 
    5746:	c7 84 24 94 0f 00 00 	mov    DWORD PTR [rsp+0xf94],0x7
    574d:	07 00 00 00 
    5751:	48 c7 84 24 98 0f 00 	mov    QWORD PTR [rsp+0xf98],0x1000
    5758:	00 00 10 00 00 
    575d:	48 05 00 10 00 00    	add    rax,0x1000
    5763:	48 89 84 24 a0 0f 00 	mov    QWORD PTR [rsp+0xfa0],rax
    576a:	00 
    576b:	48 89 84 24 a8 0f 00 	mov    QWORD PTR [rsp+0xfa8],rax
    5772:	00 
    5773:	48 89 9c 24 b0 0f 00 	mov    QWORD PTR [rsp+0xfb0],rbx
    577a:	00 
    577b:	48 89 9c 24 b8 0f 00 	mov    QWORD PTR [rsp+0xfb8],rbx
    5782:	00 
    5783:	48 c7 84 24 c0 0f 00 	mov    QWORD PTR [rsp+0xfc0],0x1000
    578a:	00 00 10 00 00 
    578f:	48 8d bc 24 90 0f 00 	lea    rdi,[rsp+0xf90]
    5796:	00 
    5797:	48 89 e9             	mov    rcx,rbp
    579a:	ba 01 00 00 00       	mov    edx,0x1
    579f:	be 38 00 00 00       	mov    esi,0x38
    57a4:	e8 37 da ff ff       	call   31e0 <fwrite@plt>
    57a9:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
    57b0:	00 
    57b1:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    57b8:	00 00 
    57ba:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    57bf:	b9 ef 01 00 00       	mov    ecx,0x1ef
    57c4:	b8 00 00 00 00       	mov    eax,0x0
    57c9:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    57cc:	48 89 e7             	mov    rdi,rsp
    57cf:	48 89 e9             	mov    rcx,rbp
    57d2:	ba 88 0f 00 00       	mov    edx,0xf88
    57d7:	be 01 00 00 00       	mov    esi,0x1
    57dc:	e8 ff d9 ff ff       	call   31e0 <fwrite@plt>
    57e1:	48 89 e9             	mov    rcx,rbp
    57e4:	48 89 da             	mov    rdx,rbx
    57e7:	be 01 00 00 00       	mov    esi,0x1
    57ec:	4c 89 ef             	mov    rdi,r13
    57ef:	e8 ec d9 ff ff       	call   31e0 <fwrite@plt>
    57f4:	8d 83 00 10 00 00    	lea    eax,[rbx+0x1000]
    57fa:	48 81 c4 18 10 00 00 	add    rsp,0x1018
    5801:	5b                   	pop    rbx
    5802:	5d                   	pop    rbp
    5803:	41 5c                	pop    r12
    5805:	41 5d                	pop    r13
    5807:	c3                   	ret
    5808:	b8 02 00 00 00       	mov    eax,0x2
    580d:	e9 b2 fe ff ff       	jmp    56c4 <ELFgenfile+0xb0>
    5812:	b8 00 00 40 00       	mov    eax,0x400000
    5817:	e9 1f ff ff ff       	jmp    573b <ELFgenfile+0x127>
    581c:	b8 00 00 00 00       	mov    eax,0x0
    5821:	c3                   	ret

0000000000005822 <parse_addr_expr>:
    5822:	41 54                	push   r12
    5824:	55                   	push   rbp
    5825:	53                   	push   rbx
    5826:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    582d:	48 89 fd             	mov    rbp,rdi
    5830:	48 89 f0             	mov    rax,rsi
    5833:	41 89 d4             	mov    r12d,edx
    5836:	66 0f ef c0          	pxor   xmm0,xmm0
    583a:	0f 29 84 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm0
    5841:	00 
    5842:	0f 29 84 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm0
    5849:	00 
    584a:	0f 29 84 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm0
    5851:	00 
    5852:	0f 29 84 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm0
    5859:	00 
    585a:	0f 29 84 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm0
    5861:	00 
    5862:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
    5869:	00 00 
    586b:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
    5872:	00 00 
    5874:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
    587b:	00 00 
    587d:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
    5884:	00 00 
    5886:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
    588d:	00 00 
    588f:	48 c7 44 24 68 00 00 	mov    QWORD PTR [rsp+0x68],0x0
    5896:	00 00 
    5898:	48 c7 44 24 70 00 00 	mov    QWORD PTR [rsp+0x70],0x0
    589f:	00 00 
    58a1:	48 c7 44 24 78 00 00 	mov    QWORD PTR [rsp+0x78],0x0
    58a8:	00 00 
    58aa:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    58b1:	00 00 
    58b3:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    58ba:	00 00 
    58bc:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    58c3:	00 00 
    58c5:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
    58cc:	00 
    58cd:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    58d4:	00 00 
    58d6:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    58dd:	00 00 
    58df:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
    58e6:	00 00 
    58e8:	c6 44 24 28 31       	mov    BYTE PTR [rsp+0x28],0x31
    58ed:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
    58f1:	41 b8 00 00 00 00    	mov    r8d,0x0
    58f7:	bb 00 00 00 00       	mov    ebx,0x0
    58fc:	41 b9 00 00 00 00    	mov    r9d,0x0
    5902:	be 00 00 00 00       	mov    esi,0x0
    5907:	eb 70                	jmp    5979 <parse_addr_expr+0x157>
    5909:	80 78 01 3d          	cmp    BYTE PTR [rax+0x1],0x3d
    590d:	75 33                	jne    5942 <parse_addr_expr+0x120>
    590f:	48 83 c0 02          	add    rax,0x2
    5913:	ba 00 00 00 00       	mov    edx,0x0
    5918:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    591b:	84 c9                	test   cl,cl
    591d:	40 0f 95 c7          	setne  dil
    5921:	80 f9 2c             	cmp    cl,0x2c
    5924:	40 0f 95 c6          	setne  sil
    5928:	40 84 f7             	test   dil,sil
    592b:	74 3a                	je     5967 <parse_addr_expr+0x145>
    592d:	83 fa 3e             	cmp    edx,0x3e
    5930:	7f 35                	jg     5967 <parse_addr_expr+0x145>
    5932:	48 83 c0 01          	add    rax,0x1
    5936:	48 63 f2             	movsxd rsi,edx
    5939:	88 4c 34 40          	mov    BYTE PTR [rsp+rsi*1+0x40],cl
    593d:	8d 52 01             	lea    edx,[rdx+0x1]
    5940:	eb d6                	jmp    5918 <parse_addr_expr+0xf6>
    5942:	44 89 e2             	mov    edx,r12d
    5945:	48 8d 35 3b fd 00 00 	lea    rsi,[rip+0xfd3b]        # 15687 <_IO_stdin_used+0x687>
    594c:	48 8b 3d 8d 52 01 00 	mov    rdi,QWORD PTR [rip+0x1528d]        # 1abe0 <stderr@GLIBC_2.2.5>
    5953:	b8 00 00 00 00       	mov    eax,0x0
    5958:	e8 e3 d7 ff ff       	call   3140 <fprintf@plt>
    595d:	bf 01 00 00 00       	mov    edi,0x1
    5962:	e8 69 d8 ff ff       	call   31d0 <exit@plt>
    5967:	48 63 d2             	movsxd rdx,edx
    596a:	c6 44 14 40 00       	mov    BYTE PTR [rsp+rdx*1+0x40],0x0
    596f:	80 38 2c             	cmp    BYTE PTR [rax],0x2c
    5972:	74 2f                	je     59a3 <parse_addr_expr+0x181>
    5974:	be 01 00 00 00       	mov    esi,0x1
    5979:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    597c:	84 c9                	test   cl,cl
    597e:	0f 84 d4 01 00 00    	je     5b58 <parse_addr_expr+0x336>
    5984:	8d 51 be             	lea    edx,[rcx-0x42]
    5987:	80 fa 31             	cmp    dl,0x31
    598a:	0f 87 a0 01 00 00    	ja     5b30 <parse_addr_expr+0x30e>
    5990:	0f b6 d2             	movzx  edx,dl
    5993:	48 8d 3d c2 fe 00 00 	lea    rdi,[rip+0xfec2]        # 1585c <_IO_stdin_used+0x85c>
    599a:	48 63 14 97          	movsxd rdx,DWORD PTR [rdi+rdx*4]
    599e:	48 01 fa             	add    rdx,rdi
    59a1:	ff e2                	jmp    rdx
    59a3:	48 83 c0 01          	add    rax,0x1
    59a7:	be 01 00 00 00       	mov    esi,0x1
    59ac:	eb cb                	jmp    5979 <parse_addr_expr+0x157>
    59ae:	80 78 01 3d          	cmp    BYTE PTR [rax+0x1],0x3d
    59b2:	75 33                	jne    59e7 <parse_addr_expr+0x1c5>
    59b4:	48 83 c0 02          	add    rax,0x2
    59b8:	ba 00 00 00 00       	mov    edx,0x0
    59bd:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    59c0:	84 c9                	test   cl,cl
    59c2:	41 0f 95 c1          	setne  r9b
    59c6:	80 f9 2c             	cmp    cl,0x2c
    59c9:	40 0f 95 c7          	setne  dil
    59cd:	41 84 f9             	test   r9b,dil
    59d0:	74 3a                	je     5a0c <parse_addr_expr+0x1ea>
    59d2:	83 fa 0e             	cmp    edx,0xe
    59d5:	7f 35                	jg     5a0c <parse_addr_expr+0x1ea>
    59d7:	48 83 c0 01          	add    rax,0x1
    59db:	48 63 fa             	movsxd rdi,edx
    59de:	88 4c 3c 30          	mov    BYTE PTR [rsp+rdi*1+0x30],cl
    59e2:	8d 52 01             	lea    edx,[rdx+0x1]
    59e5:	eb d6                	jmp    59bd <parse_addr_expr+0x19b>
    59e7:	44 89 e2             	mov    edx,r12d
    59ea:	48 8d 35 96 fc 00 00 	lea    rsi,[rip+0xfc96]        # 15687 <_IO_stdin_used+0x687>
    59f1:	48 8b 3d e8 51 01 00 	mov    rdi,QWORD PTR [rip+0x151e8]        # 1abe0 <stderr@GLIBC_2.2.5>
    59f8:	b8 00 00 00 00       	mov    eax,0x0
    59fd:	e8 3e d7 ff ff       	call   3140 <fprintf@plt>
    5a02:	bf 01 00 00 00       	mov    edi,0x1
    5a07:	e8 c4 d7 ff ff       	call   31d0 <exit@plt>
    5a0c:	48 63 d2             	movsxd rdx,edx
    5a0f:	c6 44 14 30 00       	mov    BYTE PTR [rsp+rdx*1+0x30],0x0
    5a14:	80 38 2c             	cmp    BYTE PTR [rax],0x2c
    5a17:	74 0b                	je     5a24 <parse_addr_expr+0x202>
    5a19:	41 b9 01 00 00 00    	mov    r9d,0x1
    5a1f:	e9 55 ff ff ff       	jmp    5979 <parse_addr_expr+0x157>
    5a24:	48 83 c0 01          	add    rax,0x1
    5a28:	41 b9 01 00 00 00    	mov    r9d,0x1
    5a2e:	e9 46 ff ff ff       	jmp    5979 <parse_addr_expr+0x157>
    5a33:	80 78 01 3d          	cmp    BYTE PTR [rax+0x1],0x3d
    5a37:	75 0b                	jne    5a44 <parse_addr_expr+0x222>
    5a39:	48 83 c0 02          	add    rax,0x2
    5a3d:	ba 00 00 00 00       	mov    edx,0x0
    5a42:	eb 33                	jmp    5a77 <parse_addr_expr+0x255>
    5a44:	44 89 e2             	mov    edx,r12d
    5a47:	48 8d 35 39 fc 00 00 	lea    rsi,[rip+0xfc39]        # 15687 <_IO_stdin_used+0x687>
    5a4e:	48 8b 3d 8b 51 01 00 	mov    rdi,QWORD PTR [rip+0x1518b]        # 1abe0 <stderr@GLIBC_2.2.5>
    5a55:	b8 00 00 00 00       	mov    eax,0x0
    5a5a:	e8 e1 d6 ff ff       	call   3140 <fprintf@plt>
    5a5f:	bf 01 00 00 00       	mov    edi,0x1
    5a64:	e8 67 d7 ff ff       	call   31d0 <exit@plt>
    5a69:	48 83 c0 01          	add    rax,0x1
    5a6d:	48 63 fa             	movsxd rdi,edx
    5a70:	88 4c 3c 28          	mov    BYTE PTR [rsp+rdi*1+0x28],cl
    5a74:	8d 52 01             	lea    edx,[rdx+0x1]
    5a77:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    5a7a:	8d 79 d0             	lea    edi,[rcx-0x30]
    5a7d:	40 80 ff 09          	cmp    dil,0x9
    5a81:	77 05                	ja     5a88 <parse_addr_expr+0x266>
    5a83:	83 fa 06             	cmp    edx,0x6
    5a86:	76 e1                	jbe    5a69 <parse_addr_expr+0x247>
    5a88:	48 63 d2             	movsxd rdx,edx
    5a8b:	c6 44 14 28 00       	mov    BYTE PTR [rsp+rdx*1+0x28],0x0
    5a90:	80 38 2c             	cmp    BYTE PTR [rax],0x2c
    5a93:	74 0a                	je     5a9f <parse_addr_expr+0x27d>
    5a95:	bb 01 00 00 00       	mov    ebx,0x1
    5a9a:	e9 da fe ff ff       	jmp    5979 <parse_addr_expr+0x157>
    5a9f:	48 83 c0 01          	add    rax,0x1
    5aa3:	bb 01 00 00 00       	mov    ebx,0x1
    5aa8:	e9 cc fe ff ff       	jmp    5979 <parse_addr_expr+0x157>
    5aad:	80 78 01 3d          	cmp    BYTE PTR [rax+0x1],0x3d
    5ab1:	75 0b                	jne    5abe <parse_addr_expr+0x29c>
    5ab3:	48 83 c0 02          	add    rax,0x2
    5ab7:	ba 00 00 00 00       	mov    edx,0x0
    5abc:	eb 32                	jmp    5af0 <parse_addr_expr+0x2ce>
    5abe:	44 89 e2             	mov    edx,r12d
    5ac1:	48 8d 35 bf fb 00 00 	lea    rsi,[rip+0xfbbf]        # 15687 <_IO_stdin_used+0x687>
    5ac8:	48 8b 3d 11 51 01 00 	mov    rdi,QWORD PTR [rip+0x15111]        # 1abe0 <stderr@GLIBC_2.2.5>
    5acf:	b8 00 00 00 00       	mov    eax,0x0
    5ad4:	e8 67 d6 ff ff       	call   3140 <fprintf@plt>
    5ad9:	bf 01 00 00 00       	mov    edi,0x1
    5ade:	e8 ed d6 ff ff       	call   31d0 <exit@plt>
    5ae3:	48 83 c0 01          	add    rax,0x1
    5ae7:	48 63 fa             	movsxd rdi,edx
    5aea:	88 0c 3c             	mov    BYTE PTR [rsp+rdi*1],cl
    5aed:	8d 52 01             	lea    edx,[rdx+0x1]
    5af0:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    5af3:	84 c9                	test   cl,cl
    5af5:	41 0f 95 c0          	setne  r8b
    5af9:	80 f9 2c             	cmp    cl,0x2c
    5afc:	40 0f 95 c7          	setne  dil
    5b00:	41 84 f8             	test   r8b,dil
    5b03:	74 05                	je     5b0a <parse_addr_expr+0x2e8>
    5b05:	83 fa 1e             	cmp    edx,0x1e
    5b08:	76 d9                	jbe    5ae3 <parse_addr_expr+0x2c1>
    5b0a:	48 63 d2             	movsxd rdx,edx
    5b0d:	c6 04 14 00          	mov    BYTE PTR [rsp+rdx*1],0x0
    5b11:	80 38 2c             	cmp    BYTE PTR [rax],0x2c
    5b14:	74 0b                	je     5b21 <parse_addr_expr+0x2ff>
    5b16:	41 b8 01 00 00 00    	mov    r8d,0x1
    5b1c:	e9 58 fe ff ff       	jmp    5979 <parse_addr_expr+0x157>
    5b21:	48 83 c0 01          	add    rax,0x1
    5b25:	41 b8 01 00 00 00    	mov    r8d,0x1
    5b2b:	e9 49 fe ff ff       	jmp    5979 <parse_addr_expr+0x157>
    5b30:	0f b6 c9             	movzx  ecx,cl
    5b33:	44 89 e2             	mov    edx,r12d
    5b36:	48 8d 35 67 fb 00 00 	lea    rsi,[rip+0xfb67]        # 156a4 <_IO_stdin_used+0x6a4>
    5b3d:	48 8b 3d 9c 50 01 00 	mov    rdi,QWORD PTR [rip+0x1509c]        # 1abe0 <stderr@GLIBC_2.2.5>
    5b44:	b8 00 00 00 00       	mov    eax,0x0
    5b49:	e8 f2 d5 ff ff       	call   3140 <fprintf@plt>
    5b4e:	bf 01 00 00 00       	mov    edi,0x1
    5b53:	e8 78 d6 ff ff       	call   31d0 <exit@plt>
    5b58:	40 88 b4 24 88 00 00 	mov    BYTE PTR [rsp+0x88],sil
    5b5f:	00 
    5b60:	44 88 8c 24 89 00 00 	mov    BYTE PTR [rsp+0x89],r9b
    5b67:	00 
    5b68:	44 88 84 24 8a 00 00 	mov    BYTE PTR [rsp+0x8a],r8b
    5b6f:	00 
    5b70:	48 8d 7c 24 28       	lea    rdi,[rsp+0x28]
    5b75:	e8 e6 e7 00 00       	call   14360 <eval_expr>
    5b7a:	88 84 24 82 00 00 00 	mov    BYTE PTR [rsp+0x82],al
    5b81:	48 89 e7             	mov    rdi,rsp
    5b84:	e8 d7 e7 00 00       	call   14360 <eval_expr>
    5b89:	89 84 24 84 00 00 00 	mov    DWORD PTR [rsp+0x84],eax
    5b90:	84 db                	test   bl,bl
    5b92:	74 0e                	je     5ba2 <parse_addr_expr+0x380>
    5b94:	80 bc 24 89 00 00 00 	cmp    BYTE PTR [rsp+0x89],0x0
    5b9b:	00 
    5b9c:	0f 84 43 01 00 00    	je     5ce5 <parse_addr_expr+0x4c3>
    5ba2:	0f b6 9c 24 89 00 00 	movzx  ebx,BYTE PTR [rsp+0x89]
    5ba9:	00 
    5baa:	84 db                	test   bl,bl
    5bac:	74 19                	je     5bc7 <parse_addr_expr+0x3a5>
    5bae:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    5bb3:	48 8d 35 07 fb 00 00 	lea    rsi,[rip+0xfb07]        # 156c1 <_IO_stdin_used+0x6c1>
    5bba:	e8 91 d4 ff ff       	call   3050 <strcasecmp@plt>
    5bbf:	85 c0                	test   eax,eax
    5bc1:	0f 84 43 01 00 00    	je     5d0a <parse_addr_expr+0x4e8>
    5bc7:	0f b6 84 24 82 00 00 	movzx  eax,BYTE PTR [rsp+0x82]
    5bce:	00 
    5bcf:	84 c0                	test   al,al
    5bd1:	74 1a                	je     5bed <parse_addr_expr+0x3cb>
    5bd3:	8d 50 ff             	lea    edx,[rax-0x1]
    5bd6:	80 fa 01             	cmp    dl,0x1
    5bd9:	0f 97 c1             	seta   cl
    5bdc:	3c 04                	cmp    al,0x4
    5bde:	0f 95 c2             	setne  dl
    5be1:	84 d1                	test   cl,dl
    5be3:	74 08                	je     5bed <parse_addr_expr+0x3cb>
    5be5:	3c 08                	cmp    al,0x8
    5be7:	0f 85 3d 01 00 00    	jne    5d2a <parse_addr_expr+0x508>
    5bed:	0f b6 04 24          	movzx  eax,BYTE PTR [rsp]
    5bf1:	8d 50 bf             	lea    edx,[rax-0x41]
    5bf4:	80 fa 19             	cmp    dl,0x19
    5bf7:	0f 96 c2             	setbe  dl
    5bfa:	8d 48 9f             	lea    ecx,[rax-0x61]
    5bfd:	80 f9 19             	cmp    cl,0x19
    5c00:	0f 96 c1             	setbe  cl
    5c03:	08 ca                	or     dl,cl
    5c05:	0f 85 47 01 00 00    	jne    5d52 <parse_addr_expr+0x530>
    5c0b:	3c 2e                	cmp    al,0x2e
    5c0d:	0f 84 3f 01 00 00    	je     5d52 <parse_addr_expr+0x530>
    5c13:	3c 5f                	cmp    al,0x5f
    5c15:	0f 84 37 01 00 00    	je     5d52 <parse_addr_expr+0x530>
    5c1b:	f7 84 24 88 00 00 00 	test   DWORD PTR [rsp+0x88],0xffffff
    5c22:	ff ff ff 00 
    5c26:	0f 84 4b 01 00 00    	je     5d77 <parse_addr_expr+0x555>
    5c2c:	84 db                	test   bl,bl
    5c2e:	0f 85 68 01 00 00    	jne    5d9c <parse_addr_expr+0x57a>
    5c34:	80 bc 24 88 00 00 00 	cmp    BYTE PTR [rsp+0x88],0x0
    5c3b:	00 
    5c3c:	0f 85 b1 01 00 00    	jne    5df3 <parse_addr_expr+0x5d1>
    5c42:	80 bc 24 88 00 00 00 	cmp    BYTE PTR [rsp+0x88],0x0
    5c49:	00 
    5c4a:	75 18                	jne    5c64 <parse_addr_expr+0x442>
    5c4c:	80 bc 24 89 00 00 00 	cmp    BYTE PTR [rsp+0x89],0x0
    5c53:	00 
    5c54:	74 0e                	je     5c64 <parse_addr_expr+0x442>
    5c56:	80 bc 24 8a 00 00 00 	cmp    BYTE PTR [rsp+0x8a],0x0
    5c5d:	00 
    5c5e:	0f 84 f5 01 00 00    	je     5e59 <parse_addr_expr+0x637>
    5c64:	0f b6 84 24 88 00 00 	movzx  eax,BYTE PTR [rsp+0x88]
    5c6b:	00 
    5c6c:	84 c0                	test   al,al
    5c6e:	0f 85 0a 02 00 00    	jne    5e7e <parse_addr_expr+0x65c>
    5c74:	88 84 24 80 00 00 00 	mov    BYTE PTR [rsp+0x80],al
    5c7b:	80 bc 24 89 00 00 00 	cmp    BYTE PTR [rsp+0x89],0x0
    5c82:	00 
    5c83:	0f 85 04 02 00 00    	jne    5e8d <parse_addr_expr+0x66b>
    5c89:	b8 04 00 00 00       	mov    eax,0x4
    5c8e:	88 84 24 81 00 00 00 	mov    BYTE PTR [rsp+0x81],al
    5c95:	66 0f 6f 8c 24 80 00 	movdqa xmm1,XMMWORD PTR [rsp+0x80]
    5c9c:	00 00 
    5c9e:	0f 11 4d 00          	movups XMMWORD PTR [rbp+0x0],xmm1
    5ca2:	66 0f 6f 94 24 90 00 	movdqa xmm2,XMMWORD PTR [rsp+0x90]
    5ca9:	00 00 
    5cab:	0f 11 55 10          	movups XMMWORD PTR [rbp+0x10],xmm2
    5caf:	66 0f 6f 9c 24 a0 00 	movdqa xmm3,XMMWORD PTR [rsp+0xa0]
    5cb6:	00 00 
    5cb8:	0f 11 5d 20          	movups XMMWORD PTR [rbp+0x20],xmm3
    5cbc:	66 0f 6f a4 24 b0 00 	movdqa xmm4,XMMWORD PTR [rsp+0xb0]
    5cc3:	00 00 
    5cc5:	0f 11 65 30          	movups XMMWORD PTR [rbp+0x30],xmm4
    5cc9:	66 0f 6f ac 24 c0 00 	movdqa xmm5,XMMWORD PTR [rsp+0xc0]
    5cd0:	00 00 
    5cd2:	0f 11 6d 40          	movups XMMWORD PTR [rbp+0x40],xmm5
    5cd6:	48 89 e8             	mov    rax,rbp
    5cd9:	48 81 c4 d0 00 00 00 	add    rsp,0xd0
    5ce0:	5b                   	pop    rbx
    5ce1:	5d                   	pop    rbp
    5ce2:	41 5c                	pop    r12
    5ce4:	c3                   	ret
    5ce5:	44 89 e2             	mov    edx,r12d
    5ce8:	48 8d 35 d9 f9 00 00 	lea    rsi,[rip+0xf9d9]        # 156c8 <_IO_stdin_used+0x6c8>
    5cef:	48 8b 3d ea 4e 01 00 	mov    rdi,QWORD PTR [rip+0x14eea]        # 1abe0 <stderr@GLIBC_2.2.5>
    5cf6:	b8 00 00 00 00       	mov    eax,0x0
    5cfb:	e8 40 d4 ff ff       	call   3140 <fprintf@plt>
    5d00:	bf 01 00 00 00       	mov    edi,0x1
    5d05:	e8 c6 d4 ff ff       	call   31d0 <exit@plt>
    5d0a:	44 89 e2             	mov    edx,r12d
    5d0d:	48 8d 35 e4 f9 00 00 	lea    rsi,[rip+0xf9e4]        # 156f8 <_IO_stdin_used+0x6f8>
    5d14:	48 8b 3d c5 4e 01 00 	mov    rdi,QWORD PTR [rip+0x14ec5]        # 1abe0 <stderr@GLIBC_2.2.5>
    5d1b:	e8 20 d4 ff ff       	call   3140 <fprintf@plt>
    5d20:	bf 01 00 00 00       	mov    edi,0x1
    5d25:	e8 a6 d4 ff ff       	call   31d0 <exit@plt>
    5d2a:	0f b6 c8             	movzx  ecx,al
    5d2d:	44 89 e2             	mov    edx,r12d
    5d30:	48 8d 35 f9 f9 00 00 	lea    rsi,[rip+0xf9f9]        # 15730 <_IO_stdin_used+0x730>
    5d37:	48 8b 3d a2 4e 01 00 	mov    rdi,QWORD PTR [rip+0x14ea2]        # 1abe0 <stderr@GLIBC_2.2.5>
    5d3e:	b8 00 00 00 00       	mov    eax,0x0
    5d43:	e8 f8 d3 ff ff       	call   3140 <fprintf@plt>
    5d48:	bf 01 00 00 00       	mov    edi,0x1
    5d4d:	e8 7e d4 ff ff       	call   31d0 <exit@plt>
    5d52:	44 89 e2             	mov    edx,r12d
    5d55:	48 8d 35 0c fa 00 00 	lea    rsi,[rip+0xfa0c]        # 15768 <_IO_stdin_used+0x768>
    5d5c:	48 8b 3d 7d 4e 01 00 	mov    rdi,QWORD PTR [rip+0x14e7d]        # 1abe0 <stderr@GLIBC_2.2.5>
    5d63:	b8 00 00 00 00       	mov    eax,0x0
    5d68:	e8 d3 d3 ff ff       	call   3140 <fprintf@plt>
    5d6d:	bf 01 00 00 00       	mov    edi,0x1
    5d72:	e8 59 d4 ff ff       	call   31d0 <exit@plt>
    5d77:	44 89 e2             	mov    edx,r12d
    5d7a:	48 8d 35 07 fa 00 00 	lea    rsi,[rip+0xfa07]        # 15788 <_IO_stdin_used+0x788>
    5d81:	48 8b 3d 58 4e 01 00 	mov    rdi,QWORD PTR [rip+0x14e58]        # 1abe0 <stderr@GLIBC_2.2.5>
    5d88:	b8 00 00 00 00       	mov    eax,0x0
    5d8d:	e8 ae d3 ff ff       	call   3140 <fprintf@plt>
    5d92:	bf 01 00 00 00       	mov    edi,0x1
    5d97:	e8 34 d4 ff ff       	call   31d0 <exit@plt>
    5d9c:	48 8d 74 24 30       	lea    rsi,[rsp+0x30]
    5da1:	48 8d 3d 98 4b 01 00 	lea    rdi,[rip+0x14b98]        # 1a940 <regs64>
    5da8:	e8 f9 d9 00 00       	call   137a6 <is2arrin>
    5dad:	85 c0                	test   eax,eax
    5daf:	0f 85 7f fe ff ff    	jne    5c34 <parse_addr_expr+0x412>
    5db5:	48 8d 74 24 30       	lea    rsi,[rsp+0x30]
    5dba:	48 8d 3d 1f 4b 01 00 	lea    rdi,[rip+0x14b1f]        # 1a8e0 <regs64GP>
    5dc1:	e8 e0 d9 00 00       	call   137a6 <is2arrin>
    5dc6:	85 c0                	test   eax,eax
    5dc8:	0f 85 66 fe ff ff    	jne    5c34 <parse_addr_expr+0x412>
    5dce:	48 8d 4c 24 30       	lea    rcx,[rsp+0x30]
    5dd3:	44 89 e2             	mov    edx,r12d
    5dd6:	48 8d 35 fb f9 00 00 	lea    rsi,[rip+0xf9fb]        # 157d8 <_IO_stdin_used+0x7d8>
    5ddd:	48 8b 3d fc 4d 01 00 	mov    rdi,QWORD PTR [rip+0x14dfc]        # 1abe0 <stderr@GLIBC_2.2.5>
    5de4:	e8 57 d3 ff ff       	call   3140 <fprintf@plt>
    5de9:	bf 01 00 00 00       	mov    edi,0x1
    5dee:	e8 dd d3 ff ff       	call   31d0 <exit@plt>
    5df3:	48 8d 74 24 40       	lea    rsi,[rsp+0x40]
    5df8:	48 8d 3d 41 4b 01 00 	lea    rdi,[rip+0x14b41]        # 1a940 <regs64>
    5dff:	e8 a2 d9 00 00       	call   137a6 <is2arrin>
    5e04:	85 c0                	test   eax,eax
    5e06:	0f 85 36 fe ff ff    	jne    5c42 <parse_addr_expr+0x420>
    5e0c:	48 8d 74 24 40       	lea    rsi,[rsp+0x40]
    5e11:	48 8d 3d c8 4a 01 00 	lea    rdi,[rip+0x14ac8]        # 1a8e0 <regs64GP>
    5e18:	e8 89 d9 00 00       	call   137a6 <is2arrin>
    5e1d:	85 c0                	test   eax,eax
    5e1f:	0f 85 1d fe ff ff    	jne    5c42 <parse_addr_expr+0x420>
    5e25:	48 8d 74 24 40       	lea    rsi,[rsp+0x40]
    5e2a:	48 8d bc 24 8c 00 00 	lea    rdi,[rsp+0x8c]
    5e31:	00 
    5e32:	ba 40 00 00 00       	mov    edx,0x40
    5e37:	e8 24 d2 ff ff       	call   3060 <strncpy@plt>
    5e3c:	c6 84 24 cb 00 00 00 	mov    BYTE PTR [rsp+0xcb],0x0
    5e43:	00 
    5e44:	c6 84 24 8b 00 00 00 	mov    BYTE PTR [rsp+0x8b],0x1
    5e4b:	01 
    5e4c:	c6 84 24 88 00 00 00 	mov    BYTE PTR [rsp+0x88],0x0
    5e53:	00 
    5e54:	e9 0b fe ff ff       	jmp    5c64 <parse_addr_expr+0x442>
    5e59:	44 89 e2             	mov    edx,r12d
    5e5c:	48 8d 35 a5 f9 00 00 	lea    rsi,[rip+0xf9a5]        # 15808 <_IO_stdin_used+0x808>
    5e63:	48 8b 3d 76 4d 01 00 	mov    rdi,QWORD PTR [rip+0x14d76]        # 1abe0 <stderr@GLIBC_2.2.5>
    5e6a:	b8 00 00 00 00       	mov    eax,0x0
    5e6f:	e8 cc d2 ff ff       	call   3140 <fprintf@plt>
    5e74:	bf 01 00 00 00       	mov    edi,0x1
    5e79:	e8 52 d3 ff ff       	call   31d0 <exit@plt>
    5e7e:	48 8d 7c 24 40       	lea    rdi,[rsp+0x40]
    5e83:	e8 e8 dc 00 00       	call   13b70 <find_reg64_index>
    5e88:	e9 e7 fd ff ff       	jmp    5c74 <parse_addr_expr+0x452>
    5e8d:	48 8d 7c 24 30       	lea    rdi,[rsp+0x30]
    5e92:	e8 d9 dc 00 00       	call   13b70 <find_reg64_index>
    5e97:	e9 f2 fd ff ff       	jmp    5c8e <parse_addr_expr+0x46c>

0000000000005e9c <encode_mov_reg_imm>:
    5e9c:	49 89 d0             	mov    r8,rdx
    5e9f:	80 f9 08             	cmp    cl,0x8
    5ea2:	74 62                	je     5f06 <encode_mov_reg_imm+0x6a>
    5ea4:	41 b9 b8 ff ff ff    	mov    r9d,0xffffffb8
    5eaa:	40 80 fe 07          	cmp    sil,0x7
    5eae:	77 5e                	ja     5f0e <encode_mov_reg_imm+0x72>
    5eb0:	b8 00 00 00 00       	mov    eax,0x0
    5eb5:	80 f9 10             	cmp    cl,0x10
    5eb8:	74 6d                	je     5f27 <encode_mov_reg_imm+0x8b>
    5eba:	80 f9 40             	cmp    cl,0x40
    5ebd:	74 72                	je     5f31 <encode_mov_reg_imm+0x95>
    5ebf:	80 f9 08             	cmp    cl,0x8
    5ec2:	74 51                	je     5f15 <encode_mov_reg_imm+0x79>
    5ec4:	ba 00 00 00 00       	mov    edx,0x0
    5ec9:	83 e6 07             	and    esi,0x7
    5ecc:	44 01 ce             	add    esi,r9d
    5ecf:	84 c0                	test   al,al
    5ed1:	74 0b                	je     5ede <encode_mov_reg_imm+0x42>
    5ed3:	44 0f b6 ca          	movzx  r9d,dl
    5ed7:	42 88 04 0f          	mov    BYTE PTR [rdi+r9*1],al
    5edb:	83 c2 01             	add    edx,0x1
    5ede:	8d 42 01             	lea    eax,[rdx+0x1]
    5ee1:	44 0f b6 ca          	movzx  r9d,dl
    5ee5:	42 88 34 0f          	mov    BYTE PTR [rdi+r9*1],sil
    5ee9:	80 f9 20             	cmp    cl,0x20
    5eec:	74 71                	je     5f5f <encode_mov_reg_imm+0xc3>
    5eee:	77 53                	ja     5f43 <encode_mov_reg_imm+0xa7>
    5ef0:	80 f9 08             	cmp    cl,0x8
    5ef3:	74 5f                	je     5f54 <encode_mov_reg_imm+0xb8>
    5ef5:	80 f9 10             	cmp    cl,0x10
    5ef8:	75 48                	jne    5f42 <encode_mov_reg_imm+0xa6>
    5efa:	0f b6 c0             	movzx  eax,al
    5efd:	66 44 89 04 07       	mov    WORD PTR [rdi+rax*1],r8w
    5f02:	8d 42 03             	lea    eax,[rdx+0x3]
    5f05:	c3                   	ret
    5f06:	41 b9 b0 ff ff ff    	mov    r9d,0xffffffb0
    5f0c:	eb 9c                	jmp    5eaa <encode_mov_reg_imm+0xe>
    5f0e:	b8 41 00 00 00       	mov    eax,0x41
    5f13:	eb a0                	jmp    5eb5 <encode_mov_reg_imm+0x19>
    5f15:	8d 56 fc             	lea    edx,[rsi-0x4]
    5f18:	80 fa 03             	cmp    dl,0x3
    5f1b:	77 1e                	ja     5f3b <encode_mov_reg_imm+0x9f>
    5f1d:	83 c8 40             	or     eax,0x40
    5f20:	ba 00 00 00 00       	mov    edx,0x0
    5f25:	eb a2                	jmp    5ec9 <encode_mov_reg_imm+0x2d>
    5f27:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    5f2a:	ba 01 00 00 00       	mov    edx,0x1
    5f2f:	eb 98                	jmp    5ec9 <encode_mov_reg_imm+0x2d>
    5f31:	83 c8 48             	or     eax,0x48
    5f34:	ba 00 00 00 00       	mov    edx,0x0
    5f39:	eb 8e                	jmp    5ec9 <encode_mov_reg_imm+0x2d>
    5f3b:	ba 00 00 00 00       	mov    edx,0x0
    5f40:	eb 87                	jmp    5ec9 <encode_mov_reg_imm+0x2d>
    5f42:	c3                   	ret
    5f43:	80 f9 40             	cmp    cl,0x40
    5f46:	75 0b                	jne    5f53 <encode_mov_reg_imm+0xb7>
    5f48:	0f b6 c0             	movzx  eax,al
    5f4b:	4c 89 04 07          	mov    QWORD PTR [rdi+rax*1],r8
    5f4f:	8d 42 09             	lea    eax,[rdx+0x9]
    5f52:	c3                   	ret
    5f53:	c3                   	ret
    5f54:	0f b6 c0             	movzx  eax,al
    5f57:	44 88 04 07          	mov    BYTE PTR [rdi+rax*1],r8b
    5f5b:	8d 42 02             	lea    eax,[rdx+0x2]
    5f5e:	c3                   	ret
    5f5f:	0f b6 c0             	movzx  eax,al
    5f62:	44 89 04 07          	mov    DWORD PTR [rdi+rax*1],r8d
    5f66:	8d 42 05             	lea    eax,[rdx+0x5]
    5f69:	c3                   	ret

0000000000005f6a <encode_mov_reg_reg>:
    5f6a:	80 f9 08             	cmp    cl,0x8
    5f6d:	74 65                	je     5fd4 <encode_mov_reg_reg+0x6a>
    5f6f:	41 b9 89 ff ff ff    	mov    r9d,0xffffff89
    5f75:	40 80 fe 07          	cmp    sil,0x7
    5f79:	77 61                	ja     5fdc <encode_mov_reg_reg+0x72>
    5f7b:	41 b8 00 00 00 00    	mov    r8d,0x0
    5f81:	80 fa 07             	cmp    dl,0x7
    5f84:	76 04                	jbe    5f8a <encode_mov_reg_reg+0x20>
    5f86:	41 83 c8 44          	or     r8d,0x44
    5f8a:	80 f9 10             	cmp    cl,0x10
    5f8d:	74 6e                	je     5ffd <encode_mov_reg_reg+0x93>
    5f8f:	80 f9 40             	cmp    cl,0x40
    5f92:	74 73                	je     6007 <encode_mov_reg_reg+0x9d>
    5f94:	80 f9 08             	cmp    cl,0x8
    5f97:	74 4b                	je     5fe4 <encode_mov_reg_reg+0x7a>
    5f99:	b9 00 00 00 00       	mov    ecx,0x0
    5f9e:	45 84 c0             	test   r8b,r8b
    5fa1:	74 76                	je     6019 <encode_mov_reg_reg+0xaf>
    5fa3:	8d 41 01             	lea    eax,[rcx+0x1]
    5fa6:	0f b6 c9             	movzx  ecx,cl
    5fa9:	44 88 04 0f          	mov    BYTE PTR [rdi+rcx*1],r8b
    5fad:	8d 48 01             	lea    ecx,[rax+0x1]
    5fb0:	44 0f b6 c0          	movzx  r8d,al
    5fb4:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    5fb8:	0f b6 d2             	movzx  edx,dl
    5fbb:	c1 e2 03             	shl    edx,0x3
    5fbe:	83 e2 38             	and    edx,0x38
    5fc1:	83 ca c0             	or     edx,0xffffffc0
    5fc4:	83 c0 02             	add    eax,0x2
    5fc7:	0f b6 c9             	movzx  ecx,cl
    5fca:	83 e6 07             	and    esi,0x7
    5fcd:	09 d6                	or     esi,edx
    5fcf:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    5fd3:	c3                   	ret
    5fd4:	41 b9 88 ff ff ff    	mov    r9d,0xffffff88
    5fda:	eb 99                	jmp    5f75 <encode_mov_reg_reg+0xb>
    5fdc:	41 b8 41 00 00 00    	mov    r8d,0x41
    5fe2:	eb 9d                	jmp    5f81 <encode_mov_reg_reg+0x17>
    5fe4:	8d 46 fc             	lea    eax,[rsi-0x4]
    5fe7:	3c 03                	cmp    al,0x3
    5fe9:	76 07                	jbe    5ff2 <encode_mov_reg_reg+0x88>
    5feb:	8d 42 fc             	lea    eax,[rdx-0x4]
    5fee:	3c 03                	cmp    al,0x3
    5ff0:	77 20                	ja     6012 <encode_mov_reg_reg+0xa8>
    5ff2:	41 83 c8 40          	or     r8d,0x40
    5ff6:	b9 00 00 00 00       	mov    ecx,0x0
    5ffb:	eb a6                	jmp    5fa3 <encode_mov_reg_reg+0x39>
    5ffd:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    6000:	b9 01 00 00 00       	mov    ecx,0x1
    6005:	eb 97                	jmp    5f9e <encode_mov_reg_reg+0x34>
    6007:	41 83 c8 48          	or     r8d,0x48
    600b:	b9 00 00 00 00       	mov    ecx,0x0
    6010:	eb 91                	jmp    5fa3 <encode_mov_reg_reg+0x39>
    6012:	b9 00 00 00 00       	mov    ecx,0x0
    6017:	eb 85                	jmp    5f9e <encode_mov_reg_reg+0x34>
    6019:	89 c8                	mov    eax,ecx
    601b:	eb 90                	jmp    5fad <encode_mov_reg_reg+0x43>

000000000000601d <encode_two_byte_opcode_reg>:
    601d:	80 fa 07             	cmp    dl,0x7
    6020:	77 7f                	ja     60a1 <encode_two_byte_opcode_reg+0x84>
    6022:	41 ba 00 00 00 00    	mov    r10d,0x0
    6028:	80 f9 07             	cmp    cl,0x7
    602b:	76 04                	jbe    6031 <encode_two_byte_opcode_reg+0x14>
    602d:	41 83 ca 44          	or     r10d,0x44
    6031:	8d 41 fc             	lea    eax,[rcx-0x4]
    6034:	3c 03                	cmp    al,0x3
    6036:	77 04                	ja     603c <encode_two_byte_opcode_reg+0x1f>
    6038:	41 83 ca 40          	or     r10d,0x40
    603c:	41 80 f8 10          	cmp    r8b,0x10
    6040:	74 6a                	je     60ac <encode_two_byte_opcode_reg+0x8f>
    6042:	41 80 f8 40          	cmp    r8b,0x40
    6046:	75 6e                	jne    60b6 <encode_two_byte_opcode_reg+0x99>
    6048:	b8 00 00 00 00       	mov    eax,0x0
    604d:	41 ba 48 00 00 00    	mov    r10d,0x48
    6053:	0f b6 d2             	movzx  edx,dl
    6056:	c1 e2 03             	shl    edx,0x3
    6059:	83 e2 38             	and    edx,0x38
    605c:	83 ca c0             	or     edx,0xffffffc0
    605f:	83 e1 07             	and    ecx,0x7
    6062:	09 d1                	or     ecx,edx
    6064:	45 84 c9             	test   r9b,r9b
    6067:	74 0a                	je     6073 <encode_two_byte_opcode_reg+0x56>
    6069:	48 63 d0             	movsxd rdx,eax
    606c:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    6070:	8d 40 01             	lea    eax,[rax+0x1]
    6073:	45 84 d2             	test   r10b,r10b
    6076:	74 0a                	je     6082 <encode_two_byte_opcode_reg+0x65>
    6078:	48 63 d0             	movsxd rdx,eax
    607b:	44 88 14 17          	mov    BYTE PTR [rdi+rdx*1],r10b
    607f:	8d 40 01             	lea    eax,[rax+0x1]
    6082:	44 8d 40 01          	lea    r8d,[rax+0x1]
    6086:	48 63 d0             	movsxd rdx,eax
    6089:	c6 04 17 0f          	mov    BYTE PTR [rdi+rdx*1],0xf
    608d:	8d 50 02             	lea    edx,[rax+0x2]
    6090:	4d 63 c0             	movsxd r8,r8d
    6093:	42 88 34 07          	mov    BYTE PTR [rdi+r8*1],sil
    6097:	48 63 d2             	movsxd rdx,edx
    609a:	88 0c 17             	mov    BYTE PTR [rdi+rdx*1],cl
    609d:	83 c0 03             	add    eax,0x3
    60a0:	c3                   	ret
    60a1:	41 ba 41 00 00 00    	mov    r10d,0x41
    60a7:	e9 7c ff ff ff       	jmp    6028 <encode_two_byte_opcode_reg+0xb>
    60ac:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    60af:	b8 01 00 00 00       	mov    eax,0x1
    60b4:	eb 9d                	jmp    6053 <encode_two_byte_opcode_reg+0x36>
    60b6:	b8 00 00 00 00       	mov    eax,0x0
    60bb:	eb 96                	jmp    6053 <encode_two_byte_opcode_reg+0x36>

00000000000060bd <encode_inst_rm_rm>:
    60bd:	41 56                	push   r14
    60bf:	41 55                	push   r13
    60c1:	41 54                	push   r12
    60c3:	55                   	push   rbp
    60c4:	53                   	push   rbx
    60c5:	89 f0                	mov    eax,esi
    60c7:	0f b6 1a             	movzx  ebx,BYTE PTR [rdx]
    60ca:	44 0f b6 62 01       	movzx  r12d,BYTE PTR [rdx+0x1]
    60cf:	80 f9 10             	cmp    cl,0x10
    60d2:	0f 84 e2 00 00 00    	je     61ba <encode_inst_rm_rm+0xfd>
    60d8:	80 f9 40             	cmp    cl,0x40
    60db:	0f 84 0f 01 00 00    	je     61f0 <encode_inst_rm_rm+0x133>
    60e1:	80 f9 08             	cmp    cl,0x8
    60e4:	0f 84 e3 00 00 00    	je     61cd <encode_inst_rm_rm+0x110>
    60ea:	41 ba 00 00 00 00    	mov    r10d,0x0
    60f0:	be 00 00 00 00       	mov    esi,0x0
    60f5:	0f b6 4a 02          	movzx  ecx,BYTE PTR [rdx+0x2]
    60f9:	80 f9 04             	cmp    cl,0x4
    60fc:	0f 84 19 01 00 00    	je     621b <encode_inst_rm_rm+0x15e>
    6102:	80 f9 08             	cmp    cl,0x8
    6105:	0f 84 1b 01 00 00    	je     6226 <encode_inst_rm_rm+0x169>
    610b:	80 f9 02             	cmp    cl,0x2
    610e:	0f 84 fc 00 00 00    	je     6210 <encode_inst_rm_rm+0x153>
    6114:	41 be 00 00 00 00    	mov    r14d,0x0
    611a:	3c 07                	cmp    al,0x7
    611c:	76 03                	jbe    6121 <encode_inst_rm_rm+0x64>
    611e:	83 ce 04             	or     esi,0x4
    6121:	80 fb 07             	cmp    bl,0x7
    6124:	76 03                	jbe    6129 <encode_inst_rm_rm+0x6c>
    6126:	83 ce 01             	or     esi,0x1
    6129:	41 80 fc 07          	cmp    r12b,0x7
    612d:	76 03                	jbe    6132 <encode_inst_rm_rm+0x75>
    612f:	83 ce 02             	or     esi,0x2
    6132:	66 83 7a 08 00       	cmp    WORD PTR [rdx+0x8],0x0
    6137:	74 10                	je     6149 <encode_inst_rm_rm+0x8c>
    6139:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    613d:	74 0a                	je     6149 <encode_inst_rm_rm+0x8c>
    613f:	83 7a 04 00          	cmp    DWORD PTR [rdx+0x4],0x0
    6143:	75 04                	jne    6149 <encode_inst_rm_rm+0x8c>
    6145:	c6 42 0a 00          	mov    BYTE PTR [rdx+0xa],0x0
    6149:	44 0f b6 5a 0a       	movzx  r11d,BYTE PTR [rdx+0xa]
    614e:	45 84 db             	test   r11b,r11b
    6151:	0f 85 da 00 00 00    	jne    6231 <encode_inst_rm_rm+0x174>
    6157:	c6 42 0a 00          	mov    BYTE PTR [rdx+0xa],0x0
    615b:	44 89 d9             	mov    ecx,r11d
    615e:	0f b6 6a 09          	movzx  ebp,BYTE PTR [rdx+0x9]
    6162:	40 84 ed             	test   bpl,bpl
    6165:	0f 84 21 01 00 00    	je     628c <encode_inst_rm_rm+0x1cf>
    616b:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    616f:	0f 85 17 01 00 00    	jne    628c <encode_inst_rm_rm+0x1cf>
    6175:	83 e3 07             	and    ebx,0x7
    6178:	80 fb 05             	cmp    bl,0x5
    617b:	0f 84 e6 00 00 00    	je     6267 <encode_inst_rm_rm+0x1aa>
    6181:	c1 e1 06             	shl    ecx,0x6
    6184:	0f b6 c0             	movzx  eax,al
    6187:	c1 e0 03             	shl    eax,0x3
    618a:	83 e0 38             	and    eax,0x38
    618d:	09 c1                	or     ecx,eax
    618f:	83 c9 04             	or     ecx,0x4
    6192:	41 0f b6 c6          	movzx  eax,r14b
    6196:	c1 e0 06             	shl    eax,0x6
    6199:	45 0f b6 e4          	movzx  r12d,r12b
    619d:	46 8d 34 e5 00 00 00 	lea    r14d,[r12*8+0x0]
    61a4:	00 
    61a5:	41 83 e6 38          	and    r14d,0x38
    61a9:	41 09 c6             	or     r14d,eax
    61ac:	44 09 f3             	or     ebx,r14d
    61af:	41 bc 01 00 00 00    	mov    r12d,0x1
    61b5:	e9 2d 01 00 00       	jmp    62e7 <encode_inst_rm_rm+0x22a>
    61ba:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    61bd:	41 ba 01 00 00 00    	mov    r10d,0x1
    61c3:	be 00 00 00 00       	mov    esi,0x0
    61c8:	e9 28 ff ff ff       	jmp    60f5 <encode_inst_rm_rm+0x38>
    61cd:	40 80 fe 03          	cmp    sil,0x3
    61d1:	40 0f 97 c6          	seta   sil
    61d5:	45 84 c9             	test   r9b,r9b
    61d8:	0f 94 c1             	sete   cl
    61db:	40 84 ce             	test   sil,cl
    61de:	75 20                	jne    6200 <encode_inst_rm_rm+0x143>
    61e0:	41 ba 00 00 00 00    	mov    r10d,0x0
    61e6:	be 00 00 00 00       	mov    esi,0x0
    61eb:	e9 05 ff ff ff       	jmp    60f5 <encode_inst_rm_rm+0x38>
    61f0:	41 ba 00 00 00 00    	mov    r10d,0x0
    61f6:	be 48 00 00 00       	mov    esi,0x48
    61fb:	e9 f5 fe ff ff       	jmp    60f5 <encode_inst_rm_rm+0x38>
    6200:	41 ba 00 00 00 00    	mov    r10d,0x0
    6206:	be 40 00 00 00       	mov    esi,0x40
    620b:	e9 e5 fe ff ff       	jmp    60f5 <encode_inst_rm_rm+0x38>
    6210:	41 be 01 00 00 00    	mov    r14d,0x1
    6216:	e9 ff fe ff ff       	jmp    611a <encode_inst_rm_rm+0x5d>
    621b:	41 be 02 00 00 00    	mov    r14d,0x2
    6221:	e9 f4 fe ff ff       	jmp    611a <encode_inst_rm_rm+0x5d>
    6226:	41 be 03 00 00 00    	mov    r14d,0x3
    622c:	e9 e9 fe ff ff       	jmp    611a <encode_inst_rm_rm+0x5d>
    6231:	8b 4a 04             	mov    ecx,DWORD PTR [rdx+0x4]
    6234:	83 e9 80             	sub    ecx,0xffffff80
    6237:	81 f9 ff 00 00 00    	cmp    ecx,0xff
    623d:	77 14                	ja     6253 <encode_inst_rm_rm+0x196>
    623f:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6243:	b9 01 00 00 00       	mov    ecx,0x1
    6248:	41 bb 01 00 00 00    	mov    r11d,0x1
    624e:	e9 0b ff ff ff       	jmp    615e <encode_inst_rm_rm+0xa1>
    6253:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6257:	b9 02 00 00 00       	mov    ecx,0x2
    625c:	41 bb 04 00 00 00    	mov    r11d,0x4
    6262:	e9 f7 fe ff ff       	jmp    615e <encode_inst_rm_rm+0xa1>
    6267:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    626b:	0f 85 10 ff ff ff    	jne    6181 <encode_inst_rm_rm+0xc4>
    6271:	c7 42 04 00 00 00 00 	mov    DWORD PTR [rdx+0x4],0x0
    6278:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    627c:	b9 01 00 00 00       	mov    ecx,0x1
    6281:	41 bb 01 00 00 00    	mov    r11d,0x1
    6287:	e9 f5 fe ff ff       	jmp    6181 <encode_inst_rm_rm+0xc4>
    628c:	83 e3 07             	and    ebx,0x7
    628f:	41 89 dd             	mov    r13d,ebx
    6292:	80 fb 04             	cmp    bl,0x4
    6295:	74 36                	je     62cd <encode_inst_rm_rm+0x210>
    6297:	80 fb 05             	cmp    bl,0x5
    629a:	0f 84 f9 00 00 00    	je     6399 <encode_inst_rm_rm+0x2dc>
    62a0:	0f b6 5a 08          	movzx  ebx,BYTE PTR [rdx+0x8]
    62a4:	84 db                	test   bl,bl
    62a6:	0f 84 2a 01 00 00    	je     63d6 <encode_inst_rm_rm+0x319>
    62ac:	40 84 ed             	test   bpl,bpl
    62af:	0f 85 21 01 00 00    	jne    63d6 <encode_inst_rm_rm+0x319>
    62b5:	c1 e1 06             	shl    ecx,0x6
    62b8:	0f b6 c0             	movzx  eax,al
    62bb:	c1 e0 03             	shl    eax,0x3
    62be:	83 e0 38             	and    eax,0x38
    62c1:	09 c1                	or     ecx,eax
    62c3:	44 09 e9             	or     ecx,r13d
    62c6:	41 89 ec             	mov    r12d,ebp
    62c9:	89 eb                	mov    ebx,ebp
    62cb:	eb 1a                	jmp    62e7 <encode_inst_rm_rm+0x22a>
    62cd:	c1 e1 06             	shl    ecx,0x6
    62d0:	0f b6 c0             	movzx  eax,al
    62d3:	c1 e0 03             	shl    eax,0x3
    62d6:	83 e0 38             	and    eax,0x38
    62d9:	09 c1                	or     ecx,eax
    62db:	83 c9 04             	or     ecx,0x4
    62de:	83 cb 20             	or     ebx,0x20
    62e1:	41 bc 01 00 00 00    	mov    r12d,0x1
    62e7:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    62eb:	74 0f                	je     62fc <encode_inst_rm_rm+0x23f>
    62ed:	80 7a 08 00          	cmp    BYTE PTR [rdx+0x8],0x0
    62f1:	75 09                	jne    62fc <encode_inst_rm_rm+0x23f>
    62f3:	40 84 ed             	test   bpl,bpl
    62f6:	0f 85 6b 01 00 00    	jne    6467 <encode_inst_rm_rm+0x3aa>
    62fc:	40 84 f6             	test   sil,sil
    62ff:	74 0e                	je     630f <encode_inst_rm_rm+0x252>
    6301:	49 63 c2             	movsxd rax,r10d
    6304:	83 ce 40             	or     esi,0x40
    6307:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
    630b:	45 8d 52 01          	lea    r10d,[r10+0x1]
    630f:	41 8d 72 01          	lea    esi,[r10+0x1]
    6313:	49 63 c2             	movsxd rax,r10d
    6316:	44 88 04 07          	mov    BYTE PTR [rdi+rax*1],r8b
    631a:	41 8d 42 02          	lea    eax,[r10+0x2]
    631e:	48 63 f6             	movsxd rsi,esi
    6321:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    6324:	45 84 e4             	test   r12b,r12b
    6327:	74 09                	je     6332 <encode_inst_rm_rm+0x275>
    6329:	48 98                	cdqe
    632b:	88 1c 07             	mov    BYTE PTR [rdi+rax*1],bl
    632e:	41 8d 42 03          	lea    eax,[r10+0x3]
    6332:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    6336:	74 1c                	je     6354 <encode_inst_rm_rm+0x297>
    6338:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    633c:	75 16                	jne    6354 <encode_inst_rm_rm+0x297>
    633e:	41 80 fb 01          	cmp    r11b,0x1
    6342:	0f 84 46 01 00 00    	je     648e <encode_inst_rm_rm+0x3d1>
    6348:	48 63 c8             	movsxd rcx,eax
    634b:	8b 72 04             	mov    esi,DWORD PTR [rdx+0x4]
    634e:	89 34 0f             	mov    DWORD PTR [rdi+rcx*1],esi
    6351:	83 c0 04             	add    eax,0x4
    6354:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    6358:	74 13                	je     636d <encode_inst_rm_rm+0x2b0>
    635a:	48 63 c8             	movsxd rcx,eax
    635d:	c7 04 0f 00 00 00 00 	mov    DWORD PTR [rdi+rcx*1],0x0
    6364:	83 c0 04             	add    eax,0x4
    6367:	8d 48 fc             	lea    ecx,[rax-0x4]
    636a:	88 4a 4c             	mov    BYTE PTR [rdx+0x4c],cl
    636d:	45 84 c9             	test   r9b,r9b
    6370:	74 1e                	je     6390 <encode_inst_rm_rm+0x2d3>
    6372:	41 80 f9 02          	cmp    r9b,0x2
    6376:	0f 84 37 01 00 00    	je     64b3 <encode_inst_rm_rm+0x3f6>
    637c:	41 80 f9 04          	cmp    r9b,0x4
    6380:	0f 84 41 01 00 00    	je     64c7 <encode_inst_rm_rm+0x40a>
    6386:	41 80 f9 01          	cmp    r9b,0x1
    638a:	0f 84 10 01 00 00    	je     64a0 <encode_inst_rm_rm+0x3e3>
    6390:	5b                   	pop    rbx
    6391:	5d                   	pop    rbp
    6392:	41 5c                	pop    r12
    6394:	41 5d                	pop    r13
    6396:	41 5e                	pop    r14
    6398:	c3                   	ret
    6399:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    639d:	75 16                	jne    63b5 <encode_inst_rm_rm+0x2f8>
    639f:	c7 42 04 00 00 00 00 	mov    DWORD PTR [rdx+0x4],0x0
    63a6:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    63aa:	b9 01 00 00 00       	mov    ecx,0x1
    63af:	41 bb 01 00 00 00    	mov    r11d,0x1
    63b5:	c1 e1 06             	shl    ecx,0x6
    63b8:	0f b6 c0             	movzx  eax,al
    63bb:	c1 e0 03             	shl    eax,0x3
    63be:	83 e0 38             	and    eax,0x38
    63c1:	09 c1                	or     ecx,eax
    63c3:	44 09 e9             	or     ecx,r13d
    63c6:	41 bc 00 00 00 00    	mov    r12d,0x0
    63cc:	bb 00 00 00 00       	mov    ebx,0x0
    63d1:	e9 11 ff ff ff       	jmp    62e7 <encode_inst_rm_rm+0x22a>
    63d6:	f7 42 08 ff 00 00 ff 	test   DWORD PTR [rdx+0x8],0xff0000ff
    63dd:	75 47                	jne    6426 <encode_inst_rm_rm+0x369>
    63df:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    63e3:	74 41                	je     6426 <encode_inst_rm_rm+0x369>
    63e5:	0f b6 c8             	movzx  ecx,al
    63e8:	c1 e1 03             	shl    ecx,0x3
    63eb:	83 e1 38             	and    ecx,0x38
    63ee:	83 c9 04             	or     ecx,0x4
    63f1:	41 0f b6 c6          	movzx  eax,r14b
    63f5:	c1 e0 06             	shl    eax,0x6
    63f8:	45 0f b6 e4          	movzx  r12d,r12b
    63fc:	46 8d 34 e5 00 00 00 	lea    r14d,[r12*8+0x0]
    6403:	00 
    6404:	41 83 e6 38          	and    r14d,0x38
    6408:	41 09 c6             	or     r14d,eax
    640b:	44 89 f3             	mov    ebx,r14d
    640e:	83 cb 05             	or     ebx,0x5
    6411:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6415:	41 bb 04 00 00 00    	mov    r11d,0x4
    641b:	41 bc 01 00 00 00    	mov    r12d,0x1
    6421:	e9 c1 fe ff ff       	jmp    62e7 <encode_inst_rm_rm+0x22a>
    6426:	0f b6 4a 0b          	movzx  ecx,BYTE PTR [rdx+0xb]
    642a:	84 c9                	test   cl,cl
    642c:	74 1a                	je     6448 <encode_inst_rm_rm+0x38b>
    642e:	84 db                	test   bl,bl
    6430:	75 20                	jne    6452 <encode_inst_rm_rm+0x395>
    6432:	0f b6 c0             	movzx  eax,al
    6435:	c1 e0 03             	shl    eax,0x3
    6438:	83 e0 38             	and    eax,0x38
    643b:	83 c8 05             	or     eax,0x5
    643e:	89 c1                	mov    ecx,eax
    6440:	41 89 dc             	mov    r12d,ebx
    6443:	e9 9f fe ff ff       	jmp    62e7 <encode_inst_rm_rm+0x22a>
    6448:	41 89 cc             	mov    r12d,ecx
    644b:	89 cb                	mov    ebx,ecx
    644d:	e9 95 fe ff ff       	jmp    62e7 <encode_inst_rm_rm+0x22a>
    6452:	41 bc 00 00 00 00    	mov    r12d,0x0
    6458:	bb 00 00 00 00       	mov    ebx,0x0
    645d:	b9 00 00 00 00       	mov    ecx,0x0
    6462:	e9 80 fe ff ff       	jmp    62e7 <encode_inst_rm_rm+0x22a>
    6467:	48 8b 0d 72 47 01 00 	mov    rcx,QWORD PTR [rip+0x14772]        # 1abe0 <stderr@GLIBC_2.2.5>
    646e:	ba 3a 00 00 00       	mov    edx,0x3a
    6473:	be 01 00 00 00       	mov    esi,0x1
    6478:	48 8d 3d a9 f4 00 00 	lea    rdi,[rip+0xf4a9]        # 15928 <_IO_stdin_used+0x928>
    647f:	e8 5c cd ff ff       	call   31e0 <fwrite@plt>
    6484:	bf 01 00 00 00       	mov    edi,0x1
    6489:	e8 42 cd ff ff       	call   31d0 <exit@plt>
    648e:	8b 72 04             	mov    esi,DWORD PTR [rdx+0x4]
    6491:	48 63 c8             	movsxd rcx,eax
    6494:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    6498:	8d 40 01             	lea    eax,[rax+0x1]
    649b:	e9 b4 fe ff ff       	jmp    6354 <encode_inst_rm_rm+0x297>
    64a0:	48 63 d0             	movsxd rdx,eax
    64a3:	0f b6 5c 24 30       	movzx  ebx,BYTE PTR [rsp+0x30]
    64a8:	88 1c 17             	mov    BYTE PTR [rdi+rdx*1],bl
    64ab:	8d 40 01             	lea    eax,[rax+0x1]
    64ae:	e9 dd fe ff ff       	jmp    6390 <encode_inst_rm_rm+0x2d3>
    64b3:	48 63 d0             	movsxd rdx,eax
    64b6:	0f b7 5c 24 30       	movzx  ebx,WORD PTR [rsp+0x30]
    64bb:	66 89 1c 17          	mov    WORD PTR [rdi+rdx*1],bx
    64bf:	83 c0 02             	add    eax,0x2
    64c2:	e9 c9 fe ff ff       	jmp    6390 <encode_inst_rm_rm+0x2d3>
    64c7:	48 63 d0             	movsxd rdx,eax
    64ca:	8b 5c 24 30          	mov    ebx,DWORD PTR [rsp+0x30]
    64ce:	89 1c 17             	mov    DWORD PTR [rdi+rdx*1],ebx
    64d1:	83 c0 04             	add    eax,0x4
    64d4:	e9 b7 fe ff ff       	jmp    6390 <encode_inst_rm_rm+0x2d3>

00000000000064d9 <encode_inst_reg_rm2>:
    64d9:	41 56                	push   r14
    64db:	41 55                	push   r13
    64dd:	41 54                	push   r12
    64df:	55                   	push   rbp
    64e0:	53                   	push   rbx
    64e1:	41 89 f2             	mov    r10d,esi
    64e4:	89 d0                	mov    eax,edx
    64e6:	48 89 ca             	mov    rdx,rcx
    64e9:	0f b6 19             	movzx  ebx,BYTE PTR [rcx]
    64ec:	0f b6 69 01          	movzx  ebp,BYTE PTR [rcx+0x1]
    64f0:	41 80 f8 10          	cmp    r8b,0x10
    64f4:	0f 84 e0 00 00 00    	je     65da <encode_inst_reg_rm2+0x101>
    64fa:	41 80 f8 40          	cmp    r8b,0x40
    64fe:	0f 85 e9 00 00 00    	jne    65ed <encode_inst_reg_rm2+0x114>
    6504:	b9 00 00 00 00       	mov    ecx,0x0
    6509:	41 b8 08 00 00 00    	mov    r8d,0x8
    650f:	0f b6 72 02          	movzx  esi,BYTE PTR [rdx+0x2]
    6513:	40 80 fe 04          	cmp    sil,0x4
    6517:	0f 84 eb 00 00 00    	je     6608 <encode_inst_reg_rm2+0x12f>
    651d:	40 80 fe 08          	cmp    sil,0x8
    6521:	0f 84 ec 00 00 00    	je     6613 <encode_inst_reg_rm2+0x13a>
    6527:	40 80 fe 02          	cmp    sil,0x2
    652b:	0f 84 cc 00 00 00    	je     65fd <encode_inst_reg_rm2+0x124>
    6531:	41 be 00 00 00 00    	mov    r14d,0x0
    6537:	3c 07                	cmp    al,0x7
    6539:	76 04                	jbe    653f <encode_inst_reg_rm2+0x66>
    653b:	41 83 c8 04          	or     r8d,0x4
    653f:	80 fb 07             	cmp    bl,0x7
    6542:	76 04                	jbe    6548 <encode_inst_reg_rm2+0x6f>
    6544:	41 83 c8 01          	or     r8d,0x1
    6548:	40 80 fd 07          	cmp    bpl,0x7
    654c:	76 04                	jbe    6552 <encode_inst_reg_rm2+0x79>
    654e:	41 83 c8 02          	or     r8d,0x2
    6552:	66 83 7a 08 00       	cmp    WORD PTR [rdx+0x8],0x0
    6557:	74 10                	je     6569 <encode_inst_reg_rm2+0x90>
    6559:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    655d:	74 0a                	je     6569 <encode_inst_reg_rm2+0x90>
    655f:	83 7a 04 00          	cmp    DWORD PTR [rdx+0x4],0x0
    6563:	75 04                	jne    6569 <encode_inst_reg_rm2+0x90>
    6565:	c6 42 0a 00          	mov    BYTE PTR [rdx+0xa],0x0
    6569:	44 0f b6 5a 0a       	movzx  r11d,BYTE PTR [rdx+0xa]
    656e:	45 84 db             	test   r11b,r11b
    6571:	0f 85 a7 00 00 00    	jne    661e <encode_inst_reg_rm2+0x145>
    6577:	c6 42 0a 00          	mov    BYTE PTR [rdx+0xa],0x0
    657b:	44 89 de             	mov    esi,r11d
    657e:	44 0f b6 62 09       	movzx  r12d,BYTE PTR [rdx+0x9]
    6583:	45 84 e4             	test   r12b,r12b
    6586:	0f 84 ed 00 00 00    	je     6679 <encode_inst_reg_rm2+0x1a0>
    658c:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    6590:	0f 85 e3 00 00 00    	jne    6679 <encode_inst_reg_rm2+0x1a0>
    6596:	83 e3 07             	and    ebx,0x7
    6599:	80 fb 05             	cmp    bl,0x5
    659c:	0f 84 b2 00 00 00    	je     6654 <encode_inst_reg_rm2+0x17b>
    65a2:	c1 e6 06             	shl    esi,0x6
    65a5:	0f b6 c0             	movzx  eax,al
    65a8:	c1 e0 03             	shl    eax,0x3
    65ab:	83 e0 38             	and    eax,0x38
    65ae:	09 c6                	or     esi,eax
    65b0:	83 ce 04             	or     esi,0x4
    65b3:	41 0f b6 c6          	movzx  eax,r14b
    65b7:	c1 e0 06             	shl    eax,0x6
    65ba:	40 0f b6 ed          	movzx  ebp,bpl
    65be:	44 8d 34 ed 00 00 00 	lea    r14d,[rbp*8+0x0]
    65c5:	00 
    65c6:	41 83 e6 38          	and    r14d,0x38
    65ca:	41 09 c6             	or     r14d,eax
    65cd:	44 09 f3             	or     ebx,r14d
    65d0:	bd 01 00 00 00       	mov    ebp,0x1
    65d5:	e9 fa 00 00 00       	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    65da:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    65dd:	b9 01 00 00 00       	mov    ecx,0x1
    65e2:	41 b8 00 00 00 00    	mov    r8d,0x0
    65e8:	e9 22 ff ff ff       	jmp    650f <encode_inst_reg_rm2+0x36>
    65ed:	b9 00 00 00 00       	mov    ecx,0x0
    65f2:	41 b8 00 00 00 00    	mov    r8d,0x0
    65f8:	e9 12 ff ff ff       	jmp    650f <encode_inst_reg_rm2+0x36>
    65fd:	41 be 01 00 00 00    	mov    r14d,0x1
    6603:	e9 2f ff ff ff       	jmp    6537 <encode_inst_reg_rm2+0x5e>
    6608:	41 be 02 00 00 00    	mov    r14d,0x2
    660e:	e9 24 ff ff ff       	jmp    6537 <encode_inst_reg_rm2+0x5e>
    6613:	41 be 03 00 00 00    	mov    r14d,0x3
    6619:	e9 19 ff ff ff       	jmp    6537 <encode_inst_reg_rm2+0x5e>
    661e:	8b 72 04             	mov    esi,DWORD PTR [rdx+0x4]
    6621:	83 ee 80             	sub    esi,0xffffff80
    6624:	81 fe ff 00 00 00    	cmp    esi,0xff
    662a:	77 14                	ja     6640 <encode_inst_reg_rm2+0x167>
    662c:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6630:	be 01 00 00 00       	mov    esi,0x1
    6635:	41 bb 01 00 00 00    	mov    r11d,0x1
    663b:	e9 3e ff ff ff       	jmp    657e <encode_inst_reg_rm2+0xa5>
    6640:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6644:	be 02 00 00 00       	mov    esi,0x2
    6649:	41 bb 04 00 00 00    	mov    r11d,0x4
    664f:	e9 2a ff ff ff       	jmp    657e <encode_inst_reg_rm2+0xa5>
    6654:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    6658:	0f 85 44 ff ff ff    	jne    65a2 <encode_inst_reg_rm2+0xc9>
    665e:	c7 42 04 00 00 00 00 	mov    DWORD PTR [rdx+0x4],0x0
    6665:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6669:	be 01 00 00 00       	mov    esi,0x1
    666e:	41 bb 01 00 00 00    	mov    r11d,0x1
    6674:	e9 29 ff ff ff       	jmp    65a2 <encode_inst_reg_rm2+0xc9>
    6679:	83 e3 07             	and    ebx,0x7
    667c:	41 89 dd             	mov    r13d,ebx
    667f:	80 fb 04             	cmp    bl,0x4
    6682:	74 37                	je     66bb <encode_inst_reg_rm2+0x1e2>
    6684:	80 fb 05             	cmp    bl,0x5
    6687:	0f 84 eb 00 00 00    	je     6778 <encode_inst_reg_rm2+0x29f>
    668d:	0f b6 5a 08          	movzx  ebx,BYTE PTR [rdx+0x8]
    6691:	84 db                	test   bl,bl
    6693:	0f 84 1b 01 00 00    	je     67b4 <encode_inst_reg_rm2+0x2db>
    6699:	45 84 e4             	test   r12b,r12b
    669c:	0f 85 12 01 00 00    	jne    67b4 <encode_inst_reg_rm2+0x2db>
    66a2:	c1 e6 06             	shl    esi,0x6
    66a5:	0f b6 c0             	movzx  eax,al
    66a8:	c1 e0 03             	shl    eax,0x3
    66ab:	83 e0 38             	and    eax,0x38
    66ae:	09 c6                	or     esi,eax
    66b0:	44 09 ee             	or     esi,r13d
    66b3:	44 89 e5             	mov    ebp,r12d
    66b6:	44 89 e3             	mov    ebx,r12d
    66b9:	eb 19                	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    66bb:	c1 e6 06             	shl    esi,0x6
    66be:	0f b6 c0             	movzx  eax,al
    66c1:	c1 e0 03             	shl    eax,0x3
    66c4:	83 e0 38             	and    eax,0x38
    66c7:	09 c6                	or     esi,eax
    66c9:	83 ce 04             	or     esi,0x4
    66cc:	83 cb 20             	or     ebx,0x20
    66cf:	bd 01 00 00 00       	mov    ebp,0x1
    66d4:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    66d8:	74 0f                	je     66e9 <encode_inst_reg_rm2+0x210>
    66da:	80 7a 08 00          	cmp    BYTE PTR [rdx+0x8],0x0
    66de:	75 09                	jne    66e9 <encode_inst_reg_rm2+0x210>
    66e0:	45 84 e4             	test   r12b,r12b
    66e3:	0f 85 59 01 00 00    	jne    6842 <encode_inst_reg_rm2+0x369>
    66e9:	45 84 c9             	test   r9b,r9b
    66ec:	74 0a                	je     66f8 <encode_inst_reg_rm2+0x21f>
    66ee:	48 63 c1             	movsxd rax,ecx
    66f1:	44 88 0c 07          	mov    BYTE PTR [rdi+rax*1],r9b
    66f5:	8d 49 01             	lea    ecx,[rcx+0x1]
    66f8:	45 84 c0             	test   r8b,r8b
    66fb:	74 0e                	je     670b <encode_inst_reg_rm2+0x232>
    66fd:	48 63 c1             	movsxd rax,ecx
    6700:	41 83 c8 40          	or     r8d,0x40
    6704:	44 88 04 07          	mov    BYTE PTR [rdi+rax*1],r8b
    6708:	8d 49 01             	lea    ecx,[rcx+0x1]
    670b:	8d 41 01             	lea    eax,[rcx+0x1]
    670e:	4c 63 c1             	movsxd r8,ecx
    6711:	42 c6 04 07 0f       	mov    BYTE PTR [rdi+r8*1],0xf
    6716:	44 8d 41 02          	lea    r8d,[rcx+0x2]
    671a:	48 98                	cdqe
    671c:	44 88 14 07          	mov    BYTE PTR [rdi+rax*1],r10b
    6720:	8d 41 03             	lea    eax,[rcx+0x3]
    6723:	4d 63 c0             	movsxd r8,r8d
    6726:	42 88 34 07          	mov    BYTE PTR [rdi+r8*1],sil
    672a:	40 84 ed             	test   bpl,bpl
    672d:	74 08                	je     6737 <encode_inst_reg_rm2+0x25e>
    672f:	48 98                	cdqe
    6731:	88 1c 07             	mov    BYTE PTR [rdi+rax*1],bl
    6734:	8d 41 04             	lea    eax,[rcx+0x4]
    6737:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    673b:	74 1c                	je     6759 <encode_inst_reg_rm2+0x280>
    673d:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    6741:	75 16                	jne    6759 <encode_inst_reg_rm2+0x280>
    6743:	41 80 fb 01          	cmp    r11b,0x1
    6747:	0f 84 1c 01 00 00    	je     6869 <encode_inst_reg_rm2+0x390>
    674d:	48 63 c8             	movsxd rcx,eax
    6750:	8b 72 04             	mov    esi,DWORD PTR [rdx+0x4]
    6753:	89 34 0f             	mov    DWORD PTR [rdi+rcx*1],esi
    6756:	83 c0 04             	add    eax,0x4
    6759:	80 7a 0b 00          	cmp    BYTE PTR [rdx+0xb],0x0
    675d:	74 10                	je     676f <encode_inst_reg_rm2+0x296>
    675f:	88 42 4c             	mov    BYTE PTR [rdx+0x4c],al
    6762:	48 63 d0             	movsxd rdx,eax
    6765:	c7 04 17 00 00 00 00 	mov    DWORD PTR [rdi+rdx*1],0x0
    676c:	83 c0 04             	add    eax,0x4
    676f:	5b                   	pop    rbx
    6770:	5d                   	pop    rbp
    6771:	41 5c                	pop    r12
    6773:	41 5d                	pop    r13
    6775:	41 5e                	pop    r14
    6777:	c3                   	ret
    6778:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    677c:	75 16                	jne    6794 <encode_inst_reg_rm2+0x2bb>
    677e:	c7 42 04 00 00 00 00 	mov    DWORD PTR [rdx+0x4],0x0
    6785:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    6789:	be 01 00 00 00       	mov    esi,0x1
    678e:	41 bb 01 00 00 00    	mov    r11d,0x1
    6794:	c1 e6 06             	shl    esi,0x6
    6797:	0f b6 c0             	movzx  eax,al
    679a:	c1 e0 03             	shl    eax,0x3
    679d:	83 e0 38             	and    eax,0x38
    67a0:	09 c6                	or     esi,eax
    67a2:	44 09 ee             	or     esi,r13d
    67a5:	bd 00 00 00 00       	mov    ebp,0x0
    67aa:	bb 00 00 00 00       	mov    ebx,0x0
    67af:	e9 20 ff ff ff       	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    67b4:	f7 42 08 ff 00 00 ff 	test   DWORD PTR [rdx+0x8],0xff0000ff
    67bb:	75 46                	jne    6803 <encode_inst_reg_rm2+0x32a>
    67bd:	80 7a 0a 00          	cmp    BYTE PTR [rdx+0xa],0x0
    67c1:	74 40                	je     6803 <encode_inst_reg_rm2+0x32a>
    67c3:	0f b6 f0             	movzx  esi,al
    67c6:	c1 e6 03             	shl    esi,0x3
    67c9:	83 e6 38             	and    esi,0x38
    67cc:	83 ce 04             	or     esi,0x4
    67cf:	41 0f b6 c6          	movzx  eax,r14b
    67d3:	c1 e0 06             	shl    eax,0x6
    67d6:	40 0f b6 ed          	movzx  ebp,bpl
    67da:	44 8d 34 ed 00 00 00 	lea    r14d,[rbp*8+0x0]
    67e1:	00 
    67e2:	41 83 e6 38          	and    r14d,0x38
    67e6:	41 09 c6             	or     r14d,eax
    67e9:	44 89 f3             	mov    ebx,r14d
    67ec:	83 cb 05             	or     ebx,0x5
    67ef:	c6 42 0a 01          	mov    BYTE PTR [rdx+0xa],0x1
    67f3:	41 bb 04 00 00 00    	mov    r11d,0x4
    67f9:	bd 01 00 00 00       	mov    ebp,0x1
    67fe:	e9 d1 fe ff ff       	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    6803:	0f b6 72 0b          	movzx  esi,BYTE PTR [rdx+0xb]
    6807:	40 84 f6             	test   sil,sil
    680a:	74 19                	je     6825 <encode_inst_reg_rm2+0x34c>
    680c:	84 db                	test   bl,bl
    680e:	75 1e                	jne    682e <encode_inst_reg_rm2+0x355>
    6810:	0f b6 c0             	movzx  eax,al
    6813:	c1 e0 03             	shl    eax,0x3
    6816:	83 e0 38             	and    eax,0x38
    6819:	83 c8 05             	or     eax,0x5
    681c:	89 c6                	mov    esi,eax
    681e:	89 dd                	mov    ebp,ebx
    6820:	e9 af fe ff ff       	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    6825:	89 f5                	mov    ebp,esi
    6827:	89 f3                	mov    ebx,esi
    6829:	e9 a6 fe ff ff       	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    682e:	bd 00 00 00 00       	mov    ebp,0x0
    6833:	bb 00 00 00 00       	mov    ebx,0x0
    6838:	be 00 00 00 00       	mov    esi,0x0
    683d:	e9 92 fe ff ff       	jmp    66d4 <encode_inst_reg_rm2+0x1fb>
    6842:	48 8b 0d 97 43 01 00 	mov    rcx,QWORD PTR [rip+0x14397]        # 1abe0 <stderr@GLIBC_2.2.5>
    6849:	ba 3a 00 00 00       	mov    edx,0x3a
    684e:	be 01 00 00 00       	mov    esi,0x1
    6853:	48 8d 3d ce f0 00 00 	lea    rdi,[rip+0xf0ce]        # 15928 <_IO_stdin_used+0x928>
    685a:	e8 81 c9 ff ff       	call   31e0 <fwrite@plt>
    685f:	bf 01 00 00 00       	mov    edi,0x1
    6864:	e8 67 c9 ff ff       	call   31d0 <exit@plt>
    6869:	8b 72 04             	mov    esi,DWORD PTR [rdx+0x4]
    686c:	48 63 c8             	movsxd rcx,eax
    686f:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    6873:	8d 40 01             	lea    eax,[rax+0x1]
    6876:	e9 de fe ff ff       	jmp    6759 <encode_inst_reg_rm2+0x280>

000000000000687b <encode_add_imm>:
    687b:	41 89 d1             	mov    r9d,edx
    687e:	89 ca                	mov    edx,ecx
    6880:	40 80 fe 07          	cmp    sil,0x7
    6884:	77 43                	ja     68c9 <encode_add_imm+0x4e>
    6886:	b9 00 00 00 00       	mov    ecx,0x0
    688b:	80 fa 10             	cmp    dl,0x10
    688e:	74 51                	je     68e1 <encode_add_imm+0x66>
    6890:	80 fa 40             	cmp    dl,0x40
    6893:	74 56                	je     68eb <encode_add_imm+0x70>
    6895:	80 fa 08             	cmp    dl,0x8
    6898:	74 36                	je     68d0 <encode_add_imm+0x55>
    689a:	b8 00 00 00 00       	mov    eax,0x0
    689f:	80 fa 08             	cmp    dl,0x8
    68a2:	74 58                	je     68fc <encode_add_imm+0x81>
    68a4:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    68ab:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    68b2:	0f 87 a6 00 00 00    	ja     695e <encode_add_imm+0xe3>
    68b8:	45 85 c0             	test   r8d,r8d
    68bb:	0f 84 a5 00 00 00    	je     6966 <encode_add_imm+0xeb>
    68c1:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    68c7:	eb 39                	jmp    6902 <encode_add_imm+0x87>
    68c9:	b9 41 00 00 00       	mov    ecx,0x41
    68ce:	eb bb                	jmp    688b <encode_add_imm+0x10>
    68d0:	8d 46 fc             	lea    eax,[rsi-0x4]
    68d3:	3c 03                	cmp    al,0x3
    68d5:	77 1e                	ja     68f5 <encode_add_imm+0x7a>
    68d7:	83 c9 40             	or     ecx,0x40
    68da:	b8 00 00 00 00       	mov    eax,0x0
    68df:	eb be                	jmp    689f <encode_add_imm+0x24>
    68e1:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    68e4:	b8 01 00 00 00       	mov    eax,0x1
    68e9:	eb b4                	jmp    689f <encode_add_imm+0x24>
    68eb:	83 c9 48             	or     ecx,0x48
    68ee:	b8 00 00 00 00       	mov    eax,0x0
    68f3:	eb aa                	jmp    689f <encode_add_imm+0x24>
    68f5:	b8 00 00 00 00       	mov    eax,0x0
    68fa:	eb a3                	jmp    689f <encode_add_imm+0x24>
    68fc:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    6902:	40 84 f6             	test   sil,sil
    6905:	74 67                	je     696e <encode_add_imm+0xf3>
    6907:	83 e6 07             	and    esi,0x7
    690a:	83 ce c0             	or     esi,0xffffffc0
    690d:	84 c9                	test   cl,cl
    690f:	74 0a                	je     691b <encode_add_imm+0xa0>
    6911:	4c 63 c0             	movsxd r8,eax
    6914:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    6918:	8d 40 01             	lea    eax,[rax+0x1]
    691b:	8d 48 01             	lea    ecx,[rax+0x1]
    691e:	4c 63 c0             	movsxd r8,eax
    6921:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    6925:	44 8d 40 02          	lea    r8d,[rax+0x2]
    6929:	48 63 c9             	movsxd rcx,ecx
    692c:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    6930:	41 80 fa 83          	cmp    r10b,0x83
    6934:	0f 84 81 00 00 00    	je     69bb <encode_add_imm+0x140>
    693a:	80 fa 10             	cmp    dl,0x10
    693d:	0f 84 83 00 00 00    	je     69c6 <encode_add_imm+0x14b>
    6943:	80 fa 20             	cmp    dl,0x20
    6946:	0f 94 c1             	sete   cl
    6949:	80 fa 40             	cmp    dl,0x40
    694c:	0f 94 c2             	sete   dl
    694f:	08 d1                	or     cl,dl
    6951:	74 7f                	je     69d2 <encode_add_imm+0x157>
    6953:	4d 63 c0             	movsxd r8,r8d
    6956:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    695a:	83 c0 06             	add    eax,0x6
    695d:	c3                   	ret
    695e:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    6964:	eb 9c                	jmp    6902 <encode_add_imm+0x87>
    6966:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    696c:	eb 94                	jmp    6902 <encode_add_imm+0x87>
    696e:	84 c9                	test   cl,cl
    6970:	74 09                	je     697b <encode_add_imm+0x100>
    6972:	48 63 f0             	movsxd rsi,eax
    6975:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    6978:	8d 40 01             	lea    eax,[rax+0x1]
    697b:	80 fa 08             	cmp    dl,0x8
    697e:	74 1a                	je     699a <encode_add_imm+0x11f>
    6980:	8d 48 01             	lea    ecx,[rax+0x1]
    6983:	48 63 f0             	movsxd rsi,eax
    6986:	c6 04 37 05          	mov    BYTE PTR [rdi+rsi*1],0x5
    698a:	80 fa 10             	cmp    dl,0x10
    698d:	74 20                	je     69af <encode_add_imm+0x134>
    698f:	48 63 c9             	movsxd rcx,ecx
    6992:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    6996:	83 c0 05             	add    eax,0x5
    6999:	c3                   	ret
    699a:	8d 50 01             	lea    edx,[rax+0x1]
    699d:	48 63 c8             	movsxd rcx,eax
    69a0:	c6 04 0f 04          	mov    BYTE PTR [rdi+rcx*1],0x4
    69a4:	83 c0 02             	add    eax,0x2
    69a7:	48 63 d2             	movsxd rdx,edx
    69aa:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    69ae:	c3                   	ret
    69af:	48 63 c9             	movsxd rcx,ecx
    69b2:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    69b7:	83 c0 03             	add    eax,0x3
    69ba:	c3                   	ret
    69bb:	83 c0 03             	add    eax,0x3
    69be:	4d 63 c0             	movsxd r8,r8d
    69c1:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    69c5:	c3                   	ret
    69c6:	4d 63 c0             	movsxd r8,r8d
    69c9:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    69ce:	83 c0 04             	add    eax,0x4
    69d1:	c3                   	ret
    69d2:	83 c0 03             	add    eax,0x3
    69d5:	4d 63 c0             	movsxd r8,r8d
    69d8:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    69dc:	c3                   	ret

00000000000069dd <encode_add_reg_reg>:
    69dd:	80 f9 08             	cmp    cl,0x8
    69e0:	41 0f 95 c1          	setne  r9b
    69e4:	40 80 fe 07          	cmp    sil,0x7
    69e8:	77 58                	ja     6a42 <encode_add_reg_reg+0x65>
    69ea:	41 b8 00 00 00 00    	mov    r8d,0x0
    69f0:	80 fa 07             	cmp    dl,0x7
    69f3:	76 04                	jbe    69f9 <encode_add_reg_reg+0x1c>
    69f5:	41 83 c8 44          	or     r8d,0x44
    69f9:	80 f9 10             	cmp    cl,0x10
    69fc:	74 65                	je     6a63 <encode_add_reg_reg+0x86>
    69fe:	80 f9 40             	cmp    cl,0x40
    6a01:	74 6a                	je     6a6d <encode_add_reg_reg+0x90>
    6a03:	80 f9 08             	cmp    cl,0x8
    6a06:	74 42                	je     6a4a <encode_add_reg_reg+0x6d>
    6a08:	b8 00 00 00 00       	mov    eax,0x0
    6a0d:	0f b6 d2             	movzx  edx,dl
    6a10:	c1 e2 03             	shl    edx,0x3
    6a13:	83 e2 38             	and    edx,0x38
    6a16:	83 ca c0             	or     edx,0xffffffc0
    6a19:	83 e6 07             	and    esi,0x7
    6a1c:	09 d6                	or     esi,edx
    6a1e:	45 84 c0             	test   r8b,r8b
    6a21:	74 0a                	je     6a2d <encode_add_reg_reg+0x50>
    6a23:	0f b6 d0             	movzx  edx,al
    6a26:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    6a2a:	83 c0 01             	add    eax,0x1
    6a2d:	8d 50 01             	lea    edx,[rax+0x1]
    6a30:	0f b6 c8             	movzx  ecx,al
    6a33:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    6a37:	83 c0 02             	add    eax,0x2
    6a3a:	0f b6 d2             	movzx  edx,dl
    6a3d:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    6a41:	c3                   	ret
    6a42:	41 b8 41 00 00 00    	mov    r8d,0x41
    6a48:	eb a6                	jmp    69f0 <encode_add_reg_reg+0x13>
    6a4a:	8d 46 fc             	lea    eax,[rsi-0x4]
    6a4d:	3c 03                	cmp    al,0x3
    6a4f:	76 07                	jbe    6a58 <encode_add_reg_reg+0x7b>
    6a51:	8d 42 fc             	lea    eax,[rdx-0x4]
    6a54:	3c 03                	cmp    al,0x3
    6a56:	77 20                	ja     6a78 <encode_add_reg_reg+0x9b>
    6a58:	41 83 c8 40          	or     r8d,0x40
    6a5c:	b8 00 00 00 00       	mov    eax,0x0
    6a61:	eb aa                	jmp    6a0d <encode_add_reg_reg+0x30>
    6a63:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    6a66:	b8 01 00 00 00       	mov    eax,0x1
    6a6b:	eb a0                	jmp    6a0d <encode_add_reg_reg+0x30>
    6a6d:	41 83 c8 48          	or     r8d,0x48
    6a71:	b8 00 00 00 00       	mov    eax,0x0
    6a76:	eb 95                	jmp    6a0d <encode_add_reg_reg+0x30>
    6a78:	b8 00 00 00 00       	mov    eax,0x0
    6a7d:	eb 8e                	jmp    6a0d <encode_add_reg_reg+0x30>

0000000000006a7f <encode_sub_imm>:
    6a7f:	41 89 d1             	mov    r9d,edx
    6a82:	89 ca                	mov    edx,ecx
    6a84:	40 80 fe 07          	cmp    sil,0x7
    6a88:	77 43                	ja     6acd <encode_sub_imm+0x4e>
    6a8a:	b9 00 00 00 00       	mov    ecx,0x0
    6a8f:	80 fa 10             	cmp    dl,0x10
    6a92:	74 51                	je     6ae5 <encode_sub_imm+0x66>
    6a94:	80 fa 40             	cmp    dl,0x40
    6a97:	74 56                	je     6aef <encode_sub_imm+0x70>
    6a99:	80 fa 08             	cmp    dl,0x8
    6a9c:	74 36                	je     6ad4 <encode_sub_imm+0x55>
    6a9e:	b8 00 00 00 00       	mov    eax,0x0
    6aa3:	80 fa 08             	cmp    dl,0x8
    6aa6:	74 58                	je     6b00 <encode_sub_imm+0x81>
    6aa8:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    6aaf:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    6ab6:	0f 87 a6 00 00 00    	ja     6b62 <encode_sub_imm+0xe3>
    6abc:	45 85 c0             	test   r8d,r8d
    6abf:	0f 84 a5 00 00 00    	je     6b6a <encode_sub_imm+0xeb>
    6ac5:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    6acb:	eb 39                	jmp    6b06 <encode_sub_imm+0x87>
    6acd:	b9 41 00 00 00       	mov    ecx,0x41
    6ad2:	eb bb                	jmp    6a8f <encode_sub_imm+0x10>
    6ad4:	8d 46 fc             	lea    eax,[rsi-0x4]
    6ad7:	3c 03                	cmp    al,0x3
    6ad9:	77 1e                	ja     6af9 <encode_sub_imm+0x7a>
    6adb:	83 c9 40             	or     ecx,0x40
    6ade:	b8 00 00 00 00       	mov    eax,0x0
    6ae3:	eb be                	jmp    6aa3 <encode_sub_imm+0x24>
    6ae5:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    6ae8:	b8 01 00 00 00       	mov    eax,0x1
    6aed:	eb b4                	jmp    6aa3 <encode_sub_imm+0x24>
    6aef:	83 c9 48             	or     ecx,0x48
    6af2:	b8 00 00 00 00       	mov    eax,0x0
    6af7:	eb aa                	jmp    6aa3 <encode_sub_imm+0x24>
    6af9:	b8 00 00 00 00       	mov    eax,0x0
    6afe:	eb a3                	jmp    6aa3 <encode_sub_imm+0x24>
    6b00:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    6b06:	40 84 f6             	test   sil,sil
    6b09:	74 67                	je     6b72 <encode_sub_imm+0xf3>
    6b0b:	83 e6 07             	and    esi,0x7
    6b0e:	83 ce e8             	or     esi,0xffffffe8
    6b11:	84 c9                	test   cl,cl
    6b13:	74 0a                	je     6b1f <encode_sub_imm+0xa0>
    6b15:	4c 63 c0             	movsxd r8,eax
    6b18:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    6b1c:	8d 40 01             	lea    eax,[rax+0x1]
    6b1f:	8d 48 01             	lea    ecx,[rax+0x1]
    6b22:	4c 63 c0             	movsxd r8,eax
    6b25:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    6b29:	44 8d 40 02          	lea    r8d,[rax+0x2]
    6b2d:	48 63 c9             	movsxd rcx,ecx
    6b30:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    6b34:	41 80 fa 83          	cmp    r10b,0x83
    6b38:	0f 84 81 00 00 00    	je     6bbf <encode_sub_imm+0x140>
    6b3e:	80 fa 10             	cmp    dl,0x10
    6b41:	0f 84 83 00 00 00    	je     6bca <encode_sub_imm+0x14b>
    6b47:	80 fa 20             	cmp    dl,0x20
    6b4a:	0f 94 c1             	sete   cl
    6b4d:	80 fa 40             	cmp    dl,0x40
    6b50:	0f 94 c2             	sete   dl
    6b53:	08 d1                	or     cl,dl
    6b55:	74 7f                	je     6bd6 <encode_sub_imm+0x157>
    6b57:	4d 63 c0             	movsxd r8,r8d
    6b5a:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    6b5e:	83 c0 06             	add    eax,0x6
    6b61:	c3                   	ret
    6b62:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    6b68:	eb 9c                	jmp    6b06 <encode_sub_imm+0x87>
    6b6a:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    6b70:	eb 94                	jmp    6b06 <encode_sub_imm+0x87>
    6b72:	84 c9                	test   cl,cl
    6b74:	74 09                	je     6b7f <encode_sub_imm+0x100>
    6b76:	48 63 f0             	movsxd rsi,eax
    6b79:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    6b7c:	8d 40 01             	lea    eax,[rax+0x1]
    6b7f:	80 fa 08             	cmp    dl,0x8
    6b82:	74 1a                	je     6b9e <encode_sub_imm+0x11f>
    6b84:	8d 48 01             	lea    ecx,[rax+0x1]
    6b87:	48 63 f0             	movsxd rsi,eax
    6b8a:	c6 04 37 2d          	mov    BYTE PTR [rdi+rsi*1],0x2d
    6b8e:	80 fa 10             	cmp    dl,0x10
    6b91:	74 20                	je     6bb3 <encode_sub_imm+0x134>
    6b93:	48 63 c9             	movsxd rcx,ecx
    6b96:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    6b9a:	83 c0 05             	add    eax,0x5
    6b9d:	c3                   	ret
    6b9e:	8d 50 01             	lea    edx,[rax+0x1]
    6ba1:	48 63 c8             	movsxd rcx,eax
    6ba4:	c6 04 0f 2c          	mov    BYTE PTR [rdi+rcx*1],0x2c
    6ba8:	83 c0 02             	add    eax,0x2
    6bab:	48 63 d2             	movsxd rdx,edx
    6bae:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    6bb2:	c3                   	ret
    6bb3:	48 63 c9             	movsxd rcx,ecx
    6bb6:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    6bbb:	83 c0 03             	add    eax,0x3
    6bbe:	c3                   	ret
    6bbf:	83 c0 03             	add    eax,0x3
    6bc2:	4d 63 c0             	movsxd r8,r8d
    6bc5:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    6bc9:	c3                   	ret
    6bca:	4d 63 c0             	movsxd r8,r8d
    6bcd:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    6bd2:	83 c0 04             	add    eax,0x4
    6bd5:	c3                   	ret
    6bd6:	83 c0 03             	add    eax,0x3
    6bd9:	4d 63 c0             	movsxd r8,r8d
    6bdc:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    6be0:	c3                   	ret

0000000000006be1 <encode_sub_reg_reg>:
    6be1:	80 f9 08             	cmp    cl,0x8
    6be4:	74 64                	je     6c4a <encode_sub_reg_reg+0x69>
    6be6:	41 b9 29 00 00 00    	mov    r9d,0x29
    6bec:	40 80 fe 07          	cmp    sil,0x7
    6bf0:	77 60                	ja     6c52 <encode_sub_reg_reg+0x71>
    6bf2:	41 b8 00 00 00 00    	mov    r8d,0x0
    6bf8:	80 fa 07             	cmp    dl,0x7
    6bfb:	76 04                	jbe    6c01 <encode_sub_reg_reg+0x20>
    6bfd:	41 83 c8 44          	or     r8d,0x44
    6c01:	80 f9 10             	cmp    cl,0x10
    6c04:	74 6d                	je     6c73 <encode_sub_reg_reg+0x92>
    6c06:	80 f9 40             	cmp    cl,0x40
    6c09:	74 72                	je     6c7d <encode_sub_reg_reg+0x9c>
    6c0b:	80 f9 08             	cmp    cl,0x8
    6c0e:	74 4a                	je     6c5a <encode_sub_reg_reg+0x79>
    6c10:	b8 00 00 00 00       	mov    eax,0x0
    6c15:	0f b6 d2             	movzx  edx,dl
    6c18:	c1 e2 03             	shl    edx,0x3
    6c1b:	83 e2 38             	and    edx,0x38
    6c1e:	83 ca c0             	or     edx,0xffffffc0
    6c21:	83 e6 07             	and    esi,0x7
    6c24:	09 d6                	or     esi,edx
    6c26:	45 84 c0             	test   r8b,r8b
    6c29:	74 0a                	je     6c35 <encode_sub_reg_reg+0x54>
    6c2b:	0f b6 d0             	movzx  edx,al
    6c2e:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    6c32:	83 c0 01             	add    eax,0x1
    6c35:	8d 50 01             	lea    edx,[rax+0x1]
    6c38:	0f b6 c8             	movzx  ecx,al
    6c3b:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    6c3f:	83 c0 02             	add    eax,0x2
    6c42:	0f b6 d2             	movzx  edx,dl
    6c45:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    6c49:	c3                   	ret
    6c4a:	41 b9 28 00 00 00    	mov    r9d,0x28
    6c50:	eb 9a                	jmp    6bec <encode_sub_reg_reg+0xb>
    6c52:	41 b8 41 00 00 00    	mov    r8d,0x41
    6c58:	eb 9e                	jmp    6bf8 <encode_sub_reg_reg+0x17>
    6c5a:	8d 46 fc             	lea    eax,[rsi-0x4]
    6c5d:	3c 03                	cmp    al,0x3
    6c5f:	76 07                	jbe    6c68 <encode_sub_reg_reg+0x87>
    6c61:	8d 42 fc             	lea    eax,[rdx-0x4]
    6c64:	3c 03                	cmp    al,0x3
    6c66:	77 20                	ja     6c88 <encode_sub_reg_reg+0xa7>
    6c68:	41 83 c8 40          	or     r8d,0x40
    6c6c:	b8 00 00 00 00       	mov    eax,0x0
    6c71:	eb a2                	jmp    6c15 <encode_sub_reg_reg+0x34>
    6c73:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    6c76:	b8 01 00 00 00       	mov    eax,0x1
    6c7b:	eb 98                	jmp    6c15 <encode_sub_reg_reg+0x34>
    6c7d:	41 83 c8 48          	or     r8d,0x48
    6c81:	b8 00 00 00 00       	mov    eax,0x0
    6c86:	eb 8d                	jmp    6c15 <encode_sub_reg_reg+0x34>
    6c88:	b8 00 00 00 00       	mov    eax,0x0
    6c8d:	eb 86                	jmp    6c15 <encode_sub_reg_reg+0x34>

0000000000006c8f <encode_imul_reg>:
    6c8f:	48 89 f9             	mov    rcx,rdi
    6c92:	80 fa 08             	cmp    dl,0x8
    6c95:	74 4f                	je     6ce6 <encode_imul_reg+0x57>
    6c97:	41 b8 f7 ff ff ff    	mov    r8d,0xfffffff7
    6c9d:	40 80 fe 07          	cmp    sil,0x7
    6ca1:	77 4b                	ja     6cee <encode_imul_reg+0x5f>
    6ca3:	bf 00 00 00 00       	mov    edi,0x0
    6ca8:	80 fa 10             	cmp    dl,0x10
    6cab:	74 59                	je     6d06 <encode_imul_reg+0x77>
    6cad:	80 fa 40             	cmp    dl,0x40
    6cb0:	74 5e                	je     6d10 <encode_imul_reg+0x81>
    6cb2:	80 fa 08             	cmp    dl,0x8
    6cb5:	74 3e                	je     6cf5 <encode_imul_reg+0x66>
    6cb7:	b8 00 00 00 00       	mov    eax,0x0
    6cbc:	83 e6 07             	and    esi,0x7
    6cbf:	83 ce e8             	or     esi,0xffffffe8
    6cc2:	40 84 ff             	test   dil,dil
    6cc5:	74 0a                	je     6cd1 <encode_imul_reg+0x42>
    6cc7:	0f b6 d0             	movzx  edx,al
    6cca:	40 88 3c 11          	mov    BYTE PTR [rcx+rdx*1],dil
    6cce:	83 c0 01             	add    eax,0x1
    6cd1:	8d 50 01             	lea    edx,[rax+0x1]
    6cd4:	0f b6 f8             	movzx  edi,al
    6cd7:	44 88 04 39          	mov    BYTE PTR [rcx+rdi*1],r8b
    6cdb:	83 c0 02             	add    eax,0x2
    6cde:	0f b6 d2             	movzx  edx,dl
    6ce1:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
    6ce5:	c3                   	ret
    6ce6:	41 b8 f6 ff ff ff    	mov    r8d,0xfffffff6
    6cec:	eb af                	jmp    6c9d <encode_imul_reg+0xe>
    6cee:	bf 41 00 00 00       	mov    edi,0x41
    6cf3:	eb b3                	jmp    6ca8 <encode_imul_reg+0x19>
    6cf5:	8d 46 fc             	lea    eax,[rsi-0x4]
    6cf8:	3c 03                	cmp    al,0x3
    6cfa:	77 1e                	ja     6d1a <encode_imul_reg+0x8b>
    6cfc:	83 cf 40             	or     edi,0x40
    6cff:	b8 00 00 00 00       	mov    eax,0x0
    6d04:	eb b6                	jmp    6cbc <encode_imul_reg+0x2d>
    6d06:	c6 01 66             	mov    BYTE PTR [rcx],0x66
    6d09:	b8 01 00 00 00       	mov    eax,0x1
    6d0e:	eb ac                	jmp    6cbc <encode_imul_reg+0x2d>
    6d10:	83 cf 48             	or     edi,0x48
    6d13:	b8 00 00 00 00       	mov    eax,0x0
    6d18:	eb a2                	jmp    6cbc <encode_imul_reg+0x2d>
    6d1a:	b8 00 00 00 00       	mov    eax,0x0
    6d1f:	eb 9b                	jmp    6cbc <encode_imul_reg+0x2d>

0000000000006d21 <encode_imul_reg_reg>:
    6d21:	40 80 fe 07          	cmp    sil,0x7
    6d25:	77 6a                	ja     6d91 <encode_imul_reg_reg+0x70>
    6d27:	41 b8 00 00 00 00    	mov    r8d,0x0
    6d2d:	80 fa 07             	cmp    dl,0x7
    6d30:	76 04                	jbe    6d36 <encode_imul_reg_reg+0x15>
    6d32:	41 83 c8 44          	or     r8d,0x44
    6d36:	80 f9 10             	cmp    cl,0x10
    6d39:	0f 84 85 00 00 00    	je     6dc4 <encode_imul_reg_reg+0xa3>
    6d3f:	80 f9 40             	cmp    cl,0x40
    6d42:	0f 84 86 00 00 00    	je     6dce <encode_imul_reg_reg+0xad>
    6d48:	80 f9 08             	cmp    cl,0x8
    6d4b:	74 4c                	je     6d99 <encode_imul_reg_reg+0x78>
    6d4d:	b8 00 00 00 00       	mov    eax,0x0
    6d52:	0f b6 d2             	movzx  edx,dl
    6d55:	c1 e2 03             	shl    edx,0x3
    6d58:	83 e2 38             	and    edx,0x38
    6d5b:	83 ca c0             	or     edx,0xffffffc0
    6d5e:	83 e6 07             	and    esi,0x7
    6d61:	09 d6                	or     esi,edx
    6d63:	45 84 c0             	test   r8b,r8b
    6d66:	74 0a                	je     6d72 <encode_imul_reg_reg+0x51>
    6d68:	48 63 d0             	movsxd rdx,eax
    6d6b:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    6d6f:	8d 40 01             	lea    eax,[rax+0x1]
    6d72:	8d 48 01             	lea    ecx,[rax+0x1]
    6d75:	48 63 d0             	movsxd rdx,eax
    6d78:	c6 04 17 0f          	mov    BYTE PTR [rdi+rdx*1],0xf
    6d7c:	8d 50 02             	lea    edx,[rax+0x2]
    6d7f:	48 63 c9             	movsxd rcx,ecx
    6d82:	c6 04 0f af          	mov    BYTE PTR [rdi+rcx*1],0xaf
    6d86:	48 63 d2             	movsxd rdx,edx
    6d89:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    6d8d:	83 c0 03             	add    eax,0x3
    6d90:	c3                   	ret
    6d91:	41 b8 41 00 00 00    	mov    r8d,0x41
    6d97:	eb 94                	jmp    6d2d <encode_imul_reg_reg+0xc>
    6d99:	48 83 ec 08          	sub    rsp,0x8
    6d9d:	48 8b 0d 3c 3e 01 00 	mov    rcx,QWORD PTR [rip+0x13e3c]        # 1abe0 <stderr@GLIBC_2.2.5>
    6da4:	ba 2b 00 00 00       	mov    edx,0x2b
    6da9:	be 01 00 00 00       	mov    esi,0x1
    6dae:	48 8d 3d b3 eb 00 00 	lea    rdi,[rip+0xebb3]        # 15968 <_IO_stdin_used+0x968>
    6db5:	e8 26 c4 ff ff       	call   31e0 <fwrite@plt>
    6dba:	bf 01 00 00 00       	mov    edi,0x1
    6dbf:	e8 0c c4 ff ff       	call   31d0 <exit@plt>
    6dc4:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    6dc7:	b8 01 00 00 00       	mov    eax,0x1
    6dcc:	eb 84                	jmp    6d52 <encode_imul_reg_reg+0x31>
    6dce:	41 83 c8 48          	or     r8d,0x48
    6dd2:	b8 00 00 00 00       	mov    eax,0x0
    6dd7:	e9 76 ff ff ff       	jmp    6d52 <encode_imul_reg_reg+0x31>

0000000000006ddc <encode_imul_reg_reg_imm>:
    6ddc:	40 80 fe 07          	cmp    sil,0x7
    6de0:	0f 87 80 00 00 00    	ja     6e66 <encode_imul_reg_reg_imm+0x8a>
    6de6:	b8 00 00 00 00       	mov    eax,0x0
    6deb:	80 fa 07             	cmp    dl,0x7
    6dee:	76 03                	jbe    6df3 <encode_imul_reg_reg_imm+0x17>
    6df0:	83 c8 41             	or     eax,0x41
    6df3:	41 80 f8 20          	cmp    r8b,0x20
    6df7:	0f 84 bb 00 00 00    	je     6eb8 <encode_imul_reg_reg_imm+0xdc>
    6dfd:	41 80 f8 40          	cmp    r8b,0x40
    6e01:	0f 84 f6 00 00 00    	je     6efd <encode_imul_reg_reg_imm+0x121>
    6e07:	41 80 f8 10          	cmp    r8b,0x10
    6e0b:	74 63                	je     6e70 <encode_imul_reg_reg_imm+0x94>
    6e0d:	41 b9 00 00 00 00    	mov    r9d,0x0
    6e13:	40 0f b6 f6          	movzx  esi,sil
    6e17:	c1 e6 03             	shl    esi,0x3
    6e1a:	83 e6 38             	and    esi,0x38
    6e1d:	83 ce c0             	or     esi,0xffffffc0
    6e20:	83 e2 07             	and    edx,0x7
    6e23:	09 f2                	or     edx,esi
    6e25:	84 c0                	test   al,al
    6e27:	74 0a                	je     6e33 <encode_imul_reg_reg_imm+0x57>
    6e29:	49 63 f1             	movsxd rsi,r9d
    6e2c:	88 04 37             	mov    BYTE PTR [rdi+rsi*1],al
    6e2f:	45 8d 49 01          	lea    r9d,[r9+0x1]
    6e33:	41 8d 41 01          	lea    eax,[r9+0x1]
    6e37:	49 63 f1             	movsxd rsi,r9d
    6e3a:	44 88 14 37          	mov    BYTE PTR [rdi+rsi*1],r10b
    6e3e:	41 8d 71 02          	lea    esi,[r9+0x2]
    6e42:	48 98                	cdqe
    6e44:	88 14 07             	mov    BYTE PTR [rdi+rax*1],dl
    6e47:	41 80 fa 6b          	cmp    r10b,0x6b
    6e4b:	0f 84 5a 01 00 00    	je     6fab <encode_imul_reg_reg_imm+0x1cf>
    6e51:	41 80 f8 10          	cmp    r8b,0x10
    6e55:	0f 84 5b 01 00 00    	je     6fb6 <encode_imul_reg_reg_imm+0x1da>
    6e5b:	48 63 f6             	movsxd rsi,esi
    6e5e:	89 0c 37             	mov    DWORD PTR [rdi+rsi*1],ecx
    6e61:	41 8d 41 06          	lea    eax,[r9+0x6]
    6e65:	c3                   	ret
    6e66:	b8 44 00 00 00       	mov    eax,0x44
    6e6b:	e9 7b ff ff ff       	jmp    6deb <encode_imul_reg_reg_imm+0xf>
    6e70:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    6e73:	4c 0f bf d1          	movsx  r10,cx
    6e77:	49 39 ca             	cmp    r10,rcx
    6e7a:	74 0e                	je     6e8a <encode_imul_reg_reg_imm+0xae>
    6e7c:	41 b9 01 00 00 00    	mov    r9d,0x1
    6e82:	41 ba 69 00 00 00    	mov    r10d,0x69
    6e88:	eb 89                	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6e8a:	66 83 f9 80          	cmp    cx,0xff80
    6e8e:	0f 8c 9b 00 00 00    	jl     6f2f <encode_imul_reg_reg_imm+0x153>
    6e94:	66 83 f9 7f          	cmp    cx,0x7f
    6e98:	0f 8f a2 00 00 00    	jg     6f40 <encode_imul_reg_reg_imm+0x164>
    6e9e:	45 85 c9             	test   r9d,r9d
    6ea1:	0f 84 aa 00 00 00    	je     6f51 <encode_imul_reg_reg_imm+0x175>
    6ea7:	41 b9 01 00 00 00    	mov    r9d,0x1
    6ead:	41 ba 69 00 00 00    	mov    r10d,0x69
    6eb3:	e9 5b ff ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6eb8:	4c 63 d1             	movsxd r10,ecx
    6ebb:	49 39 ca             	cmp    r10,rcx
    6ebe:	74 11                	je     6ed1 <encode_imul_reg_reg_imm+0xf5>
    6ec0:	41 b9 00 00 00 00    	mov    r9d,0x0
    6ec6:	41 ba 69 00 00 00    	mov    r10d,0x69
    6ecc:	e9 42 ff ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6ed1:	83 f9 80             	cmp    ecx,0xffffff80
    6ed4:	0f 8c 88 00 00 00    	jl     6f62 <encode_imul_reg_reg_imm+0x186>
    6eda:	83 f9 7f             	cmp    ecx,0x7f
    6edd:	0f 8f 90 00 00 00    	jg     6f73 <encode_imul_reg_reg_imm+0x197>
    6ee3:	45 85 c9             	test   r9d,r9d
    6ee6:	0f 84 98 00 00 00    	je     6f84 <encode_imul_reg_reg_imm+0x1a8>
    6eec:	41 b9 00 00 00 00    	mov    r9d,0x0
    6ef2:	41 ba 69 00 00 00    	mov    r10d,0x69
    6ef8:	e9 16 ff ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6efd:	83 c8 48             	or     eax,0x48
    6f00:	48 83 f9 80          	cmp    rcx,0xffffffffffffff80
    6f04:	41 0f 9d c3          	setge  r11b
    6f08:	48 83 f9 7f          	cmp    rcx,0x7f
    6f0c:	41 0f 9e c2          	setle  r10b
    6f10:	45 84 d3             	test   r11b,r10b
    6f13:	74 7a                	je     6f8f <encode_imul_reg_reg_imm+0x1b3>
    6f15:	45 85 c9             	test   r9d,r9d
    6f18:	0f 84 82 00 00 00    	je     6fa0 <encode_imul_reg_reg_imm+0x1c4>
    6f1e:	41 b9 00 00 00 00    	mov    r9d,0x0
    6f24:	41 ba 69 00 00 00    	mov    r10d,0x69
    6f2a:	e9 e4 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f2f:	41 b9 01 00 00 00    	mov    r9d,0x1
    6f35:	41 ba 69 00 00 00    	mov    r10d,0x69
    6f3b:	e9 d3 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f40:	41 b9 01 00 00 00    	mov    r9d,0x1
    6f46:	41 ba 69 00 00 00    	mov    r10d,0x69
    6f4c:	e9 c2 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f51:	41 b9 01 00 00 00    	mov    r9d,0x1
    6f57:	41 ba 6b 00 00 00    	mov    r10d,0x6b
    6f5d:	e9 b1 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f62:	41 b9 00 00 00 00    	mov    r9d,0x0
    6f68:	41 ba 69 00 00 00    	mov    r10d,0x69
    6f6e:	e9 a0 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f73:	41 b9 00 00 00 00    	mov    r9d,0x0
    6f79:	41 ba 69 00 00 00    	mov    r10d,0x69
    6f7f:	e9 8f fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f84:	41 ba 6b 00 00 00    	mov    r10d,0x6b
    6f8a:	e9 84 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6f8f:	41 b9 00 00 00 00    	mov    r9d,0x0
    6f95:	41 ba 69 00 00 00    	mov    r10d,0x69
    6f9b:	e9 73 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6fa0:	41 ba 6b 00 00 00    	mov    r10d,0x6b
    6fa6:	e9 68 fe ff ff       	jmp    6e13 <encode_imul_reg_reg_imm+0x37>
    6fab:	41 8d 41 03          	lea    eax,[r9+0x3]
    6faf:	48 63 f6             	movsxd rsi,esi
    6fb2:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    6fb5:	c3                   	ret
    6fb6:	48 63 f6             	movsxd rsi,esi
    6fb9:	66 89 0c 37          	mov    WORD PTR [rdi+rsi*1],cx
    6fbd:	41 8d 41 04          	lea    eax,[r9+0x4]
    6fc1:	c3                   	ret

0000000000006fc2 <encode_div_or_idiv_reg>:
    6fc2:	80 f9 08             	cmp    cl,0x8
    6fc5:	74 5a                	je     7021 <encode_div_or_idiv_reg+0x5f>
    6fc7:	41 b9 f7 ff ff ff    	mov    r9d,0xfffffff7
    6fcd:	80 fa 07             	cmp    dl,0x7
    6fd0:	77 57                	ja     7029 <encode_div_or_idiv_reg+0x67>
    6fd2:	41 b8 00 00 00 00    	mov    r8d,0x0
    6fd8:	80 f9 10             	cmp    cl,0x10
    6fdb:	74 66                	je     7043 <encode_div_or_idiv_reg+0x81>
    6fdd:	80 f9 40             	cmp    cl,0x40
    6fe0:	74 6b                	je     704d <encode_div_or_idiv_reg+0x8b>
    6fe2:	80 f9 08             	cmp    cl,0x8
    6fe5:	74 4a                	je     7031 <encode_div_or_idiv_reg+0x6f>
    6fe7:	b8 00 00 00 00       	mov    eax,0x0
    6fec:	40 0f b6 f6          	movzx  esi,sil
    6ff0:	c1 e6 03             	shl    esi,0x3
    6ff3:	83 e6 38             	and    esi,0x38
    6ff6:	83 ce c0             	or     esi,0xffffffc0
    6ff9:	83 e2 07             	and    edx,0x7
    6ffc:	09 f2                	or     edx,esi
    6ffe:	45 84 c0             	test   r8b,r8b
    7001:	74 0a                	je     700d <encode_div_or_idiv_reg+0x4b>
    7003:	48 63 c8             	movsxd rcx,eax
    7006:	44 88 04 0f          	mov    BYTE PTR [rdi+rcx*1],r8b
    700a:	8d 40 01             	lea    eax,[rax+0x1]
    700d:	8d 48 01             	lea    ecx,[rax+0x1]
    7010:	48 63 f0             	movsxd rsi,eax
    7013:	44 88 0c 37          	mov    BYTE PTR [rdi+rsi*1],r9b
    7017:	48 63 c9             	movsxd rcx,ecx
    701a:	88 14 0f             	mov    BYTE PTR [rdi+rcx*1],dl
    701d:	83 c0 02             	add    eax,0x2
    7020:	c3                   	ret
    7021:	41 b9 f6 ff ff ff    	mov    r9d,0xfffffff6
    7027:	eb a4                	jmp    6fcd <encode_div_or_idiv_reg+0xb>
    7029:	41 b8 41 00 00 00    	mov    r8d,0x41
    702f:	eb a7                	jmp    6fd8 <encode_div_or_idiv_reg+0x16>
    7031:	8d 42 fc             	lea    eax,[rdx-0x4]
    7034:	3c 03                	cmp    al,0x3
    7036:	77 20                	ja     7058 <encode_div_or_idiv_reg+0x96>
    7038:	41 83 c8 40          	or     r8d,0x40
    703c:	b8 00 00 00 00       	mov    eax,0x0
    7041:	eb a9                	jmp    6fec <encode_div_or_idiv_reg+0x2a>
    7043:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7046:	b8 01 00 00 00       	mov    eax,0x1
    704b:	eb 9f                	jmp    6fec <encode_div_or_idiv_reg+0x2a>
    704d:	41 83 c8 48          	or     r8d,0x48
    7051:	b8 00 00 00 00       	mov    eax,0x0
    7056:	eb 94                	jmp    6fec <encode_div_or_idiv_reg+0x2a>
    7058:	b8 00 00 00 00       	mov    eax,0x0
    705d:	eb 8d                	jmp    6fec <encode_div_or_idiv_reg+0x2a>

000000000000705f <encode_cmp_imm>:
    705f:	41 89 d1             	mov    r9d,edx
    7062:	89 ca                	mov    edx,ecx
    7064:	40 80 fe 07          	cmp    sil,0x7
    7068:	77 43                	ja     70ad <encode_cmp_imm+0x4e>
    706a:	b9 00 00 00 00       	mov    ecx,0x0
    706f:	80 fa 10             	cmp    dl,0x10
    7072:	74 51                	je     70c5 <encode_cmp_imm+0x66>
    7074:	80 fa 40             	cmp    dl,0x40
    7077:	74 56                	je     70cf <encode_cmp_imm+0x70>
    7079:	80 fa 08             	cmp    dl,0x8
    707c:	74 36                	je     70b4 <encode_cmp_imm+0x55>
    707e:	b8 00 00 00 00       	mov    eax,0x0
    7083:	80 fa 08             	cmp    dl,0x8
    7086:	74 58                	je     70e0 <encode_cmp_imm+0x81>
    7088:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    708f:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    7096:	0f 87 a3 00 00 00    	ja     713f <encode_cmp_imm+0xe0>
    709c:	45 85 c0             	test   r8d,r8d
    709f:	0f 84 a2 00 00 00    	je     7147 <encode_cmp_imm+0xe8>
    70a5:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    70ab:	eb 39                	jmp    70e6 <encode_cmp_imm+0x87>
    70ad:	b9 41 00 00 00       	mov    ecx,0x41
    70b2:	eb bb                	jmp    706f <encode_cmp_imm+0x10>
    70b4:	8d 46 fc             	lea    eax,[rsi-0x4]
    70b7:	3c 03                	cmp    al,0x3
    70b9:	77 1e                	ja     70d9 <encode_cmp_imm+0x7a>
    70bb:	83 c9 40             	or     ecx,0x40
    70be:	b8 00 00 00 00       	mov    eax,0x0
    70c3:	eb be                	jmp    7083 <encode_cmp_imm+0x24>
    70c5:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    70c8:	b8 01 00 00 00       	mov    eax,0x1
    70cd:	eb b4                	jmp    7083 <encode_cmp_imm+0x24>
    70cf:	83 c9 48             	or     ecx,0x48
    70d2:	b8 00 00 00 00       	mov    eax,0x0
    70d7:	eb aa                	jmp    7083 <encode_cmp_imm+0x24>
    70d9:	b8 00 00 00 00       	mov    eax,0x0
    70de:	eb a3                	jmp    7083 <encode_cmp_imm+0x24>
    70e0:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    70e6:	40 84 f6             	test   sil,sil
    70e9:	74 64                	je     714f <encode_cmp_imm+0xf0>
    70eb:	83 ce f8             	or     esi,0xfffffff8
    70ee:	84 c9                	test   cl,cl
    70f0:	74 0a                	je     70fc <encode_cmp_imm+0x9d>
    70f2:	4c 63 c0             	movsxd r8,eax
    70f5:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    70f9:	8d 40 01             	lea    eax,[rax+0x1]
    70fc:	8d 48 01             	lea    ecx,[rax+0x1]
    70ff:	4c 63 c0             	movsxd r8,eax
    7102:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    7106:	44 8d 40 02          	lea    r8d,[rax+0x2]
    710a:	48 63 c9             	movsxd rcx,ecx
    710d:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7111:	41 80 fa 83          	cmp    r10b,0x83
    7115:	0f 84 81 00 00 00    	je     719c <encode_cmp_imm+0x13d>
    711b:	80 fa 10             	cmp    dl,0x10
    711e:	0f 84 83 00 00 00    	je     71a7 <encode_cmp_imm+0x148>
    7124:	80 fa 20             	cmp    dl,0x20
    7127:	0f 94 c1             	sete   cl
    712a:	80 fa 40             	cmp    dl,0x40
    712d:	0f 94 c2             	sete   dl
    7130:	08 d1                	or     cl,dl
    7132:	74 7f                	je     71b3 <encode_cmp_imm+0x154>
    7134:	4d 63 c0             	movsxd r8,r8d
    7137:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    713b:	83 c0 06             	add    eax,0x6
    713e:	c3                   	ret
    713f:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    7145:	eb 9f                	jmp    70e6 <encode_cmp_imm+0x87>
    7147:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    714d:	eb 97                	jmp    70e6 <encode_cmp_imm+0x87>
    714f:	84 c9                	test   cl,cl
    7151:	74 09                	je     715c <encode_cmp_imm+0xfd>
    7153:	48 63 f0             	movsxd rsi,eax
    7156:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    7159:	8d 40 01             	lea    eax,[rax+0x1]
    715c:	80 fa 08             	cmp    dl,0x8
    715f:	74 1a                	je     717b <encode_cmp_imm+0x11c>
    7161:	8d 48 01             	lea    ecx,[rax+0x1]
    7164:	48 63 f0             	movsxd rsi,eax
    7167:	c6 04 37 3d          	mov    BYTE PTR [rdi+rsi*1],0x3d
    716b:	80 fa 10             	cmp    dl,0x10
    716e:	74 20                	je     7190 <encode_cmp_imm+0x131>
    7170:	48 63 c9             	movsxd rcx,ecx
    7173:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    7177:	83 c0 05             	add    eax,0x5
    717a:	c3                   	ret
    717b:	8d 50 01             	lea    edx,[rax+0x1]
    717e:	48 63 c8             	movsxd rcx,eax
    7181:	c6 04 0f 3c          	mov    BYTE PTR [rdi+rcx*1],0x3c
    7185:	83 c0 02             	add    eax,0x2
    7188:	48 63 d2             	movsxd rdx,edx
    718b:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    718f:	c3                   	ret
    7190:	48 63 c9             	movsxd rcx,ecx
    7193:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    7198:	83 c0 03             	add    eax,0x3
    719b:	c3                   	ret
    719c:	83 c0 03             	add    eax,0x3
    719f:	4d 63 c0             	movsxd r8,r8d
    71a2:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    71a6:	c3                   	ret
    71a7:	4d 63 c0             	movsxd r8,r8d
    71aa:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    71af:	83 c0 04             	add    eax,0x4
    71b2:	c3                   	ret
    71b3:	83 c0 03             	add    eax,0x3
    71b6:	4d 63 c0             	movsxd r8,r8d
    71b9:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    71bd:	c3                   	ret

00000000000071be <encode_cmp_reg_reg>:
    71be:	80 f9 08             	cmp    cl,0x8
    71c1:	74 64                	je     7227 <encode_cmp_reg_reg+0x69>
    71c3:	41 b9 39 00 00 00    	mov    r9d,0x39
    71c9:	40 80 fe 07          	cmp    sil,0x7
    71cd:	77 60                	ja     722f <encode_cmp_reg_reg+0x71>
    71cf:	41 b8 00 00 00 00    	mov    r8d,0x0
    71d5:	80 fa 07             	cmp    dl,0x7
    71d8:	76 04                	jbe    71de <encode_cmp_reg_reg+0x20>
    71da:	41 83 c8 44          	or     r8d,0x44
    71de:	80 f9 10             	cmp    cl,0x10
    71e1:	74 6d                	je     7250 <encode_cmp_reg_reg+0x92>
    71e3:	80 f9 40             	cmp    cl,0x40
    71e6:	74 72                	je     725a <encode_cmp_reg_reg+0x9c>
    71e8:	80 f9 08             	cmp    cl,0x8
    71eb:	74 4a                	je     7237 <encode_cmp_reg_reg+0x79>
    71ed:	b8 00 00 00 00       	mov    eax,0x0
    71f2:	0f b6 d2             	movzx  edx,dl
    71f5:	c1 e2 03             	shl    edx,0x3
    71f8:	83 e2 38             	and    edx,0x38
    71fb:	83 ca c0             	or     edx,0xffffffc0
    71fe:	83 e6 07             	and    esi,0x7
    7201:	09 d6                	or     esi,edx
    7203:	45 84 c0             	test   r8b,r8b
    7206:	74 0a                	je     7212 <encode_cmp_reg_reg+0x54>
    7208:	0f b6 d0             	movzx  edx,al
    720b:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    720f:	83 c0 01             	add    eax,0x1
    7212:	8d 50 01             	lea    edx,[rax+0x1]
    7215:	0f b6 c8             	movzx  ecx,al
    7218:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    721c:	83 c0 02             	add    eax,0x2
    721f:	0f b6 d2             	movzx  edx,dl
    7222:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7226:	c3                   	ret
    7227:	41 b9 38 00 00 00    	mov    r9d,0x38
    722d:	eb 9a                	jmp    71c9 <encode_cmp_reg_reg+0xb>
    722f:	41 b8 41 00 00 00    	mov    r8d,0x41
    7235:	eb 9e                	jmp    71d5 <encode_cmp_reg_reg+0x17>
    7237:	8d 46 fc             	lea    eax,[rsi-0x4]
    723a:	3c 03                	cmp    al,0x3
    723c:	76 07                	jbe    7245 <encode_cmp_reg_reg+0x87>
    723e:	8d 42 fc             	lea    eax,[rdx-0x4]
    7241:	3c 03                	cmp    al,0x3
    7243:	77 20                	ja     7265 <encode_cmp_reg_reg+0xa7>
    7245:	41 83 c8 40          	or     r8d,0x40
    7249:	b8 00 00 00 00       	mov    eax,0x0
    724e:	eb a2                	jmp    71f2 <encode_cmp_reg_reg+0x34>
    7250:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7253:	b8 01 00 00 00       	mov    eax,0x1
    7258:	eb 98                	jmp    71f2 <encode_cmp_reg_reg+0x34>
    725a:	41 83 c8 48          	or     r8d,0x48
    725e:	b8 00 00 00 00       	mov    eax,0x0
    7263:	eb 8d                	jmp    71f2 <encode_cmp_reg_reg+0x34>
    7265:	b8 00 00 00 00       	mov    eax,0x0
    726a:	eb 86                	jmp    71f2 <encode_cmp_reg_reg+0x34>

000000000000726c <encode_push_reg>:
    726c:	40 80 fe 07          	cmp    sil,0x7
    7270:	77 37                	ja     72a9 <encode_push_reg+0x3d>
    7272:	b9 00 00 00 00       	mov    ecx,0x0
    7277:	80 fa 10             	cmp    dl,0x10
    727a:	74 34                	je     72b0 <encode_push_reg+0x44>
    727c:	80 fa 20             	cmp    dl,0x20
    727f:	74 39                	je     72ba <encode_push_reg+0x4e>
    7281:	80 fa 08             	cmp    dl,0x8
    7284:	74 5f                	je     72e5 <encode_push_reg+0x79>
    7286:	b8 00 00 00 00       	mov    eax,0x0
    728b:	83 e6 07             	and    esi,0x7
    728e:	83 c6 50             	add    esi,0x50
    7291:	84 c9                	test   cl,cl
    7293:	74 09                	je     729e <encode_push_reg+0x32>
    7295:	48 63 d0             	movsxd rdx,eax
    7298:	88 0c 17             	mov    BYTE PTR [rdi+rdx*1],cl
    729b:	8d 40 01             	lea    eax,[rax+0x1]
    729e:	48 63 d0             	movsxd rdx,eax
    72a1:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    72a5:	83 c0 01             	add    eax,0x1
    72a8:	c3                   	ret
    72a9:	b9 41 00 00 00       	mov    ecx,0x41
    72ae:	eb c7                	jmp    7277 <encode_push_reg+0xb>
    72b0:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    72b3:	b8 01 00 00 00       	mov    eax,0x1
    72b8:	eb d1                	jmp    728b <encode_push_reg+0x1f>
    72ba:	48 83 ec 08          	sub    rsp,0x8
    72be:	48 8b 0d 1b 39 01 00 	mov    rcx,QWORD PTR [rip+0x1391b]        # 1abe0 <stderr@GLIBC_2.2.5>
    72c5:	ba 48 00 00 00       	mov    edx,0x48
    72ca:	be 01 00 00 00       	mov    esi,0x1
    72cf:	48 8d 3d c2 e6 00 00 	lea    rdi,[rip+0xe6c2]        # 15998 <_IO_stdin_used+0x998>
    72d6:	e8 05 bf ff ff       	call   31e0 <fwrite@plt>
    72db:	b8 00 00 00 00       	mov    eax,0x0
    72e0:	48 83 c4 08          	add    rsp,0x8
    72e4:	c3                   	ret
    72e5:	b8 00 00 00 00       	mov    eax,0x0
    72ea:	c3                   	ret

00000000000072eb <encode_pop_reg>:
    72eb:	40 80 fe 07          	cmp    sil,0x7
    72ef:	77 43                	ja     7334 <encode_pop_reg+0x49>
    72f1:	b9 00 00 00 00       	mov    ecx,0x0
    72f6:	80 fa 10             	cmp    dl,0x10
    72f9:	0f 84 8a 00 00 00    	je     7389 <encode_pop_reg+0x9e>
    72ff:	48 83 ec 08          	sub    rsp,0x8
    7303:	80 fa 20             	cmp    dl,0x20
    7306:	74 5a                	je     7362 <encode_pop_reg+0x77>
    7308:	80 fa 08             	cmp    dl,0x8
    730b:	74 2e                	je     733b <encode_pop_reg+0x50>
    730d:	b8 00 00 00 00       	mov    eax,0x0
    7312:	83 e6 07             	and    esi,0x7
    7315:	83 c6 58             	add    esi,0x58
    7318:	84 c9                	test   cl,cl
    731a:	74 09                	je     7325 <encode_pop_reg+0x3a>
    731c:	48 63 d0             	movsxd rdx,eax
    731f:	88 0c 17             	mov    BYTE PTR [rdi+rdx*1],cl
    7322:	8d 40 01             	lea    eax,[rax+0x1]
    7325:	48 63 d0             	movsxd rdx,eax
    7328:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    732c:	83 c0 01             	add    eax,0x1
    732f:	48 83 c4 08          	add    rsp,0x8
    7333:	c3                   	ret
    7334:	b9 41 00 00 00       	mov    ecx,0x41
    7339:	eb bb                	jmp    72f6 <encode_pop_reg+0xb>
    733b:	48 8b 0d 9e 38 01 00 	mov    rcx,QWORD PTR [rip+0x1389e]        # 1abe0 <stderr@GLIBC_2.2.5>
    7342:	ba 37 00 00 00       	mov    edx,0x37
    7347:	be 01 00 00 00       	mov    esi,0x1
    734c:	48 8d 3d 95 e6 00 00 	lea    rdi,[rip+0xe695]        # 159e8 <_IO_stdin_used+0x9e8>
    7353:	e8 88 be ff ff       	call   31e0 <fwrite@plt>
    7358:	bf 01 00 00 00       	mov    edi,0x1
    735d:	e8 6e be ff ff       	call   31d0 <exit@plt>
    7362:	48 8b 0d 77 38 01 00 	mov    rcx,QWORD PTR [rip+0x13877]        # 1abe0 <stderr@GLIBC_2.2.5>
    7369:	ba 47 00 00 00       	mov    edx,0x47
    736e:	be 01 00 00 00       	mov    esi,0x1
    7373:	48 8d 3d a6 e6 00 00 	lea    rdi,[rip+0xe6a6]        # 15a20 <_IO_stdin_used+0xa20>
    737a:	e8 61 be ff ff       	call   31e0 <fwrite@plt>
    737f:	bf 01 00 00 00       	mov    edi,0x1
    7384:	e8 47 be ff ff       	call   31d0 <exit@plt>
    7389:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    738c:	b8 01 00 00 00       	mov    eax,0x1
    7391:	83 e6 07             	and    esi,0x7
    7394:	83 c6 58             	add    esi,0x58
    7397:	84 c9                	test   cl,cl
    7399:	74 09                	je     73a4 <encode_pop_reg+0xb9>
    739b:	48 63 d0             	movsxd rdx,eax
    739e:	88 0c 17             	mov    BYTE PTR [rdi+rdx*1],cl
    73a1:	8d 40 01             	lea    eax,[rax+0x1]
    73a4:	48 63 d0             	movsxd rdx,eax
    73a7:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    73ab:	83 c0 01             	add    eax,0x1
    73ae:	c3                   	ret

00000000000073af <encode_xor_imm>:
    73af:	41 89 d1             	mov    r9d,edx
    73b2:	89 ca                	mov    edx,ecx
    73b4:	40 80 fe 07          	cmp    sil,0x7
    73b8:	77 43                	ja     73fd <encode_xor_imm+0x4e>
    73ba:	b9 00 00 00 00       	mov    ecx,0x0
    73bf:	80 fa 10             	cmp    dl,0x10
    73c2:	74 51                	je     7415 <encode_xor_imm+0x66>
    73c4:	80 fa 40             	cmp    dl,0x40
    73c7:	74 56                	je     741f <encode_xor_imm+0x70>
    73c9:	80 fa 08             	cmp    dl,0x8
    73cc:	74 36                	je     7404 <encode_xor_imm+0x55>
    73ce:	b8 00 00 00 00       	mov    eax,0x0
    73d3:	80 fa 08             	cmp    dl,0x8
    73d6:	74 58                	je     7430 <encode_xor_imm+0x81>
    73d8:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    73df:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    73e6:	0f 87 a6 00 00 00    	ja     7492 <encode_xor_imm+0xe3>
    73ec:	45 85 c0             	test   r8d,r8d
    73ef:	0f 84 a5 00 00 00    	je     749a <encode_xor_imm+0xeb>
    73f5:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    73fb:	eb 39                	jmp    7436 <encode_xor_imm+0x87>
    73fd:	b9 41 00 00 00       	mov    ecx,0x41
    7402:	eb bb                	jmp    73bf <encode_xor_imm+0x10>
    7404:	8d 46 fc             	lea    eax,[rsi-0x4]
    7407:	3c 03                	cmp    al,0x3
    7409:	77 1e                	ja     7429 <encode_xor_imm+0x7a>
    740b:	83 c9 40             	or     ecx,0x40
    740e:	b8 00 00 00 00       	mov    eax,0x0
    7413:	eb be                	jmp    73d3 <encode_xor_imm+0x24>
    7415:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7418:	b8 01 00 00 00       	mov    eax,0x1
    741d:	eb b4                	jmp    73d3 <encode_xor_imm+0x24>
    741f:	83 c9 48             	or     ecx,0x48
    7422:	b8 00 00 00 00       	mov    eax,0x0
    7427:	eb aa                	jmp    73d3 <encode_xor_imm+0x24>
    7429:	b8 00 00 00 00       	mov    eax,0x0
    742e:	eb a3                	jmp    73d3 <encode_xor_imm+0x24>
    7430:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    7436:	40 84 f6             	test   sil,sil
    7439:	74 67                	je     74a2 <encode_xor_imm+0xf3>
    743b:	83 e6 07             	and    esi,0x7
    743e:	83 ce f0             	or     esi,0xfffffff0
    7441:	84 c9                	test   cl,cl
    7443:	74 0a                	je     744f <encode_xor_imm+0xa0>
    7445:	4c 63 c0             	movsxd r8,eax
    7448:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    744c:	8d 40 01             	lea    eax,[rax+0x1]
    744f:	8d 48 01             	lea    ecx,[rax+0x1]
    7452:	4c 63 c0             	movsxd r8,eax
    7455:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    7459:	44 8d 40 02          	lea    r8d,[rax+0x2]
    745d:	48 63 c9             	movsxd rcx,ecx
    7460:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7464:	41 80 fa 83          	cmp    r10b,0x83
    7468:	0f 84 81 00 00 00    	je     74ef <encode_xor_imm+0x140>
    746e:	80 fa 10             	cmp    dl,0x10
    7471:	0f 84 83 00 00 00    	je     74fa <encode_xor_imm+0x14b>
    7477:	80 fa 20             	cmp    dl,0x20
    747a:	0f 94 c1             	sete   cl
    747d:	80 fa 40             	cmp    dl,0x40
    7480:	0f 94 c2             	sete   dl
    7483:	08 d1                	or     cl,dl
    7485:	74 7f                	je     7506 <encode_xor_imm+0x157>
    7487:	4d 63 c0             	movsxd r8,r8d
    748a:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    748e:	83 c0 06             	add    eax,0x6
    7491:	c3                   	ret
    7492:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    7498:	eb 9c                	jmp    7436 <encode_xor_imm+0x87>
    749a:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    74a0:	eb 94                	jmp    7436 <encode_xor_imm+0x87>
    74a2:	84 c9                	test   cl,cl
    74a4:	74 09                	je     74af <encode_xor_imm+0x100>
    74a6:	48 63 f0             	movsxd rsi,eax
    74a9:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    74ac:	8d 40 01             	lea    eax,[rax+0x1]
    74af:	80 fa 08             	cmp    dl,0x8
    74b2:	74 1a                	je     74ce <encode_xor_imm+0x11f>
    74b4:	8d 48 01             	lea    ecx,[rax+0x1]
    74b7:	48 63 f0             	movsxd rsi,eax
    74ba:	c6 04 37 35          	mov    BYTE PTR [rdi+rsi*1],0x35
    74be:	80 fa 10             	cmp    dl,0x10
    74c1:	74 20                	je     74e3 <encode_xor_imm+0x134>
    74c3:	48 63 c9             	movsxd rcx,ecx
    74c6:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    74ca:	83 c0 05             	add    eax,0x5
    74cd:	c3                   	ret
    74ce:	8d 50 01             	lea    edx,[rax+0x1]
    74d1:	48 63 c8             	movsxd rcx,eax
    74d4:	c6 04 0f 34          	mov    BYTE PTR [rdi+rcx*1],0x34
    74d8:	83 c0 02             	add    eax,0x2
    74db:	48 63 d2             	movsxd rdx,edx
    74de:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    74e2:	c3                   	ret
    74e3:	48 63 c9             	movsxd rcx,ecx
    74e6:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    74eb:	83 c0 03             	add    eax,0x3
    74ee:	c3                   	ret
    74ef:	83 c0 03             	add    eax,0x3
    74f2:	4d 63 c0             	movsxd r8,r8d
    74f5:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    74f9:	c3                   	ret
    74fa:	4d 63 c0             	movsxd r8,r8d
    74fd:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    7502:	83 c0 04             	add    eax,0x4
    7505:	c3                   	ret
    7506:	83 c0 03             	add    eax,0x3
    7509:	4d 63 c0             	movsxd r8,r8d
    750c:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7510:	c3                   	ret

0000000000007511 <encode_xor_reg_reg>:
    7511:	80 f9 08             	cmp    cl,0x8
    7514:	74 64                	je     757a <encode_xor_reg_reg+0x69>
    7516:	41 b9 31 00 00 00    	mov    r9d,0x31
    751c:	40 80 fe 07          	cmp    sil,0x7
    7520:	77 60                	ja     7582 <encode_xor_reg_reg+0x71>
    7522:	41 b8 00 00 00 00    	mov    r8d,0x0
    7528:	80 fa 07             	cmp    dl,0x7
    752b:	76 04                	jbe    7531 <encode_xor_reg_reg+0x20>
    752d:	41 83 c8 44          	or     r8d,0x44
    7531:	80 f9 10             	cmp    cl,0x10
    7534:	74 6d                	je     75a3 <encode_xor_reg_reg+0x92>
    7536:	80 f9 40             	cmp    cl,0x40
    7539:	74 72                	je     75ad <encode_xor_reg_reg+0x9c>
    753b:	80 f9 08             	cmp    cl,0x8
    753e:	74 4a                	je     758a <encode_xor_reg_reg+0x79>
    7540:	b8 00 00 00 00       	mov    eax,0x0
    7545:	0f b6 d2             	movzx  edx,dl
    7548:	c1 e2 03             	shl    edx,0x3
    754b:	83 e2 38             	and    edx,0x38
    754e:	83 ca c0             	or     edx,0xffffffc0
    7551:	83 e6 07             	and    esi,0x7
    7554:	09 d6                	or     esi,edx
    7556:	45 84 c0             	test   r8b,r8b
    7559:	74 0a                	je     7565 <encode_xor_reg_reg+0x54>
    755b:	0f b6 d0             	movzx  edx,al
    755e:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    7562:	83 c0 01             	add    eax,0x1
    7565:	8d 50 01             	lea    edx,[rax+0x1]
    7568:	0f b6 c8             	movzx  ecx,al
    756b:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    756f:	83 c0 02             	add    eax,0x2
    7572:	0f b6 d2             	movzx  edx,dl
    7575:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7579:	c3                   	ret
    757a:	41 b9 30 00 00 00    	mov    r9d,0x30
    7580:	eb 9a                	jmp    751c <encode_xor_reg_reg+0xb>
    7582:	41 b8 41 00 00 00    	mov    r8d,0x41
    7588:	eb 9e                	jmp    7528 <encode_xor_reg_reg+0x17>
    758a:	8d 46 fc             	lea    eax,[rsi-0x4]
    758d:	3c 03                	cmp    al,0x3
    758f:	76 07                	jbe    7598 <encode_xor_reg_reg+0x87>
    7591:	8d 42 fc             	lea    eax,[rdx-0x4]
    7594:	3c 03                	cmp    al,0x3
    7596:	77 20                	ja     75b8 <encode_xor_reg_reg+0xa7>
    7598:	41 83 c8 40          	or     r8d,0x40
    759c:	b8 00 00 00 00       	mov    eax,0x0
    75a1:	eb a2                	jmp    7545 <encode_xor_reg_reg+0x34>
    75a3:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    75a6:	b8 01 00 00 00       	mov    eax,0x1
    75ab:	eb 98                	jmp    7545 <encode_xor_reg_reg+0x34>
    75ad:	41 83 c8 48          	or     r8d,0x48
    75b1:	b8 00 00 00 00       	mov    eax,0x0
    75b6:	eb 8d                	jmp    7545 <encode_xor_reg_reg+0x34>
    75b8:	b8 00 00 00 00       	mov    eax,0x0
    75bd:	eb 86                	jmp    7545 <encode_xor_reg_reg+0x34>

00000000000075bf <encode_adc_imm>:
    75bf:	41 89 d1             	mov    r9d,edx
    75c2:	89 ca                	mov    edx,ecx
    75c4:	40 80 fe 07          	cmp    sil,0x7
    75c8:	77 43                	ja     760d <encode_adc_imm+0x4e>
    75ca:	b9 00 00 00 00       	mov    ecx,0x0
    75cf:	80 fa 10             	cmp    dl,0x10
    75d2:	74 51                	je     7625 <encode_adc_imm+0x66>
    75d4:	80 fa 40             	cmp    dl,0x40
    75d7:	74 56                	je     762f <encode_adc_imm+0x70>
    75d9:	80 fa 08             	cmp    dl,0x8
    75dc:	74 36                	je     7614 <encode_adc_imm+0x55>
    75de:	b8 00 00 00 00       	mov    eax,0x0
    75e3:	80 fa 08             	cmp    dl,0x8
    75e6:	74 58                	je     7640 <encode_adc_imm+0x81>
    75e8:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    75ef:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    75f6:	0f 87 a6 00 00 00    	ja     76a2 <encode_adc_imm+0xe3>
    75fc:	45 85 c0             	test   r8d,r8d
    75ff:	0f 84 a5 00 00 00    	je     76aa <encode_adc_imm+0xeb>
    7605:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    760b:	eb 39                	jmp    7646 <encode_adc_imm+0x87>
    760d:	b9 41 00 00 00       	mov    ecx,0x41
    7612:	eb bb                	jmp    75cf <encode_adc_imm+0x10>
    7614:	8d 46 fc             	lea    eax,[rsi-0x4]
    7617:	3c 03                	cmp    al,0x3
    7619:	77 1e                	ja     7639 <encode_adc_imm+0x7a>
    761b:	83 c9 40             	or     ecx,0x40
    761e:	b8 00 00 00 00       	mov    eax,0x0
    7623:	eb be                	jmp    75e3 <encode_adc_imm+0x24>
    7625:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7628:	b8 01 00 00 00       	mov    eax,0x1
    762d:	eb b4                	jmp    75e3 <encode_adc_imm+0x24>
    762f:	83 c9 48             	or     ecx,0x48
    7632:	b8 00 00 00 00       	mov    eax,0x0
    7637:	eb aa                	jmp    75e3 <encode_adc_imm+0x24>
    7639:	b8 00 00 00 00       	mov    eax,0x0
    763e:	eb a3                	jmp    75e3 <encode_adc_imm+0x24>
    7640:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    7646:	40 84 f6             	test   sil,sil
    7649:	74 67                	je     76b2 <encode_adc_imm+0xf3>
    764b:	83 e6 07             	and    esi,0x7
    764e:	83 ce d0             	or     esi,0xffffffd0
    7651:	84 c9                	test   cl,cl
    7653:	74 0a                	je     765f <encode_adc_imm+0xa0>
    7655:	4c 63 c0             	movsxd r8,eax
    7658:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    765c:	8d 40 01             	lea    eax,[rax+0x1]
    765f:	8d 48 01             	lea    ecx,[rax+0x1]
    7662:	4c 63 c0             	movsxd r8,eax
    7665:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    7669:	44 8d 40 02          	lea    r8d,[rax+0x2]
    766d:	48 63 c9             	movsxd rcx,ecx
    7670:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7674:	41 80 fa 83          	cmp    r10b,0x83
    7678:	0f 84 81 00 00 00    	je     76ff <encode_adc_imm+0x140>
    767e:	80 fa 10             	cmp    dl,0x10
    7681:	0f 84 83 00 00 00    	je     770a <encode_adc_imm+0x14b>
    7687:	80 fa 20             	cmp    dl,0x20
    768a:	0f 94 c1             	sete   cl
    768d:	80 fa 40             	cmp    dl,0x40
    7690:	0f 94 c2             	sete   dl
    7693:	08 d1                	or     cl,dl
    7695:	74 7f                	je     7716 <encode_adc_imm+0x157>
    7697:	4d 63 c0             	movsxd r8,r8d
    769a:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    769e:	83 c0 06             	add    eax,0x6
    76a1:	c3                   	ret
    76a2:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    76a8:	eb 9c                	jmp    7646 <encode_adc_imm+0x87>
    76aa:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    76b0:	eb 94                	jmp    7646 <encode_adc_imm+0x87>
    76b2:	84 c9                	test   cl,cl
    76b4:	74 09                	je     76bf <encode_adc_imm+0x100>
    76b6:	48 63 f0             	movsxd rsi,eax
    76b9:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    76bc:	8d 40 01             	lea    eax,[rax+0x1]
    76bf:	80 fa 08             	cmp    dl,0x8
    76c2:	74 1a                	je     76de <encode_adc_imm+0x11f>
    76c4:	8d 48 01             	lea    ecx,[rax+0x1]
    76c7:	48 63 f0             	movsxd rsi,eax
    76ca:	c6 04 37 15          	mov    BYTE PTR [rdi+rsi*1],0x15
    76ce:	80 fa 10             	cmp    dl,0x10
    76d1:	74 20                	je     76f3 <encode_adc_imm+0x134>
    76d3:	48 63 c9             	movsxd rcx,ecx
    76d6:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    76da:	83 c0 05             	add    eax,0x5
    76dd:	c3                   	ret
    76de:	8d 50 01             	lea    edx,[rax+0x1]
    76e1:	48 63 c8             	movsxd rcx,eax
    76e4:	c6 04 0f 14          	mov    BYTE PTR [rdi+rcx*1],0x14
    76e8:	83 c0 02             	add    eax,0x2
    76eb:	48 63 d2             	movsxd rdx,edx
    76ee:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    76f2:	c3                   	ret
    76f3:	48 63 c9             	movsxd rcx,ecx
    76f6:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    76fb:	83 c0 03             	add    eax,0x3
    76fe:	c3                   	ret
    76ff:	83 c0 03             	add    eax,0x3
    7702:	4d 63 c0             	movsxd r8,r8d
    7705:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7709:	c3                   	ret
    770a:	4d 63 c0             	movsxd r8,r8d
    770d:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    7712:	83 c0 04             	add    eax,0x4
    7715:	c3                   	ret
    7716:	83 c0 03             	add    eax,0x3
    7719:	4d 63 c0             	movsxd r8,r8d
    771c:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7720:	c3                   	ret

0000000000007721 <encode_adc_reg_reg>:
    7721:	80 f9 08             	cmp    cl,0x8
    7724:	74 64                	je     778a <encode_adc_reg_reg+0x69>
    7726:	41 b9 11 00 00 00    	mov    r9d,0x11
    772c:	40 80 fe 07          	cmp    sil,0x7
    7730:	77 60                	ja     7792 <encode_adc_reg_reg+0x71>
    7732:	41 b8 00 00 00 00    	mov    r8d,0x0
    7738:	80 fa 07             	cmp    dl,0x7
    773b:	76 04                	jbe    7741 <encode_adc_reg_reg+0x20>
    773d:	41 83 c8 44          	or     r8d,0x44
    7741:	80 f9 10             	cmp    cl,0x10
    7744:	74 6d                	je     77b3 <encode_adc_reg_reg+0x92>
    7746:	80 f9 40             	cmp    cl,0x40
    7749:	74 72                	je     77bd <encode_adc_reg_reg+0x9c>
    774b:	80 f9 08             	cmp    cl,0x8
    774e:	74 4a                	je     779a <encode_adc_reg_reg+0x79>
    7750:	b8 00 00 00 00       	mov    eax,0x0
    7755:	0f b6 d2             	movzx  edx,dl
    7758:	c1 e2 03             	shl    edx,0x3
    775b:	83 e2 38             	and    edx,0x38
    775e:	83 ca c0             	or     edx,0xffffffc0
    7761:	83 e6 07             	and    esi,0x7
    7764:	09 d6                	or     esi,edx
    7766:	45 84 c0             	test   r8b,r8b
    7769:	74 0a                	je     7775 <encode_adc_reg_reg+0x54>
    776b:	0f b6 d0             	movzx  edx,al
    776e:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    7772:	83 c0 01             	add    eax,0x1
    7775:	8d 50 01             	lea    edx,[rax+0x1]
    7778:	0f b6 c8             	movzx  ecx,al
    777b:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    777f:	83 c0 02             	add    eax,0x2
    7782:	0f b6 d2             	movzx  edx,dl
    7785:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7789:	c3                   	ret
    778a:	41 b9 10 00 00 00    	mov    r9d,0x10
    7790:	eb 9a                	jmp    772c <encode_adc_reg_reg+0xb>
    7792:	41 b8 41 00 00 00    	mov    r8d,0x41
    7798:	eb 9e                	jmp    7738 <encode_adc_reg_reg+0x17>
    779a:	8d 46 fc             	lea    eax,[rsi-0x4]
    779d:	3c 03                	cmp    al,0x3
    779f:	76 07                	jbe    77a8 <encode_adc_reg_reg+0x87>
    77a1:	8d 42 fc             	lea    eax,[rdx-0x4]
    77a4:	3c 03                	cmp    al,0x3
    77a6:	77 20                	ja     77c8 <encode_adc_reg_reg+0xa7>
    77a8:	41 83 c8 40          	or     r8d,0x40
    77ac:	b8 00 00 00 00       	mov    eax,0x0
    77b1:	eb a2                	jmp    7755 <encode_adc_reg_reg+0x34>
    77b3:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    77b6:	b8 01 00 00 00       	mov    eax,0x1
    77bb:	eb 98                	jmp    7755 <encode_adc_reg_reg+0x34>
    77bd:	41 83 c8 48          	or     r8d,0x48
    77c1:	b8 00 00 00 00       	mov    eax,0x0
    77c6:	eb 8d                	jmp    7755 <encode_adc_reg_reg+0x34>
    77c8:	b8 00 00 00 00       	mov    eax,0x0
    77cd:	eb 86                	jmp    7755 <encode_adc_reg_reg+0x34>

00000000000077cf <encode_or_imm>:
    77cf:	41 89 d1             	mov    r9d,edx
    77d2:	89 ca                	mov    edx,ecx
    77d4:	40 80 fe 07          	cmp    sil,0x7
    77d8:	77 43                	ja     781d <encode_or_imm+0x4e>
    77da:	b9 00 00 00 00       	mov    ecx,0x0
    77df:	80 fa 10             	cmp    dl,0x10
    77e2:	74 51                	je     7835 <encode_or_imm+0x66>
    77e4:	80 fa 40             	cmp    dl,0x40
    77e7:	74 56                	je     783f <encode_or_imm+0x70>
    77e9:	80 fa 08             	cmp    dl,0x8
    77ec:	74 36                	je     7824 <encode_or_imm+0x55>
    77ee:	b8 00 00 00 00       	mov    eax,0x0
    77f3:	80 fa 08             	cmp    dl,0x8
    77f6:	74 58                	je     7850 <encode_or_imm+0x81>
    77f8:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    77ff:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    7806:	0f 87 a6 00 00 00    	ja     78b2 <encode_or_imm+0xe3>
    780c:	45 85 c0             	test   r8d,r8d
    780f:	0f 84 a5 00 00 00    	je     78ba <encode_or_imm+0xeb>
    7815:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    781b:	eb 39                	jmp    7856 <encode_or_imm+0x87>
    781d:	b9 41 00 00 00       	mov    ecx,0x41
    7822:	eb bb                	jmp    77df <encode_or_imm+0x10>
    7824:	8d 46 fc             	lea    eax,[rsi-0x4]
    7827:	3c 03                	cmp    al,0x3
    7829:	77 1e                	ja     7849 <encode_or_imm+0x7a>
    782b:	83 c9 40             	or     ecx,0x40
    782e:	b8 00 00 00 00       	mov    eax,0x0
    7833:	eb be                	jmp    77f3 <encode_or_imm+0x24>
    7835:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7838:	b8 01 00 00 00       	mov    eax,0x1
    783d:	eb b4                	jmp    77f3 <encode_or_imm+0x24>
    783f:	83 c9 48             	or     ecx,0x48
    7842:	b8 00 00 00 00       	mov    eax,0x0
    7847:	eb aa                	jmp    77f3 <encode_or_imm+0x24>
    7849:	b8 00 00 00 00       	mov    eax,0x0
    784e:	eb a3                	jmp    77f3 <encode_or_imm+0x24>
    7850:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    7856:	40 84 f6             	test   sil,sil
    7859:	74 67                	je     78c2 <encode_or_imm+0xf3>
    785b:	83 e6 07             	and    esi,0x7
    785e:	83 ce c8             	or     esi,0xffffffc8
    7861:	84 c9                	test   cl,cl
    7863:	74 0a                	je     786f <encode_or_imm+0xa0>
    7865:	4c 63 c0             	movsxd r8,eax
    7868:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    786c:	8d 40 01             	lea    eax,[rax+0x1]
    786f:	8d 48 01             	lea    ecx,[rax+0x1]
    7872:	4c 63 c0             	movsxd r8,eax
    7875:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    7879:	44 8d 40 02          	lea    r8d,[rax+0x2]
    787d:	48 63 c9             	movsxd rcx,ecx
    7880:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7884:	41 80 fa 83          	cmp    r10b,0x83
    7888:	0f 84 81 00 00 00    	je     790f <encode_or_imm+0x140>
    788e:	80 fa 10             	cmp    dl,0x10
    7891:	0f 84 83 00 00 00    	je     791a <encode_or_imm+0x14b>
    7897:	80 fa 20             	cmp    dl,0x20
    789a:	0f 94 c1             	sete   cl
    789d:	80 fa 40             	cmp    dl,0x40
    78a0:	0f 94 c2             	sete   dl
    78a3:	08 d1                	or     cl,dl
    78a5:	74 7f                	je     7926 <encode_or_imm+0x157>
    78a7:	4d 63 c0             	movsxd r8,r8d
    78aa:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    78ae:	83 c0 06             	add    eax,0x6
    78b1:	c3                   	ret
    78b2:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    78b8:	eb 9c                	jmp    7856 <encode_or_imm+0x87>
    78ba:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    78c0:	eb 94                	jmp    7856 <encode_or_imm+0x87>
    78c2:	84 c9                	test   cl,cl
    78c4:	74 09                	je     78cf <encode_or_imm+0x100>
    78c6:	48 63 f0             	movsxd rsi,eax
    78c9:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    78cc:	8d 40 01             	lea    eax,[rax+0x1]
    78cf:	80 fa 08             	cmp    dl,0x8
    78d2:	74 1a                	je     78ee <encode_or_imm+0x11f>
    78d4:	8d 48 01             	lea    ecx,[rax+0x1]
    78d7:	48 63 f0             	movsxd rsi,eax
    78da:	c6 04 37 0d          	mov    BYTE PTR [rdi+rsi*1],0xd
    78de:	80 fa 10             	cmp    dl,0x10
    78e1:	74 20                	je     7903 <encode_or_imm+0x134>
    78e3:	48 63 c9             	movsxd rcx,ecx
    78e6:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    78ea:	83 c0 05             	add    eax,0x5
    78ed:	c3                   	ret
    78ee:	8d 50 01             	lea    edx,[rax+0x1]
    78f1:	48 63 c8             	movsxd rcx,eax
    78f4:	c6 04 0f 0c          	mov    BYTE PTR [rdi+rcx*1],0xc
    78f8:	83 c0 02             	add    eax,0x2
    78fb:	48 63 d2             	movsxd rdx,edx
    78fe:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    7902:	c3                   	ret
    7903:	48 63 c9             	movsxd rcx,ecx
    7906:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    790b:	83 c0 03             	add    eax,0x3
    790e:	c3                   	ret
    790f:	83 c0 03             	add    eax,0x3
    7912:	4d 63 c0             	movsxd r8,r8d
    7915:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7919:	c3                   	ret
    791a:	4d 63 c0             	movsxd r8,r8d
    791d:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    7922:	83 c0 04             	add    eax,0x4
    7925:	c3                   	ret
    7926:	83 c0 03             	add    eax,0x3
    7929:	4d 63 c0             	movsxd r8,r8d
    792c:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7930:	c3                   	ret

0000000000007931 <encode_or_reg_reg>:
    7931:	80 f9 08             	cmp    cl,0x8
    7934:	74 64                	je     799a <encode_or_reg_reg+0x69>
    7936:	41 b9 09 00 00 00    	mov    r9d,0x9
    793c:	40 80 fe 07          	cmp    sil,0x7
    7940:	77 5d                	ja     799f <encode_or_reg_reg+0x6e>
    7942:	41 b8 00 00 00 00    	mov    r8d,0x0
    7948:	80 fa 07             	cmp    dl,0x7
    794b:	76 04                	jbe    7951 <encode_or_reg_reg+0x20>
    794d:	41 83 c8 44          	or     r8d,0x44
    7951:	80 f9 10             	cmp    cl,0x10
    7954:	74 6a                	je     79c0 <encode_or_reg_reg+0x8f>
    7956:	80 f9 40             	cmp    cl,0x40
    7959:	74 6f                	je     79ca <encode_or_reg_reg+0x99>
    795b:	80 f9 08             	cmp    cl,0x8
    795e:	74 47                	je     79a7 <encode_or_reg_reg+0x76>
    7960:	b8 00 00 00 00       	mov    eax,0x0
    7965:	0f b6 d2             	movzx  edx,dl
    7968:	c1 e2 03             	shl    edx,0x3
    796b:	83 e2 38             	and    edx,0x38
    796e:	83 ca c0             	or     edx,0xffffffc0
    7971:	83 e6 07             	and    esi,0x7
    7974:	09 d6                	or     esi,edx
    7976:	45 84 c0             	test   r8b,r8b
    7979:	74 0a                	je     7985 <encode_or_reg_reg+0x54>
    797b:	0f b6 d0             	movzx  edx,al
    797e:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    7982:	83 c0 01             	add    eax,0x1
    7985:	8d 50 01             	lea    edx,[rax+0x1]
    7988:	0f b6 c8             	movzx  ecx,al
    798b:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    798f:	83 c0 02             	add    eax,0x2
    7992:	0f b6 d2             	movzx  edx,dl
    7995:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7999:	c3                   	ret
    799a:	41 89 c9             	mov    r9d,ecx
    799d:	eb 9d                	jmp    793c <encode_or_reg_reg+0xb>
    799f:	41 b8 41 00 00 00    	mov    r8d,0x41
    79a5:	eb a1                	jmp    7948 <encode_or_reg_reg+0x17>
    79a7:	8d 46 fc             	lea    eax,[rsi-0x4]
    79aa:	3c 03                	cmp    al,0x3
    79ac:	76 07                	jbe    79b5 <encode_or_reg_reg+0x84>
    79ae:	8d 42 fc             	lea    eax,[rdx-0x4]
    79b1:	3c 03                	cmp    al,0x3
    79b3:	77 20                	ja     79d5 <encode_or_reg_reg+0xa4>
    79b5:	41 83 c8 40          	or     r8d,0x40
    79b9:	b8 00 00 00 00       	mov    eax,0x0
    79be:	eb a5                	jmp    7965 <encode_or_reg_reg+0x34>
    79c0:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    79c3:	b8 01 00 00 00       	mov    eax,0x1
    79c8:	eb 9b                	jmp    7965 <encode_or_reg_reg+0x34>
    79ca:	41 83 c8 48          	or     r8d,0x48
    79ce:	b8 00 00 00 00       	mov    eax,0x0
    79d3:	eb 90                	jmp    7965 <encode_or_reg_reg+0x34>
    79d5:	b8 00 00 00 00       	mov    eax,0x0
    79da:	eb 89                	jmp    7965 <encode_or_reg_reg+0x34>

00000000000079dc <encode_sbb_imm>:
    79dc:	41 89 d1             	mov    r9d,edx
    79df:	89 ca                	mov    edx,ecx
    79e1:	40 80 fe 07          	cmp    sil,0x7
    79e5:	77 43                	ja     7a2a <encode_sbb_imm+0x4e>
    79e7:	b9 00 00 00 00       	mov    ecx,0x0
    79ec:	80 fa 10             	cmp    dl,0x10
    79ef:	74 51                	je     7a42 <encode_sbb_imm+0x66>
    79f1:	80 fa 40             	cmp    dl,0x40
    79f4:	74 56                	je     7a4c <encode_sbb_imm+0x70>
    79f6:	80 fa 08             	cmp    dl,0x8
    79f9:	74 36                	je     7a31 <encode_sbb_imm+0x55>
    79fb:	b8 00 00 00 00       	mov    eax,0x0
    7a00:	80 fa 08             	cmp    dl,0x8
    7a03:	74 58                	je     7a5d <encode_sbb_imm+0x81>
    7a05:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    7a0c:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    7a13:	0f 87 a6 00 00 00    	ja     7abf <encode_sbb_imm+0xe3>
    7a19:	45 85 c0             	test   r8d,r8d
    7a1c:	0f 84 a5 00 00 00    	je     7ac7 <encode_sbb_imm+0xeb>
    7a22:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    7a28:	eb 39                	jmp    7a63 <encode_sbb_imm+0x87>
    7a2a:	b9 41 00 00 00       	mov    ecx,0x41
    7a2f:	eb bb                	jmp    79ec <encode_sbb_imm+0x10>
    7a31:	8d 46 fc             	lea    eax,[rsi-0x4]
    7a34:	3c 03                	cmp    al,0x3
    7a36:	77 1e                	ja     7a56 <encode_sbb_imm+0x7a>
    7a38:	83 c9 40             	or     ecx,0x40
    7a3b:	b8 00 00 00 00       	mov    eax,0x0
    7a40:	eb be                	jmp    7a00 <encode_sbb_imm+0x24>
    7a42:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7a45:	b8 01 00 00 00       	mov    eax,0x1
    7a4a:	eb b4                	jmp    7a00 <encode_sbb_imm+0x24>
    7a4c:	83 c9 48             	or     ecx,0x48
    7a4f:	b8 00 00 00 00       	mov    eax,0x0
    7a54:	eb aa                	jmp    7a00 <encode_sbb_imm+0x24>
    7a56:	b8 00 00 00 00       	mov    eax,0x0
    7a5b:	eb a3                	jmp    7a00 <encode_sbb_imm+0x24>
    7a5d:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    7a63:	40 84 f6             	test   sil,sil
    7a66:	74 67                	je     7acf <encode_sbb_imm+0xf3>
    7a68:	83 e6 07             	and    esi,0x7
    7a6b:	83 ce d8             	or     esi,0xffffffd8
    7a6e:	84 c9                	test   cl,cl
    7a70:	74 0a                	je     7a7c <encode_sbb_imm+0xa0>
    7a72:	4c 63 c0             	movsxd r8,eax
    7a75:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    7a79:	8d 40 01             	lea    eax,[rax+0x1]
    7a7c:	8d 48 01             	lea    ecx,[rax+0x1]
    7a7f:	4c 63 c0             	movsxd r8,eax
    7a82:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    7a86:	44 8d 40 02          	lea    r8d,[rax+0x2]
    7a8a:	48 63 c9             	movsxd rcx,ecx
    7a8d:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7a91:	41 80 fa 83          	cmp    r10b,0x83
    7a95:	0f 84 81 00 00 00    	je     7b1c <encode_sbb_imm+0x140>
    7a9b:	80 fa 10             	cmp    dl,0x10
    7a9e:	0f 84 83 00 00 00    	je     7b27 <encode_sbb_imm+0x14b>
    7aa4:	80 fa 20             	cmp    dl,0x20
    7aa7:	0f 94 c1             	sete   cl
    7aaa:	80 fa 40             	cmp    dl,0x40
    7aad:	0f 94 c2             	sete   dl
    7ab0:	08 d1                	or     cl,dl
    7ab2:	74 7f                	je     7b33 <encode_sbb_imm+0x157>
    7ab4:	4d 63 c0             	movsxd r8,r8d
    7ab7:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    7abb:	83 c0 06             	add    eax,0x6
    7abe:	c3                   	ret
    7abf:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    7ac5:	eb 9c                	jmp    7a63 <encode_sbb_imm+0x87>
    7ac7:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    7acd:	eb 94                	jmp    7a63 <encode_sbb_imm+0x87>
    7acf:	84 c9                	test   cl,cl
    7ad1:	74 09                	je     7adc <encode_sbb_imm+0x100>
    7ad3:	48 63 f0             	movsxd rsi,eax
    7ad6:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    7ad9:	8d 40 01             	lea    eax,[rax+0x1]
    7adc:	80 fa 08             	cmp    dl,0x8
    7adf:	74 1a                	je     7afb <encode_sbb_imm+0x11f>
    7ae1:	8d 48 01             	lea    ecx,[rax+0x1]
    7ae4:	48 63 f0             	movsxd rsi,eax
    7ae7:	c6 04 37 1d          	mov    BYTE PTR [rdi+rsi*1],0x1d
    7aeb:	80 fa 10             	cmp    dl,0x10
    7aee:	74 20                	je     7b10 <encode_sbb_imm+0x134>
    7af0:	48 63 c9             	movsxd rcx,ecx
    7af3:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    7af7:	83 c0 05             	add    eax,0x5
    7afa:	c3                   	ret
    7afb:	8d 50 01             	lea    edx,[rax+0x1]
    7afe:	48 63 c8             	movsxd rcx,eax
    7b01:	c6 04 0f 1c          	mov    BYTE PTR [rdi+rcx*1],0x1c
    7b05:	83 c0 02             	add    eax,0x2
    7b08:	48 63 d2             	movsxd rdx,edx
    7b0b:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    7b0f:	c3                   	ret
    7b10:	48 63 c9             	movsxd rcx,ecx
    7b13:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    7b18:	83 c0 03             	add    eax,0x3
    7b1b:	c3                   	ret
    7b1c:	83 c0 03             	add    eax,0x3
    7b1f:	4d 63 c0             	movsxd r8,r8d
    7b22:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7b26:	c3                   	ret
    7b27:	4d 63 c0             	movsxd r8,r8d
    7b2a:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    7b2f:	83 c0 04             	add    eax,0x4
    7b32:	c3                   	ret
    7b33:	83 c0 03             	add    eax,0x3
    7b36:	4d 63 c0             	movsxd r8,r8d
    7b39:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7b3d:	c3                   	ret

0000000000007b3e <encode_sbb_reg_reg>:
    7b3e:	80 f9 08             	cmp    cl,0x8
    7b41:	74 64                	je     7ba7 <encode_sbb_reg_reg+0x69>
    7b43:	41 b9 19 00 00 00    	mov    r9d,0x19
    7b49:	40 80 fe 07          	cmp    sil,0x7
    7b4d:	77 60                	ja     7baf <encode_sbb_reg_reg+0x71>
    7b4f:	41 b8 00 00 00 00    	mov    r8d,0x0
    7b55:	80 fa 07             	cmp    dl,0x7
    7b58:	76 04                	jbe    7b5e <encode_sbb_reg_reg+0x20>
    7b5a:	41 83 c8 44          	or     r8d,0x44
    7b5e:	80 f9 10             	cmp    cl,0x10
    7b61:	74 6d                	je     7bd0 <encode_sbb_reg_reg+0x92>
    7b63:	80 f9 40             	cmp    cl,0x40
    7b66:	74 72                	je     7bda <encode_sbb_reg_reg+0x9c>
    7b68:	80 f9 08             	cmp    cl,0x8
    7b6b:	74 4a                	je     7bb7 <encode_sbb_reg_reg+0x79>
    7b6d:	b8 00 00 00 00       	mov    eax,0x0
    7b72:	0f b6 d2             	movzx  edx,dl
    7b75:	c1 e2 03             	shl    edx,0x3
    7b78:	83 e2 38             	and    edx,0x38
    7b7b:	83 ca c0             	or     edx,0xffffffc0
    7b7e:	83 e6 07             	and    esi,0x7
    7b81:	09 d6                	or     esi,edx
    7b83:	45 84 c0             	test   r8b,r8b
    7b86:	74 0a                	je     7b92 <encode_sbb_reg_reg+0x54>
    7b88:	0f b6 d0             	movzx  edx,al
    7b8b:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    7b8f:	83 c0 01             	add    eax,0x1
    7b92:	8d 50 01             	lea    edx,[rax+0x1]
    7b95:	0f b6 c8             	movzx  ecx,al
    7b98:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    7b9c:	83 c0 02             	add    eax,0x2
    7b9f:	0f b6 d2             	movzx  edx,dl
    7ba2:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7ba6:	c3                   	ret
    7ba7:	41 b9 18 00 00 00    	mov    r9d,0x18
    7bad:	eb 9a                	jmp    7b49 <encode_sbb_reg_reg+0xb>
    7baf:	41 b8 41 00 00 00    	mov    r8d,0x41
    7bb5:	eb 9e                	jmp    7b55 <encode_sbb_reg_reg+0x17>
    7bb7:	8d 46 fc             	lea    eax,[rsi-0x4]
    7bba:	3c 03                	cmp    al,0x3
    7bbc:	76 07                	jbe    7bc5 <encode_sbb_reg_reg+0x87>
    7bbe:	8d 42 fc             	lea    eax,[rdx-0x4]
    7bc1:	3c 03                	cmp    al,0x3
    7bc3:	77 20                	ja     7be5 <encode_sbb_reg_reg+0xa7>
    7bc5:	41 83 c8 40          	or     r8d,0x40
    7bc9:	b8 00 00 00 00       	mov    eax,0x0
    7bce:	eb a2                	jmp    7b72 <encode_sbb_reg_reg+0x34>
    7bd0:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7bd3:	b8 01 00 00 00       	mov    eax,0x1
    7bd8:	eb 98                	jmp    7b72 <encode_sbb_reg_reg+0x34>
    7bda:	41 83 c8 48          	or     r8d,0x48
    7bde:	b8 00 00 00 00       	mov    eax,0x0
    7be3:	eb 8d                	jmp    7b72 <encode_sbb_reg_reg+0x34>
    7be5:	b8 00 00 00 00       	mov    eax,0x0
    7bea:	eb 86                	jmp    7b72 <encode_sbb_reg_reg+0x34>

0000000000007bec <encode_and_imm>:
    7bec:	41 89 d1             	mov    r9d,edx
    7bef:	89 ca                	mov    edx,ecx
    7bf1:	40 80 fe 07          	cmp    sil,0x7
    7bf5:	77 43                	ja     7c3a <encode_and_imm+0x4e>
    7bf7:	b9 00 00 00 00       	mov    ecx,0x0
    7bfc:	80 fa 10             	cmp    dl,0x10
    7bff:	74 51                	je     7c52 <encode_and_imm+0x66>
    7c01:	80 fa 40             	cmp    dl,0x40
    7c04:	74 56                	je     7c5c <encode_and_imm+0x70>
    7c06:	80 fa 08             	cmp    dl,0x8
    7c09:	74 36                	je     7c41 <encode_and_imm+0x55>
    7c0b:	b8 00 00 00 00       	mov    eax,0x0
    7c10:	80 fa 08             	cmp    dl,0x8
    7c13:	74 58                	je     7c6d <encode_and_imm+0x81>
    7c15:	45 8d 91 80 00 00 00 	lea    r10d,[r9+0x80]
    7c1c:	41 81 fa ff 00 00 00 	cmp    r10d,0xff
    7c23:	0f 87 a6 00 00 00    	ja     7ccf <encode_and_imm+0xe3>
    7c29:	45 85 c0             	test   r8d,r8d
    7c2c:	0f 84 a5 00 00 00    	je     7cd7 <encode_and_imm+0xeb>
    7c32:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    7c38:	eb 39                	jmp    7c73 <encode_and_imm+0x87>
    7c3a:	b9 41 00 00 00       	mov    ecx,0x41
    7c3f:	eb bb                	jmp    7bfc <encode_and_imm+0x10>
    7c41:	8d 46 fc             	lea    eax,[rsi-0x4]
    7c44:	3c 03                	cmp    al,0x3
    7c46:	77 1e                	ja     7c66 <encode_and_imm+0x7a>
    7c48:	83 c9 40             	or     ecx,0x40
    7c4b:	b8 00 00 00 00       	mov    eax,0x0
    7c50:	eb be                	jmp    7c10 <encode_and_imm+0x24>
    7c52:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7c55:	b8 01 00 00 00       	mov    eax,0x1
    7c5a:	eb b4                	jmp    7c10 <encode_and_imm+0x24>
    7c5c:	83 c9 48             	or     ecx,0x48
    7c5f:	b8 00 00 00 00       	mov    eax,0x0
    7c64:	eb aa                	jmp    7c10 <encode_and_imm+0x24>
    7c66:	b8 00 00 00 00       	mov    eax,0x0
    7c6b:	eb a3                	jmp    7c10 <encode_and_imm+0x24>
    7c6d:	41 ba 80 ff ff ff    	mov    r10d,0xffffff80
    7c73:	40 84 f6             	test   sil,sil
    7c76:	74 67                	je     7cdf <encode_and_imm+0xf3>
    7c78:	83 e6 07             	and    esi,0x7
    7c7b:	83 ce e0             	or     esi,0xffffffe0
    7c7e:	84 c9                	test   cl,cl
    7c80:	74 0a                	je     7c8c <encode_and_imm+0xa0>
    7c82:	4c 63 c0             	movsxd r8,eax
    7c85:	42 88 0c 07          	mov    BYTE PTR [rdi+r8*1],cl
    7c89:	8d 40 01             	lea    eax,[rax+0x1]
    7c8c:	8d 48 01             	lea    ecx,[rax+0x1]
    7c8f:	4c 63 c0             	movsxd r8,eax
    7c92:	46 88 14 07          	mov    BYTE PTR [rdi+r8*1],r10b
    7c96:	44 8d 40 02          	lea    r8d,[rax+0x2]
    7c9a:	48 63 c9             	movsxd rcx,ecx
    7c9d:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7ca1:	41 80 fa 83          	cmp    r10b,0x83
    7ca5:	0f 84 81 00 00 00    	je     7d2c <encode_and_imm+0x140>
    7cab:	80 fa 10             	cmp    dl,0x10
    7cae:	0f 84 83 00 00 00    	je     7d37 <encode_and_imm+0x14b>
    7cb4:	80 fa 20             	cmp    dl,0x20
    7cb7:	0f 94 c1             	sete   cl
    7cba:	80 fa 40             	cmp    dl,0x40
    7cbd:	0f 94 c2             	sete   dl
    7cc0:	08 d1                	or     cl,dl
    7cc2:	74 7f                	je     7d43 <encode_and_imm+0x157>
    7cc4:	4d 63 c0             	movsxd r8,r8d
    7cc7:	46 89 0c 07          	mov    DWORD PTR [rdi+r8*1],r9d
    7ccb:	83 c0 06             	add    eax,0x6
    7cce:	c3                   	ret
    7ccf:	41 ba 81 ff ff ff    	mov    r10d,0xffffff81
    7cd5:	eb 9c                	jmp    7c73 <encode_and_imm+0x87>
    7cd7:	41 ba 83 ff ff ff    	mov    r10d,0xffffff83
    7cdd:	eb 94                	jmp    7c73 <encode_and_imm+0x87>
    7cdf:	84 c9                	test   cl,cl
    7ce1:	74 09                	je     7cec <encode_and_imm+0x100>
    7ce3:	48 63 f0             	movsxd rsi,eax
    7ce6:	88 0c 37             	mov    BYTE PTR [rdi+rsi*1],cl
    7ce9:	8d 40 01             	lea    eax,[rax+0x1]
    7cec:	80 fa 08             	cmp    dl,0x8
    7cef:	74 1a                	je     7d0b <encode_and_imm+0x11f>
    7cf1:	8d 48 01             	lea    ecx,[rax+0x1]
    7cf4:	48 63 f0             	movsxd rsi,eax
    7cf7:	c6 04 37 25          	mov    BYTE PTR [rdi+rsi*1],0x25
    7cfb:	80 fa 10             	cmp    dl,0x10
    7cfe:	74 20                	je     7d20 <encode_and_imm+0x134>
    7d00:	48 63 c9             	movsxd rcx,ecx
    7d03:	44 89 0c 0f          	mov    DWORD PTR [rdi+rcx*1],r9d
    7d07:	83 c0 05             	add    eax,0x5
    7d0a:	c3                   	ret
    7d0b:	8d 50 01             	lea    edx,[rax+0x1]
    7d0e:	48 63 c8             	movsxd rcx,eax
    7d11:	c6 04 0f 24          	mov    BYTE PTR [rdi+rcx*1],0x24
    7d15:	83 c0 02             	add    eax,0x2
    7d18:	48 63 d2             	movsxd rdx,edx
    7d1b:	44 88 0c 17          	mov    BYTE PTR [rdi+rdx*1],r9b
    7d1f:	c3                   	ret
    7d20:	48 63 c9             	movsxd rcx,ecx
    7d23:	66 44 89 0c 0f       	mov    WORD PTR [rdi+rcx*1],r9w
    7d28:	83 c0 03             	add    eax,0x3
    7d2b:	c3                   	ret
    7d2c:	83 c0 03             	add    eax,0x3
    7d2f:	4d 63 c0             	movsxd r8,r8d
    7d32:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7d36:	c3                   	ret
    7d37:	4d 63 c0             	movsxd r8,r8d
    7d3a:	66 46 89 0c 07       	mov    WORD PTR [rdi+r8*1],r9w
    7d3f:	83 c0 04             	add    eax,0x4
    7d42:	c3                   	ret
    7d43:	83 c0 03             	add    eax,0x3
    7d46:	4d 63 c0             	movsxd r8,r8d
    7d49:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7d4d:	c3                   	ret

0000000000007d4e <encode_and_reg_reg>:
    7d4e:	80 f9 08             	cmp    cl,0x8
    7d51:	74 64                	je     7db7 <encode_and_reg_reg+0x69>
    7d53:	41 b9 21 00 00 00    	mov    r9d,0x21
    7d59:	40 80 fe 07          	cmp    sil,0x7
    7d5d:	77 60                	ja     7dbf <encode_and_reg_reg+0x71>
    7d5f:	41 b8 00 00 00 00    	mov    r8d,0x0
    7d65:	80 fa 07             	cmp    dl,0x7
    7d68:	76 04                	jbe    7d6e <encode_and_reg_reg+0x20>
    7d6a:	41 83 c8 44          	or     r8d,0x44
    7d6e:	80 f9 10             	cmp    cl,0x10
    7d71:	74 6d                	je     7de0 <encode_and_reg_reg+0x92>
    7d73:	80 f9 40             	cmp    cl,0x40
    7d76:	74 72                	je     7dea <encode_and_reg_reg+0x9c>
    7d78:	80 f9 08             	cmp    cl,0x8
    7d7b:	74 4a                	je     7dc7 <encode_and_reg_reg+0x79>
    7d7d:	b8 00 00 00 00       	mov    eax,0x0
    7d82:	0f b6 d2             	movzx  edx,dl
    7d85:	c1 e2 03             	shl    edx,0x3
    7d88:	83 e2 38             	and    edx,0x38
    7d8b:	83 ca c0             	or     edx,0xffffffc0
    7d8e:	83 e6 07             	and    esi,0x7
    7d91:	09 d6                	or     esi,edx
    7d93:	45 84 c0             	test   r8b,r8b
    7d96:	74 0a                	je     7da2 <encode_and_reg_reg+0x54>
    7d98:	0f b6 d0             	movzx  edx,al
    7d9b:	44 88 04 17          	mov    BYTE PTR [rdi+rdx*1],r8b
    7d9f:	83 c0 01             	add    eax,0x1
    7da2:	8d 50 01             	lea    edx,[rax+0x1]
    7da5:	0f b6 c8             	movzx  ecx,al
    7da8:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    7dac:	83 c0 02             	add    eax,0x2
    7daf:	0f b6 d2             	movzx  edx,dl
    7db2:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7db6:	c3                   	ret
    7db7:	41 b9 20 00 00 00    	mov    r9d,0x20
    7dbd:	eb 9a                	jmp    7d59 <encode_and_reg_reg+0xb>
    7dbf:	41 b8 41 00 00 00    	mov    r8d,0x41
    7dc5:	eb 9e                	jmp    7d65 <encode_and_reg_reg+0x17>
    7dc7:	8d 46 fc             	lea    eax,[rsi-0x4]
    7dca:	3c 03                	cmp    al,0x3
    7dcc:	76 07                	jbe    7dd5 <encode_and_reg_reg+0x87>
    7dce:	8d 42 fc             	lea    eax,[rdx-0x4]
    7dd1:	3c 03                	cmp    al,0x3
    7dd3:	77 20                	ja     7df5 <encode_and_reg_reg+0xa7>
    7dd5:	41 83 c8 40          	or     r8d,0x40
    7dd9:	b8 00 00 00 00       	mov    eax,0x0
    7dde:	eb a2                	jmp    7d82 <encode_and_reg_reg+0x34>
    7de0:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7de3:	b8 01 00 00 00       	mov    eax,0x1
    7de8:	eb 98                	jmp    7d82 <encode_and_reg_reg+0x34>
    7dea:	41 83 c8 48          	or     r8d,0x48
    7dee:	b8 00 00 00 00       	mov    eax,0x0
    7df3:	eb 8d                	jmp    7d82 <encode_and_reg_reg+0x34>
    7df5:	b8 00 00 00 00       	mov    eax,0x0
    7dfa:	eb 86                	jmp    7d82 <encode_and_reg_reg+0x34>

0000000000007dfc <encode_test_reg_reg>:
    7dfc:	80 f9 08             	cmp    cl,0x8
    7dff:	74 65                	je     7e66 <encode_test_reg_reg+0x6a>
    7e01:	41 b9 85 ff ff ff    	mov    r9d,0xffffff85
    7e07:	40 80 fe 07          	cmp    sil,0x7
    7e0b:	77 61                	ja     7e6e <encode_test_reg_reg+0x72>
    7e0d:	41 b8 00 00 00 00    	mov    r8d,0x0
    7e13:	80 fa 07             	cmp    dl,0x7
    7e16:	76 04                	jbe    7e1c <encode_test_reg_reg+0x20>
    7e18:	41 83 c8 44          	or     r8d,0x44
    7e1c:	80 f9 10             	cmp    cl,0x10
    7e1f:	74 6e                	je     7e8f <encode_test_reg_reg+0x93>
    7e21:	80 f9 40             	cmp    cl,0x40
    7e24:	74 73                	je     7e99 <encode_test_reg_reg+0x9d>
    7e26:	80 f9 08             	cmp    cl,0x8
    7e29:	74 4b                	je     7e76 <encode_test_reg_reg+0x7a>
    7e2b:	b9 00 00 00 00       	mov    ecx,0x0
    7e30:	45 84 c0             	test   r8b,r8b
    7e33:	74 76                	je     7eab <encode_test_reg_reg+0xaf>
    7e35:	8d 41 01             	lea    eax,[rcx+0x1]
    7e38:	0f b6 c9             	movzx  ecx,cl
    7e3b:	44 88 04 0f          	mov    BYTE PTR [rdi+rcx*1],r8b
    7e3f:	8d 48 01             	lea    ecx,[rax+0x1]
    7e42:	44 0f b6 c0          	movzx  r8d,al
    7e46:	46 88 0c 07          	mov    BYTE PTR [rdi+r8*1],r9b
    7e4a:	0f b6 d2             	movzx  edx,dl
    7e4d:	c1 e2 03             	shl    edx,0x3
    7e50:	83 e2 38             	and    edx,0x38
    7e53:	83 ca c0             	or     edx,0xffffffc0
    7e56:	83 c0 02             	add    eax,0x2
    7e59:	0f b6 c9             	movzx  ecx,cl
    7e5c:	83 e6 07             	and    esi,0x7
    7e5f:	09 d6                	or     esi,edx
    7e61:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7e65:	c3                   	ret
    7e66:	41 b9 84 ff ff ff    	mov    r9d,0xffffff84
    7e6c:	eb 99                	jmp    7e07 <encode_test_reg_reg+0xb>
    7e6e:	41 b8 41 00 00 00    	mov    r8d,0x41
    7e74:	eb 9d                	jmp    7e13 <encode_test_reg_reg+0x17>
    7e76:	8d 46 fc             	lea    eax,[rsi-0x4]
    7e79:	3c 03                	cmp    al,0x3
    7e7b:	76 07                	jbe    7e84 <encode_test_reg_reg+0x88>
    7e7d:	8d 42 fc             	lea    eax,[rdx-0x4]
    7e80:	3c 03                	cmp    al,0x3
    7e82:	77 20                	ja     7ea4 <encode_test_reg_reg+0xa8>
    7e84:	41 83 c8 40          	or     r8d,0x40
    7e88:	b9 00 00 00 00       	mov    ecx,0x0
    7e8d:	eb a6                	jmp    7e35 <encode_test_reg_reg+0x39>
    7e8f:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7e92:	b9 01 00 00 00       	mov    ecx,0x1
    7e97:	eb 97                	jmp    7e30 <encode_test_reg_reg+0x34>
    7e99:	41 83 c8 48          	or     r8d,0x48
    7e9d:	b9 00 00 00 00       	mov    ecx,0x0
    7ea2:	eb 91                	jmp    7e35 <encode_test_reg_reg+0x39>
    7ea4:	b9 00 00 00 00       	mov    ecx,0x0
    7ea9:	eb 85                	jmp    7e30 <encode_test_reg_reg+0x34>
    7eab:	89 c8                	mov    eax,ecx
    7ead:	eb 90                	jmp    7e3f <encode_test_reg_reg+0x43>

0000000000007eaf <encode_group2_reg_imm>:
    7eaf:	89 f0                	mov    eax,esi
    7eb1:	89 d6                	mov    esi,edx
    7eb3:	3c 07                	cmp    al,0x7
    7eb5:	77 65                	ja     7f1c <encode_group2_reg_imm+0x6d>
    7eb7:	41 ba 00 00 00 00    	mov    r10d,0x0
    7ebd:	41 80 f9 10          	cmp    r9b,0x10
    7ec1:	74 74                	je     7f37 <encode_group2_reg_imm+0x88>
    7ec3:	41 80 f9 40          	cmp    r9b,0x40
    7ec7:	74 78                	je     7f41 <encode_group2_reg_imm+0x92>
    7ec9:	41 80 f9 08          	cmp    r9b,0x8
    7ecd:	74 55                	je     7f24 <encode_group2_reg_imm+0x75>
    7ecf:	ba 00 00 00 00       	mov    edx,0x0
    7ed4:	0f b6 c9             	movzx  ecx,cl
    7ed7:	c1 e1 03             	shl    ecx,0x3
    7eda:	83 e1 38             	and    ecx,0x38
    7edd:	83 c9 c0             	or     ecx,0xffffffc0
    7ee0:	83 e0 07             	and    eax,0x7
    7ee3:	09 c8                	or     eax,ecx
    7ee5:	45 84 d2             	test   r10b,r10b
    7ee8:	74 0a                	je     7ef4 <encode_group2_reg_imm+0x45>
    7eea:	0f b6 ca             	movzx  ecx,dl
    7eed:	44 88 14 0f          	mov    BYTE PTR [rdi+rcx*1],r10b
    7ef1:	83 c2 01             	add    edx,0x1
    7ef4:	44 8d 4a 01          	lea    r9d,[rdx+0x1]
    7ef8:	0f b6 ca             	movzx  ecx,dl
    7efb:	40 88 34 0f          	mov    BYTE PTR [rdi+rcx*1],sil
    7eff:	8d 4a 02             	lea    ecx,[rdx+0x2]
    7f02:	41 0f b6 f1          	movzx  esi,r9b
    7f06:	88 04 37             	mov    BYTE PTR [rdi+rsi*1],al
    7f09:	41 80 f8 01          	cmp    r8b,0x1
    7f0d:	74 0a                	je     7f19 <encode_group2_reg_imm+0x6a>
    7f0f:	0f b6 c9             	movzx  ecx,cl
    7f12:	44 88 04 0f          	mov    BYTE PTR [rdi+rcx*1],r8b
    7f16:	8d 4a 03             	lea    ecx,[rdx+0x3]
    7f19:	89 c8                	mov    eax,ecx
    7f1b:	c3                   	ret
    7f1c:	41 ba 41 00 00 00    	mov    r10d,0x41
    7f22:	eb 99                	jmp    7ebd <encode_group2_reg_imm+0xe>
    7f24:	8d 50 fc             	lea    edx,[rax-0x4]
    7f27:	80 fa 03             	cmp    dl,0x3
    7f2a:	77 20                	ja     7f4c <encode_group2_reg_imm+0x9d>
    7f2c:	41 83 ca 40          	or     r10d,0x40
    7f30:	ba 00 00 00 00       	mov    edx,0x0
    7f35:	eb 9d                	jmp    7ed4 <encode_group2_reg_imm+0x25>
    7f37:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7f3a:	ba 01 00 00 00       	mov    edx,0x1
    7f3f:	eb 93                	jmp    7ed4 <encode_group2_reg_imm+0x25>
    7f41:	41 83 ca 48          	or     r10d,0x48
    7f45:	ba 00 00 00 00       	mov    edx,0x0
    7f4a:	eb 88                	jmp    7ed4 <encode_group2_reg_imm+0x25>
    7f4c:	ba 00 00 00 00       	mov    edx,0x0
    7f51:	eb 81                	jmp    7ed4 <encode_group2_reg_imm+0x25>

0000000000007f53 <encode_group2_reg_cl>:
    7f53:	40 80 fe 07          	cmp    sil,0x7
    7f57:	77 53                	ja     7fac <encode_group2_reg_cl+0x59>
    7f59:	41 b9 00 00 00 00    	mov    r9d,0x0
    7f5f:	41 80 f8 10          	cmp    r8b,0x10
    7f63:	74 61                	je     7fc6 <encode_group2_reg_cl+0x73>
    7f65:	41 80 f8 40          	cmp    r8b,0x40
    7f69:	74 65                	je     7fd0 <encode_group2_reg_cl+0x7d>
    7f6b:	41 80 f8 08          	cmp    r8b,0x8
    7f6f:	74 43                	je     7fb4 <encode_group2_reg_cl+0x61>
    7f71:	b8 00 00 00 00       	mov    eax,0x0
    7f76:	0f b6 c9             	movzx  ecx,cl
    7f79:	c1 e1 03             	shl    ecx,0x3
    7f7c:	83 e1 38             	and    ecx,0x38
    7f7f:	83 c9 c0             	or     ecx,0xffffffc0
    7f82:	83 e6 07             	and    esi,0x7
    7f85:	09 ce                	or     esi,ecx
    7f87:	45 84 c9             	test   r9b,r9b
    7f8a:	74 0a                	je     7f96 <encode_group2_reg_cl+0x43>
    7f8c:	0f b6 c8             	movzx  ecx,al
    7f8f:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    7f93:	83 c0 01             	add    eax,0x1
    7f96:	8d 48 01             	lea    ecx,[rax+0x1]
    7f99:	44 0f b6 c0          	movzx  r8d,al
    7f9d:	42 88 14 07          	mov    BYTE PTR [rdi+r8*1],dl
    7fa1:	83 c0 02             	add    eax,0x2
    7fa4:	0f b6 d1             	movzx  edx,cl
    7fa7:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    7fab:	c3                   	ret
    7fac:	41 b9 41 00 00 00    	mov    r9d,0x41
    7fb2:	eb ab                	jmp    7f5f <encode_group2_reg_cl+0xc>
    7fb4:	8d 46 fc             	lea    eax,[rsi-0x4]
    7fb7:	3c 03                	cmp    al,0x3
    7fb9:	77 20                	ja     7fdb <encode_group2_reg_cl+0x88>
    7fbb:	41 83 c9 40          	or     r9d,0x40
    7fbf:	b8 00 00 00 00       	mov    eax,0x0
    7fc4:	eb b0                	jmp    7f76 <encode_group2_reg_cl+0x23>
    7fc6:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    7fc9:	b8 01 00 00 00       	mov    eax,0x1
    7fce:	eb a6                	jmp    7f76 <encode_group2_reg_cl+0x23>
    7fd0:	41 83 c9 48          	or     r9d,0x48
    7fd4:	b8 00 00 00 00       	mov    eax,0x0
    7fd9:	eb 9b                	jmp    7f76 <encode_group2_reg_cl+0x23>
    7fdb:	b8 00 00 00 00       	mov    eax,0x0
    7fe0:	eb 94                	jmp    7f76 <encode_group2_reg_cl+0x23>

0000000000007fe2 <encode_group3_reg>:
    7fe2:	40 80 fe 07          	cmp    sil,0x7
    7fe6:	77 53                	ja     803b <encode_group3_reg+0x59>
    7fe8:	41 b9 00 00 00 00    	mov    r9d,0x0
    7fee:	41 80 f8 10          	cmp    r8b,0x10
    7ff2:	74 61                	je     8055 <encode_group3_reg+0x73>
    7ff4:	41 80 f8 40          	cmp    r8b,0x40
    7ff8:	74 65                	je     805f <encode_group3_reg+0x7d>
    7ffa:	41 80 f8 08          	cmp    r8b,0x8
    7ffe:	74 43                	je     8043 <encode_group3_reg+0x61>
    8000:	b8 00 00 00 00       	mov    eax,0x0
    8005:	0f b6 c9             	movzx  ecx,cl
    8008:	c1 e1 03             	shl    ecx,0x3
    800b:	83 e1 38             	and    ecx,0x38
    800e:	83 c9 c0             	or     ecx,0xffffffc0
    8011:	83 e6 07             	and    esi,0x7
    8014:	09 ce                	or     esi,ecx
    8016:	45 84 c9             	test   r9b,r9b
    8019:	74 0a                	je     8025 <encode_group3_reg+0x43>
    801b:	0f b6 c8             	movzx  ecx,al
    801e:	44 88 0c 0f          	mov    BYTE PTR [rdi+rcx*1],r9b
    8022:	83 c0 01             	add    eax,0x1
    8025:	8d 48 01             	lea    ecx,[rax+0x1]
    8028:	44 0f b6 c0          	movzx  r8d,al
    802c:	42 88 14 07          	mov    BYTE PTR [rdi+r8*1],dl
    8030:	83 c0 02             	add    eax,0x2
    8033:	0f b6 d1             	movzx  edx,cl
    8036:	40 88 34 17          	mov    BYTE PTR [rdi+rdx*1],sil
    803a:	c3                   	ret
    803b:	41 b9 41 00 00 00    	mov    r9d,0x41
    8041:	eb ab                	jmp    7fee <encode_group3_reg+0xc>
    8043:	8d 46 fc             	lea    eax,[rsi-0x4]
    8046:	3c 03                	cmp    al,0x3
    8048:	77 20                	ja     806a <encode_group3_reg+0x88>
    804a:	41 83 c9 40          	or     r9d,0x40
    804e:	b8 00 00 00 00       	mov    eax,0x0
    8053:	eb b0                	jmp    8005 <encode_group3_reg+0x23>
    8055:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    8058:	b8 01 00 00 00       	mov    eax,0x1
    805d:	eb a6                	jmp    8005 <encode_group3_reg+0x23>
    805f:	41 83 c9 48          	or     r9d,0x48
    8063:	b8 00 00 00 00       	mov    eax,0x0
    8068:	eb 9b                	jmp    8005 <encode_group3_reg+0x23>
    806a:	b8 00 00 00 00       	mov    eax,0x0
    806f:	eb 94                	jmp    8005 <encode_group3_reg+0x23>

0000000000008071 <encode_test_reg_imm>:
    8071:	49 89 d1             	mov    r9,rdx
    8074:	80 f9 08             	cmp    cl,0x8
    8077:	74 6d                	je     80e6 <encode_test_reg_imm+0x75>
    8079:	41 ba f7 ff ff ff    	mov    r10d,0xfffffff7
    807f:	40 80 fe 07          	cmp    sil,0x7
    8083:	77 69                	ja     80ee <encode_test_reg_imm+0x7d>
    8085:	b8 00 00 00 00       	mov    eax,0x0
    808a:	80 f9 10             	cmp    cl,0x10
    808d:	74 78                	je     8107 <encode_test_reg_imm+0x96>
    808f:	80 f9 40             	cmp    cl,0x40
    8092:	74 7d                	je     8111 <encode_test_reg_imm+0xa0>
    8094:	80 f9 08             	cmp    cl,0x8
    8097:	74 5c                	je     80f5 <encode_test_reg_imm+0x84>
    8099:	ba 00 00 00 00       	mov    edx,0x0
    809e:	83 e6 07             	and    esi,0x7
    80a1:	83 ce c0             	or     esi,0xffffffc0
    80a4:	84 c0                	test   al,al
    80a6:	74 0b                	je     80b3 <encode_test_reg_imm+0x42>
    80a8:	44 0f b6 c2          	movzx  r8d,dl
    80ac:	42 88 04 07          	mov    BYTE PTR [rdi+r8*1],al
    80b0:	83 c2 01             	add    edx,0x1
    80b3:	44 8d 42 01          	lea    r8d,[rdx+0x1]
    80b7:	0f b6 c2             	movzx  eax,dl
    80ba:	44 88 14 07          	mov    BYTE PTR [rdi+rax*1],r10b
    80be:	8d 42 02             	lea    eax,[rdx+0x2]
    80c1:	45 0f b6 c0          	movzx  r8d,r8b
    80c5:	42 88 34 07          	mov    BYTE PTR [rdi+r8*1],sil
    80c9:	80 f9 20             	cmp    cl,0x20
    80cc:	74 74                	je     8142 <encode_test_reg_imm+0xd1>
    80ce:	77 56                	ja     8126 <encode_test_reg_imm+0xb5>
    80d0:	80 f9 08             	cmp    cl,0x8
    80d3:	74 62                	je     8137 <encode_test_reg_imm+0xc6>
    80d5:	80 f9 10             	cmp    cl,0x10
    80d8:	75 4b                	jne    8125 <encode_test_reg_imm+0xb4>
    80da:	0f b6 c0             	movzx  eax,al
    80dd:	66 44 89 0c 07       	mov    WORD PTR [rdi+rax*1],r9w
    80e2:	8d 42 04             	lea    eax,[rdx+0x4]
    80e5:	c3                   	ret
    80e6:	41 ba f6 ff ff ff    	mov    r10d,0xfffffff6
    80ec:	eb 91                	jmp    807f <encode_test_reg_imm+0xe>
    80ee:	b8 41 00 00 00       	mov    eax,0x41
    80f3:	eb 95                	jmp    808a <encode_test_reg_imm+0x19>
    80f5:	8d 56 fc             	lea    edx,[rsi-0x4]
    80f8:	80 fa 03             	cmp    dl,0x3
    80fb:	77 1e                	ja     811b <encode_test_reg_imm+0xaa>
    80fd:	83 c8 40             	or     eax,0x40
    8100:	ba 00 00 00 00       	mov    edx,0x0
    8105:	eb 97                	jmp    809e <encode_test_reg_imm+0x2d>
    8107:	c6 07 66             	mov    BYTE PTR [rdi],0x66
    810a:	ba 01 00 00 00       	mov    edx,0x1
    810f:	eb 8d                	jmp    809e <encode_test_reg_imm+0x2d>
    8111:	83 c8 48             	or     eax,0x48
    8114:	ba 00 00 00 00       	mov    edx,0x0
    8119:	eb 83                	jmp    809e <encode_test_reg_imm+0x2d>
    811b:	ba 00 00 00 00       	mov    edx,0x0
    8120:	e9 79 ff ff ff       	jmp    809e <encode_test_reg_imm+0x2d>
    8125:	c3                   	ret
    8126:	80 f9 40             	cmp    cl,0x40
    8129:	75 0b                	jne    8136 <encode_test_reg_imm+0xc5>
    812b:	0f b6 c0             	movzx  eax,al
    812e:	44 89 0c 07          	mov    DWORD PTR [rdi+rax*1],r9d
    8132:	8d 42 06             	lea    eax,[rdx+0x6]
    8135:	c3                   	ret
    8136:	c3                   	ret
    8137:	0f b6 c0             	movzx  eax,al
    813a:	44 88 0c 07          	mov    BYTE PTR [rdi+rax*1],r9b
    813e:	8d 42 03             	lea    eax,[rdx+0x3]
    8141:	c3                   	ret
    8142:	0f b6 c0             	movzx  eax,al
    8145:	44 89 0c 07          	mov    DWORD PTR [rdi+rax*1],r9d
    8149:	8d 42 06             	lea    eax,[rdx+0x6]
    814c:	c3                   	ret

000000000000814d <encode_group4_reg>:
    814d:	0f b6 c9             	movzx  ecx,cl
    8150:	0f b6 d2             	movzx  edx,dl
    8153:	40 0f b6 f6          	movzx  esi,sil
    8157:	45 0f b6 c0          	movzx  r8d,r8b
    815b:	e8 82 fe ff ff       	call   7fe2 <encode_group3_reg>
    8160:	c3                   	ret

0000000000008161 <encode_group5_reg>:
    8161:	0f b6 c9             	movzx  ecx,cl
    8164:	0f b6 d2             	movzx  edx,dl
    8167:	40 0f b6 f6          	movzx  esi,sil
    816b:	45 0f b6 c0          	movzx  r8d,r8b
    816f:	e8 6e fe ff ff       	call   7fe2 <encode_group3_reg>
    8174:	c3                   	ret

0000000000008175 <parseInst>:
    8175:	41 57                	push   r15
    8177:	41 56                	push   r14
    8179:	41 55                	push   r13
    817b:	41 54                	push   r12
    817d:	55                   	push   rbp
    817e:	53                   	push   rbx
    817f:	48 83 ec 28          	sub    rsp,0x28
    8183:	44 0f b6 3f          	movzx  r15d,BYTE PTR [rdi]
    8187:	41 80 ff 01          	cmp    r15b,0x1
    818b:	74 14                	je     81a1 <parseInst+0x2c>
    818d:	b8 00 00 00 00       	mov    eax,0x0
    8192:	48 83 c4 28          	add    rsp,0x28
    8196:	5b                   	pop    rbx
    8197:	5d                   	pop    rbp
    8198:	41 5c                	pop    r12
    819a:	41 5d                	pop    r13
    819c:	41 5e                	pop    r14
    819e:	41 5f                	pop    r15
    81a0:	c3                   	ret
    81a1:	48 89 fb             	mov    rbx,rdi
    81a4:	49 89 f4             	mov    r12,rsi
    81a7:	48 8d 6f 01          	lea    rbp,[rdi+0x1]
    81ab:	bf 10 00 00 00       	mov    edi,0x10
    81b0:	e8 bb af ff ff       	call   3170 <malloc@plt>
    81b5:	49 89 c6             	mov    r14,rax
    81b8:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    81bf:	48 c7 83 b0 01 00 00 	mov    QWORD PTR [rbx+0x1b0],0x10
    81c6:	10 00 00 00 
    81ca:	66 0f ef c0          	pxor   xmm0,xmm0
    81ce:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
    81d1:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x0
    81d8:	00 00 00 00 
    81dc:	44 0f b6 6b 10       	movzx  r13d,BYTE PTR [rbx+0x10]
    81e1:	41 8d 45 f5          	lea    eax,[r13-0xb]
    81e5:	3c 01                	cmp    al,0x1
    81e7:	0f 86 aa 04 00 00    	jbe    8697 <parseInst+0x522>
    81ed:	48 8d 35 18 d9 00 00 	lea    rsi,[rip+0xd918]        # 15b0c <_IO_stdin_used+0xb0c>
    81f4:	48 89 ef             	mov    rdi,rbp
    81f7:	e8 54 ae ff ff       	call   3050 <strcasecmp@plt>
    81fc:	85 c0                	test   eax,eax
    81fe:	0f 85 c6 0b 00 00    	jne    8dca <parseInst+0xc55>
    8204:	41 80 fd 0e          	cmp    r13b,0xe
    8208:	0f 84 cf 04 00 00    	je     86dd <parseInst+0x568>
    820e:	41 80 fd 0d          	cmp    r13b,0xd
    8212:	0f 84 1a 05 00 00    	je     8732 <parseInst+0x5bd>
    8218:	41 80 fd 0c          	cmp    r13b,0xc
    821c:	0f 84 64 05 00 00    	je     8786 <parseInst+0x611>
    8222:	41 80 fd 0b          	cmp    r13b,0xb
    8226:	0f 84 9f 05 00 00    	je     87cb <parseInst+0x656>
    822c:	41 80 fd 0e          	cmp    r13b,0xe
    8230:	0f 84 f3 05 00 00    	je     8829 <parseInst+0x6b4>
    8236:	41 80 fd 0d          	cmp    r13b,0xd
    823a:	0f 84 3a 06 00 00    	je     887a <parseInst+0x705>
    8240:	41 80 fd 0c          	cmp    r13b,0xc
    8244:	0f 84 81 06 00 00    	je     88cb <parseInst+0x756>
    824a:	41 80 fd 0b          	cmp    r13b,0xb
    824e:	0f 84 c8 06 00 00    	je     891c <parseInst+0x7a7>
    8254:	41 80 fd 0e          	cmp    r13b,0xe
    8258:	0f 84 0f 07 00 00    	je     896d <parseInst+0x7f8>
    825e:	41 80 fd 0d          	cmp    r13b,0xd
    8262:	0f 84 60 07 00 00    	je     89c8 <parseInst+0x853>
    8268:	41 80 fd 0c          	cmp    r13b,0xc
    826c:	0f 84 b1 07 00 00    	je     8a23 <parseInst+0x8ae>
    8272:	41 80 fd 0b          	cmp    r13b,0xb
    8276:	0f 84 02 08 00 00    	je     8a7e <parseInst+0x909>
    827c:	41 80 fd 14          	cmp    r13b,0x14
    8280:	0f 84 53 08 00 00    	je     8ad9 <parseInst+0x964>
    8286:	41 80 fd 14          	cmp    r13b,0x14
    828a:	0f 84 a4 08 00 00    	je     8b34 <parseInst+0x9bf>
    8290:	41 80 fd 14          	cmp    r13b,0x14
    8294:	0f 84 f5 08 00 00    	je     8b8f <parseInst+0xa1a>
    829a:	41 80 fd 14          	cmp    r13b,0x14
    829e:	0f 84 46 09 00 00    	je     8bea <parseInst+0xa75>
    82a4:	41 80 fd 14          	cmp    r13b,0x14
    82a8:	0f 84 97 09 00 00    	je     8c45 <parseInst+0xad0>
    82ae:	48 8d 35 42 d8 00 00 	lea    rsi,[rip+0xd842]        # 15af7 <_IO_stdin_used+0xaf7>
    82b5:	48 89 ef             	mov    rdi,rbp
    82b8:	e8 93 ad ff ff       	call   3050 <strcasecmp@plt>
    82bd:	41 89 c5             	mov    r13d,eax
    82c0:	85 c0                	test   eax,eax
    82c2:	74 13                	je     82d7 <parseInst+0x162>
    82c4:	48 8d 35 32 d8 00 00 	lea    rsi,[rip+0xd832]        # 15afd <_IO_stdin_used+0xafd>
    82cb:	48 89 ef             	mov    rdi,rbp
    82ce:	e8 7d ad ff ff       	call   3050 <strcasecmp@plt>
    82d3:	85 c0                	test   eax,eax
    82d5:	75 73                	jne    834a <parseInst+0x1d5>
    82d7:	45 85 ed             	test   r13d,r13d
    82da:	0f 85 02 3a 00 00    	jne    bce2 <parseInst+0x3b6d>
    82e0:	41 bd b7 ff ff ff    	mov    r13d,0xffffffb7
    82e6:	80 7b 10 0c          	cmp    BYTE PTR [rbx+0x10],0xc
    82ea:	0f 84 fd 39 00 00    	je     bced <parseInst+0x3b78>
    82f0:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    82f4:	0f 84 53 3a 00 00    	je     bd4d <parseInst+0x3bd8>
    82fa:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    82fe:	0f 84 a9 3a 00 00    	je     bdad <parseInst+0x3c38>
    8304:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    8308:	0f 84 ff 3a 00 00    	je     be0d <parseInst+0x3c98>
    830e:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    8312:	0f 84 51 3b 00 00    	je     be69 <parseInst+0x3cf4>
    8318:	80 7b 10 0c          	cmp    BYTE PTR [rbx+0x10],0xc
    831c:	0f 84 a3 3b 00 00    	je     bec5 <parseInst+0x3d50>
    8322:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    8326:	0f 84 fa 3b 00 00    	je     bf26 <parseInst+0x3db1>
    832c:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    8330:	0f 84 51 3c 00 00    	je     bf87 <parseInst+0x3e12>
    8336:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    833a:	0f 84 a8 3c 00 00    	je     bfe8 <parseInst+0x3e73>
    8340:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    8344:	0f 84 fb 3c 00 00    	je     c045 <parseInst+0x3ed0>
    834a:	48 8d 35 b2 d7 00 00 	lea    rsi,[rip+0xd7b2]        # 15b03 <_IO_stdin_used+0xb03>
    8351:	48 89 ef             	mov    rdi,rbp
    8354:	e8 f7 ac ff ff       	call   3050 <strcasecmp@plt>
    8359:	41 89 c5             	mov    r13d,eax
    835c:	85 c0                	test   eax,eax
    835e:	74 13                	je     8373 <parseInst+0x1fe>
    8360:	48 8d 35 a0 d7 00 00 	lea    rsi,[rip+0xd7a0]        # 15b07 <_IO_stdin_used+0xb07>
    8367:	48 89 ef             	mov    rdi,rbp
    836a:	e8 e1 ac ff ff       	call   3050 <strcasecmp@plt>
    836f:	85 c0                	test   eax,eax
    8371:	75 4b                	jne    83be <parseInst+0x249>
    8373:	45 85 ed             	test   r13d,r13d
    8376:	0f 85 26 3d 00 00    	jne    c0a2 <parseInst+0x3f2d>
    837c:	41 bd bc ff ff ff    	mov    r13d,0xffffffbc
    8382:	80 7b 10 0c          	cmp    BYTE PTR [rbx+0x10],0xc
    8386:	0f 84 21 3d 00 00    	je     c0ad <parseInst+0x3f38>
    838c:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    8390:	0f 84 73 3d 00 00    	je     c109 <parseInst+0x3f94>
    8396:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    839a:	0f 84 c5 3d 00 00    	je     c165 <parseInst+0x3ff0>
    83a0:	80 7b 10 0c          	cmp    BYTE PTR [rbx+0x10],0xc
    83a4:	0f 84 17 3e 00 00    	je     c1c1 <parseInst+0x404c>
    83aa:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    83ae:	0f 84 6a 3e 00 00    	je     c21e <parseInst+0x40a9>
    83b4:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    83b8:	0f 84 bd 3e 00 00    	je     c27b <parseInst+0x4106>
    83be:	ba 04 00 00 00       	mov    edx,0x4
    83c3:	48 8d 35 41 d7 00 00 	lea    rsi,[rip+0xd741]        # 15b0b <_IO_stdin_used+0xb0b>
    83ca:	48 89 ef             	mov    rdi,rbp
    83cd:	e8 ae ad ff ff       	call   3180 <strncasecmp@plt>
    83d2:	85 c0                	test   eax,eax
    83d4:	0f 85 40 3f 00 00    	jne    c31a <parseInst+0x41a5>
    83da:	48 8d 35 2f d7 00 00 	lea    rsi,[rip+0xd72f]        # 15b10 <_IO_stdin_used+0xb10>
    83e1:	48 89 ef             	mov    rdi,rbp
    83e4:	e8 67 ac ff ff       	call   3050 <strcasecmp@plt>
    83e9:	85 c0                	test   eax,eax
    83eb:	0f 84 e7 3e 00 00    	je     c2d8 <parseInst+0x4163>
    83f1:	48 8d 35 1e d7 00 00 	lea    rsi,[rip+0xd71e]        # 15b16 <_IO_stdin_used+0xb16>
    83f8:	48 89 ef             	mov    rdi,rbp
    83fb:	e8 50 ac ff ff       	call   3050 <strcasecmp@plt>
    8400:	85 c0                	test   eax,eax
    8402:	0f 84 eb 41 00 00    	je     c5f3 <parseInst+0x447e>
    8408:	48 8d 35 0e d7 00 00 	lea    rsi,[rip+0xd70e]        # 15b1d <_IO_stdin_used+0xb1d>
    840f:	48 89 ef             	mov    rdi,rbp
    8412:	e8 39 ac ff ff       	call   3050 <strcasecmp@plt>
    8417:	85 c0                	test   eax,eax
    8419:	0f 84 df 41 00 00    	je     c5fe <parseInst+0x4489>
    841f:	48 8d 35 fd d6 00 00 	lea    rsi,[rip+0xd6fd]        # 15b23 <_IO_stdin_used+0xb23>
    8426:	48 89 ef             	mov    rdi,rbp
    8429:	e8 22 ac ff ff       	call   3050 <strcasecmp@plt>
    842e:	85 c0                	test   eax,eax
    8430:	0f 84 d3 41 00 00    	je     c609 <parseInst+0x4494>
    8436:	48 8d 35 ec d6 00 00 	lea    rsi,[rip+0xd6ec]        # 15b29 <_IO_stdin_used+0xb29>
    843d:	48 89 ef             	mov    rdi,rbp
    8440:	e8 0b ac ff ff       	call   3050 <strcasecmp@plt>
    8445:	85 c0                	test   eax,eax
    8447:	0f 84 c7 41 00 00    	je     c614 <parseInst+0x449f>
    844d:	48 8d 35 dd d6 00 00 	lea    rsi,[rip+0xd6dd]        # 15b31 <_IO_stdin_used+0xb31>
    8454:	48 89 ef             	mov    rdi,rbp
    8457:	e8 f4 ab ff ff       	call   3050 <strcasecmp@plt>
    845c:	85 c0                	test   eax,eax
    845e:	0f 84 bb 41 00 00    	je     c61f <parseInst+0x44aa>
    8464:	48 8d 35 cd d6 00 00 	lea    rsi,[rip+0xd6cd]        # 15b38 <_IO_stdin_used+0xb38>
    846b:	48 89 ef             	mov    rdi,rbp
    846e:	e8 dd ab ff ff       	call   3050 <strcasecmp@plt>
    8473:	85 c0                	test   eax,eax
    8475:	0f 84 af 41 00 00    	je     c62a <parseInst+0x44b5>
    847b:	48 8d 35 bd d6 00 00 	lea    rsi,[rip+0xd6bd]        # 15b3f <_IO_stdin_used+0xb3f>
    8482:	48 89 ef             	mov    rdi,rbp
    8485:	e8 c6 ab ff ff       	call   3050 <strcasecmp@plt>
    848a:	85 c0                	test   eax,eax
    848c:	0f 84 a3 41 00 00    	je     c635 <parseInst+0x44c0>
    8492:	48 8d 35 ad d6 00 00 	lea    rsi,[rip+0xd6ad]        # 15b46 <_IO_stdin_used+0xb46>
    8499:	48 89 ef             	mov    rdi,rbp
    849c:	e8 af ab ff ff       	call   3050 <strcasecmp@plt>
    84a1:	85 c0                	test   eax,eax
    84a3:	0f 84 97 41 00 00    	je     c640 <parseInst+0x44cb>
    84a9:	48 8d 35 9c d6 00 00 	lea    rsi,[rip+0xd69c]        # 15b4c <_IO_stdin_used+0xb4c>
    84b0:	48 89 ef             	mov    rdi,rbp
    84b3:	e8 98 ab ff ff       	call   3050 <strcasecmp@plt>
    84b8:	85 c0                	test   eax,eax
    84ba:	0f 84 8b 41 00 00    	je     c64b <parseInst+0x44d6>
    84c0:	48 8d 35 8b d6 00 00 	lea    rsi,[rip+0xd68b]        # 15b52 <_IO_stdin_used+0xb52>
    84c7:	48 89 ef             	mov    rdi,rbp
    84ca:	e8 81 ab ff ff       	call   3050 <strcasecmp@plt>
    84cf:	85 c0                	test   eax,eax
    84d1:	0f 84 7f 41 00 00    	je     c656 <parseInst+0x44e1>
    84d7:	48 8d 35 7b d6 00 00 	lea    rsi,[rip+0xd67b]        # 15b59 <_IO_stdin_used+0xb59>
    84de:	48 89 ef             	mov    rdi,rbp
    84e1:	e8 6a ab ff ff       	call   3050 <strcasecmp@plt>
    84e6:	85 c0                	test   eax,eax
    84e8:	0f 84 73 41 00 00    	je     c661 <parseInst+0x44ec>
    84ee:	48 8d 35 6b d6 00 00 	lea    rsi,[rip+0xd66b]        # 15b60 <_IO_stdin_used+0xb60>
    84f5:	48 89 ef             	mov    rdi,rbp
    84f8:	e8 53 ab ff ff       	call   3050 <strcasecmp@plt>
    84fd:	85 c0                	test   eax,eax
    84ff:	0f 84 67 41 00 00    	je     c66c <parseInst+0x44f7>
    8505:	48 8d 35 5b d6 00 00 	lea    rsi,[rip+0xd65b]        # 15b67 <_IO_stdin_used+0xb67>
    850c:	48 89 ef             	mov    rdi,rbp
    850f:	e8 3c ab ff ff       	call   3050 <strcasecmp@plt>
    8514:	85 c0                	test   eax,eax
    8516:	0f 84 5b 41 00 00    	je     c677 <parseInst+0x4502>
    851c:	48 8d 35 4b d6 00 00 	lea    rsi,[rip+0xd64b]        # 15b6e <_IO_stdin_used+0xb6e>
    8523:	48 89 ef             	mov    rdi,rbp
    8526:	e8 25 ab ff ff       	call   3050 <strcasecmp@plt>
    852b:	85 c0                	test   eax,eax
    852d:	0f 84 4f 41 00 00    	je     c682 <parseInst+0x450d>
    8533:	48 8d 35 3a d6 00 00 	lea    rsi,[rip+0xd63a]        # 15b74 <_IO_stdin_used+0xb74>
    853a:	48 89 ef             	mov    rdi,rbp
    853d:	e8 0e ab ff ff       	call   3050 <strcasecmp@plt>
    8542:	85 c0                	test   eax,eax
    8544:	0f 84 43 41 00 00    	je     c68d <parseInst+0x4518>
    854a:	48 8d 35 2b d6 00 00 	lea    rsi,[rip+0xd62b]        # 15b7c <_IO_stdin_used+0xb7c>
    8551:	48 89 ef             	mov    rdi,rbp
    8554:	e8 f7 aa ff ff       	call   3050 <strcasecmp@plt>
    8559:	85 c0                	test   eax,eax
    855b:	0f 84 37 41 00 00    	je     c698 <parseInst+0x4523>
    8561:	48 8d 35 1a d6 00 00 	lea    rsi,[rip+0xd61a]        # 15b82 <_IO_stdin_used+0xb82>
    8568:	48 89 ef             	mov    rdi,rbp
    856b:	e8 e0 aa ff ff       	call   3050 <strcasecmp@plt>
    8570:	85 c0                	test   eax,eax
    8572:	0f 84 2b 41 00 00    	je     c6a3 <parseInst+0x452e>
    8578:	48 8d 35 0a d6 00 00 	lea    rsi,[rip+0xd60a]        # 15b89 <_IO_stdin_used+0xb89>
    857f:	48 89 ef             	mov    rdi,rbp
    8582:	e8 c9 aa ff ff       	call   3050 <strcasecmp@plt>
    8587:	85 c0                	test   eax,eax
    8589:	0f 84 1f 41 00 00    	je     c6ae <parseInst+0x4539>
    858f:	48 8d 35 f9 d5 00 00 	lea    rsi,[rip+0xd5f9]        # 15b8f <_IO_stdin_used+0xb8f>
    8596:	48 89 ef             	mov    rdi,rbp
    8599:	e8 b2 aa ff ff       	call   3050 <strcasecmp@plt>
    859e:	85 c0                	test   eax,eax
    85a0:	0f 84 13 41 00 00    	je     c6b9 <parseInst+0x4544>
    85a6:	48 8d 35 e9 d5 00 00 	lea    rsi,[rip+0xd5e9]        # 15b96 <_IO_stdin_used+0xb96>
    85ad:	48 89 ef             	mov    rdi,rbp
    85b0:	e8 9b aa ff ff       	call   3050 <strcasecmp@plt>
    85b5:	85 c0                	test   eax,eax
    85b7:	0f 84 07 41 00 00    	je     c6c4 <parseInst+0x454f>
    85bd:	48 8d 35 d9 d5 00 00 	lea    rsi,[rip+0xd5d9]        # 15b9d <_IO_stdin_used+0xb9d>
    85c4:	48 89 ef             	mov    rdi,rbp
    85c7:	e8 84 aa ff ff       	call   3050 <strcasecmp@plt>
    85cc:	85 c0                	test   eax,eax
    85ce:	0f 84 fb 40 00 00    	je     c6cf <parseInst+0x455a>
    85d4:	48 8d 35 c9 d5 00 00 	lea    rsi,[rip+0xd5c9]        # 15ba4 <_IO_stdin_used+0xba4>
    85db:	48 89 ef             	mov    rdi,rbp
    85de:	e8 6d aa ff ff       	call   3050 <strcasecmp@plt>
    85e3:	85 c0                	test   eax,eax
    85e5:	0f 84 ef 40 00 00    	je     c6da <parseInst+0x4565>
    85eb:	48 8d 35 b8 d5 00 00 	lea    rsi,[rip+0xd5b8]        # 15baa <_IO_stdin_used+0xbaa>
    85f2:	48 89 ef             	mov    rdi,rbp
    85f5:	e8 56 aa ff ff       	call   3050 <strcasecmp@plt>
    85fa:	85 c0                	test   eax,eax
    85fc:	0f 84 e3 40 00 00    	je     c6e5 <parseInst+0x4570>
    8602:	48 8d 35 a9 d5 00 00 	lea    rsi,[rip+0xd5a9]        # 15bb2 <_IO_stdin_used+0xbb2>
    8609:	48 89 ef             	mov    rdi,rbp
    860c:	e8 3f aa ff ff       	call   3050 <strcasecmp@plt>
    8611:	85 c0                	test   eax,eax
    8613:	0f 84 d7 40 00 00    	je     c6f0 <parseInst+0x457b>
    8619:	48 8d 35 99 d5 00 00 	lea    rsi,[rip+0xd599]        # 15bb9 <_IO_stdin_used+0xbb9>
    8620:	48 89 ef             	mov    rdi,rbp
    8623:	e8 28 aa ff ff       	call   3050 <strcasecmp@plt>
    8628:	85 c0                	test   eax,eax
    862a:	0f 84 cb 40 00 00    	je     c6fb <parseInst+0x4586>
    8630:	48 8d 35 89 d5 00 00 	lea    rsi,[rip+0xd589]        # 15bc0 <_IO_stdin_used+0xbc0>
    8637:	48 89 ef             	mov    rdi,rbp
    863a:	e8 11 aa ff ff       	call   3050 <strcasecmp@plt>
    863f:	85 c0                	test   eax,eax
    8641:	0f 84 bf 40 00 00    	je     c706 <parseInst+0x4591>
    8647:	48 8d 35 79 d5 00 00 	lea    rsi,[rip+0xd579]        # 15bc7 <_IO_stdin_used+0xbc7>
    864e:	48 89 ef             	mov    rdi,rbp
    8651:	e8 fa a9 ff ff       	call   3050 <strcasecmp@plt>
    8656:	85 c0                	test   eax,eax
    8658:	0f 84 b3 40 00 00    	je     c711 <parseInst+0x459c>
    865e:	48 8d 35 69 d5 00 00 	lea    rsi,[rip+0xd569]        # 15bce <_IO_stdin_used+0xbce>
    8665:	48 89 ef             	mov    rdi,rbp
    8668:	e8 e3 a9 ff ff       	call   3050 <strcasecmp@plt>
    866d:	85 c0                	test   eax,eax
    866f:	0f 84 a7 40 00 00    	je     c71c <parseInst+0x45a7>
    8675:	48 8d 35 58 d5 00 00 	lea    rsi,[rip+0xd558]        # 15bd4 <_IO_stdin_used+0xbd4>
    867c:	48 89 ef             	mov    rdi,rbp
    867f:	e8 cc a9 ff ff       	call   3050 <strcasecmp@plt>
    8684:	85 c0                	test   eax,eax
    8686:	0f 84 9b 40 00 00    	je     c727 <parseInst+0x45b2>
    868c:	41 bd 00 00 00 00    	mov    r13d,0x0
    8692:	e9 47 3c 00 00       	jmp    c2de <parseInst+0x4169>
    8697:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
    869b:	0f 85 4c fb ff ff    	jne    81ed <parseInst+0x78>
    86a1:	41 80 fd 0b          	cmp    r13b,0xb
    86a5:	74 2d                	je     86d4 <parseInst+0x55f>
    86a7:	48 8d 0d 23 ca 00 00 	lea    rcx,[rip+0xca23]        # 150d1 <_IO_stdin_used+0xd1>
    86ae:	0f b7 53 0a          	movzx  edx,WORD PTR [rbx+0xa]
    86b2:	48 8d 35 8f d7 00 00 	lea    rsi,[rip+0xd78f]        # 15e48 <_IO_stdin_used+0xe48>
    86b9:	48 8b 3d 20 25 01 00 	mov    rdi,QWORD PTR [rip+0x12520]        # 1abe0 <stderr@GLIBC_2.2.5>
    86c0:	b8 00 00 00 00       	mov    eax,0x0
    86c5:	e8 76 aa ff ff       	call   3140 <fprintf@plt>
    86ca:	bf 01 00 00 00       	mov    edi,0x1
    86cf:	e8 fc aa ff ff       	call   31d0 <exit@plt>
    86d4:	48 8d 0d ef c9 00 00 	lea    rcx,[rip+0xc9ef]        # 150ca <_IO_stdin_used+0xca>
    86db:	eb d1                	jmp    86ae <parseInst+0x539>
    86dd:	0f b6 53 70          	movzx  edx,BYTE PTR [rbx+0x70]
    86e1:	8d 42 f0             	lea    eax,[rdx-0x10]
    86e4:	3c 01                	cmp    al,0x1
    86e6:	0f 96 c0             	setbe  al
    86e9:	80 fa 13             	cmp    dl,0x13
    86ec:	0f 94 c2             	sete   dl
    86ef:	08 d0                	or     al,dl
    86f1:	0f 84 17 fb ff ff    	je     820e <parseInst+0x99>
    86f7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    86fb:	e8 70 b4 00 00       	call   13b70 <find_reg64_index>
    8700:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    8704:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8708:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    870f:	0f b6 f0             	movzx  esi,al
    8712:	b9 40 00 00 00       	mov    ecx,0x40
    8717:	4c 89 f7             	mov    rdi,r14
    871a:	e8 7d d7 ff ff       	call   5e9c <encode_mov_reg_imm>
    871f:	0f b6 c0             	movzx  eax,al
    8722:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8729:	49 01 04 24          	add    QWORD PTR [r12],rax
    872d:	e9 7c fb ff ff       	jmp    82ae <parseInst+0x139>
    8732:	0f b6 53 70          	movzx  edx,BYTE PTR [rbx+0x70]
    8736:	8d 42 f0             	lea    eax,[rdx-0x10]
    8739:	3c 01                	cmp    al,0x1
    873b:	0f 96 c0             	setbe  al
    873e:	80 fa 13             	cmp    dl,0x13
    8741:	0f 94 c2             	sete   dl
    8744:	08 d0                	or     al,dl
    8746:	0f 84 cc fa ff ff    	je     8218 <parseInst+0xa3>
    874c:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    8750:	e8 d5 b4 00 00       	call   13c2a <find_reg32_index>
    8755:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    8759:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    8760:	8b 53 78             	mov    edx,DWORD PTR [rbx+0x78]
    8763:	0f b6 f0             	movzx  esi,al
    8766:	b9 20 00 00 00       	mov    ecx,0x20
    876b:	4c 89 f7             	mov    rdi,r14
    876e:	e8 29 d7 ff ff       	call   5e9c <encode_mov_reg_imm>
    8773:	0f b6 c0             	movzx  eax,al
    8776:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    877d:	49 01 04 24          	add    QWORD PTR [r12],rax
    8781:	e9 28 fb ff ff       	jmp    82ae <parseInst+0x139>
    8786:	80 7b 70 13          	cmp    BYTE PTR [rbx+0x70],0x13
    878a:	0f 85 92 fa ff ff    	jne    8222 <parseInst+0xad>
    8790:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    8794:	e8 4b b5 00 00       	call   13ce4 <find_reg16_index>
    8799:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    879d:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    87a4:	0f b7 53 78          	movzx  edx,WORD PTR [rbx+0x78]
    87a8:	0f b6 f0             	movzx  esi,al
    87ab:	b9 10 00 00 00       	mov    ecx,0x10
    87b0:	4c 89 f7             	mov    rdi,r14
    87b3:	e8 e4 d6 ff ff       	call   5e9c <encode_mov_reg_imm>
    87b8:	0f b6 c0             	movzx  eax,al
    87bb:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    87c2:	49 01 04 24          	add    QWORD PTR [r12],rax
    87c6:	e9 e3 fa ff ff       	jmp    82ae <parseInst+0x139>
    87cb:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    87cf:	83 e8 12             	sub    eax,0x12
    87d2:	3c 01                	cmp    al,0x1
    87d4:	0f 87 52 fa ff ff    	ja     822c <parseInst+0xb7>
    87da:	44 0f b6 6b 78       	movzx  r13d,BYTE PTR [rbx+0x78]
    87df:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    87e3:	e8 cd b5 00 00       	call   13db5 <find_reg8_index>
    87e8:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    87ec:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    87f0:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    87f7:	80 7b 70 12          	cmp    BYTE PTR [rbx+0x70],0x12
    87fb:	74 26                	je     8823 <parseInst+0x6ae>
    87fd:	0f b6 d2             	movzx  edx,dl
    8800:	0f b6 f0             	movzx  esi,al
    8803:	b9 08 00 00 00       	mov    ecx,0x8
    8808:	4c 89 f7             	mov    rdi,r14
    880b:	e8 8c d6 ff ff       	call   5e9c <encode_mov_reg_imm>
    8810:	0f b6 c0             	movzx  eax,al
    8813:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    881a:	49 01 04 24          	add    QWORD PTR [r12],rax
    881e:	e9 8b fa ff ff       	jmp    82ae <parseInst+0x139>
    8823:	41 0f b6 d5          	movzx  edx,r13b
    8827:	eb d7                	jmp    8800 <parseInst+0x68b>
    8829:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    882d:	0f 85 03 fa ff ff    	jne    8236 <parseInst+0xc1>
    8833:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    8837:	e8 34 b3 00 00       	call   13b70 <find_reg64_index>
    883c:	41 89 c5             	mov    r13d,eax
    883f:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8843:	e8 28 b3 00 00       	call   13b70 <find_reg64_index>
    8848:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    884c:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    8853:	0f b6 d0             	movzx  edx,al
    8856:	41 0f b6 f5          	movzx  esi,r13b
    885a:	b9 40 00 00 00       	mov    ecx,0x40
    885f:	4c 89 f7             	mov    rdi,r14
    8862:	e8 03 d7 ff ff       	call   5f6a <encode_mov_reg_reg>
    8867:	0f b6 c0             	movzx  eax,al
    886a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8871:	49 01 04 24          	add    QWORD PTR [r12],rax
    8875:	e9 34 fa ff ff       	jmp    82ae <parseInst+0x139>
    887a:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    887e:	0f 85 bc f9 ff ff    	jne    8240 <parseInst+0xcb>
    8884:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    8888:	e8 9d b3 00 00       	call   13c2a <find_reg32_index>
    888d:	41 89 c5             	mov    r13d,eax
    8890:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8894:	e8 91 b3 00 00       	call   13c2a <find_reg32_index>
    8899:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    889d:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    88a4:	0f b6 d0             	movzx  edx,al
    88a7:	41 0f b6 f5          	movzx  esi,r13b
    88ab:	b9 20 00 00 00       	mov    ecx,0x20
    88b0:	4c 89 f7             	mov    rdi,r14
    88b3:	e8 b2 d6 ff ff       	call   5f6a <encode_mov_reg_reg>
    88b8:	0f b6 c0             	movzx  eax,al
    88bb:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    88c2:	49 01 04 24          	add    QWORD PTR [r12],rax
    88c6:	e9 e3 f9 ff ff       	jmp    82ae <parseInst+0x139>
    88cb:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    88cf:	0f 85 75 f9 ff ff    	jne    824a <parseInst+0xd5>
    88d5:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    88d9:	e8 06 b4 00 00       	call   13ce4 <find_reg16_index>
    88de:	41 89 c5             	mov    r13d,eax
    88e1:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    88e5:	e8 fa b3 00 00       	call   13ce4 <find_reg16_index>
    88ea:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    88ee:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    88f5:	0f b6 d0             	movzx  edx,al
    88f8:	41 0f b6 f5          	movzx  esi,r13b
    88fc:	b9 10 00 00 00       	mov    ecx,0x10
    8901:	4c 89 f7             	mov    rdi,r14
    8904:	e8 61 d6 ff ff       	call   5f6a <encode_mov_reg_reg>
    8909:	0f b6 c0             	movzx  eax,al
    890c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8913:	49 01 04 24          	add    QWORD PTR [r12],rax
    8917:	e9 92 f9 ff ff       	jmp    82ae <parseInst+0x139>
    891c:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    8920:	0f 85 2e f9 ff ff    	jne    8254 <parseInst+0xdf>
    8926:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    892a:	e8 86 b4 00 00       	call   13db5 <find_reg8_index>
    892f:	41 89 c5             	mov    r13d,eax
    8932:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8936:	e8 7a b4 00 00       	call   13db5 <find_reg8_index>
    893b:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    893f:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    8946:	0f b6 d0             	movzx  edx,al
    8949:	41 0f b6 f5          	movzx  esi,r13b
    894d:	b9 08 00 00 00       	mov    ecx,0x8
    8952:	4c 89 f7             	mov    rdi,r14
    8955:	e8 10 d6 ff ff       	call   5f6a <encode_mov_reg_reg>
    895a:	0f b6 c0             	movzx  eax,al
    895d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8964:	49 01 04 24          	add    QWORD PTR [r12],rax
    8968:	e9 41 f9 ff ff       	jmp    82ae <parseInst+0x139>
    896d:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    8971:	0f 85 e7 f8 ff ff    	jne    825e <parseInst+0xe9>
    8977:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    897b:	e8 f0 b1 00 00       	call   13b70 <find_reg64_index>
    8980:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    8984:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8988:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    898f:	0f b6 f0             	movzx  esi,al
    8992:	48 83 ec 08          	sub    rsp,0x8
    8996:	6a 00                	push   0x0
    8998:	41 b9 00 00 00 00    	mov    r9d,0x0
    899e:	41 b8 8b 00 00 00    	mov    r8d,0x8b
    89a4:	b9 40 00 00 00       	mov    ecx,0x40
    89a9:	4c 89 f7             	mov    rdi,r14
    89ac:	e8 0c d7 ff ff       	call   60bd <encode_inst_rm_rm>
    89b1:	0f b6 c0             	movzx  eax,al
    89b4:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    89bb:	49 01 04 24          	add    QWORD PTR [r12],rax
    89bf:	48 83 c4 10          	add    rsp,0x10
    89c3:	e9 e6 f8 ff ff       	jmp    82ae <parseInst+0x139>
    89c8:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    89cc:	0f 85 96 f8 ff ff    	jne    8268 <parseInst+0xf3>
    89d2:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    89d6:	e8 4f b2 00 00       	call   13c2a <find_reg32_index>
    89db:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    89df:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    89e3:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    89ea:	0f b6 f0             	movzx  esi,al
    89ed:	48 83 ec 08          	sub    rsp,0x8
    89f1:	6a 00                	push   0x0
    89f3:	41 b9 00 00 00 00    	mov    r9d,0x0
    89f9:	41 b8 8b 00 00 00    	mov    r8d,0x8b
    89ff:	b9 20 00 00 00       	mov    ecx,0x20
    8a04:	4c 89 f7             	mov    rdi,r14
    8a07:	e8 b1 d6 ff ff       	call   60bd <encode_inst_rm_rm>
    8a0c:	0f b6 c0             	movzx  eax,al
    8a0f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8a16:	49 01 04 24          	add    QWORD PTR [r12],rax
    8a1a:	48 83 c4 10          	add    rsp,0x10
    8a1e:	e9 8b f8 ff ff       	jmp    82ae <parseInst+0x139>
    8a23:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    8a27:	0f 85 45 f8 ff ff    	jne    8272 <parseInst+0xfd>
    8a2d:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    8a31:	e8 ae b2 00 00       	call   13ce4 <find_reg16_index>
    8a36:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    8a3a:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8a3e:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    8a45:	0f b6 f0             	movzx  esi,al
    8a48:	48 83 ec 08          	sub    rsp,0x8
    8a4c:	6a 00                	push   0x0
    8a4e:	41 b9 00 00 00 00    	mov    r9d,0x0
    8a54:	41 b8 8b 00 00 00    	mov    r8d,0x8b
    8a5a:	b9 10 00 00 00       	mov    ecx,0x10
    8a5f:	4c 89 f7             	mov    rdi,r14
    8a62:	e8 56 d6 ff ff       	call   60bd <encode_inst_rm_rm>
    8a67:	0f b6 c0             	movzx  eax,al
    8a6a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8a71:	49 01 04 24          	add    QWORD PTR [r12],rax
    8a75:	48 83 c4 10          	add    rsp,0x10
    8a79:	e9 30 f8 ff ff       	jmp    82ae <parseInst+0x139>
    8a7e:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    8a82:	0f 85 f4 f7 ff ff    	jne    827c <parseInst+0x107>
    8a88:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    8a8c:	e8 24 b3 00 00       	call   13db5 <find_reg8_index>
    8a91:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    8a95:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8a99:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    8aa0:	0f b6 f0             	movzx  esi,al
    8aa3:	48 83 ec 08          	sub    rsp,0x8
    8aa7:	6a 00                	push   0x0
    8aa9:	41 b9 00 00 00 00    	mov    r9d,0x0
    8aaf:	41 b8 8a 00 00 00    	mov    r8d,0x8a
    8ab5:	b9 08 00 00 00       	mov    ecx,0x8
    8aba:	4c 89 f7             	mov    rdi,r14
    8abd:	e8 fb d5 ff ff       	call   60bd <encode_inst_rm_rm>
    8ac2:	0f b6 c0             	movzx  eax,al
    8ac5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8acc:	49 01 04 24          	add    QWORD PTR [r12],rax
    8ad0:	48 83 c4 10          	add    rsp,0x10
    8ad4:	e9 d5 f7 ff ff       	jmp    82ae <parseInst+0x139>
    8ad9:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    8add:	0f 85 a3 f7 ff ff    	jne    8286 <parseInst+0x111>
    8ae3:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8ae7:	e8 84 b0 00 00       	call   13b70 <find_reg64_index>
    8aec:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    8af0:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8af4:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    8afb:	0f b6 f0             	movzx  esi,al
    8afe:	48 83 ec 08          	sub    rsp,0x8
    8b02:	6a 00                	push   0x0
    8b04:	41 b9 00 00 00 00    	mov    r9d,0x0
    8b0a:	41 b8 89 00 00 00    	mov    r8d,0x89
    8b10:	b9 40 00 00 00       	mov    ecx,0x40
    8b15:	4c 89 f7             	mov    rdi,r14
    8b18:	e8 a0 d5 ff ff       	call   60bd <encode_inst_rm_rm>
    8b1d:	0f b6 c0             	movzx  eax,al
    8b20:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8b27:	49 01 04 24          	add    QWORD PTR [r12],rax
    8b2b:	48 83 c4 10          	add    rsp,0x10
    8b2f:	e9 7a f7 ff ff       	jmp    82ae <parseInst+0x139>
    8b34:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    8b38:	0f 85 52 f7 ff ff    	jne    8290 <parseInst+0x11b>
    8b3e:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8b42:	e8 e3 b0 00 00       	call   13c2a <find_reg32_index>
    8b47:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    8b4b:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8b4f:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    8b56:	0f b6 f0             	movzx  esi,al
    8b59:	48 83 ec 08          	sub    rsp,0x8
    8b5d:	6a 00                	push   0x0
    8b5f:	41 b9 00 00 00 00    	mov    r9d,0x0
    8b65:	41 b8 89 00 00 00    	mov    r8d,0x89
    8b6b:	b9 20 00 00 00       	mov    ecx,0x20
    8b70:	4c 89 f7             	mov    rdi,r14
    8b73:	e8 45 d5 ff ff       	call   60bd <encode_inst_rm_rm>
    8b78:	0f b6 c0             	movzx  eax,al
    8b7b:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8b82:	49 01 04 24          	add    QWORD PTR [r12],rax
    8b86:	48 83 c4 10          	add    rsp,0x10
    8b8a:	e9 1f f7 ff ff       	jmp    82ae <parseInst+0x139>
    8b8f:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    8b93:	0f 85 01 f7 ff ff    	jne    829a <parseInst+0x125>
    8b99:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8b9d:	e8 42 b1 00 00       	call   13ce4 <find_reg16_index>
    8ba2:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    8ba6:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8baa:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    8bb1:	0f b6 f0             	movzx  esi,al
    8bb4:	48 83 ec 08          	sub    rsp,0x8
    8bb8:	6a 00                	push   0x0
    8bba:	41 b9 00 00 00 00    	mov    r9d,0x0
    8bc0:	41 b8 89 00 00 00    	mov    r8d,0x89
    8bc6:	b9 10 00 00 00       	mov    ecx,0x10
    8bcb:	4c 89 f7             	mov    rdi,r14
    8bce:	e8 ea d4 ff ff       	call   60bd <encode_inst_rm_rm>
    8bd3:	0f b6 c0             	movzx  eax,al
    8bd6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8bdd:	49 01 04 24          	add    QWORD PTR [r12],rax
    8be1:	48 83 c4 10          	add    rsp,0x10
    8be5:	e9 c4 f6 ff ff       	jmp    82ae <parseInst+0x139>
    8bea:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    8bee:	0f 85 b0 f6 ff ff    	jne    82a4 <parseInst+0x12f>
    8bf4:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    8bf8:	e8 b8 b1 00 00       	call   13db5 <find_reg8_index>
    8bfd:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    8c01:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8c05:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    8c0c:	0f b6 f0             	movzx  esi,al
    8c0f:	48 83 ec 08          	sub    rsp,0x8
    8c13:	6a 00                	push   0x0
    8c15:	41 b9 00 00 00 00    	mov    r9d,0x0
    8c1b:	41 b8 88 00 00 00    	mov    r8d,0x88
    8c21:	b9 08 00 00 00       	mov    ecx,0x8
    8c26:	4c 89 f7             	mov    rdi,r14
    8c29:	e8 8f d4 ff ff       	call   60bd <encode_inst_rm_rm>
    8c2e:	0f b6 c0             	movzx  eax,al
    8c31:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8c38:	49 01 04 24          	add    QWORD PTR [r12],rax
    8c3c:	48 83 c4 10          	add    rsp,0x10
    8c40:	e9 69 f6 ff ff       	jmp    82ae <parseInst+0x139>
    8c45:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    8c49:	8d 50 f0             	lea    edx,[rax-0x10]
    8c4c:	80 fa 01             	cmp    dl,0x1
    8c4f:	0f 96 c2             	setbe  dl
    8c52:	3c 13                	cmp    al,0x13
    8c54:	0f 94 c1             	sete   cl
    8c57:	08 ca                	or     dl,cl
    8c59:	75 08                	jne    8c63 <parseInst+0xaee>
    8c5b:	3c 12                	cmp    al,0x12
    8c5d:	0f 85 4b f6 ff ff    	jne    82ae <parseInst+0x139>
    8c63:	48 8d 73 18          	lea    rsi,[rbx+0x18]
    8c67:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    8c6b:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    8c72:	0f b6 93 c8 00 00 00 	movzx  edx,BYTE PTR [rbx+0xc8]
    8c79:	80 fa 04             	cmp    dl,0x4
    8c7c:	0f 84 fb 00 00 00    	je     8d7d <parseInst+0xc08>
    8c82:	77 57                	ja     8cdb <parseInst+0xb66>
    8c84:	80 fa 01             	cmp    dl,0x1
    8c87:	0f 84 95 00 00 00    	je     8d22 <parseInst+0xbad>
    8c8d:	80 fa 02             	cmp    dl,0x2
    8c90:	0f 85 c8 00 00 00    	jne    8d5e <parseInst+0xbe9>
    8c96:	3c 13                	cmp    al,0x13
    8c98:	0f 84 d6 00 00 00    	je     8d74 <parseInst+0xbff>
    8c9e:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    8ca2:	48 83 ec 08          	sub    rsp,0x8
    8ca6:	50                   	push   rax
    8ca7:	41 b9 02 00 00 00    	mov    r9d,0x2
    8cad:	41 b8 c7 00 00 00    	mov    r8d,0xc7
    8cb3:	b9 10 00 00 00       	mov    ecx,0x10
    8cb8:	48 89 f2             	mov    rdx,rsi
    8cbb:	be 00 00 00 00       	mov    esi,0x0
    8cc0:	4c 89 f7             	mov    rdi,r14
    8cc3:	e8 f5 d3 ff ff       	call   60bd <encode_inst_rm_rm>
    8cc8:	0f b6 c0             	movzx  eax,al
    8ccb:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8cd2:	48 83 c4 10          	add    rsp,0x10
    8cd6:	e9 83 00 00 00       	jmp    8d5e <parseInst+0xbe9>
    8cdb:	80 fa 08             	cmp    dl,0x8
    8cde:	75 7e                	jne    8d5e <parseInst+0xbe9>
    8ce0:	3c 13                	cmp    al,0x13
    8ce2:	0f 84 d9 00 00 00    	je     8dc1 <parseInst+0xc4c>
    8ce8:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    8cec:	48 83 ec 08          	sub    rsp,0x8
    8cf0:	50                   	push   rax
    8cf1:	41 b9 04 00 00 00    	mov    r9d,0x4
    8cf7:	41 b8 c7 00 00 00    	mov    r8d,0xc7
    8cfd:	b9 40 00 00 00       	mov    ecx,0x40
    8d02:	48 89 f2             	mov    rdx,rsi
    8d05:	be 00 00 00 00       	mov    esi,0x0
    8d0a:	4c 89 f7             	mov    rdi,r14
    8d0d:	e8 ab d3 ff ff       	call   60bd <encode_inst_rm_rm>
    8d12:	0f b6 c0             	movzx  eax,al
    8d15:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8d1c:	48 83 c4 10          	add    rsp,0x10
    8d20:	eb 3c                	jmp    8d5e <parseInst+0xbe9>
    8d22:	3c 13                	cmp    al,0x13
    8d24:	74 48                	je     8d6e <parseInst+0xbf9>
    8d26:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    8d2a:	48 83 ec 08          	sub    rsp,0x8
    8d2e:	50                   	push   rax
    8d2f:	41 b9 01 00 00 00    	mov    r9d,0x1
    8d35:	41 b8 c6 00 00 00    	mov    r8d,0xc6
    8d3b:	b9 08 00 00 00       	mov    ecx,0x8
    8d40:	48 89 f2             	mov    rdx,rsi
    8d43:	be 00 00 00 00       	mov    esi,0x0
    8d48:	4c 89 f7             	mov    rdi,r14
    8d4b:	e8 6d d3 ff ff       	call   60bd <encode_inst_rm_rm>
    8d50:	0f b6 c0             	movzx  eax,al
    8d53:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8d5a:	48 83 c4 10          	add    rsp,0x10
    8d5e:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    8d65:	49 01 04 24          	add    QWORD PTR [r12],rax
    8d69:	e9 40 f5 ff ff       	jmp    82ae <parseInst+0x139>
    8d6e:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    8d72:	eb b6                	jmp    8d2a <parseInst+0xbb5>
    8d74:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    8d78:	e9 25 ff ff ff       	jmp    8ca2 <parseInst+0xb2d>
    8d7d:	3c 13                	cmp    al,0x13
    8d7f:	74 3a                	je     8dbb <parseInst+0xc46>
    8d81:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    8d85:	48 83 ec 08          	sub    rsp,0x8
    8d89:	50                   	push   rax
    8d8a:	41 b9 04 00 00 00    	mov    r9d,0x4
    8d90:	41 b8 c7 00 00 00    	mov    r8d,0xc7
    8d96:	b9 20 00 00 00       	mov    ecx,0x20
    8d9b:	48 89 f2             	mov    rdx,rsi
    8d9e:	be 00 00 00 00       	mov    esi,0x0
    8da3:	4c 89 f7             	mov    rdi,r14
    8da6:	e8 12 d3 ff ff       	call   60bd <encode_inst_rm_rm>
    8dab:	0f b6 c0             	movzx  eax,al
    8dae:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    8db5:	48 83 c4 10          	add    rsp,0x10
    8db9:	eb a3                	jmp    8d5e <parseInst+0xbe9>
    8dbb:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    8dbf:	eb c4                	jmp    8d85 <parseInst+0xc10>
    8dc1:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    8dc5:	e9 22 ff ff ff       	jmp    8cec <parseInst+0xb77>
    8dca:	48 8d 35 9d cc 00 00 	lea    rsi,[rip+0xcc9d]        # 15a6e <_IO_stdin_used+0xa6e>
    8dd1:	48 89 ef             	mov    rdi,rbp
    8dd4:	e8 77 a2 ff ff       	call   3050 <strcasecmp@plt>
    8dd9:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    8ddd:	85 c0                	test   eax,eax
    8ddf:	0f 84 89 00 00 00    	je     8e6e <parseInst+0xcf9>
    8de5:	48 8d 35 19 cf 00 00 	lea    rsi,[rip+0xcf19]        # 15d05 <_IO_stdin_used+0xd05>
    8dec:	48 89 ef             	mov    rdi,rbp
    8def:	e8 5c a2 ff ff       	call   3050 <strcasecmp@plt>
    8df4:	85 c0                	test   eax,eax
    8df6:	74 76                	je     8e6e <parseInst+0xcf9>
    8df8:	48 8d 35 73 cc 00 00 	lea    rsi,[rip+0xcc73]        # 15a72 <_IO_stdin_used+0xa72>
    8dff:	48 89 ef             	mov    rdi,rbp
    8e02:	e8 49 a2 ff ff       	call   3050 <strcasecmp@plt>
    8e07:	85 c0                	test   eax,eax
    8e09:	74 63                	je     8e6e <parseInst+0xcf9>
    8e0b:	48 8d 35 64 cc 00 00 	lea    rsi,[rip+0xcc64]        # 15a76 <_IO_stdin_used+0xa76>
    8e12:	48 89 ef             	mov    rdi,rbp
    8e15:	e8 36 a2 ff ff       	call   3050 <strcasecmp@plt>
    8e1a:	85 c0                	test   eax,eax
    8e1c:	74 50                	je     8e6e <parseInst+0xcf9>
    8e1e:	48 8d 35 d5 ce 00 00 	lea    rsi,[rip+0xced5]        # 15cfa <_IO_stdin_used+0xcfa>
    8e25:	48 89 ef             	mov    rdi,rbp
    8e28:	e8 23 a2 ff ff       	call   3050 <strcasecmp@plt>
    8e2d:	85 c0                	test   eax,eax
    8e2f:	74 3d                	je     8e6e <parseInst+0xcf9>
    8e31:	48 8d 35 42 cc 00 00 	lea    rsi,[rip+0xcc42]        # 15a7a <_IO_stdin_used+0xa7a>
    8e38:	48 89 ef             	mov    rdi,rbp
    8e3b:	e8 10 a2 ff ff       	call   3050 <strcasecmp@plt>
    8e40:	85 c0                	test   eax,eax
    8e42:	74 2a                	je     8e6e <parseInst+0xcf9>
    8e44:	48 8d 35 be ce 00 00 	lea    rsi,[rip+0xcebe]        # 15d09 <_IO_stdin_used+0xd09>
    8e4b:	48 89 ef             	mov    rdi,rbp
    8e4e:	e8 fd a1 ff ff       	call   3050 <strcasecmp@plt>
    8e53:	85 c0                	test   eax,eax
    8e55:	74 17                	je     8e6e <parseInst+0xcf9>
    8e57:	48 8d 35 20 cc 00 00 	lea    rsi,[rip+0xcc20]        # 15a7e <_IO_stdin_used+0xa7e>
    8e5e:	48 89 ef             	mov    rdi,rbp
    8e61:	e8 ea a1 ff ff       	call   3050 <strcasecmp@plt>
    8e66:	85 c0                	test   eax,eax
    8e68:	0f 85 2b 0a 00 00    	jne    9899 <parseInst+0x1724>
    8e6e:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    8e73:	0f 84 b5 00 00 00    	je     8f2e <parseInst+0xdb9>
    8e79:	48 8d 35 85 ce 00 00 	lea    rsi,[rip+0xce85]        # 15d05 <_IO_stdin_used+0xd05>
    8e80:	48 89 ef             	mov    rdi,rbp
    8e83:	e8 c8 a1 ff ff       	call   3050 <strcasecmp@plt>
    8e88:	85 c0                	test   eax,eax
    8e8a:	0f 84 0e 02 00 00    	je     909e <parseInst+0xf29>
    8e90:	48 8d 35 db cb 00 00 	lea    rsi,[rip+0xcbdb]        # 15a72 <_IO_stdin_used+0xa72>
    8e97:	48 89 ef             	mov    rdi,rbp
    8e9a:	e8 b1 a1 ff ff       	call   3050 <strcasecmp@plt>
    8e9f:	85 c0                	test   eax,eax
    8ea1:	0f 84 2e 02 00 00    	je     90d5 <parseInst+0xf60>
    8ea7:	48 8d 35 c8 cb 00 00 	lea    rsi,[rip+0xcbc8]        # 15a76 <_IO_stdin_used+0xa76>
    8eae:	48 89 ef             	mov    rdi,rbp
    8eb1:	e8 9a a1 ff ff       	call   3050 <strcasecmp@plt>
    8eb6:	85 c0                	test   eax,eax
    8eb8:	0f 84 4e 02 00 00    	je     910c <parseInst+0xf97>
    8ebe:	48 8d 35 35 ce 00 00 	lea    rsi,[rip+0xce35]        # 15cfa <_IO_stdin_used+0xcfa>
    8ec5:	48 89 ef             	mov    rdi,rbp
    8ec8:	e8 83 a1 ff ff       	call   3050 <strcasecmp@plt>
    8ecd:	85 c0                	test   eax,eax
    8ecf:	0f 84 6e 02 00 00    	je     9143 <parseInst+0xfce>
    8ed5:	48 8d 35 9e cb 00 00 	lea    rsi,[rip+0xcb9e]        # 15a7a <_IO_stdin_used+0xa7a>
    8edc:	48 89 ef             	mov    rdi,rbp
    8edf:	e8 6c a1 ff ff       	call   3050 <strcasecmp@plt>
    8ee4:	85 c0                	test   eax,eax
    8ee6:	0f 84 8e 02 00 00    	je     917a <parseInst+0x1005>
    8eec:	48 8d 35 16 ce 00 00 	lea    rsi,[rip+0xce16]        # 15d09 <_IO_stdin_used+0xd09>
    8ef3:	48 89 ef             	mov    rdi,rbp
    8ef6:	e8 55 a1 ff ff       	call   3050 <strcasecmp@plt>
    8efb:	85 c0                	test   eax,eax
    8efd:	0f 84 ae 02 00 00    	je     91b1 <parseInst+0x103c>
    8f03:	48 8d 35 74 cb 00 00 	lea    rsi,[rip+0xcb74]        # 15a7e <_IO_stdin_used+0xa7e>
    8f0a:	48 89 ef             	mov    rdi,rbp
    8f0d:	e8 3e a1 ff ff       	call   3050 <strcasecmp@plt>
    8f12:	85 c0                	test   eax,eax
    8f14:	0f 84 ce 02 00 00    	je     91e8 <parseInst+0x1073>
    8f1a:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    8f21:	00 00 
    8f23:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    8f2a:	00 00 
    8f2c:	eb 2c                	jmp    8f5a <parseInst+0xde5>
    8f2e:	c6 44 24 1d 00       	mov    BYTE PTR [rsp+0x1d],0x0
    8f33:	c6 44 24 1f 00       	mov    BYTE PTR [rsp+0x1f],0x0
    8f38:	c6 44 24 1e 02       	mov    BYTE PTR [rsp+0x1e],0x2
    8f3d:	c6 44 24 1c 03       	mov    BYTE PTR [rsp+0x1c],0x3
    8f42:	48 8d 05 94 da ff ff 	lea    rax,[rip+0xffffffffffffda94]        # 69dd <encode_add_reg_reg>
    8f49:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    8f4e:	48 8d 05 26 d9 ff ff 	lea    rax,[rip+0xffffffffffffd926]        # 687b <encode_add_imm>
    8f55:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    8f5a:	41 80 fd 0e          	cmp    r13b,0xe
    8f5e:	0f 84 bb 02 00 00    	je     921f <parseInst+0x10aa>
    8f64:	41 80 fd 0d          	cmp    r13b,0xd
    8f68:	0f 84 13 03 00 00    	je     9281 <parseInst+0x110c>
    8f6e:	41 80 fd 0c          	cmp    r13b,0xc
    8f72:	0f 84 6b 03 00 00    	je     92e3 <parseInst+0x116e>
    8f78:	41 80 fd 0b          	cmp    r13b,0xb
    8f7c:	0f 84 ad 03 00 00    	je     932f <parseInst+0x11ba>
    8f82:	41 80 fd 0e          	cmp    r13b,0xe
    8f86:	0f 84 00 04 00 00    	je     938c <parseInst+0x1217>
    8f8c:	41 80 fd 0d          	cmp    r13b,0xd
    8f90:	0f 84 49 04 00 00    	je     93df <parseInst+0x126a>
    8f96:	41 80 fd 0c          	cmp    r13b,0xc
    8f9a:	0f 84 92 04 00 00    	je     9432 <parseInst+0x12bd>
    8fa0:	41 80 fd 0b          	cmp    r13b,0xb
    8fa4:	0f 84 db 04 00 00    	je     9485 <parseInst+0x1310>
    8faa:	41 80 fd 0e          	cmp    r13b,0xe
    8fae:	0f 84 24 05 00 00    	je     94d8 <parseInst+0x1363>
    8fb4:	41 80 fd 0d          	cmp    r13b,0xd
    8fb8:	0f 84 75 05 00 00    	je     9533 <parseInst+0x13be>
    8fbe:	41 80 fd 0c          	cmp    r13b,0xc
    8fc2:	0f 84 c6 05 00 00    	je     958e <parseInst+0x1419>
    8fc8:	41 80 fd 0b          	cmp    r13b,0xb
    8fcc:	0f 84 17 06 00 00    	je     95e9 <parseInst+0x1474>
    8fd2:	41 80 fd 14          	cmp    r13b,0x14
    8fd6:	0f 84 68 06 00 00    	je     9644 <parseInst+0x14cf>
    8fdc:	41 80 fd 14          	cmp    r13b,0x14
    8fe0:	0f 84 b7 06 00 00    	je     969d <parseInst+0x1528>
    8fe6:	41 80 fd 14          	cmp    r13b,0x14
    8fea:	0f 84 06 07 00 00    	je     96f6 <parseInst+0x1581>
    8ff0:	41 80 fd 14          	cmp    r13b,0x14
    8ff4:	0f 84 55 07 00 00    	je     974f <parseInst+0x15da>
    8ffa:	41 80 fd 14          	cmp    r13b,0x14
    8ffe:	0f 85 aa f2 ff ff    	jne    82ae <parseInst+0x139>
    9004:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    9008:	8d 50 f0             	lea    edx,[rax-0x10]
    900b:	80 fa 01             	cmp    dl,0x1
    900e:	0f 96 c2             	setbe  dl
    9011:	3c 13                	cmp    al,0x13
    9013:	0f 94 c1             	sete   cl
    9016:	08 ca                	or     dl,cl
    9018:	75 08                	jne    9022 <parseInst+0xead>
    901a:	3c 12                	cmp    al,0x12
    901c:	0f 85 8c f2 ff ff    	jne    82ae <parseInst+0x139>
    9022:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9026:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    902a:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9031:	0f b6 93 c8 00 00 00 	movzx  edx,BYTE PTR [rbx+0xc8]
    9038:	80 fa 04             	cmp    dl,0x4
    903b:	0f 84 0b 08 00 00    	je     984c <parseInst+0x16d7>
    9041:	0f 87 63 07 00 00    	ja     97aa <parseInst+0x1635>
    9047:	80 fa 01             	cmp    dl,0x1
    904a:	0f 84 a1 07 00 00    	je     97f1 <parseInst+0x167c>
    9050:	80 fa 02             	cmp    dl,0x2
    9053:	0f 85 d4 07 00 00    	jne    982d <parseInst+0x16b8>
    9059:	3c 13                	cmp    al,0x13
    905b:	0f 84 e2 07 00 00    	je     9843 <parseInst+0x16ce>
    9061:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    9065:	0f b6 74 24 1d       	movzx  esi,BYTE PTR [rsp+0x1d]
    906a:	48 83 ec 08          	sub    rsp,0x8
    906e:	50                   	push   rax
    906f:	41 b9 02 00 00 00    	mov    r9d,0x2
    9075:	41 b8 81 00 00 00    	mov    r8d,0x81
    907b:	b9 10 00 00 00       	mov    ecx,0x10
    9080:	48 89 fa             	mov    rdx,rdi
    9083:	4c 89 f7             	mov    rdi,r14
    9086:	e8 32 d0 ff ff       	call   60bd <encode_inst_rm_rm>
    908b:	0f b6 c0             	movzx  eax,al
    908e:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9095:	48 83 c4 10          	add    rsp,0x10
    9099:	e9 8f 07 00 00       	jmp    982d <parseInst+0x16b8>
    909e:	44 88 7c 24 1d       	mov    BYTE PTR [rsp+0x1d],r15b
    90a3:	c6 44 24 1f 08       	mov    BYTE PTR [rsp+0x1f],0x8
    90a8:	41 bf 09 00 00 00    	mov    r15d,0x9
    90ae:	c6 44 24 1e 0a       	mov    BYTE PTR [rsp+0x1e],0xa
    90b3:	c6 44 24 1c 0b       	mov    BYTE PTR [rsp+0x1c],0xb
    90b8:	48 8d 05 72 e8 ff ff 	lea    rax,[rip+0xffffffffffffe872]        # 7931 <encode_or_reg_reg>
    90bf:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    90c4:	48 8d 05 04 e7 ff ff 	lea    rax,[rip+0xffffffffffffe704]        # 77cf <encode_or_imm>
    90cb:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    90d0:	e9 85 fe ff ff       	jmp    8f5a <parseInst+0xde5>
    90d5:	c6 44 24 1d 02       	mov    BYTE PTR [rsp+0x1d],0x2
    90da:	c6 44 24 1f 10       	mov    BYTE PTR [rsp+0x1f],0x10
    90df:	41 bf 11 00 00 00    	mov    r15d,0x11
    90e5:	c6 44 24 1e 12       	mov    BYTE PTR [rsp+0x1e],0x12
    90ea:	c6 44 24 1c 13       	mov    BYTE PTR [rsp+0x1c],0x13
    90ef:	48 8d 05 2b e6 ff ff 	lea    rax,[rip+0xffffffffffffe62b]        # 7721 <encode_adc_reg_reg>
    90f6:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    90fb:	48 8d 05 bd e4 ff ff 	lea    rax,[rip+0xffffffffffffe4bd]        # 75bf <encode_adc_imm>
    9102:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    9107:	e9 4e fe ff ff       	jmp    8f5a <parseInst+0xde5>
    910c:	c6 44 24 1d 03       	mov    BYTE PTR [rsp+0x1d],0x3
    9111:	c6 44 24 1f 18       	mov    BYTE PTR [rsp+0x1f],0x18
    9116:	41 bf 19 00 00 00    	mov    r15d,0x19
    911c:	c6 44 24 1e 1a       	mov    BYTE PTR [rsp+0x1e],0x1a
    9121:	c6 44 24 1c 1b       	mov    BYTE PTR [rsp+0x1c],0x1b
    9126:	48 8d 05 11 ea ff ff 	lea    rax,[rip+0xffffffffffffea11]        # 7b3e <encode_sbb_reg_reg>
    912d:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    9132:	48 8d 05 a3 e8 ff ff 	lea    rax,[rip+0xffffffffffffe8a3]        # 79dc <encode_sbb_imm>
    9139:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    913e:	e9 17 fe ff ff       	jmp    8f5a <parseInst+0xde5>
    9143:	c6 44 24 1d 04       	mov    BYTE PTR [rsp+0x1d],0x4
    9148:	c6 44 24 1f 20       	mov    BYTE PTR [rsp+0x1f],0x20
    914d:	41 bf 21 00 00 00    	mov    r15d,0x21
    9153:	c6 44 24 1e 22       	mov    BYTE PTR [rsp+0x1e],0x22
    9158:	c6 44 24 1c 23       	mov    BYTE PTR [rsp+0x1c],0x23
    915d:	48 8d 05 ea eb ff ff 	lea    rax,[rip+0xffffffffffffebea]        # 7d4e <encode_and_reg_reg>
    9164:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    9169:	48 8d 05 7c ea ff ff 	lea    rax,[rip+0xffffffffffffea7c]        # 7bec <encode_and_imm>
    9170:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    9175:	e9 e0 fd ff ff       	jmp    8f5a <parseInst+0xde5>
    917a:	c6 44 24 1d 05       	mov    BYTE PTR [rsp+0x1d],0x5
    917f:	c6 44 24 1f 28       	mov    BYTE PTR [rsp+0x1f],0x28
    9184:	41 bf 29 00 00 00    	mov    r15d,0x29
    918a:	c6 44 24 1e 2a       	mov    BYTE PTR [rsp+0x1e],0x2a
    918f:	c6 44 24 1c 2b       	mov    BYTE PTR [rsp+0x1c],0x2b
    9194:	48 8d 05 46 da ff ff 	lea    rax,[rip+0xffffffffffffda46]        # 6be1 <encode_sub_reg_reg>
    919b:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    91a0:	48 8d 05 d8 d8 ff ff 	lea    rax,[rip+0xffffffffffffd8d8]        # 6a7f <encode_sub_imm>
    91a7:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    91ac:	e9 a9 fd ff ff       	jmp    8f5a <parseInst+0xde5>
    91b1:	c6 44 24 1d 06       	mov    BYTE PTR [rsp+0x1d],0x6
    91b6:	c6 44 24 1f 30       	mov    BYTE PTR [rsp+0x1f],0x30
    91bb:	41 bf 31 00 00 00    	mov    r15d,0x31
    91c1:	c6 44 24 1e 32       	mov    BYTE PTR [rsp+0x1e],0x32
    91c6:	c6 44 24 1c 33       	mov    BYTE PTR [rsp+0x1c],0x33
    91cb:	48 8d 05 3f e3 ff ff 	lea    rax,[rip+0xffffffffffffe33f]        # 7511 <encode_xor_reg_reg>
    91d2:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    91d7:	48 8d 05 d1 e1 ff ff 	lea    rax,[rip+0xffffffffffffe1d1]        # 73af <encode_xor_imm>
    91de:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    91e3:	e9 72 fd ff ff       	jmp    8f5a <parseInst+0xde5>
    91e8:	c6 44 24 1d 07       	mov    BYTE PTR [rsp+0x1d],0x7
    91ed:	c6 44 24 1f 38       	mov    BYTE PTR [rsp+0x1f],0x38
    91f2:	41 bf 39 00 00 00    	mov    r15d,0x39
    91f8:	c6 44 24 1e 3a       	mov    BYTE PTR [rsp+0x1e],0x3a
    91fd:	c6 44 24 1c 3b       	mov    BYTE PTR [rsp+0x1c],0x3b
    9202:	48 8d 05 b5 df ff ff 	lea    rax,[rip+0xffffffffffffdfb5]        # 71be <encode_cmp_reg_reg>
    9209:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    920e:	48 8d 05 4a de ff ff 	lea    rax,[rip+0xffffffffffffde4a]        # 705f <encode_cmp_imm>
    9215:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    921a:	e9 3b fd ff ff       	jmp    8f5a <parseInst+0xde5>
    921f:	0f b6 53 70          	movzx  edx,BYTE PTR [rbx+0x70]
    9223:	8d 42 f0             	lea    eax,[rdx-0x10]
    9226:	3c 01                	cmp    al,0x1
    9228:	0f 96 c0             	setbe  al
    922b:	80 fa 13             	cmp    dl,0x13
    922e:	0f 94 c2             	sete   dl
    9231:	08 d0                	or     al,dl
    9233:	0f 84 2b fd ff ff    	je     8f64 <parseInst+0xdef>
    9239:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    923d:	e8 2e a9 00 00       	call   13b70 <find_reg64_index>
    9242:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9246:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    924d:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
    9251:	0f b6 f0             	movzx  esi,al
    9254:	41 0f 94 c0          	sete   r8b
    9258:	45 0f b6 c0          	movzx  r8d,r8b
    925c:	b9 40 00 00 00       	mov    ecx,0x40
    9261:	8b 53 78             	mov    edx,DWORD PTR [rbx+0x78]
    9264:	4c 89 f7             	mov    rdi,r14
    9267:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    926c:	ff d0                	call   rax
    926e:	0f b6 c0             	movzx  eax,al
    9271:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9278:	49 01 04 24          	add    QWORD PTR [r12],rax
    927c:	e9 2d f0 ff ff       	jmp    82ae <parseInst+0x139>
    9281:	0f b6 53 70          	movzx  edx,BYTE PTR [rbx+0x70]
    9285:	8d 42 f0             	lea    eax,[rdx-0x10]
    9288:	3c 01                	cmp    al,0x1
    928a:	0f 96 c0             	setbe  al
    928d:	80 fa 13             	cmp    dl,0x13
    9290:	0f 94 c2             	sete   dl
    9293:	08 d0                	or     al,dl
    9295:	0f 84 d3 fc ff ff    	je     8f6e <parseInst+0xdf9>
    929b:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    929f:	e8 86 a9 00 00       	call   13c2a <find_reg32_index>
    92a4:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    92a8:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    92af:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
    92b3:	0f b6 f0             	movzx  esi,al
    92b6:	41 0f 94 c0          	sete   r8b
    92ba:	45 0f b6 c0          	movzx  r8d,r8b
    92be:	b9 20 00 00 00       	mov    ecx,0x20
    92c3:	8b 53 78             	mov    edx,DWORD PTR [rbx+0x78]
    92c6:	4c 89 f7             	mov    rdi,r14
    92c9:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    92ce:	ff d0                	call   rax
    92d0:	0f b6 c0             	movzx  eax,al
    92d3:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    92da:	49 01 04 24          	add    QWORD PTR [r12],rax
    92de:	e9 cb ef ff ff       	jmp    82ae <parseInst+0x139>
    92e3:	80 7b 70 13          	cmp    BYTE PTR [rbx+0x70],0x13
    92e7:	0f 85 8b fc ff ff    	jne    8f78 <parseInst+0xe03>
    92ed:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    92f1:	e8 ee a9 00 00       	call   13ce4 <find_reg16_index>
    92f6:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    92fa:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9301:	0f b6 f0             	movzx  esi,al
    9304:	41 b8 00 00 00 00    	mov    r8d,0x0
    930a:	b9 10 00 00 00       	mov    ecx,0x10
    930f:	8b 53 78             	mov    edx,DWORD PTR [rbx+0x78]
    9312:	4c 89 f7             	mov    rdi,r14
    9315:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    931a:	ff d0                	call   rax
    931c:	0f b6 c0             	movzx  eax,al
    931f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9326:	49 01 04 24          	add    QWORD PTR [r12],rax
    932a:	e9 7f ef ff ff       	jmp    82ae <parseInst+0x139>
    932f:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    9333:	83 e8 12             	sub    eax,0x12
    9336:	3c 01                	cmp    al,0x1
    9338:	0f 87 44 fc ff ff    	ja     8f82 <parseInst+0xe0d>
    933e:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9342:	e8 6e aa 00 00       	call   13db5 <find_reg8_index>
    9347:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    934b:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9352:	80 7b 70 13          	cmp    BYTE PTR [rbx+0x70],0x13
    9356:	74 2f                	je     9387 <parseInst+0x1212>
    9358:	0f b6 53 78          	movzx  edx,BYTE PTR [rbx+0x78]
    935c:	0f b6 f0             	movzx  esi,al
    935f:	41 b8 00 00 00 00    	mov    r8d,0x0
    9365:	b9 08 00 00 00       	mov    ecx,0x8
    936a:	4c 89 f7             	mov    rdi,r14
    936d:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    9372:	ff d0                	call   rax
    9374:	0f b6 c0             	movzx  eax,al
    9377:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    937e:	49 01 04 24          	add    QWORD PTR [r12],rax
    9382:	e9 27 ef ff ff       	jmp    82ae <parseInst+0x139>
    9387:	8b 53 78             	mov    edx,DWORD PTR [rbx+0x78]
    938a:	eb d0                	jmp    935c <parseInst+0x11e7>
    938c:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    9390:	0f 85 f6 fb ff ff    	jne    8f8c <parseInst+0xe17>
    9396:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    939a:	e8 d1 a7 00 00       	call   13b70 <find_reg64_index>
    939f:	41 89 c5             	mov    r13d,eax
    93a2:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    93a6:	e8 c5 a7 00 00       	call   13b70 <find_reg64_index>
    93ab:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    93af:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    93b6:	0f b6 d0             	movzx  edx,al
    93b9:	41 0f b6 f5          	movzx  esi,r13b
    93bd:	b9 40 00 00 00       	mov    ecx,0x40
    93c2:	4c 89 f7             	mov    rdi,r14
    93c5:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    93ca:	ff d0                	call   rax
    93cc:	0f b6 c0             	movzx  eax,al
    93cf:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    93d6:	49 01 04 24          	add    QWORD PTR [r12],rax
    93da:	e9 cf ee ff ff       	jmp    82ae <parseInst+0x139>
    93df:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    93e3:	0f 85 ad fb ff ff    	jne    8f96 <parseInst+0xe21>
    93e9:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    93ed:	e8 38 a8 00 00       	call   13c2a <find_reg32_index>
    93f2:	41 89 c5             	mov    r13d,eax
    93f5:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    93f9:	e8 2c a8 00 00       	call   13c2a <find_reg32_index>
    93fe:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9402:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9409:	0f b6 d0             	movzx  edx,al
    940c:	41 0f b6 f5          	movzx  esi,r13b
    9410:	b9 20 00 00 00       	mov    ecx,0x20
    9415:	4c 89 f7             	mov    rdi,r14
    9418:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    941d:	ff d0                	call   rax
    941f:	0f b6 c0             	movzx  eax,al
    9422:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9429:	49 01 04 24          	add    QWORD PTR [r12],rax
    942d:	e9 7c ee ff ff       	jmp    82ae <parseInst+0x139>
    9432:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    9436:	0f 85 64 fb ff ff    	jne    8fa0 <parseInst+0xe2b>
    943c:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9440:	e8 9f a8 00 00       	call   13ce4 <find_reg16_index>
    9445:	41 89 c5             	mov    r13d,eax
    9448:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    944c:	e8 93 a8 00 00       	call   13ce4 <find_reg16_index>
    9451:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9455:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    945c:	0f b6 d0             	movzx  edx,al
    945f:	41 0f b6 f5          	movzx  esi,r13b
    9463:	b9 10 00 00 00       	mov    ecx,0x10
    9468:	4c 89 f7             	mov    rdi,r14
    946b:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    9470:	ff d0                	call   rax
    9472:	0f b6 c0             	movzx  eax,al
    9475:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    947c:	49 01 04 24          	add    QWORD PTR [r12],rax
    9480:	e9 29 ee ff ff       	jmp    82ae <parseInst+0x139>
    9485:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    9489:	0f 85 1b fb ff ff    	jne    8faa <parseInst+0xe35>
    948f:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9493:	e8 1d a9 00 00       	call   13db5 <find_reg8_index>
    9498:	41 89 c5             	mov    r13d,eax
    949b:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    949f:	e8 11 a9 00 00       	call   13db5 <find_reg8_index>
    94a4:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    94a8:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    94af:	0f b6 d0             	movzx  edx,al
    94b2:	41 0f b6 f5          	movzx  esi,r13b
    94b6:	b9 08 00 00 00       	mov    ecx,0x8
    94bb:	4c 89 f7             	mov    rdi,r14
    94be:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    94c3:	ff d0                	call   rax
    94c5:	0f b6 c0             	movzx  eax,al
    94c8:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    94cf:	49 01 04 24          	add    QWORD PTR [r12],rax
    94d3:	e9 d6 ed ff ff       	jmp    82ae <parseInst+0x139>
    94d8:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    94dc:	0f 85 d2 fa ff ff    	jne    8fb4 <parseInst+0xe3f>
    94e2:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    94e6:	e8 85 a6 00 00       	call   13b70 <find_reg64_index>
    94eb:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    94ef:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    94f3:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    94fa:	0f b6 f0             	movzx  esi,al
    94fd:	48 83 ec 08          	sub    rsp,0x8
    9501:	6a 00                	push   0x0
    9503:	41 b9 00 00 00 00    	mov    r9d,0x0
    9509:	44 0f b6 44 24 2c    	movzx  r8d,BYTE PTR [rsp+0x2c]
    950f:	b9 40 00 00 00       	mov    ecx,0x40
    9514:	4c 89 f7             	mov    rdi,r14
    9517:	e8 a1 cb ff ff       	call   60bd <encode_inst_rm_rm>
    951c:	0f b6 c0             	movzx  eax,al
    951f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9526:	49 01 04 24          	add    QWORD PTR [r12],rax
    952a:	48 83 c4 10          	add    rsp,0x10
    952e:	e9 7b ed ff ff       	jmp    82ae <parseInst+0x139>
    9533:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    9537:	0f 85 81 fa ff ff    	jne    8fbe <parseInst+0xe49>
    953d:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9541:	e8 e4 a6 00 00       	call   13c2a <find_reg32_index>
    9546:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    954a:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    954e:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    9555:	0f b6 f0             	movzx  esi,al
    9558:	48 83 ec 08          	sub    rsp,0x8
    955c:	6a 00                	push   0x0
    955e:	41 b9 00 00 00 00    	mov    r9d,0x0
    9564:	44 0f b6 44 24 2c    	movzx  r8d,BYTE PTR [rsp+0x2c]
    956a:	b9 20 00 00 00       	mov    ecx,0x20
    956f:	4c 89 f7             	mov    rdi,r14
    9572:	e8 46 cb ff ff       	call   60bd <encode_inst_rm_rm>
    9577:	0f b6 c0             	movzx  eax,al
    957a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9581:	49 01 04 24          	add    QWORD PTR [r12],rax
    9585:	48 83 c4 10          	add    rsp,0x10
    9589:	e9 20 ed ff ff       	jmp    82ae <parseInst+0x139>
    958e:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    9592:	0f 85 30 fa ff ff    	jne    8fc8 <parseInst+0xe53>
    9598:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    959c:	e8 43 a7 00 00       	call   13ce4 <find_reg16_index>
    95a1:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    95a5:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    95a9:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    95b0:	0f b6 f0             	movzx  esi,al
    95b3:	48 83 ec 08          	sub    rsp,0x8
    95b7:	6a 00                	push   0x0
    95b9:	41 b9 00 00 00 00    	mov    r9d,0x0
    95bf:	44 0f b6 44 24 2c    	movzx  r8d,BYTE PTR [rsp+0x2c]
    95c5:	b9 10 00 00 00       	mov    ecx,0x10
    95ca:	4c 89 f7             	mov    rdi,r14
    95cd:	e8 eb ca ff ff       	call   60bd <encode_inst_rm_rm>
    95d2:	0f b6 c0             	movzx  eax,al
    95d5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    95dc:	49 01 04 24          	add    QWORD PTR [r12],rax
    95e0:	48 83 c4 10          	add    rsp,0x10
    95e4:	e9 c5 ec ff ff       	jmp    82ae <parseInst+0x139>
    95e9:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    95ed:	0f 85 df f9 ff ff    	jne    8fd2 <parseInst+0xe5d>
    95f3:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    95f7:	e8 b9 a7 00 00       	call   13db5 <find_reg8_index>
    95fc:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    9600:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    9604:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    960b:	0f b6 f0             	movzx  esi,al
    960e:	48 83 ec 08          	sub    rsp,0x8
    9612:	6a 00                	push   0x0
    9614:	41 b9 00 00 00 00    	mov    r9d,0x0
    961a:	44 0f b6 44 24 2e    	movzx  r8d,BYTE PTR [rsp+0x2e]
    9620:	b9 08 00 00 00       	mov    ecx,0x8
    9625:	4c 89 f7             	mov    rdi,r14
    9628:	e8 90 ca ff ff       	call   60bd <encode_inst_rm_rm>
    962d:	0f b6 c0             	movzx  eax,al
    9630:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9637:	49 01 04 24          	add    QWORD PTR [r12],rax
    963b:	48 83 c4 10          	add    rsp,0x10
    963f:	e9 6a ec ff ff       	jmp    82ae <parseInst+0x139>
    9644:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    9648:	0f 85 8e f9 ff ff    	jne    8fdc <parseInst+0xe67>
    964e:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    9652:	e8 19 a5 00 00       	call   13b70 <find_reg64_index>
    9657:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    965b:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    965f:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    9666:	0f b6 f0             	movzx  esi,al
    9669:	48 83 ec 08          	sub    rsp,0x8
    966d:	6a 00                	push   0x0
    966f:	41 b9 00 00 00 00    	mov    r9d,0x0
    9675:	45 0f b6 c7          	movzx  r8d,r15b
    9679:	b9 40 00 00 00       	mov    ecx,0x40
    967e:	4c 89 f7             	mov    rdi,r14
    9681:	e8 37 ca ff ff       	call   60bd <encode_inst_rm_rm>
    9686:	0f b6 c0             	movzx  eax,al
    9689:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9690:	49 01 04 24          	add    QWORD PTR [r12],rax
    9694:	48 83 c4 10          	add    rsp,0x10
    9698:	e9 11 ec ff ff       	jmp    82ae <parseInst+0x139>
    969d:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    96a1:	0f 85 3f f9 ff ff    	jne    8fe6 <parseInst+0xe71>
    96a7:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    96ab:	e8 7a a5 00 00       	call   13c2a <find_reg32_index>
    96b0:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    96b4:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    96b8:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    96bf:	0f b6 f0             	movzx  esi,al
    96c2:	48 83 ec 08          	sub    rsp,0x8
    96c6:	6a 00                	push   0x0
    96c8:	41 b9 00 00 00 00    	mov    r9d,0x0
    96ce:	45 0f b6 c7          	movzx  r8d,r15b
    96d2:	b9 20 00 00 00       	mov    ecx,0x20
    96d7:	4c 89 f7             	mov    rdi,r14
    96da:	e8 de c9 ff ff       	call   60bd <encode_inst_rm_rm>
    96df:	0f b6 c0             	movzx  eax,al
    96e2:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    96e9:	49 01 04 24          	add    QWORD PTR [r12],rax
    96ed:	48 83 c4 10          	add    rsp,0x10
    96f1:	e9 b8 eb ff ff       	jmp    82ae <parseInst+0x139>
    96f6:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    96fa:	0f 85 f0 f8 ff ff    	jne    8ff0 <parseInst+0xe7b>
    9700:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    9704:	e8 db a5 00 00       	call   13ce4 <find_reg16_index>
    9709:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    970d:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    9711:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    9718:	0f b6 f0             	movzx  esi,al
    971b:	48 83 ec 08          	sub    rsp,0x8
    971f:	6a 00                	push   0x0
    9721:	41 b9 00 00 00 00    	mov    r9d,0x0
    9727:	45 0f b6 c7          	movzx  r8d,r15b
    972b:	b9 10 00 00 00       	mov    ecx,0x10
    9730:	4c 89 f7             	mov    rdi,r14
    9733:	e8 85 c9 ff ff       	call   60bd <encode_inst_rm_rm>
    9738:	0f b6 c0             	movzx  eax,al
    973b:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9742:	49 01 04 24          	add    QWORD PTR [r12],rax
    9746:	48 83 c4 10          	add    rsp,0x10
    974a:	e9 5f eb ff ff       	jmp    82ae <parseInst+0x139>
    974f:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    9753:	0f 85 a1 f8 ff ff    	jne    8ffa <parseInst+0xe85>
    9759:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    975d:	e8 53 a6 00 00       	call   13db5 <find_reg8_index>
    9762:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    9766:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    976a:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    9771:	0f b6 f0             	movzx  esi,al
    9774:	48 83 ec 08          	sub    rsp,0x8
    9778:	6a 00                	push   0x0
    977a:	41 b9 00 00 00 00    	mov    r9d,0x0
    9780:	44 0f b6 44 24 2f    	movzx  r8d,BYTE PTR [rsp+0x2f]
    9786:	b9 08 00 00 00       	mov    ecx,0x8
    978b:	4c 89 f7             	mov    rdi,r14
    978e:	e8 2a c9 ff ff       	call   60bd <encode_inst_rm_rm>
    9793:	0f b6 c0             	movzx  eax,al
    9796:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    979d:	49 01 04 24          	add    QWORD PTR [r12],rax
    97a1:	48 83 c4 10          	add    rsp,0x10
    97a5:	e9 04 eb ff ff       	jmp    82ae <parseInst+0x139>
    97aa:	80 fa 08             	cmp    dl,0x8
    97ad:	75 7e                	jne    982d <parseInst+0x16b8>
    97af:	3c 13                	cmp    al,0x13
    97b1:	0f 84 d9 00 00 00    	je     9890 <parseInst+0x171b>
    97b7:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    97bb:	0f b6 74 24 1d       	movzx  esi,BYTE PTR [rsp+0x1d]
    97c0:	48 83 ec 08          	sub    rsp,0x8
    97c4:	50                   	push   rax
    97c5:	41 b9 04 00 00 00    	mov    r9d,0x4
    97cb:	41 b8 81 00 00 00    	mov    r8d,0x81
    97d1:	b9 40 00 00 00       	mov    ecx,0x40
    97d6:	48 89 fa             	mov    rdx,rdi
    97d9:	4c 89 f7             	mov    rdi,r14
    97dc:	e8 dc c8 ff ff       	call   60bd <encode_inst_rm_rm>
    97e1:	0f b6 c0             	movzx  eax,al
    97e4:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    97eb:	48 83 c4 10          	add    rsp,0x10
    97ef:	eb 3c                	jmp    982d <parseInst+0x16b8>
    97f1:	3c 13                	cmp    al,0x13
    97f3:	74 48                	je     983d <parseInst+0x16c8>
    97f5:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    97f9:	0f b6 74 24 1d       	movzx  esi,BYTE PTR [rsp+0x1d]
    97fe:	48 83 ec 08          	sub    rsp,0x8
    9802:	50                   	push   rax
    9803:	41 b9 01 00 00 00    	mov    r9d,0x1
    9809:	41 b8 80 00 00 00    	mov    r8d,0x80
    980f:	b9 08 00 00 00       	mov    ecx,0x8
    9814:	48 89 fa             	mov    rdx,rdi
    9817:	4c 89 f7             	mov    rdi,r14
    981a:	e8 9e c8 ff ff       	call   60bd <encode_inst_rm_rm>
    981f:	0f b6 c0             	movzx  eax,al
    9822:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9829:	48 83 c4 10          	add    rsp,0x10
    982d:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    9834:	49 01 04 24          	add    QWORD PTR [r12],rax
    9838:	e9 71 ea ff ff       	jmp    82ae <parseInst+0x139>
    983d:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    9841:	eb b6                	jmp    97f9 <parseInst+0x1684>
    9843:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    9847:	e9 19 f8 ff ff       	jmp    9065 <parseInst+0xef0>
    984c:	3c 13                	cmp    al,0x13
    984e:	74 3a                	je     988a <parseInst+0x1715>
    9850:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    9854:	0f b6 74 24 1d       	movzx  esi,BYTE PTR [rsp+0x1d]
    9859:	48 83 ec 08          	sub    rsp,0x8
    985d:	50                   	push   rax
    985e:	41 b9 04 00 00 00    	mov    r9d,0x4
    9864:	41 b8 81 00 00 00    	mov    r8d,0x81
    986a:	b9 20 00 00 00       	mov    ecx,0x20
    986f:	48 89 fa             	mov    rdx,rdi
    9872:	4c 89 f7             	mov    rdi,r14
    9875:	e8 43 c8 ff ff       	call   60bd <encode_inst_rm_rm>
    987a:	0f b6 c0             	movzx  eax,al
    987d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9884:	48 83 c4 10          	add    rsp,0x10
    9888:	eb a3                	jmp    982d <parseInst+0x16b8>
    988a:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    988e:	eb c4                	jmp    9854 <parseInst+0x16df>
    9890:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    9894:	e9 22 ff ff ff       	jmp    97bb <parseInst+0x1646>
    9899:	48 8d 35 e2 c1 00 00 	lea    rsi,[rip+0xc1e2]        # 15a82 <_IO_stdin_used+0xa82>
    98a0:	48 89 ef             	mov    rdi,rbp
    98a3:	e8 a8 97 ff ff       	call   3050 <strcasecmp@plt>
    98a8:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    98ac:	85 c0                	test   eax,eax
    98ae:	0f 84 89 00 00 00    	je     993d <parseInst+0x17c8>
    98b4:	48 8d 35 cb c1 00 00 	lea    rsi,[rip+0xc1cb]        # 15a86 <_IO_stdin_used+0xa86>
    98bb:	48 89 ef             	mov    rdi,rbp
    98be:	e8 8d 97 ff ff       	call   3050 <strcasecmp@plt>
    98c3:	85 c0                	test   eax,eax
    98c5:	74 76                	je     993d <parseInst+0x17c8>
    98c7:	48 8d 35 bc c1 00 00 	lea    rsi,[rip+0xc1bc]        # 15a8a <_IO_stdin_used+0xa8a>
    98ce:	48 89 ef             	mov    rdi,rbp
    98d1:	e8 7a 97 ff ff       	call   3050 <strcasecmp@plt>
    98d6:	85 c0                	test   eax,eax
    98d8:	74 63                	je     993d <parseInst+0x17c8>
    98da:	48 8d 35 ad c1 00 00 	lea    rsi,[rip+0xc1ad]        # 15a8e <_IO_stdin_used+0xa8e>
    98e1:	48 89 ef             	mov    rdi,rbp
    98e4:	e8 67 97 ff ff       	call   3050 <strcasecmp@plt>
    98e9:	85 c0                	test   eax,eax
    98eb:	74 50                	je     993d <parseInst+0x17c8>
    98ed:	48 8d 35 9e c1 00 00 	lea    rsi,[rip+0xc19e]        # 15a92 <_IO_stdin_used+0xa92>
    98f4:	48 89 ef             	mov    rdi,rbp
    98f7:	e8 54 97 ff ff       	call   3050 <strcasecmp@plt>
    98fc:	85 c0                	test   eax,eax
    98fe:	74 3d                	je     993d <parseInst+0x17c8>
    9900:	48 8d 35 8f c1 00 00 	lea    rsi,[rip+0xc18f]        # 15a96 <_IO_stdin_used+0xa96>
    9907:	48 89 ef             	mov    rdi,rbp
    990a:	e8 41 97 ff ff       	call   3050 <strcasecmp@plt>
    990f:	85 c0                	test   eax,eax
    9911:	74 2a                	je     993d <parseInst+0x17c8>
    9913:	48 8d 35 80 c1 00 00 	lea    rsi,[rip+0xc180]        # 15a9a <_IO_stdin_used+0xa9a>
    991a:	48 89 ef             	mov    rdi,rbp
    991d:	e8 2e 97 ff ff       	call   3050 <strcasecmp@plt>
    9922:	85 c0                	test   eax,eax
    9924:	74 17                	je     993d <parseInst+0x17c8>
    9926:	48 8d 35 71 c1 00 00 	lea    rsi,[rip+0xc171]        # 15a9e <_IO_stdin_used+0xa9e>
    992d:	48 89 ef             	mov    rdi,rbp
    9930:	e8 1b 97 ff ff       	call   3050 <strcasecmp@plt>
    9935:	85 c0                	test   eax,eax
    9937:	0f 85 61 08 00 00    	jne    a19e <parseInst+0x2029>
    993d:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    9942:	0f 84 a5 00 00 00    	je     99ed <parseInst+0x1878>
    9948:	48 8d 35 37 c1 00 00 	lea    rsi,[rip+0xc137]        # 15a86 <_IO_stdin_used+0xa86>
    994f:	48 89 ef             	mov    rdi,rbp
    9952:	e8 f9 96 ff ff       	call   3050 <strcasecmp@plt>
    9957:	85 c0                	test   eax,eax
    9959:	0f 84 94 00 00 00    	je     99f3 <parseInst+0x187e>
    995f:	48 8d 35 24 c1 00 00 	lea    rsi,[rip+0xc124]        # 15a8a <_IO_stdin_used+0xa8a>
    9966:	48 89 ef             	mov    rdi,rbp
    9969:	e8 e2 96 ff ff       	call   3050 <strcasecmp@plt>
    996e:	85 c0                	test   eax,eax
    9970:	0f 84 d3 00 00 00    	je     9a49 <parseInst+0x18d4>
    9976:	48 8d 35 11 c1 00 00 	lea    rsi,[rip+0xc111]        # 15a8e <_IO_stdin_used+0xa8e>
    997d:	48 89 ef             	mov    rdi,rbp
    9980:	e8 cb 96 ff ff       	call   3050 <strcasecmp@plt>
    9985:	85 c0                	test   eax,eax
    9987:	0f 84 c4 00 00 00    	je     9a51 <parseInst+0x18dc>
    998d:	48 8d 35 fe c0 00 00 	lea    rsi,[rip+0xc0fe]        # 15a92 <_IO_stdin_used+0xa92>
    9994:	48 89 ef             	mov    rdi,rbp
    9997:	e8 b4 96 ff ff       	call   3050 <strcasecmp@plt>
    999c:	85 c0                	test   eax,eax
    999e:	0f 84 b5 00 00 00    	je     9a59 <parseInst+0x18e4>
    99a4:	48 8d 35 eb c0 00 00 	lea    rsi,[rip+0xc0eb]        # 15a96 <_IO_stdin_used+0xa96>
    99ab:	48 89 ef             	mov    rdi,rbp
    99ae:	e8 9d 96 ff ff       	call   3050 <strcasecmp@plt>
    99b3:	85 c0                	test   eax,eax
    99b5:	0f 84 a6 00 00 00    	je     9a61 <parseInst+0x18ec>
    99bb:	48 8d 35 d8 c0 00 00 	lea    rsi,[rip+0xc0d8]        # 15a9a <_IO_stdin_used+0xa9a>
    99c2:	48 89 ef             	mov    rdi,rbp
    99c5:	e8 86 96 ff ff       	call   3050 <strcasecmp@plt>
    99ca:	85 c0                	test   eax,eax
    99cc:	0f 84 97 00 00 00    	je     9a69 <parseInst+0x18f4>
    99d2:	48 8d 35 c5 c0 00 00 	lea    rsi,[rip+0xc0c5]        # 15a9e <_IO_stdin_used+0xa9e>
    99d9:	48 89 ef             	mov    rdi,rbp
    99dc:	e8 6f 96 ff ff       	call   3050 <strcasecmp@plt>
    99e1:	85 c0                	test   eax,eax
    99e3:	75 0e                	jne    99f3 <parseInst+0x187e>
    99e5:	41 bf 07 00 00 00    	mov    r15d,0x7
    99eb:	eb 06                	jmp    99f3 <parseInst+0x187e>
    99ed:	41 bf 00 00 00 00    	mov    r15d,0x0
    99f3:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    99f7:	3c 13                	cmp    al,0x13
    99f9:	74 76                	je     9a71 <parseInst+0x18fc>
    99fb:	8d 50 ee             	lea    edx,[rax-0x12]
    99fe:	80 fa 01             	cmp    dl,0x1
    9a01:	0f 86 b9 02 00 00    	jbe    9cc0 <parseInst+0x1b4b>
    9a07:	3c 0b                	cmp    al,0xb
    9a09:	0f 85 9f e8 ff ff    	jne    82ae <parseInst+0x139>
    9a0f:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    9a13:	48 8d 35 71 c0 00 00 	lea    rsi,[rip+0xc071]        # 15a8b <_IO_stdin_used+0xa8b>
    9a1a:	e8 31 96 ff ff       	call   3050 <strcasecmp@plt>
    9a1f:	85 c0                	test   eax,eax
    9a21:	0f 85 87 e8 ff ff    	jne    82ae <parseInst+0x139>
    9a27:	41 83 ed 0b          	sub    r13d,0xb
    9a2b:	41 80 fd 09          	cmp    r13b,0x9
    9a2f:	0f 87 79 e8 ff ff    	ja     82ae <parseInst+0x139>
    9a35:	45 0f b6 ed          	movzx  r13d,r13b
    9a39:	48 8d 15 b0 c4 00 00 	lea    rdx,[rip+0xc4b0]        # 15ef0 <_IO_stdin_used+0xef0>
    9a40:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
    9a44:	48 01 d0             	add    rax,rdx
    9a47:	ff e0                	jmp    rax
    9a49:	41 bf 02 00 00 00    	mov    r15d,0x2
    9a4f:	eb a2                	jmp    99f3 <parseInst+0x187e>
    9a51:	41 bf 03 00 00 00    	mov    r15d,0x3
    9a57:	eb 9a                	jmp    99f3 <parseInst+0x187e>
    9a59:	41 bf 04 00 00 00    	mov    r15d,0x4
    9a5f:	eb 92                	jmp    99f3 <parseInst+0x187e>
    9a61:	41 bf 04 00 00 00    	mov    r15d,0x4
    9a67:	eb 8a                	jmp    99f3 <parseInst+0x187e>
    9a69:	41 bf 05 00 00 00    	mov    r15d,0x5
    9a6f:	eb 82                	jmp    99f3 <parseInst+0x187e>
    9a71:	48 83 7b 78 01       	cmp    QWORD PTR [rbx+0x78],0x1
    9a76:	75 83                	jne    99fb <parseInst+0x1886>
    9a78:	41 83 ed 0b          	sub    r13d,0xb
    9a7c:	41 80 fd 09          	cmp    r13b,0x9
    9a80:	0f 87 28 e8 ff ff    	ja     82ae <parseInst+0x139>
    9a86:	45 0f b6 ed          	movzx  r13d,r13b
    9a8a:	48 8d 15 87 c4 00 00 	lea    rdx,[rip+0xc487]        # 15f18 <_IO_stdin_used+0xf18>
    9a91:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
    9a95:	48 01 d0             	add    rax,rdx
    9a98:	ff e0                	jmp    rax
    9a9a:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9a9e:	e8 cd a0 00 00       	call   13b70 <find_reg64_index>
    9aa3:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9aa7:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9aae:	41 0f b6 cf          	movzx  ecx,r15b
    9ab2:	0f b6 f0             	movzx  esi,al
    9ab5:	41 b9 40 00 00 00    	mov    r9d,0x40
    9abb:	41 b8 01 00 00 00    	mov    r8d,0x1
    9ac1:	ba d1 00 00 00       	mov    edx,0xd1
    9ac6:	4c 89 f7             	mov    rdi,r14
    9ac9:	e8 e1 e3 ff ff       	call   7eaf <encode_group2_reg_imm>
    9ace:	0f b6 c0             	movzx  eax,al
    9ad1:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9ad8:	49 01 04 24          	add    QWORD PTR [r12],rax
    9adc:	e9 cd e7 ff ff       	jmp    82ae <parseInst+0x139>
    9ae1:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9ae5:	e8 40 a1 00 00       	call   13c2a <find_reg32_index>
    9aea:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9aee:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9af5:	41 0f b6 cf          	movzx  ecx,r15b
    9af9:	0f b6 f0             	movzx  esi,al
    9afc:	41 b9 20 00 00 00    	mov    r9d,0x20
    9b02:	41 b8 01 00 00 00    	mov    r8d,0x1
    9b08:	ba d1 00 00 00       	mov    edx,0xd1
    9b0d:	4c 89 f7             	mov    rdi,r14
    9b10:	e8 9a e3 ff ff       	call   7eaf <encode_group2_reg_imm>
    9b15:	0f b6 c0             	movzx  eax,al
    9b18:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9b1f:	49 01 04 24          	add    QWORD PTR [r12],rax
    9b23:	e9 86 e7 ff ff       	jmp    82ae <parseInst+0x139>
    9b28:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9b2c:	e8 b3 a1 00 00       	call   13ce4 <find_reg16_index>
    9b31:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9b35:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9b3c:	41 0f b6 cf          	movzx  ecx,r15b
    9b40:	0f b6 f0             	movzx  esi,al
    9b43:	41 b9 10 00 00 00    	mov    r9d,0x10
    9b49:	41 b8 01 00 00 00    	mov    r8d,0x1
    9b4f:	ba d1 00 00 00       	mov    edx,0xd1
    9b54:	4c 89 f7             	mov    rdi,r14
    9b57:	e8 53 e3 ff ff       	call   7eaf <encode_group2_reg_imm>
    9b5c:	0f b6 c0             	movzx  eax,al
    9b5f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9b66:	49 01 04 24          	add    QWORD PTR [r12],rax
    9b6a:	e9 3f e7 ff ff       	jmp    82ae <parseInst+0x139>
    9b6f:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9b73:	e8 3d a2 00 00       	call   13db5 <find_reg8_index>
    9b78:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9b7c:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9b83:	41 0f b6 cf          	movzx  ecx,r15b
    9b87:	0f b6 f0             	movzx  esi,al
    9b8a:	41 b9 08 00 00 00    	mov    r9d,0x8
    9b90:	41 b8 01 00 00 00    	mov    r8d,0x1
    9b96:	ba d0 00 00 00       	mov    edx,0xd0
    9b9b:	4c 89 f7             	mov    rdi,r14
    9b9e:	e8 0c e3 ff ff       	call   7eaf <encode_group2_reg_imm>
    9ba3:	0f b6 c0             	movzx  eax,al
    9ba6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9bad:	49 01 04 24          	add    QWORD PTR [r12],rax
    9bb1:	e9 f8 e6 ff ff       	jmp    82ae <parseInst+0x139>
    9bb6:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    9bba:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    9bbe:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    9bc5:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    9bcc:	3c 04                	cmp    al,0x4
    9bce:	0f 84 b9 00 00 00    	je     9c8d <parseInst+0x1b18>
    9bd4:	77 3f                	ja     9c15 <parseInst+0x1aa0>
    9bd6:	3c 01                	cmp    al,0x1
    9bd8:	74 72                	je     9c4c <parseInst+0x1ad7>
    9bda:	3c 02                	cmp    al,0x2
    9bdc:	0f 85 9b 00 00 00    	jne    9c7d <parseInst+0x1b08>
    9be2:	41 0f b6 f7          	movzx  esi,r15b
    9be6:	48 83 ec 08          	sub    rsp,0x8
    9bea:	6a 00                	push   0x0
    9bec:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9bf2:	41 b8 d1 00 00 00    	mov    r8d,0xd1
    9bf8:	b9 10 00 00 00       	mov    ecx,0x10
    9bfd:	4c 89 f7             	mov    rdi,r14
    9c00:	e8 b8 c4 ff ff       	call   60bd <encode_inst_rm_rm>
    9c05:	0f b6 c0             	movzx  eax,al
    9c08:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9c0f:	48 83 c4 10          	add    rsp,0x10
    9c13:	eb 68                	jmp    9c7d <parseInst+0x1b08>
    9c15:	3c 08                	cmp    al,0x8
    9c17:	75 64                	jne    9c7d <parseInst+0x1b08>
    9c19:	41 0f b6 f7          	movzx  esi,r15b
    9c1d:	48 83 ec 08          	sub    rsp,0x8
    9c21:	6a 00                	push   0x0
    9c23:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9c29:	41 b8 d1 00 00 00    	mov    r8d,0xd1
    9c2f:	b9 40 00 00 00       	mov    ecx,0x40
    9c34:	4c 89 f7             	mov    rdi,r14
    9c37:	e8 81 c4 ff ff       	call   60bd <encode_inst_rm_rm>
    9c3c:	0f b6 c0             	movzx  eax,al
    9c3f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9c46:	48 83 c4 10          	add    rsp,0x10
    9c4a:	eb 31                	jmp    9c7d <parseInst+0x1b08>
    9c4c:	41 0f b6 f7          	movzx  esi,r15b
    9c50:	48 83 ec 08          	sub    rsp,0x8
    9c54:	6a 00                	push   0x0
    9c56:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9c5c:	41 b8 d0 00 00 00    	mov    r8d,0xd0
    9c62:	b9 08 00 00 00       	mov    ecx,0x8
    9c67:	4c 89 f7             	mov    rdi,r14
    9c6a:	e8 4e c4 ff ff       	call   60bd <encode_inst_rm_rm>
    9c6f:	0f b6 c0             	movzx  eax,al
    9c72:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9c79:	48 83 c4 10          	add    rsp,0x10
    9c7d:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    9c84:	49 01 04 24          	add    QWORD PTR [r12],rax
    9c88:	e9 21 e6 ff ff       	jmp    82ae <parseInst+0x139>
    9c8d:	41 0f b6 f7          	movzx  esi,r15b
    9c91:	48 83 ec 08          	sub    rsp,0x8
    9c95:	6a 00                	push   0x0
    9c97:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9c9d:	41 b8 d1 00 00 00    	mov    r8d,0xd1
    9ca3:	b9 20 00 00 00       	mov    ecx,0x20
    9ca8:	4c 89 f7             	mov    rdi,r14
    9cab:	e8 0d c4 ff ff       	call   60bd <encode_inst_rm_rm>
    9cb0:	0f b6 c0             	movzx  eax,al
    9cb3:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9cba:	48 83 c4 10          	add    rsp,0x10
    9cbe:	eb bd                	jmp    9c7d <parseInst+0x1b08>
    9cc0:	3c 13                	cmp    al,0x13
    9cc2:	0f 84 b7 00 00 00    	je     9d7f <parseInst+0x1c0a>
    9cc8:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    9ccc:	88 44 24 08          	mov    BYTE PTR [rsp+0x8],al
    9cd0:	41 80 fd 0e          	cmp    r13b,0xe
    9cd4:	0f 84 b2 00 00 00    	je     9d8c <parseInst+0x1c17>
    9cda:	41 80 fd 0d          	cmp    r13b,0xd
    9cde:	0f 84 ef 00 00 00    	je     9dd3 <parseInst+0x1c5e>
    9ce4:	41 80 fd 0c          	cmp    r13b,0xc
    9ce8:	0f 84 2c 01 00 00    	je     9e1a <parseInst+0x1ca5>
    9cee:	41 80 fd 0b          	cmp    r13b,0xb
    9cf2:	0f 84 69 01 00 00    	je     9e61 <parseInst+0x1cec>
    9cf8:	41 80 fd 14          	cmp    r13b,0x14
    9cfc:	0f 85 ac e5 ff ff    	jne    82ae <parseInst+0x139>
    9d02:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    9d06:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    9d0a:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    9d11:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    9d18:	3c 04                	cmp    al,0x4
    9d1a:	0f 84 2a 02 00 00    	je     9f4a <parseInst+0x1dd5>
    9d20:	0f 87 82 01 00 00    	ja     9ea8 <parseInst+0x1d33>
    9d26:	3c 01                	cmp    al,0x1
    9d28:	0f 84 c8 01 00 00    	je     9ef6 <parseInst+0x1d81>
    9d2e:	3c 02                	cmp    al,0x2
    9d30:	0f 85 04 02 00 00    	jne    9f3a <parseInst+0x1dc5>
    9d36:	41 0f b6 f7          	movzx  esi,r15b
    9d3a:	48 83 ec 08          	sub    rsp,0x8
    9d3e:	6a 00                	push   0x0
    9d40:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9d46:	41 b8 c1 00 00 00    	mov    r8d,0xc1
    9d4c:	b9 10 00 00 00       	mov    ecx,0x10
    9d51:	4c 89 f7             	mov    rdi,r14
    9d54:	e8 64 c3 ff ff       	call   60bd <encode_inst_rm_rm>
    9d59:	0f b6 c0             	movzx  eax,al
    9d5c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9d63:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    9d67:	41 88 14 06          	mov    BYTE PTR [r14+rax*1],dl
    9d6b:	48 83 c0 01          	add    rax,0x1
    9d6f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9d76:	48 83 c4 10          	add    rsp,0x10
    9d7a:	e9 bb 01 00 00       	jmp    9f3a <parseInst+0x1dc5>
    9d7f:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    9d83:	88 44 24 08          	mov    BYTE PTR [rsp+0x8],al
    9d87:	e9 44 ff ff ff       	jmp    9cd0 <parseInst+0x1b5b>
    9d8c:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9d90:	e8 db 9d 00 00       	call   13b70 <find_reg64_index>
    9d95:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9d99:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9da0:	41 0f b6 cf          	movzx  ecx,r15b
    9da4:	0f b6 f0             	movzx  esi,al
    9da7:	41 b9 40 00 00 00    	mov    r9d,0x40
    9dad:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
    9db3:	ba c1 00 00 00       	mov    edx,0xc1
    9db8:	4c 89 f7             	mov    rdi,r14
    9dbb:	e8 ef e0 ff ff       	call   7eaf <encode_group2_reg_imm>
    9dc0:	0f b6 c0             	movzx  eax,al
    9dc3:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9dca:	49 01 04 24          	add    QWORD PTR [r12],rax
    9dce:	e9 db e4 ff ff       	jmp    82ae <parseInst+0x139>
    9dd3:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9dd7:	e8 4e 9e 00 00       	call   13c2a <find_reg32_index>
    9ddc:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9de0:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9de7:	41 0f b6 cf          	movzx  ecx,r15b
    9deb:	0f b6 f0             	movzx  esi,al
    9dee:	41 b9 20 00 00 00    	mov    r9d,0x20
    9df4:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
    9dfa:	ba c1 00 00 00       	mov    edx,0xc1
    9dff:	4c 89 f7             	mov    rdi,r14
    9e02:	e8 a8 e0 ff ff       	call   7eaf <encode_group2_reg_imm>
    9e07:	0f b6 c0             	movzx  eax,al
    9e0a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9e11:	49 01 04 24          	add    QWORD PTR [r12],rax
    9e15:	e9 94 e4 ff ff       	jmp    82ae <parseInst+0x139>
    9e1a:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9e1e:	e8 c1 9e 00 00       	call   13ce4 <find_reg16_index>
    9e23:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9e27:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9e2e:	41 0f b6 cf          	movzx  ecx,r15b
    9e32:	0f b6 f0             	movzx  esi,al
    9e35:	41 b9 10 00 00 00    	mov    r9d,0x10
    9e3b:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
    9e41:	ba c1 00 00 00       	mov    edx,0xc1
    9e46:	4c 89 f7             	mov    rdi,r14
    9e49:	e8 61 e0 ff ff       	call   7eaf <encode_group2_reg_imm>
    9e4e:	0f b6 c0             	movzx  eax,al
    9e51:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9e58:	49 01 04 24          	add    QWORD PTR [r12],rax
    9e5c:	e9 4d e4 ff ff       	jmp    82ae <parseInst+0x139>
    9e61:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9e65:	e8 4b 9f 00 00       	call   13db5 <find_reg8_index>
    9e6a:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9e6e:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9e75:	41 0f b6 cf          	movzx  ecx,r15b
    9e79:	0f b6 f0             	movzx  esi,al
    9e7c:	41 b9 08 00 00 00    	mov    r9d,0x8
    9e82:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
    9e88:	ba c0 00 00 00       	mov    edx,0xc0
    9e8d:	4c 89 f7             	mov    rdi,r14
    9e90:	e8 1a e0 ff ff       	call   7eaf <encode_group2_reg_imm>
    9e95:	0f b6 c0             	movzx  eax,al
    9e98:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9e9f:	49 01 04 24          	add    QWORD PTR [r12],rax
    9ea3:	e9 06 e4 ff ff       	jmp    82ae <parseInst+0x139>
    9ea8:	3c 08                	cmp    al,0x8
    9eaa:	0f 85 8a 00 00 00    	jne    9f3a <parseInst+0x1dc5>
    9eb0:	41 0f b6 f7          	movzx  esi,r15b
    9eb4:	48 83 ec 08          	sub    rsp,0x8
    9eb8:	6a 00                	push   0x0
    9eba:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9ec0:	41 b8 c1 00 00 00    	mov    r8d,0xc1
    9ec6:	b9 40 00 00 00       	mov    ecx,0x40
    9ecb:	4c 89 f7             	mov    rdi,r14
    9ece:	e8 ea c1 ff ff       	call   60bd <encode_inst_rm_rm>
    9ed3:	0f b6 c0             	movzx  eax,al
    9ed6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9edd:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    9ee1:	41 88 14 06          	mov    BYTE PTR [r14+rax*1],dl
    9ee5:	48 83 c0 01          	add    rax,0x1
    9ee9:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9ef0:	48 83 c4 10          	add    rsp,0x10
    9ef4:	eb 44                	jmp    9f3a <parseInst+0x1dc5>
    9ef6:	41 0f b6 f7          	movzx  esi,r15b
    9efa:	48 83 ec 08          	sub    rsp,0x8
    9efe:	6a 00                	push   0x0
    9f00:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9f06:	41 b8 c0 00 00 00    	mov    r8d,0xc0
    9f0c:	b9 08 00 00 00       	mov    ecx,0x8
    9f11:	4c 89 f7             	mov    rdi,r14
    9f14:	e8 a4 c1 ff ff       	call   60bd <encode_inst_rm_rm>
    9f19:	0f b6 c0             	movzx  eax,al
    9f1c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9f23:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    9f27:	41 88 14 06          	mov    BYTE PTR [r14+rax*1],dl
    9f2b:	48 83 c0 01          	add    rax,0x1
    9f2f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9f36:	48 83 c4 10          	add    rsp,0x10
    9f3a:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    9f41:	49 01 04 24          	add    QWORD PTR [r12],rax
    9f45:	e9 64 e3 ff ff       	jmp    82ae <parseInst+0x139>
    9f4a:	41 0f b6 f7          	movzx  esi,r15b
    9f4e:	48 83 ec 08          	sub    rsp,0x8
    9f52:	6a 00                	push   0x0
    9f54:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    9f5a:	41 b8 c1 00 00 00    	mov    r8d,0xc1
    9f60:	b9 20 00 00 00       	mov    ecx,0x20
    9f65:	4c 89 f7             	mov    rdi,r14
    9f68:	e8 50 c1 ff ff       	call   60bd <encode_inst_rm_rm>
    9f6d:	0f b6 c0             	movzx  eax,al
    9f70:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9f77:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    9f7b:	41 88 14 06          	mov    BYTE PTR [r14+rax*1],dl
    9f7f:	48 83 c0 01          	add    rax,0x1
    9f83:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9f8a:	48 83 c4 10          	add    rsp,0x10
    9f8e:	eb aa                	jmp    9f3a <parseInst+0x1dc5>
    9f90:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9f94:	e8 d7 9b 00 00       	call   13b70 <find_reg64_index>
    9f99:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9f9d:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9fa4:	41 0f b6 cf          	movzx  ecx,r15b
    9fa8:	0f b6 f0             	movzx  esi,al
    9fab:	41 b8 40 00 00 00    	mov    r8d,0x40
    9fb1:	ba d3 00 00 00       	mov    edx,0xd3
    9fb6:	4c 89 f7             	mov    rdi,r14
    9fb9:	e8 95 df ff ff       	call   7f53 <encode_group2_reg_cl>
    9fbe:	0f b6 c0             	movzx  eax,al
    9fc1:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    9fc8:	49 01 04 24          	add    QWORD PTR [r12],rax
    9fcc:	e9 dd e2 ff ff       	jmp    82ae <parseInst+0x139>
    9fd1:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    9fd5:	e8 50 9c 00 00       	call   13c2a <find_reg32_index>
    9fda:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    9fde:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    9fe5:	41 0f b6 cf          	movzx  ecx,r15b
    9fe9:	0f b6 f0             	movzx  esi,al
    9fec:	41 b8 20 00 00 00    	mov    r8d,0x20
    9ff2:	ba d3 00 00 00       	mov    edx,0xd3
    9ff7:	4c 89 f7             	mov    rdi,r14
    9ffa:	e8 54 df ff ff       	call   7f53 <encode_group2_reg_cl>
    9fff:	0f b6 c0             	movzx  eax,al
    a002:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a009:	49 01 04 24          	add    QWORD PTR [r12],rax
    a00d:	e9 9c e2 ff ff       	jmp    82ae <parseInst+0x139>
    a012:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a016:	e8 c9 9c 00 00       	call   13ce4 <find_reg16_index>
    a01b:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a01f:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a026:	41 0f b6 cf          	movzx  ecx,r15b
    a02a:	0f b6 f0             	movzx  esi,al
    a02d:	41 b8 10 00 00 00    	mov    r8d,0x10
    a033:	ba d3 00 00 00       	mov    edx,0xd3
    a038:	4c 89 f7             	mov    rdi,r14
    a03b:	e8 13 df ff ff       	call   7f53 <encode_group2_reg_cl>
    a040:	0f b6 c0             	movzx  eax,al
    a043:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a04a:	49 01 04 24          	add    QWORD PTR [r12],rax
    a04e:	e9 5b e2 ff ff       	jmp    82ae <parseInst+0x139>
    a053:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a057:	e8 59 9d 00 00       	call   13db5 <find_reg8_index>
    a05c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a060:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a067:	41 0f b6 cf          	movzx  ecx,r15b
    a06b:	0f b6 f0             	movzx  esi,al
    a06e:	41 b8 08 00 00 00    	mov    r8d,0x8
    a074:	ba d2 00 00 00       	mov    edx,0xd2
    a079:	4c 89 f7             	mov    rdi,r14
    a07c:	e8 d2 de ff ff       	call   7f53 <encode_group2_reg_cl>
    a081:	0f b6 c0             	movzx  eax,al
    a084:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a08b:	49 01 04 24          	add    QWORD PTR [r12],rax
    a08f:	e9 1a e2 ff ff       	jmp    82ae <parseInst+0x139>
    a094:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    a098:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    a09c:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    a0a3:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    a0aa:	3c 04                	cmp    al,0x4
    a0ac:	0f 84 b9 00 00 00    	je     a16b <parseInst+0x1ff6>
    a0b2:	77 3f                	ja     a0f3 <parseInst+0x1f7e>
    a0b4:	3c 01                	cmp    al,0x1
    a0b6:	74 72                	je     a12a <parseInst+0x1fb5>
    a0b8:	3c 02                	cmp    al,0x2
    a0ba:	0f 85 9b 00 00 00    	jne    a15b <parseInst+0x1fe6>
    a0c0:	41 0f b6 f7          	movzx  esi,r15b
    a0c4:	48 83 ec 08          	sub    rsp,0x8
    a0c8:	6a 00                	push   0x0
    a0ca:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a0d0:	41 b8 d3 00 00 00    	mov    r8d,0xd3
    a0d6:	b9 10 00 00 00       	mov    ecx,0x10
    a0db:	4c 89 f7             	mov    rdi,r14
    a0de:	e8 da bf ff ff       	call   60bd <encode_inst_rm_rm>
    a0e3:	0f b6 c0             	movzx  eax,al
    a0e6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a0ed:	48 83 c4 10          	add    rsp,0x10
    a0f1:	eb 68                	jmp    a15b <parseInst+0x1fe6>
    a0f3:	3c 08                	cmp    al,0x8
    a0f5:	75 64                	jne    a15b <parseInst+0x1fe6>
    a0f7:	41 0f b6 f7          	movzx  esi,r15b
    a0fb:	48 83 ec 08          	sub    rsp,0x8
    a0ff:	6a 00                	push   0x0
    a101:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a107:	41 b8 d3 00 00 00    	mov    r8d,0xd3
    a10d:	b9 40 00 00 00       	mov    ecx,0x40
    a112:	4c 89 f7             	mov    rdi,r14
    a115:	e8 a3 bf ff ff       	call   60bd <encode_inst_rm_rm>
    a11a:	0f b6 c0             	movzx  eax,al
    a11d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a124:	48 83 c4 10          	add    rsp,0x10
    a128:	eb 31                	jmp    a15b <parseInst+0x1fe6>
    a12a:	41 0f b6 f7          	movzx  esi,r15b
    a12e:	48 83 ec 08          	sub    rsp,0x8
    a132:	6a 00                	push   0x0
    a134:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a13a:	41 b8 d2 00 00 00    	mov    r8d,0xd2
    a140:	b9 08 00 00 00       	mov    ecx,0x8
    a145:	4c 89 f7             	mov    rdi,r14
    a148:	e8 70 bf ff ff       	call   60bd <encode_inst_rm_rm>
    a14d:	0f b6 c0             	movzx  eax,al
    a150:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a157:	48 83 c4 10          	add    rsp,0x10
    a15b:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    a162:	49 01 04 24          	add    QWORD PTR [r12],rax
    a166:	e9 43 e1 ff ff       	jmp    82ae <parseInst+0x139>
    a16b:	41 0f b6 f7          	movzx  esi,r15b
    a16f:	48 83 ec 08          	sub    rsp,0x8
    a173:	6a 00                	push   0x0
    a175:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a17b:	41 b8 d3 00 00 00    	mov    r8d,0xd3
    a181:	b9 20 00 00 00       	mov    ecx,0x20
    a186:	4c 89 f7             	mov    rdi,r14
    a189:	e8 2f bf ff ff       	call   60bd <encode_inst_rm_rm>
    a18e:	0f b6 c0             	movzx  eax,al
    a191:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a198:	48 83 c4 10          	add    rsp,0x10
    a19c:	eb bd                	jmp    a15b <parseInst+0x1fe6>
    a19e:	48 8d 35 fd b8 00 00 	lea    rsi,[rip+0xb8fd]        # 15aa2 <_IO_stdin_used+0xaa2>
    a1a5:	48 89 ef             	mov    rdi,rbp
    a1a8:	e8 a3 8e ff ff       	call   3050 <strcasecmp@plt>
    a1ad:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    a1b1:	85 c0                	test   eax,eax
    a1b3:	74 2a                	je     a1df <parseInst+0x206a>
    a1b5:	48 8d 35 ea b8 00 00 	lea    rsi,[rip+0xb8ea]        # 15aa6 <_IO_stdin_used+0xaa6>
    a1bc:	48 89 ef             	mov    rdi,rbp
    a1bf:	e8 8c 8e ff ff       	call   3050 <strcasecmp@plt>
    a1c4:	85 c0                	test   eax,eax
    a1c6:	74 17                	je     a1df <parseInst+0x206a>
    a1c8:	48 8d 35 e1 b8 00 00 	lea    rsi,[rip+0xb8e1]        # 15ab0 <_IO_stdin_used+0xab0>
    a1cf:	48 89 ef             	mov    rdi,rbp
    a1d2:	e8 79 8e ff ff       	call   3050 <strcasecmp@plt>
    a1d7:	85 c0                	test   eax,eax
    a1d9:	0f 85 9a 02 00 00    	jne    a479 <parseInst+0x2304>
    a1df:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    a1e4:	74 31                	je     a217 <parseInst+0x20a2>
    a1e6:	48 8d 35 b9 b8 00 00 	lea    rsi,[rip+0xb8b9]        # 15aa6 <_IO_stdin_used+0xaa6>
    a1ed:	48 89 ef             	mov    rdi,rbp
    a1f0:	e8 5b 8e ff ff       	call   3050 <strcasecmp@plt>
    a1f5:	85 c0                	test   eax,eax
    a1f7:	0f 84 bc 00 00 00    	je     a2b9 <parseInst+0x2144>
    a1fd:	48 8d 35 ac b8 00 00 	lea    rsi,[rip+0xb8ac]        # 15ab0 <_IO_stdin_used+0xab0>
    a204:	48 89 ef             	mov    rdi,rbp
    a207:	e8 44 8e ff ff       	call   3050 <strcasecmp@plt>
    a20c:	85 c0                	test   eax,eax
    a20e:	75 0c                	jne    a21c <parseInst+0x20a7>
    a210:	c6 44 24 10 04       	mov    BYTE PTR [rsp+0x10],0x4
    a215:	eb 05                	jmp    a21c <parseInst+0x20a7>
    a217:	c6 44 24 10 02       	mov    BYTE PTR [rsp+0x10],0x2
    a21c:	41 80 fd 0e          	cmp    r13b,0xe
    a220:	0f 84 9d 00 00 00    	je     a2c3 <parseInst+0x214e>
    a226:	41 80 fd 0d          	cmp    r13b,0xd
    a22a:	0f 84 d5 00 00 00    	je     a305 <parseInst+0x2190>
    a230:	41 80 fd 0c          	cmp    r13b,0xc
    a234:	0f 84 0d 01 00 00    	je     a347 <parseInst+0x21d2>
    a23a:	41 80 fd 0b          	cmp    r13b,0xb
    a23e:	0f 84 45 01 00 00    	je     a389 <parseInst+0x2214>
    a244:	41 80 fd 14          	cmp    r13b,0x14
    a248:	0f 85 60 e0 ff ff    	jne    82ae <parseInst+0x139>
    a24e:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    a252:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    a256:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    a25d:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    a264:	3c 04                	cmp    al,0x4
    a266:	0f 84 d9 01 00 00    	je     a445 <parseInst+0x22d0>
    a26c:	0f 87 59 01 00 00    	ja     a3cb <parseInst+0x2256>
    a272:	3c 01                	cmp    al,0x1
    a274:	0f 84 89 01 00 00    	je     a403 <parseInst+0x228e>
    a27a:	3c 02                	cmp    al,0x2
    a27c:	0f 85 b3 01 00 00    	jne    a435 <parseInst+0x22c0>
    a282:	0f b6 74 24 10       	movzx  esi,BYTE PTR [rsp+0x10]
    a287:	48 83 ec 08          	sub    rsp,0x8
    a28b:	6a 00                	push   0x0
    a28d:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a293:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    a299:	b9 10 00 00 00       	mov    ecx,0x10
    a29e:	4c 89 f7             	mov    rdi,r14
    a2a1:	e8 17 be ff ff       	call   60bd <encode_inst_rm_rm>
    a2a6:	0f b6 c0             	movzx  eax,al
    a2a9:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a2b0:	48 83 c4 10          	add    rsp,0x10
    a2b4:	e9 7c 01 00 00       	jmp    a435 <parseInst+0x22c0>
    a2b9:	c6 44 24 10 03       	mov    BYTE PTR [rsp+0x10],0x3
    a2be:	e9 59 ff ff ff       	jmp    a21c <parseInst+0x20a7>
    a2c3:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a2c7:	e8 a4 98 00 00       	call   13b70 <find_reg64_index>
    a2cc:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a2d0:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a2d7:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [rsp+0x10]
    a2dc:	0f b6 f0             	movzx  esi,al
    a2df:	41 b8 40 00 00 00    	mov    r8d,0x40
    a2e5:	ba f7 00 00 00       	mov    edx,0xf7
    a2ea:	4c 89 f7             	mov    rdi,r14
    a2ed:	e8 f0 dc ff ff       	call   7fe2 <encode_group3_reg>
    a2f2:	0f b6 c0             	movzx  eax,al
    a2f5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a2fc:	49 01 04 24          	add    QWORD PTR [r12],rax
    a300:	e9 a9 df ff ff       	jmp    82ae <parseInst+0x139>
    a305:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a309:	e8 1c 99 00 00       	call   13c2a <find_reg32_index>
    a30e:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a312:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a319:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [rsp+0x10]
    a31e:	0f b6 f0             	movzx  esi,al
    a321:	41 b8 20 00 00 00    	mov    r8d,0x20
    a327:	ba f7 00 00 00       	mov    edx,0xf7
    a32c:	4c 89 f7             	mov    rdi,r14
    a32f:	e8 ae dc ff ff       	call   7fe2 <encode_group3_reg>
    a334:	0f b6 c0             	movzx  eax,al
    a337:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a33e:	49 01 04 24          	add    QWORD PTR [r12],rax
    a342:	e9 67 df ff ff       	jmp    82ae <parseInst+0x139>
    a347:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a34b:	e8 94 99 00 00       	call   13ce4 <find_reg16_index>
    a350:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a354:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a35b:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [rsp+0x10]
    a360:	0f b6 f0             	movzx  esi,al
    a363:	41 b8 10 00 00 00    	mov    r8d,0x10
    a369:	ba f7 00 00 00       	mov    edx,0xf7
    a36e:	4c 89 f7             	mov    rdi,r14
    a371:	e8 6c dc ff ff       	call   7fe2 <encode_group3_reg>
    a376:	0f b6 c0             	movzx  eax,al
    a379:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a380:	49 01 04 24          	add    QWORD PTR [r12],rax
    a384:	e9 25 df ff ff       	jmp    82ae <parseInst+0x139>
    a389:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a38d:	e8 23 9a 00 00       	call   13db5 <find_reg8_index>
    a392:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a396:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a39d:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [rsp+0x10]
    a3a2:	0f b6 f0             	movzx  esi,al
    a3a5:	41 b8 08 00 00 00    	mov    r8d,0x8
    a3ab:	ba f6 00 00 00       	mov    edx,0xf6
    a3b0:	4c 89 f7             	mov    rdi,r14
    a3b3:	e8 2a dc ff ff       	call   7fe2 <encode_group3_reg>
    a3b8:	0f b6 c0             	movzx  eax,al
    a3bb:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a3c2:	49 01 04 24          	add    QWORD PTR [r12],rax
    a3c6:	e9 e3 de ff ff       	jmp    82ae <parseInst+0x139>
    a3cb:	3c 08                	cmp    al,0x8
    a3cd:	75 66                	jne    a435 <parseInst+0x22c0>
    a3cf:	0f b6 74 24 10       	movzx  esi,BYTE PTR [rsp+0x10]
    a3d4:	48 83 ec 08          	sub    rsp,0x8
    a3d8:	6a 00                	push   0x0
    a3da:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a3e0:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    a3e6:	b9 40 00 00 00       	mov    ecx,0x40
    a3eb:	4c 89 f7             	mov    rdi,r14
    a3ee:	e8 ca bc ff ff       	call   60bd <encode_inst_rm_rm>
    a3f3:	0f b6 c0             	movzx  eax,al
    a3f6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a3fd:	48 83 c4 10          	add    rsp,0x10
    a401:	eb 32                	jmp    a435 <parseInst+0x22c0>
    a403:	0f b6 74 24 10       	movzx  esi,BYTE PTR [rsp+0x10]
    a408:	48 83 ec 08          	sub    rsp,0x8
    a40c:	6a 00                	push   0x0
    a40e:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a414:	41 b8 f6 00 00 00    	mov    r8d,0xf6
    a41a:	b9 08 00 00 00       	mov    ecx,0x8
    a41f:	4c 89 f7             	mov    rdi,r14
    a422:	e8 96 bc ff ff       	call   60bd <encode_inst_rm_rm>
    a427:	0f b6 c0             	movzx  eax,al
    a42a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a431:	48 83 c4 10          	add    rsp,0x10
    a435:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    a43c:	49 01 04 24          	add    QWORD PTR [r12],rax
    a440:	e9 69 de ff ff       	jmp    82ae <parseInst+0x139>
    a445:	0f b6 74 24 10       	movzx  esi,BYTE PTR [rsp+0x10]
    a44a:	48 83 ec 08          	sub    rsp,0x8
    a44e:	6a 00                	push   0x0
    a450:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    a456:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    a45c:	b9 20 00 00 00       	mov    ecx,0x20
    a461:	4c 89 f7             	mov    rdi,r14
    a464:	e8 54 bc ff ff       	call   60bd <encode_inst_rm_rm>
    a469:	0f b6 c0             	movzx  eax,al
    a46c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a473:	48 83 c4 10          	add    rsp,0x10
    a477:	eb bc                	jmp    a435 <parseInst+0x22c0>
    a479:	48 8d 35 2a b6 00 00 	lea    rsi,[rip+0xb62a]        # 15aaa <_IO_stdin_used+0xaaa>
    a480:	48 89 ef             	mov    rdi,rbp
    a483:	e8 c8 8b ff ff       	call   3050 <strcasecmp@plt>
    a488:	85 c0                	test   eax,eax
    a48a:	0f 85 b6 06 00 00    	jne    ab46 <parseInst+0x29d1>
    a490:	41 80 fd 0e          	cmp    r13b,0xe
    a494:	0f 84 3a 01 00 00    	je     a5d4 <parseInst+0x245f>
    a49a:	41 80 fd 0d          	cmp    r13b,0xd
    a49e:	0f 84 85 01 00 00    	je     a629 <parseInst+0x24b4>
    a4a4:	41 80 fd 0c          	cmp    r13b,0xc
    a4a8:	0f 84 cf 01 00 00    	je     a67d <parseInst+0x2508>
    a4ae:	41 80 fd 0b          	cmp    r13b,0xb
    a4b2:	0f 84 0a 02 00 00    	je     a6c2 <parseInst+0x254d>
    a4b8:	41 80 fd 0e          	cmp    r13b,0xe
    a4bc:	0f 84 61 02 00 00    	je     a723 <parseInst+0x25ae>
    a4c2:	41 80 fd 0d          	cmp    r13b,0xd
    a4c6:	0f 84 a8 02 00 00    	je     a774 <parseInst+0x25ff>
    a4cc:	41 80 fd 0c          	cmp    r13b,0xc
    a4d0:	0f 84 ef 02 00 00    	je     a7c5 <parseInst+0x2650>
    a4d6:	41 80 fd 0b          	cmp    r13b,0xb
    a4da:	0f 84 36 03 00 00    	je     a816 <parseInst+0x26a1>
    a4e0:	41 80 fd 0e          	cmp    r13b,0xe
    a4e4:	0f 84 7d 03 00 00    	je     a867 <parseInst+0x26f2>
    a4ea:	41 80 fd 14          	cmp    r13b,0x14
    a4ee:	0f 84 d4 03 00 00    	je     a8c8 <parseInst+0x2753>
    a4f4:	41 80 fd 0d          	cmp    r13b,0xd
    a4f8:	0f 84 e5 03 00 00    	je     a8e3 <parseInst+0x276e>
    a4fe:	41 80 fd 14          	cmp    r13b,0x14
    a502:	0f 84 3c 04 00 00    	je     a944 <parseInst+0x27cf>
    a508:	41 80 fd 0c          	cmp    r13b,0xc
    a50c:	0f 84 4d 04 00 00    	je     a95f <parseInst+0x27ea>
    a512:	41 80 fd 14          	cmp    r13b,0x14
    a516:	0f 84 a4 04 00 00    	je     a9c0 <parseInst+0x284b>
    a51c:	41 80 fd 0b          	cmp    r13b,0xb
    a520:	0f 84 b5 04 00 00    	je     a9db <parseInst+0x2866>
    a526:	41 80 fd 14          	cmp    r13b,0x14
    a52a:	0f 84 0c 05 00 00    	je     aa3c <parseInst+0x28c7>
    a530:	41 80 fd 14          	cmp    r13b,0x14
    a534:	0f 85 74 dd ff ff    	jne    82ae <parseInst+0x139>
    a53a:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    a53e:	8d 50 f0             	lea    edx,[rax-0x10]
    a541:	80 fa 01             	cmp    dl,0x1
    a544:	0f 96 c2             	setbe  dl
    a547:	3c 13                	cmp    al,0x13
    a549:	0f 94 c1             	sete   cl
    a54c:	08 ca                	or     dl,cl
    a54e:	75 08                	jne    a558 <parseInst+0x23e3>
    a550:	3c 12                	cmp    al,0x12
    a552:	0f 85 56 dd ff ff    	jne    82ae <parseInst+0x139>
    a558:	48 8d 73 18          	lea    rsi,[rbx+0x18]
    a55c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a560:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a567:	0f b6 93 c8 00 00 00 	movzx  edx,BYTE PTR [rbx+0xc8]
    a56e:	80 fa 04             	cmp    dl,0x4
    a571:	0f 84 82 05 00 00    	je     aaf9 <parseInst+0x2984>
    a577:	0f 87 da 04 00 00    	ja     aa57 <parseInst+0x28e2>
    a57d:	80 fa 01             	cmp    dl,0x1
    a580:	0f 84 18 05 00 00    	je     aa9e <parseInst+0x2929>
    a586:	80 fa 02             	cmp    dl,0x2
    a589:	0f 85 4b 05 00 00    	jne    aada <parseInst+0x2965>
    a58f:	3c 13                	cmp    al,0x13
    a591:	0f 84 59 05 00 00    	je     aaf0 <parseInst+0x297b>
    a597:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    a59b:	48 83 ec 08          	sub    rsp,0x8
    a59f:	50                   	push   rax
    a5a0:	41 b9 02 00 00 00    	mov    r9d,0x2
    a5a6:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    a5ac:	b9 10 00 00 00       	mov    ecx,0x10
    a5b1:	48 89 f2             	mov    rdx,rsi
    a5b4:	be 00 00 00 00       	mov    esi,0x0
    a5b9:	4c 89 f7             	mov    rdi,r14
    a5bc:	e8 fc ba ff ff       	call   60bd <encode_inst_rm_rm>
    a5c1:	0f b6 c0             	movzx  eax,al
    a5c4:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a5cb:	48 83 c4 10          	add    rsp,0x10
    a5cf:	e9 06 05 00 00       	jmp    aada <parseInst+0x2965>
    a5d4:	0f b6 53 70          	movzx  edx,BYTE PTR [rbx+0x70]
    a5d8:	8d 42 f0             	lea    eax,[rdx-0x10]
    a5db:	3c 01                	cmp    al,0x1
    a5dd:	0f 96 c0             	setbe  al
    a5e0:	80 fa 13             	cmp    dl,0x13
    a5e3:	0f 94 c2             	sete   dl
    a5e6:	08 d0                	or     al,dl
    a5e8:	0f 84 ac fe ff ff    	je     a49a <parseInst+0x2325>
    a5ee:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a5f2:	e8 79 95 00 00       	call   13b70 <find_reg64_index>
    a5f7:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    a5fb:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    a5ff:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    a606:	0f b6 f0             	movzx  esi,al
    a609:	b9 40 00 00 00       	mov    ecx,0x40
    a60e:	4c 89 f7             	mov    rdi,r14
    a611:	e8 5b da ff ff       	call   8071 <encode_test_reg_imm>
    a616:	0f b6 c0             	movzx  eax,al
    a619:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a620:	49 01 04 24          	add    QWORD PTR [r12],rax
    a624:	e9 85 dc ff ff       	jmp    82ae <parseInst+0x139>
    a629:	0f b6 53 70          	movzx  edx,BYTE PTR [rbx+0x70]
    a62d:	8d 42 f0             	lea    eax,[rdx-0x10]
    a630:	3c 01                	cmp    al,0x1
    a632:	0f 96 c0             	setbe  al
    a635:	80 fa 13             	cmp    dl,0x13
    a638:	0f 94 c2             	sete   dl
    a63b:	08 d0                	or     al,dl
    a63d:	0f 84 61 fe ff ff    	je     a4a4 <parseInst+0x232f>
    a643:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a647:	e8 de 95 00 00       	call   13c2a <find_reg32_index>
    a64c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a650:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a657:	8b 53 78             	mov    edx,DWORD PTR [rbx+0x78]
    a65a:	0f b6 f0             	movzx  esi,al
    a65d:	b9 20 00 00 00       	mov    ecx,0x20
    a662:	4c 89 f7             	mov    rdi,r14
    a665:	e8 07 da ff ff       	call   8071 <encode_test_reg_imm>
    a66a:	0f b6 c0             	movzx  eax,al
    a66d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a674:	49 01 04 24          	add    QWORD PTR [r12],rax
    a678:	e9 31 dc ff ff       	jmp    82ae <parseInst+0x139>
    a67d:	80 7b 70 13          	cmp    BYTE PTR [rbx+0x70],0x13
    a681:	0f 85 27 fe ff ff    	jne    a4ae <parseInst+0x2339>
    a687:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a68b:	e8 54 96 00 00       	call   13ce4 <find_reg16_index>
    a690:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a694:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a69b:	0f b7 53 78          	movzx  edx,WORD PTR [rbx+0x78]
    a69f:	0f b6 f0             	movzx  esi,al
    a6a2:	b9 10 00 00 00       	mov    ecx,0x10
    a6a7:	4c 89 f7             	mov    rdi,r14
    a6aa:	e8 c2 d9 ff ff       	call   8071 <encode_test_reg_imm>
    a6af:	0f b6 c0             	movzx  eax,al
    a6b2:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a6b9:	49 01 04 24          	add    QWORD PTR [r12],rax
    a6bd:	e9 ec db ff ff       	jmp    82ae <parseInst+0x139>
    a6c2:	0f b6 43 70          	movzx  eax,BYTE PTR [rbx+0x70]
    a6c6:	83 e8 12             	sub    eax,0x12
    a6c9:	3c 01                	cmp    al,0x1
    a6cb:	0f 87 e7 fd ff ff    	ja     a4b8 <parseInst+0x2343>
    a6d1:	44 0f b6 6b 78       	movzx  r13d,BYTE PTR [rbx+0x78]
    a6d6:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a6da:	e8 d6 96 00 00       	call   13db5 <find_reg8_index>
    a6df:	89 c6                	mov    esi,eax
    a6e1:	48 8b 53 78          	mov    rdx,QWORD PTR [rbx+0x78]
    a6e5:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    a6e9:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    a6f0:	80 7b 70 12          	cmp    BYTE PTR [rbx+0x70],0x12
    a6f4:	74 27                	je     a71d <parseInst+0x25a8>
    a6f6:	0f b6 d2             	movzx  edx,dl
    a6f9:	40 0f b6 f6          	movzx  esi,sil
    a6fd:	b9 08 00 00 00       	mov    ecx,0x8
    a702:	4c 89 f7             	mov    rdi,r14
    a705:	e8 67 d9 ff ff       	call   8071 <encode_test_reg_imm>
    a70a:	0f b6 c0             	movzx  eax,al
    a70d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a714:	49 01 04 24          	add    QWORD PTR [r12],rax
    a718:	e9 91 db ff ff       	jmp    82ae <parseInst+0x139>
    a71d:	41 0f b6 d5          	movzx  edx,r13b
    a721:	eb d6                	jmp    a6f9 <parseInst+0x2584>
    a723:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    a727:	0f 85 95 fd ff ff    	jne    a4c2 <parseInst+0x234d>
    a72d:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a731:	e8 3a 94 00 00       	call   13b70 <find_reg64_index>
    a736:	41 89 c5             	mov    r13d,eax
    a739:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a73d:	e8 2e 94 00 00       	call   13b70 <find_reg64_index>
    a742:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a746:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a74d:	0f b6 d0             	movzx  edx,al
    a750:	41 0f b6 f5          	movzx  esi,r13b
    a754:	b9 40 00 00 00       	mov    ecx,0x40
    a759:	4c 89 f7             	mov    rdi,r14
    a75c:	e8 9b d6 ff ff       	call   7dfc <encode_test_reg_reg>
    a761:	0f b6 c0             	movzx  eax,al
    a764:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a76b:	49 01 04 24          	add    QWORD PTR [r12],rax
    a76f:	e9 3a db ff ff       	jmp    82ae <parseInst+0x139>
    a774:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    a778:	0f 85 4e fd ff ff    	jne    a4cc <parseInst+0x2357>
    a77e:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a782:	e8 a3 94 00 00       	call   13c2a <find_reg32_index>
    a787:	41 89 c5             	mov    r13d,eax
    a78a:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a78e:	e8 97 94 00 00       	call   13c2a <find_reg32_index>
    a793:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a797:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a79e:	0f b6 d0             	movzx  edx,al
    a7a1:	41 0f b6 f5          	movzx  esi,r13b
    a7a5:	b9 20 00 00 00       	mov    ecx,0x20
    a7aa:	4c 89 f7             	mov    rdi,r14
    a7ad:	e8 4a d6 ff ff       	call   7dfc <encode_test_reg_reg>
    a7b2:	0f b6 c0             	movzx  eax,al
    a7b5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a7bc:	49 01 04 24          	add    QWORD PTR [r12],rax
    a7c0:	e9 e9 da ff ff       	jmp    82ae <parseInst+0x139>
    a7c5:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    a7c9:	0f 85 07 fd ff ff    	jne    a4d6 <parseInst+0x2361>
    a7cf:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a7d3:	e8 0c 95 00 00       	call   13ce4 <find_reg16_index>
    a7d8:	41 89 c5             	mov    r13d,eax
    a7db:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a7df:	e8 00 95 00 00       	call   13ce4 <find_reg16_index>
    a7e4:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a7e8:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a7ef:	0f b6 d0             	movzx  edx,al
    a7f2:	41 0f b6 f5          	movzx  esi,r13b
    a7f6:	b9 10 00 00 00       	mov    ecx,0x10
    a7fb:	4c 89 f7             	mov    rdi,r14
    a7fe:	e8 f9 d5 ff ff       	call   7dfc <encode_test_reg_reg>
    a803:	0f b6 c0             	movzx  eax,al
    a806:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a80d:	49 01 04 24          	add    QWORD PTR [r12],rax
    a811:	e9 98 da ff ff       	jmp    82ae <parseInst+0x139>
    a816:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    a81a:	0f 85 c0 fc ff ff    	jne    a4e0 <parseInst+0x236b>
    a820:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a824:	e8 8c 95 00 00       	call   13db5 <find_reg8_index>
    a829:	41 89 c5             	mov    r13d,eax
    a82c:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a830:	e8 80 95 00 00       	call   13db5 <find_reg8_index>
    a835:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    a839:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    a840:	0f b6 d0             	movzx  edx,al
    a843:	41 0f b6 f5          	movzx  esi,r13b
    a847:	b9 08 00 00 00       	mov    ecx,0x8
    a84c:	4c 89 f7             	mov    rdi,r14
    a84f:	e8 a8 d5 ff ff       	call   7dfc <encode_test_reg_reg>
    a854:	0f b6 c0             	movzx  eax,al
    a857:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a85e:	49 01 04 24          	add    QWORD PTR [r12],rax
    a862:	e9 47 da ff ff       	jmp    82ae <parseInst+0x139>
    a867:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    a86b:	0f 85 79 fc ff ff    	jne    a4ea <parseInst+0x2375>
    a871:	41 80 fd 14          	cmp    r13b,0x14
    a875:	74 5d                	je     a8d4 <parseInst+0x275f>
    a877:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a87b:	e8 f0 92 00 00       	call   13b70 <find_reg64_index>
    a880:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    a884:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    a888:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    a88f:	0f b6 f0             	movzx  esi,al
    a892:	48 83 ec 08          	sub    rsp,0x8
    a896:	6a 00                	push   0x0
    a898:	41 b9 00 00 00 00    	mov    r9d,0x0
    a89e:	41 b8 85 00 00 00    	mov    r8d,0x85
    a8a4:	b9 40 00 00 00       	mov    ecx,0x40
    a8a9:	4c 89 f7             	mov    rdi,r14
    a8ac:	e8 0c b8 ff ff       	call   60bd <encode_inst_rm_rm>
    a8b1:	0f b6 c0             	movzx  eax,al
    a8b4:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a8bb:	49 01 04 24          	add    QWORD PTR [r12],rax
    a8bf:	48 83 c4 10          	add    rsp,0x10
    a8c3:	e9 e6 d9 ff ff       	jmp    82ae <parseInst+0x139>
    a8c8:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    a8cc:	0f 85 22 fc ff ff    	jne    a4f4 <parseInst+0x237f>
    a8d2:	eb 9d                	jmp    a871 <parseInst+0x26fc>
    a8d4:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a8d8:	e8 93 92 00 00       	call   13b70 <find_reg64_index>
    a8dd:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    a8e1:	eb a1                	jmp    a884 <parseInst+0x270f>
    a8e3:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    a8e7:	0f 85 11 fc ff ff    	jne    a4fe <parseInst+0x2389>
    a8ed:	41 80 fd 14          	cmp    r13b,0x14
    a8f1:	74 5d                	je     a950 <parseInst+0x27db>
    a8f3:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a8f7:	e8 2e 93 00 00       	call   13c2a <find_reg32_index>
    a8fc:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    a900:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    a904:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    a90b:	0f b6 f0             	movzx  esi,al
    a90e:	48 83 ec 08          	sub    rsp,0x8
    a912:	6a 00                	push   0x0
    a914:	41 b9 00 00 00 00    	mov    r9d,0x0
    a91a:	41 b8 85 00 00 00    	mov    r8d,0x85
    a920:	b9 20 00 00 00       	mov    ecx,0x20
    a925:	4c 89 f7             	mov    rdi,r14
    a928:	e8 90 b7 ff ff       	call   60bd <encode_inst_rm_rm>
    a92d:	0f b6 c0             	movzx  eax,al
    a930:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a937:	49 01 04 24          	add    QWORD PTR [r12],rax
    a93b:	48 83 c4 10          	add    rsp,0x10
    a93f:	e9 6a d9 ff ff       	jmp    82ae <parseInst+0x139>
    a944:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    a948:	0f 85 ba fb ff ff    	jne    a508 <parseInst+0x2393>
    a94e:	eb 9d                	jmp    a8ed <parseInst+0x2778>
    a950:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a954:	e8 d1 92 00 00       	call   13c2a <find_reg32_index>
    a959:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    a95d:	eb a1                	jmp    a900 <parseInst+0x278b>
    a95f:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    a963:	0f 85 a9 fb ff ff    	jne    a512 <parseInst+0x239d>
    a969:	41 80 fd 14          	cmp    r13b,0x14
    a96d:	74 5d                	je     a9cc <parseInst+0x2857>
    a96f:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a973:	e8 6c 93 00 00       	call   13ce4 <find_reg16_index>
    a978:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    a97c:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    a980:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    a987:	0f b6 f0             	movzx  esi,al
    a98a:	48 83 ec 08          	sub    rsp,0x8
    a98e:	6a 00                	push   0x0
    a990:	41 b9 00 00 00 00    	mov    r9d,0x0
    a996:	41 b8 85 00 00 00    	mov    r8d,0x85
    a99c:	b9 10 00 00 00       	mov    ecx,0x10
    a9a1:	4c 89 f7             	mov    rdi,r14
    a9a4:	e8 14 b7 ff ff       	call   60bd <encode_inst_rm_rm>
    a9a9:	0f b6 c0             	movzx  eax,al
    a9ac:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    a9b3:	49 01 04 24          	add    QWORD PTR [r12],rax
    a9b7:	48 83 c4 10          	add    rsp,0x10
    a9bb:	e9 ee d8 ff ff       	jmp    82ae <parseInst+0x139>
    a9c0:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    a9c4:	0f 85 52 fb ff ff    	jne    a51c <parseInst+0x23a7>
    a9ca:	eb 9d                	jmp    a969 <parseInst+0x27f4>
    a9cc:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    a9d0:	e8 0f 93 00 00       	call   13ce4 <find_reg16_index>
    a9d5:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    a9d9:	eb a1                	jmp    a97c <parseInst+0x2807>
    a9db:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    a9df:	0f 85 41 fb ff ff    	jne    a526 <parseInst+0x23b1>
    a9e5:	41 80 fd 14          	cmp    r13b,0x14
    a9e9:	74 5d                	je     aa48 <parseInst+0x28d3>
    a9eb:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    a9ef:	e8 c1 93 00 00       	call   13db5 <find_reg8_index>
    a9f4:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    a9f8:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    a9fc:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    aa03:	0f b6 f0             	movzx  esi,al
    aa06:	48 83 ec 08          	sub    rsp,0x8
    aa0a:	6a 00                	push   0x0
    aa0c:	41 b9 00 00 00 00    	mov    r9d,0x0
    aa12:	41 b8 84 00 00 00    	mov    r8d,0x84
    aa18:	b9 08 00 00 00       	mov    ecx,0x8
    aa1d:	4c 89 f7             	mov    rdi,r14
    aa20:	e8 98 b6 ff ff       	call   60bd <encode_inst_rm_rm>
    aa25:	0f b6 c0             	movzx  eax,al
    aa28:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    aa2f:	49 01 04 24          	add    QWORD PTR [r12],rax
    aa33:	48 83 c4 10          	add    rsp,0x10
    aa37:	e9 72 d8 ff ff       	jmp    82ae <parseInst+0x139>
    aa3c:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    aa40:	0f 85 ea fa ff ff    	jne    a530 <parseInst+0x23bb>
    aa46:	eb 9d                	jmp    a9e5 <parseInst+0x2870>
    aa48:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    aa4c:	e8 64 93 00 00       	call   13db5 <find_reg8_index>
    aa51:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    aa55:	eb a1                	jmp    a9f8 <parseInst+0x2883>
    aa57:	80 fa 08             	cmp    dl,0x8
    aa5a:	75 7e                	jne    aada <parseInst+0x2965>
    aa5c:	3c 13                	cmp    al,0x13
    aa5e:	0f 84 d9 00 00 00    	je     ab3d <parseInst+0x29c8>
    aa64:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    aa68:	48 83 ec 08          	sub    rsp,0x8
    aa6c:	50                   	push   rax
    aa6d:	41 b9 04 00 00 00    	mov    r9d,0x4
    aa73:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    aa79:	b9 40 00 00 00       	mov    ecx,0x40
    aa7e:	48 89 f2             	mov    rdx,rsi
    aa81:	be 00 00 00 00       	mov    esi,0x0
    aa86:	4c 89 f7             	mov    rdi,r14
    aa89:	e8 2f b6 ff ff       	call   60bd <encode_inst_rm_rm>
    aa8e:	0f b6 c0             	movzx  eax,al
    aa91:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    aa98:	48 83 c4 10          	add    rsp,0x10
    aa9c:	eb 3c                	jmp    aada <parseInst+0x2965>
    aa9e:	3c 13                	cmp    al,0x13
    aaa0:	74 48                	je     aaea <parseInst+0x2975>
    aaa2:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    aaa6:	48 83 ec 08          	sub    rsp,0x8
    aaaa:	50                   	push   rax
    aaab:	41 b9 01 00 00 00    	mov    r9d,0x1
    aab1:	41 b8 f6 00 00 00    	mov    r8d,0xf6
    aab7:	b9 08 00 00 00       	mov    ecx,0x8
    aabc:	48 89 f2             	mov    rdx,rsi
    aabf:	be 00 00 00 00       	mov    esi,0x0
    aac4:	4c 89 f7             	mov    rdi,r14
    aac7:	e8 f1 b5 ff ff       	call   60bd <encode_inst_rm_rm>
    aacc:	0f b6 c0             	movzx  eax,al
    aacf:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    aad6:	48 83 c4 10          	add    rsp,0x10
    aada:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    aae1:	49 01 04 24          	add    QWORD PTR [r12],rax
    aae5:	e9 c4 d7 ff ff       	jmp    82ae <parseInst+0x139>
    aaea:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    aaee:	eb b6                	jmp    aaa6 <parseInst+0x2931>
    aaf0:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    aaf4:	e9 a2 fa ff ff       	jmp    a59b <parseInst+0x2426>
    aaf9:	3c 13                	cmp    al,0x13
    aafb:	74 3a                	je     ab37 <parseInst+0x29c2>
    aafd:	0f b6 43 78          	movzx  eax,BYTE PTR [rbx+0x78]
    ab01:	48 83 ec 08          	sub    rsp,0x8
    ab05:	50                   	push   rax
    ab06:	41 b9 04 00 00 00    	mov    r9d,0x4
    ab0c:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    ab12:	b9 20 00 00 00       	mov    ecx,0x20
    ab17:	48 89 f2             	mov    rdx,rsi
    ab1a:	be 00 00 00 00       	mov    esi,0x0
    ab1f:	4c 89 f7             	mov    rdi,r14
    ab22:	e8 96 b5 ff ff       	call   60bd <encode_inst_rm_rm>
    ab27:	0f b6 c0             	movzx  eax,al
    ab2a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ab31:	48 83 c4 10          	add    rsp,0x10
    ab35:	eb a3                	jmp    aada <parseInst+0x2965>
    ab37:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    ab3b:	eb c4                	jmp    ab01 <parseInst+0x298c>
    ab3d:	48 8b 43 78          	mov    rax,QWORD PTR [rbx+0x78]
    ab41:	e9 22 ff ff ff       	jmp    aa68 <parseInst+0x28f3>
    ab46:	48 8d 35 62 af 00 00 	lea    rsi,[rip+0xaf62]        # 15aaf <_IO_stdin_used+0xaaf>
    ab4d:	48 89 ef             	mov    rdi,rbp
    ab50:	e8 fb 84 ff ff       	call   3050 <strcasecmp@plt>
    ab55:	85 c0                	test   eax,eax
    ab57:	0f 85 24 05 00 00    	jne    b081 <parseInst+0x2f0c>
    ab5d:	41 80 fd 0e          	cmp    r13b,0xe
    ab61:	0f 84 c4 00 00 00    	je     ac2b <parseInst+0x2ab6>
    ab67:	41 80 fd 0d          	cmp    r13b,0xd
    ab6b:	0f 84 fb 00 00 00    	je     ac6c <parseInst+0x2af7>
    ab71:	41 80 fd 0c          	cmp    r13b,0xc
    ab75:	0f 84 32 01 00 00    	je     acad <parseInst+0x2b38>
    ab7b:	41 80 fd 0b          	cmp    r13b,0xb
    ab7f:	0f 84 69 01 00 00    	je     acee <parseInst+0x2b79>
    ab85:	41 80 fd 0e          	cmp    r13b,0xe
    ab89:	0f 84 a0 01 00 00    	je     ad2f <parseInst+0x2bba>
    ab8f:	41 80 fd 0d          	cmp    r13b,0xd
    ab93:	0f 84 e7 01 00 00    	je     ad80 <parseInst+0x2c0b>
    ab99:	41 80 fd 0c          	cmp    r13b,0xc
    ab9d:	0f 84 2e 02 00 00    	je     add1 <parseInst+0x2c5c>
    aba3:	0f b6 43 10          	movzx  eax,BYTE PTR [rbx+0x10]
    aba7:	3c 0e                	cmp    al,0xe
    aba9:	0f 84 73 02 00 00    	je     ae22 <parseInst+0x2cad>
    abaf:	3c 0d                	cmp    al,0xd
    abb1:	0f 84 f1 02 00 00    	je     aea8 <parseInst+0x2d33>
    abb7:	3c 0c                	cmp    al,0xc
    abb9:	0f 84 6f 03 00 00    	je     af2e <parseInst+0x2db9>
    abbf:	3c 0e                	cmp    al,0xe
    abc1:	0f 84 dc 03 00 00    	je     afa3 <parseInst+0x2e2e>
    abc7:	3c 0d                	cmp    al,0xd
    abc9:	0f 84 43 04 00 00    	je     b012 <parseInst+0x2e9d>
    abcf:	3c 0c                	cmp    al,0xc
    abd1:	0f 85 d7 d6 ff ff    	jne    82ae <parseInst+0x139>
    abd7:	80 7b 70 13          	cmp    BYTE PTR [rbx+0x70],0x13
    abdb:	0f 85 cd d6 ff ff    	jne    82ae <parseInst+0x139>
    abe1:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    abe5:	e8 fa 90 00 00       	call   13ce4 <find_reg16_index>
    abea:	48 8b 4b 78          	mov    rcx,QWORD PTR [rbx+0x78]
    abee:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    abf2:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    abf9:	0f b6 f0             	movzx  esi,al
    abfc:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
    ac00:	41 0f 94 c1          	sete   r9b
    ac04:	45 0f b6 c9          	movzx  r9d,r9b
    ac08:	41 b8 10 00 00 00    	mov    r8d,0x10
    ac0e:	89 f2                	mov    edx,esi
    ac10:	4c 89 f7             	mov    rdi,r14
    ac13:	e8 c4 c1 ff ff       	call   6ddc <encode_imul_reg_reg_imm>
    ac18:	0f b6 c0             	movzx  eax,al
    ac1b:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ac22:	49 01 04 24          	add    QWORD PTR [r12],rax
    ac26:	e9 83 d6 ff ff       	jmp    82ae <parseInst+0x139>
    ac2b:	80 7b 70 0a          	cmp    BYTE PTR [rbx+0x70],0xa
    ac2f:	0f 85 32 ff ff ff    	jne    ab67 <parseInst+0x29f2>
    ac35:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    ac39:	e8 32 8f 00 00       	call   13b70 <find_reg64_index>
    ac3e:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    ac42:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    ac49:	0f b6 f0             	movzx  esi,al
    ac4c:	ba 40 00 00 00       	mov    edx,0x40
    ac51:	4c 89 f7             	mov    rdi,r14
    ac54:	e8 36 c0 ff ff       	call   6c8f <encode_imul_reg>
    ac59:	0f b6 c0             	movzx  eax,al
    ac5c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ac63:	49 01 04 24          	add    QWORD PTR [r12],rax
    ac67:	e9 37 ff ff ff       	jmp    aba3 <parseInst+0x2a2e>
    ac6c:	80 7b 70 0a          	cmp    BYTE PTR [rbx+0x70],0xa
    ac70:	0f 85 fb fe ff ff    	jne    ab71 <parseInst+0x29fc>
    ac76:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    ac7a:	e8 ab 8f 00 00       	call   13c2a <find_reg32_index>
    ac7f:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    ac83:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    ac8a:	0f b6 f0             	movzx  esi,al
    ac8d:	ba 20 00 00 00       	mov    edx,0x20
    ac92:	4c 89 f7             	mov    rdi,r14
    ac95:	e8 f5 bf ff ff       	call   6c8f <encode_imul_reg>
    ac9a:	0f b6 c0             	movzx  eax,al
    ac9d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    aca4:	49 01 04 24          	add    QWORD PTR [r12],rax
    aca8:	e9 f6 fe ff ff       	jmp    aba3 <parseInst+0x2a2e>
    acad:	80 7b 70 0a          	cmp    BYTE PTR [rbx+0x70],0xa
    acb1:	0f 85 c4 fe ff ff    	jne    ab7b <parseInst+0x2a06>
    acb7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    acbb:	e8 24 90 00 00       	call   13ce4 <find_reg16_index>
    acc0:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    acc4:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    accb:	0f b6 f0             	movzx  esi,al
    acce:	ba 10 00 00 00       	mov    edx,0x10
    acd3:	4c 89 f7             	mov    rdi,r14
    acd6:	e8 b4 bf ff ff       	call   6c8f <encode_imul_reg>
    acdb:	0f b6 c0             	movzx  eax,al
    acde:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ace5:	49 01 04 24          	add    QWORD PTR [r12],rax
    ace9:	e9 b5 fe ff ff       	jmp    aba3 <parseInst+0x2a2e>
    acee:	80 7b 70 0a          	cmp    BYTE PTR [rbx+0x70],0xa
    acf2:	0f 85 8d fe ff ff    	jne    ab85 <parseInst+0x2a10>
    acf8:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    acfc:	e8 b4 90 00 00       	call   13db5 <find_reg8_index>
    ad01:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    ad05:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    ad0c:	0f b6 f0             	movzx  esi,al
    ad0f:	ba 08 00 00 00       	mov    edx,0x8
    ad14:	4c 89 f7             	mov    rdi,r14
    ad17:	e8 73 bf ff ff       	call   6c8f <encode_imul_reg>
    ad1c:	0f b6 c0             	movzx  eax,al
    ad1f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ad26:	49 01 04 24          	add    QWORD PTR [r12],rax
    ad2a:	e9 74 fe ff ff       	jmp    aba3 <parseInst+0x2a2e>
    ad2f:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    ad33:	0f 85 56 fe ff ff    	jne    ab8f <parseInst+0x2a1a>
    ad39:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    ad3d:	e8 2e 8e 00 00       	call   13b70 <find_reg64_index>
    ad42:	41 89 c5             	mov    r13d,eax
    ad45:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    ad49:	e8 22 8e 00 00       	call   13b70 <find_reg64_index>
    ad4e:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    ad52:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    ad59:	41 0f b6 d5          	movzx  edx,r13b
    ad5d:	0f b6 f0             	movzx  esi,al
    ad60:	b9 40 00 00 00       	mov    ecx,0x40
    ad65:	4c 89 f7             	mov    rdi,r14
    ad68:	e8 b4 bf ff ff       	call   6d21 <encode_imul_reg_reg>
    ad6d:	0f b6 c0             	movzx  eax,al
    ad70:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ad77:	49 01 04 24          	add    QWORD PTR [r12],rax
    ad7b:	e9 23 fe ff ff       	jmp    aba3 <parseInst+0x2a2e>
    ad80:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    ad84:	0f 85 0f fe ff ff    	jne    ab99 <parseInst+0x2a24>
    ad8a:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    ad8e:	e8 97 8e 00 00       	call   13c2a <find_reg32_index>
    ad93:	41 89 c5             	mov    r13d,eax
    ad96:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    ad9a:	e8 8b 8e 00 00       	call   13c2a <find_reg32_index>
    ad9f:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    ada3:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    adaa:	41 0f b6 d5          	movzx  edx,r13b
    adae:	0f b6 f0             	movzx  esi,al
    adb1:	b9 20 00 00 00       	mov    ecx,0x20
    adb6:	4c 89 f7             	mov    rdi,r14
    adb9:	e8 63 bf ff ff       	call   6d21 <encode_imul_reg_reg>
    adbe:	0f b6 c0             	movzx  eax,al
    adc1:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    adc8:	49 01 04 24          	add    QWORD PTR [r12],rax
    adcc:	e9 d2 fd ff ff       	jmp    aba3 <parseInst+0x2a2e>
    add1:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    add5:	0f 85 c8 fd ff ff    	jne    aba3 <parseInst+0x2a2e>
    addb:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    addf:	e8 00 8f 00 00       	call   13ce4 <find_reg16_index>
    ade4:	41 89 c5             	mov    r13d,eax
    ade7:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    adeb:	e8 f4 8e 00 00       	call   13ce4 <find_reg16_index>
    adf0:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    adf4:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    adfb:	41 0f b6 d5          	movzx  edx,r13b
    adff:	0f b6 f0             	movzx  esi,al
    ae02:	b9 10 00 00 00       	mov    ecx,0x10
    ae07:	4c 89 f7             	mov    rdi,r14
    ae0a:	e8 12 bf ff ff       	call   6d21 <encode_imul_reg_reg>
    ae0f:	0f b6 c0             	movzx  eax,al
    ae12:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ae19:	49 01 04 24          	add    QWORD PTR [r12],rax
    ae1d:	e9 81 fd ff ff       	jmp    aba3 <parseInst+0x2a2e>
    ae22:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    ae26:	0f 85 83 fd ff ff    	jne    abaf <parseInst+0x2a3a>
    ae2c:	0f b6 8b d0 00 00 00 	movzx  ecx,BYTE PTR [rbx+0xd0]
    ae33:	8d 51 f0             	lea    edx,[rcx-0x10]
    ae36:	80 fa 01             	cmp    dl,0x1
    ae39:	0f 96 c2             	setbe  dl
    ae3c:	80 f9 13             	cmp    cl,0x13
    ae3f:	0f 94 c1             	sete   cl
    ae42:	08 ca                	or     dl,cl
    ae44:	0f 84 65 fd ff ff    	je     abaf <parseInst+0x2a3a>
    ae4a:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    ae4e:	e8 1d 8d 00 00       	call   13b70 <find_reg64_index>
    ae53:	41 89 c5             	mov    r13d,eax
    ae56:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    ae5a:	e8 11 8d 00 00       	call   13b70 <find_reg64_index>
    ae5f:	48 8b 8b d8 00 00 00 	mov    rcx,QWORD PTR [rbx+0xd8]
    ae66:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    ae6a:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    ae71:	80 bb d0 00 00 00 10 	cmp    BYTE PTR [rbx+0xd0],0x10
    ae78:	0f b6 d0             	movzx  edx,al
    ae7b:	41 0f b6 f5          	movzx  esi,r13b
    ae7f:	41 0f 94 c1          	sete   r9b
    ae83:	45 0f b6 c9          	movzx  r9d,r9b
    ae87:	41 b8 40 00 00 00    	mov    r8d,0x40
    ae8d:	4c 89 f7             	mov    rdi,r14
    ae90:	e8 47 bf ff ff       	call   6ddc <encode_imul_reg_reg_imm>
    ae95:	0f b6 c0             	movzx  eax,al
    ae98:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ae9f:	49 01 04 24          	add    QWORD PTR [r12],rax
    aea3:	e9 06 d4 ff ff       	jmp    82ae <parseInst+0x139>
    aea8:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    aeac:	0f 85 05 fd ff ff    	jne    abb7 <parseInst+0x2a42>
    aeb2:	0f b6 8b d0 00 00 00 	movzx  ecx,BYTE PTR [rbx+0xd0]
    aeb9:	8d 51 f0             	lea    edx,[rcx-0x10]
    aebc:	80 fa 01             	cmp    dl,0x1
    aebf:	0f 96 c2             	setbe  dl
    aec2:	80 f9 13             	cmp    cl,0x13
    aec5:	0f 94 c1             	sete   cl
    aec8:	08 ca                	or     dl,cl
    aeca:	0f 84 e7 fc ff ff    	je     abb7 <parseInst+0x2a42>
    aed0:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    aed4:	e8 51 8d 00 00       	call   13c2a <find_reg32_index>
    aed9:	41 89 c5             	mov    r13d,eax
    aedc:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    aee0:	e8 45 8d 00 00       	call   13c2a <find_reg32_index>
    aee5:	48 8b 8b d8 00 00 00 	mov    rcx,QWORD PTR [rbx+0xd8]
    aeec:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    aef0:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    aef7:	80 bb d0 00 00 00 10 	cmp    BYTE PTR [rbx+0xd0],0x10
    aefe:	0f b6 d0             	movzx  edx,al
    af01:	41 0f b6 f5          	movzx  esi,r13b
    af05:	41 0f 94 c1          	sete   r9b
    af09:	45 0f b6 c9          	movzx  r9d,r9b
    af0d:	41 b8 20 00 00 00    	mov    r8d,0x20
    af13:	4c 89 f7             	mov    rdi,r14
    af16:	e8 c1 be ff ff       	call   6ddc <encode_imul_reg_reg_imm>
    af1b:	0f b6 c0             	movzx  eax,al
    af1e:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    af25:	49 01 04 24          	add    QWORD PTR [r12],rax
    af29:	e9 80 d3 ff ff       	jmp    82ae <parseInst+0x139>
    af2e:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    af32:	0f 85 87 fc ff ff    	jne    abbf <parseInst+0x2a4a>
    af38:	80 bb d0 00 00 00 13 	cmp    BYTE PTR [rbx+0xd0],0x13
    af3f:	0f 85 7a fc ff ff    	jne    abbf <parseInst+0x2a4a>
    af45:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    af49:	e8 96 8d 00 00       	call   13ce4 <find_reg16_index>
    af4e:	41 89 c5             	mov    r13d,eax
    af51:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    af55:	e8 8a 8d 00 00       	call   13ce4 <find_reg16_index>
    af5a:	48 8b 8b d8 00 00 00 	mov    rcx,QWORD PTR [rbx+0xd8]
    af61:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    af65:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    af6c:	80 bb d0 00 00 00 10 	cmp    BYTE PTR [rbx+0xd0],0x10
    af73:	0f b6 d0             	movzx  edx,al
    af76:	41 0f b6 f5          	movzx  esi,r13b
    af7a:	41 0f 94 c1          	sete   r9b
    af7e:	45 0f b6 c9          	movzx  r9d,r9b
    af82:	41 b8 10 00 00 00    	mov    r8d,0x10
    af88:	4c 89 f7             	mov    rdi,r14
    af8b:	e8 4c be ff ff       	call   6ddc <encode_imul_reg_reg_imm>
    af90:	0f b6 c0             	movzx  eax,al
    af93:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    af9a:	49 01 04 24          	add    QWORD PTR [r12],rax
    af9e:	e9 0b d3 ff ff       	jmp    82ae <parseInst+0x139>
    afa3:	0f b6 4b 70          	movzx  ecx,BYTE PTR [rbx+0x70]
    afa7:	80 f9 13             	cmp    cl,0x13
    afaa:	0f 94 c2             	sete   dl
    afad:	80 f9 10             	cmp    cl,0x10
    afb0:	0f 94 c1             	sete   cl
    afb3:	08 ca                	or     dl,cl
    afb5:	0f 84 0c fc ff ff    	je     abc7 <parseInst+0x2a52>
    afbb:	80 bb d0 00 00 00 0a 	cmp    BYTE PTR [rbx+0xd0],0xa
    afc2:	0f 85 ff fb ff ff    	jne    abc7 <parseInst+0x2a52>
    afc8:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    afcc:	e8 9f 8b 00 00       	call   13b70 <find_reg64_index>
    afd1:	48 8b 4b 78          	mov    rcx,QWORD PTR [rbx+0x78]
    afd5:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    afd9:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    afe0:	0f b6 f0             	movzx  esi,al
    afe3:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
    afe7:	41 0f 94 c1          	sete   r9b
    afeb:	45 0f b6 c9          	movzx  r9d,r9b
    afef:	41 b8 40 00 00 00    	mov    r8d,0x40
    aff5:	89 f2                	mov    edx,esi
    aff7:	4c 89 f7             	mov    rdi,r14
    affa:	e8 dd bd ff ff       	call   6ddc <encode_imul_reg_reg_imm>
    afff:	0f b6 c0             	movzx  eax,al
    b002:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b009:	49 01 04 24          	add    QWORD PTR [r12],rax
    b00d:	e9 9c d2 ff ff       	jmp    82ae <parseInst+0x139>
    b012:	0f b6 4b 70          	movzx  ecx,BYTE PTR [rbx+0x70]
    b016:	80 f9 13             	cmp    cl,0x13
    b019:	0f 94 c2             	sete   dl
    b01c:	80 f9 10             	cmp    cl,0x10
    b01f:	0f 94 c1             	sete   cl
    b022:	08 ca                	or     dl,cl
    b024:	0f 84 a5 fb ff ff    	je     abcf <parseInst+0x2a5a>
    b02a:	80 bb d0 00 00 00 0a 	cmp    BYTE PTR [rbx+0xd0],0xa
    b031:	0f 85 98 fb ff ff    	jne    abcf <parseInst+0x2a5a>
    b037:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b03b:	e8 ea 8b 00 00       	call   13c2a <find_reg32_index>
    b040:	48 8b 4b 78          	mov    rcx,QWORD PTR [rbx+0x78]
    b044:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b048:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b04f:	0f b6 f0             	movzx  esi,al
    b052:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
    b056:	41 0f 94 c1          	sete   r9b
    b05a:	45 0f b6 c9          	movzx  r9d,r9b
    b05e:	41 b8 20 00 00 00    	mov    r8d,0x20
    b064:	89 f2                	mov    edx,esi
    b066:	4c 89 f7             	mov    rdi,r14
    b069:	e8 6e bd ff ff       	call   6ddc <encode_imul_reg_reg_imm>
    b06e:	0f b6 c0             	movzx  eax,al
    b071:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b078:	49 01 04 24          	add    QWORD PTR [r12],rax
    b07c:	e9 2d d2 ff ff       	jmp    82ae <parseInst+0x139>
    b081:	48 8d 35 2d aa 00 00 	lea    rsi,[rip+0xaa2d]        # 15ab5 <_IO_stdin_used+0xab5>
    b088:	48 89 ef             	mov    rdi,rbp
    b08b:	e8 c0 7f ff ff       	call   3050 <strcasecmp@plt>
    b090:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    b094:	85 c0                	test   eax,eax
    b096:	74 17                	je     b0af <parseInst+0x2f3a>
    b098:	48 8d 35 15 aa 00 00 	lea    rsi,[rip+0xaa15]        # 15ab4 <_IO_stdin_used+0xab4>
    b09f:	48 89 ef             	mov    rdi,rbp
    b0a2:	e8 a9 7f ff ff       	call   3050 <strcasecmp@plt>
    b0a7:	85 c0                	test   eax,eax
    b0a9:	0f 85 23 02 00 00    	jne    b2d2 <parseInst+0x315d>
    b0af:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    b0b4:	0f 85 a2 00 00 00    	jne    b15c <parseInst+0x2fe7>
    b0ba:	41 bf 06 00 00 00    	mov    r15d,0x6
    b0c0:	41 80 fd 0e          	cmp    r13b,0xe
    b0c4:	0f 84 9d 00 00 00    	je     b167 <parseInst+0x2ff2>
    b0ca:	41 80 fd 0d          	cmp    r13b,0xd
    b0ce:	0f 84 c3 00 00 00    	je     b197 <parseInst+0x3022>
    b0d4:	41 80 fd 0c          	cmp    r13b,0xc
    b0d8:	0f 84 e9 00 00 00    	je     b1c7 <parseInst+0x3052>
    b0de:	41 80 fd 0b          	cmp    r13b,0xb
    b0e2:	0f 84 0f 01 00 00    	je     b1f7 <parseInst+0x3082>
    b0e8:	41 80 fd 14          	cmp    r13b,0x14
    b0ec:	0f 85 bc d1 ff ff    	jne    82ae <parseInst+0x139>
    b0f2:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    b0f6:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b0fa:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b101:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    b108:	3c 04                	cmp    al,0x4
    b10a:	0f 84 8f 01 00 00    	je     b29f <parseInst+0x312a>
    b110:	0f 87 11 01 00 00    	ja     b227 <parseInst+0x30b2>
    b116:	3c 01                	cmp    al,0x1
    b118:	0f 84 40 01 00 00    	je     b25e <parseInst+0x30e9>
    b11e:	3c 02                	cmp    al,0x2
    b120:	0f 85 69 01 00 00    	jne    b28f <parseInst+0x311a>
    b126:	41 0f b6 f7          	movzx  esi,r15b
    b12a:	48 83 ec 08          	sub    rsp,0x8
    b12e:	6a 00                	push   0x0
    b130:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b136:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    b13c:	b9 10 00 00 00       	mov    ecx,0x10
    b141:	4c 89 f7             	mov    rdi,r14
    b144:	e8 74 af ff ff       	call   60bd <encode_inst_rm_rm>
    b149:	0f b6 c0             	movzx  eax,al
    b14c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b153:	48 83 c4 10          	add    rsp,0x10
    b157:	e9 33 01 00 00       	jmp    b28f <parseInst+0x311a>
    b15c:	41 bf 07 00 00 00    	mov    r15d,0x7
    b162:	e9 59 ff ff ff       	jmp    b0c0 <parseInst+0x2f4b>
    b167:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b16b:	e8 00 8a 00 00       	call   13b70 <find_reg64_index>
    b170:	0f b6 d0             	movzx  edx,al
    b173:	41 0f b6 f7          	movzx  esi,r15b
    b177:	b9 40 00 00 00       	mov    ecx,0x40
    b17c:	4c 89 f7             	mov    rdi,r14
    b17f:	e8 3e be ff ff       	call   6fc2 <encode_div_or_idiv_reg>
    b184:	0f b6 c0             	movzx  eax,al
    b187:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b18e:	49 01 04 24          	add    QWORD PTR [r12],rax
    b192:	e9 17 d1 ff ff       	jmp    82ae <parseInst+0x139>
    b197:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b19b:	e8 8a 8a 00 00       	call   13c2a <find_reg32_index>
    b1a0:	0f b6 d0             	movzx  edx,al
    b1a3:	41 0f b6 f7          	movzx  esi,r15b
    b1a7:	b9 20 00 00 00       	mov    ecx,0x20
    b1ac:	4c 89 f7             	mov    rdi,r14
    b1af:	e8 0e be ff ff       	call   6fc2 <encode_div_or_idiv_reg>
    b1b4:	0f b6 c0             	movzx  eax,al
    b1b7:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b1be:	49 01 04 24          	add    QWORD PTR [r12],rax
    b1c2:	e9 e7 d0 ff ff       	jmp    82ae <parseInst+0x139>
    b1c7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b1cb:	e8 14 8b 00 00       	call   13ce4 <find_reg16_index>
    b1d0:	0f b6 d0             	movzx  edx,al
    b1d3:	41 0f b6 f7          	movzx  esi,r15b
    b1d7:	b9 10 00 00 00       	mov    ecx,0x10
    b1dc:	4c 89 f7             	mov    rdi,r14
    b1df:	e8 de bd ff ff       	call   6fc2 <encode_div_or_idiv_reg>
    b1e4:	0f b6 c0             	movzx  eax,al
    b1e7:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b1ee:	49 01 04 24          	add    QWORD PTR [r12],rax
    b1f2:	e9 b7 d0 ff ff       	jmp    82ae <parseInst+0x139>
    b1f7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b1fb:	e8 b5 8b 00 00       	call   13db5 <find_reg8_index>
    b200:	0f b6 d0             	movzx  edx,al
    b203:	41 0f b6 f7          	movzx  esi,r15b
    b207:	b9 08 00 00 00       	mov    ecx,0x8
    b20c:	4c 89 f7             	mov    rdi,r14
    b20f:	e8 ae bd ff ff       	call   6fc2 <encode_div_or_idiv_reg>
    b214:	0f b6 c0             	movzx  eax,al
    b217:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b21e:	49 01 04 24          	add    QWORD PTR [r12],rax
    b222:	e9 87 d0 ff ff       	jmp    82ae <parseInst+0x139>
    b227:	3c 08                	cmp    al,0x8
    b229:	75 64                	jne    b28f <parseInst+0x311a>
    b22b:	41 0f b6 f7          	movzx  esi,r15b
    b22f:	48 83 ec 08          	sub    rsp,0x8
    b233:	6a 00                	push   0x0
    b235:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b23b:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    b241:	b9 40 00 00 00       	mov    ecx,0x40
    b246:	4c 89 f7             	mov    rdi,r14
    b249:	e8 6f ae ff ff       	call   60bd <encode_inst_rm_rm>
    b24e:	0f b6 c0             	movzx  eax,al
    b251:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b258:	48 83 c4 10          	add    rsp,0x10
    b25c:	eb 31                	jmp    b28f <parseInst+0x311a>
    b25e:	41 0f b6 f7          	movzx  esi,r15b
    b262:	48 83 ec 08          	sub    rsp,0x8
    b266:	6a 00                	push   0x0
    b268:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b26e:	41 b8 f6 00 00 00    	mov    r8d,0xf6
    b274:	b9 08 00 00 00       	mov    ecx,0x8
    b279:	4c 89 f7             	mov    rdi,r14
    b27c:	e8 3c ae ff ff       	call   60bd <encode_inst_rm_rm>
    b281:	0f b6 c0             	movzx  eax,al
    b284:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b28b:	48 83 c4 10          	add    rsp,0x10
    b28f:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    b296:	49 01 04 24          	add    QWORD PTR [r12],rax
    b29a:	e9 0f d0 ff ff       	jmp    82ae <parseInst+0x139>
    b29f:	41 0f b6 f7          	movzx  esi,r15b
    b2a3:	48 83 ec 08          	sub    rsp,0x8
    b2a7:	6a 00                	push   0x0
    b2a9:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b2af:	41 b8 f7 00 00 00    	mov    r8d,0xf7
    b2b5:	b9 20 00 00 00       	mov    ecx,0x20
    b2ba:	4c 89 f7             	mov    rdi,r14
    b2bd:	e8 fb ad ff ff       	call   60bd <encode_inst_rm_rm>
    b2c2:	0f b6 c0             	movzx  eax,al
    b2c5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b2cc:	48 83 c4 10          	add    rsp,0x10
    b2d0:	eb bd                	jmp    b28f <parseInst+0x311a>
    b2d2:	48 8d 35 e0 a7 00 00 	lea    rsi,[rip+0xa7e0]        # 15ab9 <_IO_stdin_used+0xab9>
    b2d9:	48 89 ef             	mov    rdi,rbp
    b2dc:	e8 6f 7d ff ff       	call   3050 <strcasecmp@plt>
    b2e1:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    b2e5:	85 c0                	test   eax,eax
    b2e7:	74 13                	je     b2fc <parseInst+0x3187>
    b2e9:	48 8d 35 cd a7 00 00 	lea    rsi,[rip+0xa7cd]        # 15abd <_IO_stdin_used+0xabd>
    b2f0:	48 89 ef             	mov    rdi,rbp
    b2f3:	e8 58 7d ff ff       	call   3050 <strcasecmp@plt>
    b2f8:	85 c0                	test   eax,eax
    b2fa:	75 17                	jne    b313 <parseInst+0x319e>
    b2fc:	41 80 fd 0b          	cmp    r13b,0xb
    b300:	0f 84 c7 00 00 00    	je     b3cd <parseInst+0x3258>
    b306:	80 bb c8 00 00 00 01 	cmp    BYTE PTR [rbx+0xc8],0x1
    b30d:	0f 84 ba 00 00 00    	je     b3cd <parseInst+0x3258>
    b313:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    b318:	74 17                	je     b331 <parseInst+0x31bc>
    b31a:	48 8d 35 9c a7 00 00 	lea    rsi,[rip+0xa79c]        # 15abd <_IO_stdin_used+0xabd>
    b321:	48 89 ef             	mov    rdi,rbp
    b324:	e8 27 7d ff ff       	call   3050 <strcasecmp@plt>
    b329:	85 c0                	test   eax,eax
    b32b:	0f 85 72 02 00 00    	jne    b5a3 <parseInst+0x342e>
    b331:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    b336:	41 0f 95 c7          	setne  r15b
    b33a:	41 80 fd 0e          	cmp    r13b,0xe
    b33e:	0f 84 30 01 00 00    	je     b474 <parseInst+0x32ff>
    b344:	41 80 fd 0d          	cmp    r13b,0xd
    b348:	0f 84 67 01 00 00    	je     b4b5 <parseInst+0x3340>
    b34e:	41 80 fd 0c          	cmp    r13b,0xc
    b352:	0f 84 9e 01 00 00    	je     b4f6 <parseInst+0x3381>
    b358:	41 80 fd 14          	cmp    r13b,0x14
    b35c:	0f 85 4c cf ff ff    	jne    82ae <parseInst+0x139>
    b362:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    b366:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b36a:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b371:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    b378:	3c 04                	cmp    al,0x4
    b37a:	0f 84 b7 01 00 00    	je     b537 <parseInst+0x33c2>
    b380:	3c 08                	cmp    al,0x8
    b382:	0f 84 e5 01 00 00    	je     b56d <parseInst+0x33f8>
    b388:	3c 02                	cmp    al,0x2
    b38a:	75 31                	jne    b3bd <parseInst+0x3248>
    b38c:	41 0f b6 f7          	movzx  esi,r15b
    b390:	48 83 ec 08          	sub    rsp,0x8
    b394:	6a 00                	push   0x0
    b396:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b39c:	41 b8 ff 00 00 00    	mov    r8d,0xff
    b3a2:	b9 10 00 00 00       	mov    ecx,0x10
    b3a7:	4c 89 f7             	mov    rdi,r14
    b3aa:	e8 0e ad ff ff       	call   60bd <encode_inst_rm_rm>
    b3af:	0f b6 c0             	movzx  eax,al
    b3b2:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b3b9:	48 83 c4 10          	add    rsp,0x10
    b3bd:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    b3c4:	49 01 04 24          	add    QWORD PTR [r12],rax
    b3c8:	e9 e1 ce ff ff       	jmp    82ae <parseInst+0x139>
    b3cd:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    b3d2:	75 06                	jne    b3da <parseInst+0x3265>
    b3d4:	41 bf 00 00 00 00    	mov    r15d,0x0
    b3da:	41 80 fd 0b          	cmp    r13b,0xb
    b3de:	74 53                	je     b433 <parseInst+0x32be>
    b3e0:	41 80 fd 14          	cmp    r13b,0x14
    b3e4:	0f 85 c4 ce ff ff    	jne    82ae <parseInst+0x139>
    b3ea:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    b3ee:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b3f2:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b3f9:	41 0f b6 f7          	movzx  esi,r15b
    b3fd:	48 83 ec 08          	sub    rsp,0x8
    b401:	6a 00                	push   0x0
    b403:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b409:	41 b8 fe 00 00 00    	mov    r8d,0xfe
    b40f:	b9 08 00 00 00       	mov    ecx,0x8
    b414:	4c 89 f7             	mov    rdi,r14
    b417:	e8 a1 ac ff ff       	call   60bd <encode_inst_rm_rm>
    b41c:	0f b6 c0             	movzx  eax,al
    b41f:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b426:	49 01 04 24          	add    QWORD PTR [r12],rax
    b42a:	48 83 c4 10          	add    rsp,0x10
    b42e:	e9 7b ce ff ff       	jmp    82ae <parseInst+0x139>
    b433:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b437:	e8 79 89 00 00       	call   13db5 <find_reg8_index>
    b43c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b440:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b447:	41 0f b6 cf          	movzx  ecx,r15b
    b44b:	0f b6 f0             	movzx  esi,al
    b44e:	41 b8 08 00 00 00    	mov    r8d,0x8
    b454:	ba fe 00 00 00       	mov    edx,0xfe
    b459:	4c 89 f7             	mov    rdi,r14
    b45c:	e8 ec cc ff ff       	call   814d <encode_group4_reg>
    b461:	0f b6 c0             	movzx  eax,al
    b464:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b46b:	49 01 04 24          	add    QWORD PTR [r12],rax
    b46f:	e9 3a ce ff ff       	jmp    82ae <parseInst+0x139>
    b474:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b478:	e8 f3 86 00 00       	call   13b70 <find_reg64_index>
    b47d:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b481:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b488:	41 0f b6 cf          	movzx  ecx,r15b
    b48c:	0f b6 f0             	movzx  esi,al
    b48f:	41 b8 40 00 00 00    	mov    r8d,0x40
    b495:	ba ff 00 00 00       	mov    edx,0xff
    b49a:	4c 89 f7             	mov    rdi,r14
    b49d:	e8 bf cc ff ff       	call   8161 <encode_group5_reg>
    b4a2:	0f b6 c0             	movzx  eax,al
    b4a5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b4ac:	49 01 04 24          	add    QWORD PTR [r12],rax
    b4b0:	e9 f9 cd ff ff       	jmp    82ae <parseInst+0x139>
    b4b5:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b4b9:	e8 6c 87 00 00       	call   13c2a <find_reg32_index>
    b4be:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b4c2:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b4c9:	41 0f b6 cf          	movzx  ecx,r15b
    b4cd:	0f b6 f0             	movzx  esi,al
    b4d0:	41 b8 20 00 00 00    	mov    r8d,0x20
    b4d6:	ba ff 00 00 00       	mov    edx,0xff
    b4db:	4c 89 f7             	mov    rdi,r14
    b4de:	e8 7e cc ff ff       	call   8161 <encode_group5_reg>
    b4e3:	0f b6 c0             	movzx  eax,al
    b4e6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b4ed:	49 01 04 24          	add    QWORD PTR [r12],rax
    b4f1:	e9 b8 cd ff ff       	jmp    82ae <parseInst+0x139>
    b4f6:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b4fa:	e8 e5 87 00 00       	call   13ce4 <find_reg16_index>
    b4ff:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b503:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b50a:	41 0f b6 cf          	movzx  ecx,r15b
    b50e:	0f b6 f0             	movzx  esi,al
    b511:	41 b8 10 00 00 00    	mov    r8d,0x10
    b517:	ba ff 00 00 00       	mov    edx,0xff
    b51c:	4c 89 f7             	mov    rdi,r14
    b51f:	e8 3d cc ff ff       	call   8161 <encode_group5_reg>
    b524:	0f b6 c0             	movzx  eax,al
    b527:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b52e:	49 01 04 24          	add    QWORD PTR [r12],rax
    b532:	e9 77 cd ff ff       	jmp    82ae <parseInst+0x139>
    b537:	41 0f b6 f7          	movzx  esi,r15b
    b53b:	48 83 ec 08          	sub    rsp,0x8
    b53f:	6a 00                	push   0x0
    b541:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b547:	41 b8 ff 00 00 00    	mov    r8d,0xff
    b54d:	b9 20 00 00 00       	mov    ecx,0x20
    b552:	4c 89 f7             	mov    rdi,r14
    b555:	e8 63 ab ff ff       	call   60bd <encode_inst_rm_rm>
    b55a:	0f b6 c0             	movzx  eax,al
    b55d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b564:	48 83 c4 10          	add    rsp,0x10
    b568:	e9 50 fe ff ff       	jmp    b3bd <parseInst+0x3248>
    b56d:	41 0f b6 f7          	movzx  esi,r15b
    b571:	48 83 ec 08          	sub    rsp,0x8
    b575:	6a 00                	push   0x0
    b577:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b57d:	41 b8 ff 00 00 00    	mov    r8d,0xff
    b583:	b9 40 00 00 00       	mov    ecx,0x40
    b588:	4c 89 f7             	mov    rdi,r14
    b58b:	e8 2d ab ff ff       	call   60bd <encode_inst_rm_rm>
    b590:	0f b6 c0             	movzx  eax,al
    b593:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b59a:	48 83 c4 10          	add    rsp,0x10
    b59e:	e9 1a fe ff ff       	jmp    b3bd <parseInst+0x3248>
    b5a3:	48 8d 35 17 a5 00 00 	lea    rsi,[rip+0xa517]        # 15ac1 <_IO_stdin_used+0xac1>
    b5aa:	48 89 ef             	mov    rdi,rbp
    b5ad:	e8 9e 7a ff ff       	call   3050 <strcasecmp@plt>
    b5b2:	85 c0                	test   eax,eax
    b5b4:	0f 85 b8 01 00 00    	jne    b772 <parseInst+0x35fd>
    b5ba:	41 83 ed 0b          	sub    r13d,0xb
    b5be:	41 80 fd 09          	cmp    r13b,0x9
    b5c2:	0f 87 e6 cc ff ff    	ja     82ae <parseInst+0x139>
    b5c8:	45 0f b6 ed          	movzx  r13d,r13b
    b5cc:	48 8d 15 6d a9 00 00 	lea    rdx,[rip+0xa96d]        # 15f40 <_IO_stdin_used+0xf40>
    b5d3:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
    b5d7:	48 01 d0             	add    rax,rdx
    b5da:	ff e0                	jmp    rax
    b5dc:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b5e0:	e8 8b 85 00 00       	call   13b70 <find_reg64_index>
    b5e5:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b5e9:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b5f0:	0f b6 f0             	movzx  esi,al
    b5f3:	ba 40 00 00 00       	mov    edx,0x40
    b5f8:	4c 89 f7             	mov    rdi,r14
    b5fb:	e8 6c bc ff ff       	call   726c <encode_push_reg>
    b600:	0f b6 c0             	movzx  eax,al
    b603:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b60a:	49 01 04 24          	add    QWORD PTR [r12],rax
    b60e:	e9 9b cc ff ff       	jmp    82ae <parseInst+0x139>
    b613:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b617:	e8 0e 86 00 00       	call   13c2a <find_reg32_index>
    b61c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b620:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b627:	0f b6 f0             	movzx  esi,al
    b62a:	ba 20 00 00 00       	mov    edx,0x20
    b62f:	4c 89 f7             	mov    rdi,r14
    b632:	e8 35 bc ff ff       	call   726c <encode_push_reg>
    b637:	0f b6 c0             	movzx  eax,al
    b63a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b641:	49 01 04 24          	add    QWORD PTR [r12],rax
    b645:	e9 64 cc ff ff       	jmp    82ae <parseInst+0x139>
    b64a:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b64e:	e8 91 86 00 00       	call   13ce4 <find_reg16_index>
    b653:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b657:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b65e:	0f b6 f0             	movzx  esi,al
    b661:	ba 10 00 00 00       	mov    edx,0x10
    b666:	4c 89 f7             	mov    rdi,r14
    b669:	e8 fe bb ff ff       	call   726c <encode_push_reg>
    b66e:	0f b6 c0             	movzx  eax,al
    b671:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b678:	49 01 04 24          	add    QWORD PTR [r12],rax
    b67c:	e9 2d cc ff ff       	jmp    82ae <parseInst+0x139>
    b681:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b685:	e8 2b 87 00 00       	call   13db5 <find_reg8_index>
    b68a:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b68e:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b695:	0f b6 f0             	movzx  esi,al
    b698:	ba 08 00 00 00       	mov    edx,0x8
    b69d:	4c 89 f7             	mov    rdi,r14
    b6a0:	e8 c7 bb ff ff       	call   726c <encode_push_reg>
    b6a5:	0f b6 c0             	movzx  eax,al
    b6a8:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b6af:	49 01 04 24          	add    QWORD PTR [r12],rax
    b6b3:	e9 f6 cb ff ff       	jmp    82ae <parseInst+0x139>
    b6b8:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    b6bc:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b6c0:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b6c7:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    b6ce:	3c 02                	cmp    al,0x2
    b6d0:	74 2a                	je     b6fc <parseInst+0x3587>
    b6d2:	3c 08                	cmp    al,0x8
    b6d4:	74 68                	je     b73e <parseInst+0x35c9>
    b6d6:	0f b7 53 0a          	movzx  edx,WORD PTR [rbx+0xa]
    b6da:	48 8d 35 a7 a7 00 00 	lea    rsi,[rip+0xa7a7]        # 15e88 <_IO_stdin_used+0xe88>
    b6e1:	48 8b 3d f8 f4 00 00 	mov    rdi,QWORD PTR [rip+0xf4f8]        # 1abe0 <stderr@GLIBC_2.2.5>
    b6e8:	b8 00 00 00 00       	mov    eax,0x0
    b6ed:	e8 4e 7a ff ff       	call   3140 <fprintf@plt>
    b6f2:	bf 01 00 00 00       	mov    edi,0x1
    b6f7:	e8 d4 7a ff ff       	call   31d0 <exit@plt>
    b6fc:	48 83 ec 08          	sub    rsp,0x8
    b700:	6a 00                	push   0x0
    b702:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b708:	41 b8 ff 00 00 00    	mov    r8d,0xff
    b70e:	b9 10 00 00 00       	mov    ecx,0x10
    b713:	be 06 00 00 00       	mov    esi,0x6
    b718:	4c 89 f7             	mov    rdi,r14
    b71b:	e8 9d a9 ff ff       	call   60bd <encode_inst_rm_rm>
    b720:	0f b6 c0             	movzx  eax,al
    b723:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b72a:	48 83 c4 10          	add    rsp,0x10
    b72e:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    b735:	49 01 04 24          	add    QWORD PTR [r12],rax
    b739:	e9 70 cb ff ff       	jmp    82ae <parseInst+0x139>
    b73e:	48 83 ec 08          	sub    rsp,0x8
    b742:	6a 00                	push   0x0
    b744:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    b74a:	41 b8 ff 00 00 00    	mov    r8d,0xff
    b750:	b9 40 00 00 00       	mov    ecx,0x40
    b755:	be 06 00 00 00       	mov    esi,0x6
    b75a:	4c 89 f7             	mov    rdi,r14
    b75d:	e8 5b a9 ff ff       	call   60bd <encode_inst_rm_rm>
    b762:	0f b6 c0             	movzx  eax,al
    b765:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b76c:	48 83 c4 10          	add    rsp,0x10
    b770:	eb bc                	jmp    b72e <parseInst+0x35b9>
    b772:	48 8d 35 4d a3 00 00 	lea    rsi,[rip+0xa34d]        # 15ac6 <_IO_stdin_used+0xac6>
    b779:	48 89 ef             	mov    rdi,rbp
    b77c:	e8 cf 78 ff ff       	call   3050 <strcasecmp@plt>
    b781:	85 c0                	test   eax,eax
    b783:	0f 85 fc 00 00 00    	jne    b885 <parseInst+0x3710>
    b789:	41 80 fd 0e          	cmp    r13b,0xe
    b78d:	74 47                	je     b7d6 <parseInst+0x3661>
    b78f:	41 80 fd 0d          	cmp    r13b,0xd
    b793:	74 78                	je     b80d <parseInst+0x3698>
    b795:	41 80 fd 0c          	cmp    r13b,0xc
    b799:	0f 85 a5 00 00 00    	jne    b844 <parseInst+0x36cf>
    b79f:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b7a3:	e8 3c 85 00 00       	call   13ce4 <find_reg16_index>
    b7a8:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b7ac:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b7b3:	0f b6 f0             	movzx  esi,al
    b7b6:	ba 10 00 00 00       	mov    edx,0x10
    b7bb:	4c 89 f7             	mov    rdi,r14
    b7be:	e8 28 bb ff ff       	call   72eb <encode_pop_reg>
    b7c3:	0f b6 c0             	movzx  eax,al
    b7c6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b7cd:	49 01 04 24          	add    QWORD PTR [r12],rax
    b7d1:	e9 d8 ca ff ff       	jmp    82ae <parseInst+0x139>
    b7d6:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b7da:	e8 91 83 00 00       	call   13b70 <find_reg64_index>
    b7df:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b7e3:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b7ea:	0f b6 f0             	movzx  esi,al
    b7ed:	ba 40 00 00 00       	mov    edx,0x40
    b7f2:	4c 89 f7             	mov    rdi,r14
    b7f5:	e8 f1 ba ff ff       	call   72eb <encode_pop_reg>
    b7fa:	0f b6 c0             	movzx  eax,al
    b7fd:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b804:	49 01 04 24          	add    QWORD PTR [r12],rax
    b808:	e9 a1 ca ff ff       	jmp    82ae <parseInst+0x139>
    b80d:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b811:	e8 14 84 00 00       	call   13c2a <find_reg32_index>
    b816:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b81a:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b821:	0f b6 f0             	movzx  esi,al
    b824:	ba 20 00 00 00       	mov    edx,0x20
    b829:	4c 89 f7             	mov    rdi,r14
    b82c:	e8 ba ba ff ff       	call   72eb <encode_pop_reg>
    b831:	0f b6 c0             	movzx  eax,al
    b834:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b83b:	49 01 04 24          	add    QWORD PTR [r12],rax
    b83f:	e9 6a ca ff ff       	jmp    82ae <parseInst+0x139>
    b844:	41 80 fd 0b          	cmp    r13b,0xb
    b848:	0f 85 60 ca ff ff    	jne    82ae <parseInst+0x139>
    b84e:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b852:	e8 5e 85 00 00       	call   13db5 <find_reg8_index>
    b857:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    b85b:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    b862:	0f b6 f0             	movzx  esi,al
    b865:	ba 08 00 00 00       	mov    edx,0x8
    b86a:	4c 89 f7             	mov    rdi,r14
    b86d:	e8 79 ba ff ff       	call   72eb <encode_pop_reg>
    b872:	0f b6 c0             	movzx  eax,al
    b875:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    b87c:	49 01 04 24          	add    QWORD PTR [r12],rax
    b880:	e9 29 ca ff ff       	jmp    82ae <parseInst+0x139>
    b885:	48 8d 35 14 9d 00 00 	lea    rsi,[rip+0x9d14]        # 155a0 <_IO_stdin_used+0x5a0>
    b88c:	48 89 ef             	mov    rdi,rbp
    b88f:	e8 bc 77 ff ff       	call   3050 <strcasecmp@plt>
    b894:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
    b898:	85 c0                	test   eax,eax
    b89a:	74 17                	je     b8b3 <parseInst+0x373e>
    b89c:	48 8d 35 63 a5 00 00 	lea    rsi,[rip+0xa563]        # 15e06 <_IO_stdin_used+0xe06>
    b8a3:	48 89 ef             	mov    rdi,rbp
    b8a6:	e8 a5 77 ff ff       	call   3050 <strcasecmp@plt>
    b8ab:	85 c0                	test   eax,eax
    b8ad:	0f 85 42 02 00 00    	jne    baf5 <parseInst+0x3980>
    b8b3:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    b8b8:	0f 85 ad 00 00 00    	jne    b96b <parseInst+0x37f6>
    b8be:	41 bf 04 00 00 00    	mov    r15d,0x4
    b8c4:	41 8d 45 f0          	lea    eax,[r13-0x10]
    b8c8:	3c 01                	cmp    al,0x1
    b8ca:	0f 86 a6 00 00 00    	jbe    b976 <parseInst+0x3801>
    b8d0:	41 80 fd 0e          	cmp    r13b,0xe
    b8d4:	0f 85 03 01 00 00    	jne    b9dd <parseInst+0x3868>
    b8da:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    b8de:	e8 8d 82 00 00       	call   13b70 <find_reg64_index>
    b8e3:	41 89 c5             	mov    r13d,eax
    b8e6:	0f b6 c0             	movzx  eax,al
    b8e9:	83 f8 07             	cmp    eax,0x7
    b8ec:	0f 8f c9 00 00 00    	jg     b9bb <parseInst+0x3846>
    b8f2:	c6 44 24 08 48       	mov    BYTE PTR [rsp+0x8],0x48
    b8f7:	48 8d 35 a2 9c 00 00 	lea    rsi,[rip+0x9ca2]        # 155a0 <_IO_stdin_used+0x5a0>
    b8fe:	48 89 ef             	mov    rdi,rbp
    b901:	e8 4a 77 ff ff       	call   3050 <strcasecmp@plt>
    b906:	85 c0                	test   eax,eax
    b908:	0f 85 b7 00 00 00    	jne    b9c5 <parseInst+0x3850>
    b90e:	42 8d 14 fd 00 00 00 	lea    edx,[r15*8+0x0]
    b915:	00 
    b916:	83 ca c0             	or     edx,0xffffffc0
    b919:	44 89 e8             	mov    eax,r13d
    b91c:	83 e0 07             	and    eax,0x7
    b91f:	09 d0                	or     eax,edx
    b921:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    b928:	0f b6 4c 24 08       	movzx  ecx,BYTE PTR [rsp+0x8]
    b92d:	88 0a                	mov    BYTE PTR [rdx],cl
    b92f:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    b936:	c6 42 01 ff          	mov    BYTE PTR [rdx+0x1],0xff
    b93a:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    b941:	88 42 02             	mov    BYTE PTR [rdx+0x2],al
    b944:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b948:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b94f:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x3
    b956:	03 00 00 00 
    b95a:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b95e:	48 83 c0 03          	add    rax,0x3
    b962:	49 89 04 24          	mov    QWORD PTR [r12],rax
    b966:	e9 43 c9 ff ff       	jmp    82ae <parseInst+0x139>
    b96b:	41 bf 02 00 00 00    	mov    r15d,0x2
    b971:	e9 4e ff ff ff       	jmp    b8c4 <parseInst+0x374f>
    b976:	83 7c 24 08 00       	cmp    DWORD PTR [rsp+0x8],0x0
    b97b:	75 37                	jne    b9b4 <parseInst+0x383f>
    b97d:	b8 e9 ff ff ff       	mov    eax,0xffffffe9
    b982:	41 88 06             	mov    BYTE PTR [r14],al
    b985:	41 c7 46 01 00 00 00 	mov    DWORD PTR [r14+0x1],0x0
    b98c:	00 
    b98d:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b991:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b998:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x5
    b99f:	05 00 00 00 
    b9a3:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b9a7:	48 83 c0 05          	add    rax,0x5
    b9ab:	49 89 04 24          	mov    QWORD PTR [r12],rax
    b9af:	e9 fa c8 ff ff       	jmp    82ae <parseInst+0x139>
    b9b4:	b8 e8 ff ff ff       	mov    eax,0xffffffe8
    b9b9:	eb c7                	jmp    b982 <parseInst+0x380d>
    b9bb:	c6 44 24 08 49       	mov    BYTE PTR [rsp+0x8],0x49
    b9c0:	e9 32 ff ff ff       	jmp    b8f7 <parseInst+0x3782>
    b9c5:	42 8d 14 fd 00 00 00 	lea    edx,[r15*8+0x0]
    b9cc:	00 
    b9cd:	83 ca c0             	or     edx,0xffffffc0
    b9d0:	44 89 e8             	mov    eax,r13d
    b9d3:	83 e0 07             	and    eax,0x7
    b9d6:	09 d0                	or     eax,edx
    b9d8:	e9 44 ff ff ff       	jmp    b921 <parseInst+0x37ac>
    b9dd:	41 80 fd 14          	cmp    r13b,0x14
    b9e1:	0f 85 c7 c8 ff ff    	jne    82ae <parseInst+0x139>
    b9e7:	48 8d 53 18          	lea    rdx,[rbx+0x18]
    b9eb:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    b9ef:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    b9f6:	0f b6 83 c8 00 00 00 	movzx  eax,BYTE PTR [rbx+0xc8]
    b9fd:	3c 04                	cmp    al,0x4
    b9ff:	0f 84 ba 00 00 00    	je     babf <parseInst+0x394a>
    ba05:	77 18                	ja     ba1f <parseInst+0x38aa>
    ba07:	3c 01                	cmp    al,0x1
    ba09:	74 4b                	je     ba56 <parseInst+0x38e1>
    ba0b:	3c 02                	cmp    al,0x2
    ba0d:	74 7a                	je     ba89 <parseInst+0x3914>
    ba0f:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    ba16:	49 01 04 24          	add    QWORD PTR [r12],rax
    ba1a:	e9 8f c8 ff ff       	jmp    82ae <parseInst+0x139>
    ba1f:	3c 08                	cmp    al,0x8
    ba21:	75 ec                	jne    ba0f <parseInst+0x389a>
    ba23:	41 0f b6 f7          	movzx  esi,r15b
    ba27:	48 83 ec 08          	sub    rsp,0x8
    ba2b:	6a 00                	push   0x0
    ba2d:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    ba33:	41 b8 ff 00 00 00    	mov    r8d,0xff
    ba39:	b9 40 00 00 00       	mov    ecx,0x40
    ba3e:	4c 89 f7             	mov    rdi,r14
    ba41:	e8 77 a6 ff ff       	call   60bd <encode_inst_rm_rm>
    ba46:	0f b6 c0             	movzx  eax,al
    ba49:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ba50:	48 83 c4 10          	add    rsp,0x10
    ba54:	eb b9                	jmp    ba0f <parseInst+0x389a>
    ba56:	41 0f b6 f7          	movzx  esi,r15b
    ba5a:	48 83 ec 08          	sub    rsp,0x8
    ba5e:	6a 00                	push   0x0
    ba60:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    ba66:	41 b8 ff 00 00 00    	mov    r8d,0xff
    ba6c:	b9 08 00 00 00       	mov    ecx,0x8
    ba71:	4c 89 f7             	mov    rdi,r14
    ba74:	e8 44 a6 ff ff       	call   60bd <encode_inst_rm_rm>
    ba79:	0f b6 c0             	movzx  eax,al
    ba7c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ba83:	48 83 c4 10          	add    rsp,0x10
    ba87:	eb 86                	jmp    ba0f <parseInst+0x389a>
    ba89:	41 0f b6 f7          	movzx  esi,r15b
    ba8d:	48 83 ec 08          	sub    rsp,0x8
    ba91:	6a 00                	push   0x0
    ba93:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    ba99:	41 b8 ff 00 00 00    	mov    r8d,0xff
    ba9f:	b9 10 00 00 00       	mov    ecx,0x10
    baa4:	4c 89 f7             	mov    rdi,r14
    baa7:	e8 11 a6 ff ff       	call   60bd <encode_inst_rm_rm>
    baac:	0f b6 c0             	movzx  eax,al
    baaf:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bab6:	48 83 c4 10          	add    rsp,0x10
    baba:	e9 50 ff ff ff       	jmp    ba0f <parseInst+0x389a>
    babf:	41 0f b6 f7          	movzx  esi,r15b
    bac3:	48 83 ec 08          	sub    rsp,0x8
    bac7:	6a 00                	push   0x0
    bac9:	41 b9 6f 00 00 00    	mov    r9d,0x6f
    bacf:	41 b8 ff 00 00 00    	mov    r8d,0xff
    bad5:	b9 20 00 00 00       	mov    ecx,0x20
    bada:	4c 89 f7             	mov    rdi,r14
    badd:	e8 db a5 ff ff       	call   60bd <encode_inst_rm_rm>
    bae2:	0f b6 c0             	movzx  eax,al
    bae5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    baec:	48 83 c4 10          	add    rsp,0x10
    baf0:	e9 1a ff ff ff       	jmp    ba0f <parseInst+0x389a>
    baf5:	48 89 ee             	mov    rsi,rbp
    baf8:	48 8d 3d 61 e7 00 00 	lea    rdi,[rip+0xe761]        # 1a260 <JCC>
    baff:	e8 a2 7c 00 00       	call   137a6 <is2arrin>
    bb04:	85 c0                	test   eax,eax
    bb06:	0f 84 a2 c7 ff ff    	je     82ae <parseInst+0x139>
    bb0c:	48 8d 35 b7 9f 00 00 	lea    rsi,[rip+0x9fb7]        # 15aca <_IO_stdin_used+0xaca>
    bb13:	48 89 ef             	mov    rdi,rbp
    bb16:	e8 35 75 ff ff       	call   3050 <strcasecmp@plt>
    bb1b:	85 c0                	test   eax,eax
    bb1d:	0f 84 58 01 00 00    	je     bc7b <parseInst+0x3b06>
    bb23:	48 8d 35 a3 9f 00 00 	lea    rsi,[rip+0x9fa3]        # 15acd <_IO_stdin_used+0xacd>
    bb2a:	48 89 ef             	mov    rdi,rbp
    bb2d:	e8 1e 75 ff ff       	call   3050 <strcasecmp@plt>
    bb32:	85 c0                	test   eax,eax
    bb34:	0f 84 48 01 00 00    	je     bc82 <parseInst+0x3b0d>
    bb3a:	48 8d 35 8f 9f 00 00 	lea    rsi,[rip+0x9f8f]        # 15ad0 <_IO_stdin_used+0xad0>
    bb41:	48 89 ef             	mov    rdi,rbp
    bb44:	e8 07 75 ff ff       	call   3050 <strcasecmp@plt>
    bb49:	85 c0                	test   eax,eax
    bb4b:	0f 84 38 01 00 00    	je     bc89 <parseInst+0x3b14>
    bb51:	48 8d 35 7c 9f 00 00 	lea    rsi,[rip+0x9f7c]        # 15ad4 <_IO_stdin_used+0xad4>
    bb58:	48 89 ef             	mov    rdi,rbp
    bb5b:	e8 f0 74 ff ff       	call   3050 <strcasecmp@plt>
    bb60:	85 c0                	test   eax,eax
    bb62:	0f 84 28 01 00 00    	je     bc90 <parseInst+0x3b1b>
    bb68:	48 8d 35 69 9f 00 00 	lea    rsi,[rip+0x9f69]        # 15ad8 <_IO_stdin_used+0xad8>
    bb6f:	48 89 ef             	mov    rdi,rbp
    bb72:	e8 d9 74 ff ff       	call   3050 <strcasecmp@plt>
    bb77:	85 c0                	test   eax,eax
    bb79:	0f 84 18 01 00 00    	je     bc97 <parseInst+0x3b22>
    bb7f:	48 8d 35 55 9f 00 00 	lea    rsi,[rip+0x9f55]        # 15adb <_IO_stdin_used+0xadb>
    bb86:	48 89 ef             	mov    rdi,rbp
    bb89:	e8 c2 74 ff ff       	call   3050 <strcasecmp@plt>
    bb8e:	85 c0                	test   eax,eax
    bb90:	0f 84 08 01 00 00    	je     bc9e <parseInst+0x3b29>
    bb96:	48 8d 35 42 9f 00 00 	lea    rsi,[rip+0x9f42]        # 15adf <_IO_stdin_used+0xadf>
    bb9d:	48 89 ef             	mov    rdi,rbp
    bba0:	e8 ab 74 ff ff       	call   3050 <strcasecmp@plt>
    bba5:	85 c0                	test   eax,eax
    bba7:	0f 84 f8 00 00 00    	je     bca5 <parseInst+0x3b30>
    bbad:	48 8d 35 2f 9f 00 00 	lea    rsi,[rip+0x9f2f]        # 15ae3 <_IO_stdin_used+0xae3>
    bbb4:	48 89 ef             	mov    rdi,rbp
    bbb7:	e8 94 74 ff ff       	call   3050 <strcasecmp@plt>
    bbbc:	85 c0                	test   eax,eax
    bbbe:	0f 84 e8 00 00 00    	je     bcac <parseInst+0x3b37>
    bbc4:	48 8d 35 1b 9f 00 00 	lea    rsi,[rip+0x9f1b]        # 15ae6 <_IO_stdin_used+0xae6>
    bbcb:	48 89 ef             	mov    rdi,rbp
    bbce:	e8 7d 74 ff ff       	call   3050 <strcasecmp@plt>
    bbd3:	85 c0                	test   eax,eax
    bbd5:	0f 84 d8 00 00 00    	je     bcb3 <parseInst+0x3b3e>
    bbdb:	48 8d 35 07 9f 00 00 	lea    rsi,[rip+0x9f07]        # 15ae9 <_IO_stdin_used+0xae9>
    bbe2:	48 89 ef             	mov    rdi,rbp
    bbe5:	e8 66 74 ff ff       	call   3050 <strcasecmp@plt>
    bbea:	85 c0                	test   eax,eax
    bbec:	0f 84 c8 00 00 00    	je     bcba <parseInst+0x3b45>
    bbf2:	48 8d 35 f3 9e 00 00 	lea    rsi,[rip+0x9ef3]        # 15aec <_IO_stdin_used+0xaec>
    bbf9:	48 89 ef             	mov    rdi,rbp
    bbfc:	e8 4f 74 ff ff       	call   3050 <strcasecmp@plt>
    bc01:	85 c0                	test   eax,eax
    bc03:	0f 84 bb 00 00 00    	je     bcc4 <parseInst+0x3b4f>
    bc09:	48 8d 35 df 9e 00 00 	lea    rsi,[rip+0x9edf]        # 15aef <_IO_stdin_used+0xaef>
    bc10:	48 89 ef             	mov    rdi,rbp
    bc13:	e8 38 74 ff ff       	call   3050 <strcasecmp@plt>
    bc18:	85 c0                	test   eax,eax
    bc1a:	0f 84 ae 00 00 00    	je     bcce <parseInst+0x3b59>
    bc20:	48 8d 35 cc 9e 00 00 	lea    rsi,[rip+0x9ecc]        # 15af3 <_IO_stdin_used+0xaf3>
    bc27:	48 89 ef             	mov    rdi,rbp
    bc2a:	e8 21 74 ff ff       	call   3050 <strcasecmp@plt>
    bc2f:	85 c0                	test   eax,eax
    bc31:	0f 84 a1 00 00 00    	je     bcd8 <parseInst+0x3b63>
    bc37:	b8 00 00 00 00       	mov    eax,0x0
    bc3c:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    bc43:	c6 02 0f             	mov    BYTE PTR [rdx],0xf
    bc46:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    bc4d:	88 42 01             	mov    BYTE PTR [rdx+0x1],al
    bc50:	41 c7 46 02 00 00 00 	mov    DWORD PTR [r14+0x2],0x0
    bc57:	00 
    bc58:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    bc5c:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    bc63:	48 83 c0 06          	add    rax,0x6
    bc67:	49 89 04 24          	mov    QWORD PTR [r12],rax
    bc6b:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x6
    bc72:	06 00 00 00 
    bc76:	e9 33 c6 ff ff       	jmp    82ae <parseInst+0x139>
    bc7b:	b8 84 ff ff ff       	mov    eax,0xffffff84
    bc80:	eb ba                	jmp    bc3c <parseInst+0x3ac7>
    bc82:	b8 84 ff ff ff       	mov    eax,0xffffff84
    bc87:	eb b3                	jmp    bc3c <parseInst+0x3ac7>
    bc89:	b8 85 ff ff ff       	mov    eax,0xffffff85
    bc8e:	eb ac                	jmp    bc3c <parseInst+0x3ac7>
    bc90:	b8 85 ff ff ff       	mov    eax,0xffffff85
    bc95:	eb a5                	jmp    bc3c <parseInst+0x3ac7>
    bc97:	b8 8c ff ff ff       	mov    eax,0xffffff8c
    bc9c:	eb 9e                	jmp    bc3c <parseInst+0x3ac7>
    bc9e:	b8 8d ff ff ff       	mov    eax,0xffffff8d
    bca3:	eb 97                	jmp    bc3c <parseInst+0x3ac7>
    bca5:	b8 8e ff ff ff       	mov    eax,0xffffff8e
    bcaa:	eb 90                	jmp    bc3c <parseInst+0x3ac7>
    bcac:	b8 8f ff ff ff       	mov    eax,0xffffff8f
    bcb1:	eb 89                	jmp    bc3c <parseInst+0x3ac7>
    bcb3:	b8 82 ff ff ff       	mov    eax,0xffffff82
    bcb8:	eb 82                	jmp    bc3c <parseInst+0x3ac7>
    bcba:	b8 82 ff ff ff       	mov    eax,0xffffff82
    bcbf:	e9 78 ff ff ff       	jmp    bc3c <parseInst+0x3ac7>
    bcc4:	b8 87 ff ff ff       	mov    eax,0xffffff87
    bcc9:	e9 6e ff ff ff       	jmp    bc3c <parseInst+0x3ac7>
    bcce:	b8 83 ff ff ff       	mov    eax,0xffffff83
    bcd3:	e9 64 ff ff ff       	jmp    bc3c <parseInst+0x3ac7>
    bcd8:	b8 86 ff ff ff       	mov    eax,0xffffff86
    bcdd:	e9 5a ff ff ff       	jmp    bc3c <parseInst+0x3ac7>
    bce2:	41 bd bf ff ff ff    	mov    r13d,0xffffffbf
    bce8:	e9 f9 c5 ff ff       	jmp    82e6 <parseInst+0x171>
    bced:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    bcf1:	0f 85 f9 c5 ff ff    	jne    82f0 <parseInst+0x17b>
    bcf7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    bcfb:	e8 e4 7f 00 00       	call   13ce4 <find_reg16_index>
    bd00:	41 89 c7             	mov    r15d,eax
    bd03:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    bd07:	e8 a9 80 00 00       	call   13db5 <find_reg8_index>
    bd0c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    bd10:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    bd17:	41 8d 75 ff          	lea    esi,[r13-0x1]
    bd1b:	0f b6 c8             	movzx  ecx,al
    bd1e:	41 0f b6 d7          	movzx  edx,r15b
    bd22:	40 0f b6 f6          	movzx  esi,sil
    bd26:	41 b9 00 00 00 00    	mov    r9d,0x0
    bd2c:	41 b8 10 00 00 00    	mov    r8d,0x10
    bd32:	4c 89 f7             	mov    rdi,r14
    bd35:	e8 e3 a2 ff ff       	call   601d <encode_two_byte_opcode_reg>
    bd3a:	0f b6 c0             	movzx  eax,al
    bd3d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bd44:	49 01 04 24          	add    QWORD PTR [r12],rax
    bd48:	e9 a3 c5 ff ff       	jmp    82f0 <parseInst+0x17b>
    bd4d:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    bd51:	0f 85 a3 c5 ff ff    	jne    82fa <parseInst+0x185>
    bd57:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    bd5b:	e8 ca 7e 00 00       	call   13c2a <find_reg32_index>
    bd60:	41 89 c7             	mov    r15d,eax
    bd63:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    bd67:	e8 49 80 00 00       	call   13db5 <find_reg8_index>
    bd6c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    bd70:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    bd77:	41 8d 75 ff          	lea    esi,[r13-0x1]
    bd7b:	0f b6 c8             	movzx  ecx,al
    bd7e:	41 0f b6 d7          	movzx  edx,r15b
    bd82:	40 0f b6 f6          	movzx  esi,sil
    bd86:	41 b9 00 00 00 00    	mov    r9d,0x0
    bd8c:	41 b8 20 00 00 00    	mov    r8d,0x20
    bd92:	4c 89 f7             	mov    rdi,r14
    bd95:	e8 83 a2 ff ff       	call   601d <encode_two_byte_opcode_reg>
    bd9a:	0f b6 c0             	movzx  eax,al
    bd9d:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bda4:	49 01 04 24          	add    QWORD PTR [r12],rax
    bda8:	e9 4d c5 ff ff       	jmp    82fa <parseInst+0x185>
    bdad:	80 7b 70 0b          	cmp    BYTE PTR [rbx+0x70],0xb
    bdb1:	0f 85 4d c5 ff ff    	jne    8304 <parseInst+0x18f>
    bdb7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    bdbb:	e8 b0 7d 00 00       	call   13b70 <find_reg64_index>
    bdc0:	41 89 c7             	mov    r15d,eax
    bdc3:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    bdc7:	e8 e9 7f 00 00       	call   13db5 <find_reg8_index>
    bdcc:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    bdd0:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    bdd7:	41 8d 75 ff          	lea    esi,[r13-0x1]
    bddb:	0f b6 c8             	movzx  ecx,al
    bdde:	41 0f b6 d7          	movzx  edx,r15b
    bde2:	40 0f b6 f6          	movzx  esi,sil
    bde6:	41 b9 00 00 00 00    	mov    r9d,0x0
    bdec:	41 b8 40 00 00 00    	mov    r8d,0x40
    bdf2:	4c 89 f7             	mov    rdi,r14
    bdf5:	e8 23 a2 ff ff       	call   601d <encode_two_byte_opcode_reg>
    bdfa:	0f b6 c0             	movzx  eax,al
    bdfd:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    be04:	49 01 04 24          	add    QWORD PTR [r12],rax
    be08:	e9 f7 c4 ff ff       	jmp    8304 <parseInst+0x18f>
    be0d:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    be11:	0f 85 f7 c4 ff ff    	jne    830e <parseInst+0x199>
    be17:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    be1b:	e8 0a 7e 00 00       	call   13c2a <find_reg32_index>
    be20:	41 89 c7             	mov    r15d,eax
    be23:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    be27:	e8 b8 7e 00 00       	call   13ce4 <find_reg16_index>
    be2c:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    be30:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    be37:	0f b6 c8             	movzx  ecx,al
    be3a:	41 0f b6 d7          	movzx  edx,r15b
    be3e:	41 0f b6 f5          	movzx  esi,r13b
    be42:	41 b9 00 00 00 00    	mov    r9d,0x0
    be48:	41 b8 20 00 00 00    	mov    r8d,0x20
    be4e:	4c 89 f7             	mov    rdi,r14
    be51:	e8 c7 a1 ff ff       	call   601d <encode_two_byte_opcode_reg>
    be56:	0f b6 c0             	movzx  eax,al
    be59:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    be60:	49 01 04 24          	add    QWORD PTR [r12],rax
    be64:	e9 a5 c4 ff ff       	jmp    830e <parseInst+0x199>
    be69:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    be6d:	0f 85 a5 c4 ff ff    	jne    8318 <parseInst+0x1a3>
    be73:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    be77:	e8 f4 7c 00 00       	call   13b70 <find_reg64_index>
    be7c:	41 89 c7             	mov    r15d,eax
    be7f:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    be83:	e8 5c 7e 00 00       	call   13ce4 <find_reg16_index>
    be88:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    be8c:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    be93:	0f b6 c8             	movzx  ecx,al
    be96:	41 0f b6 d7          	movzx  edx,r15b
    be9a:	41 0f b6 f5          	movzx  esi,r13b
    be9e:	41 b9 00 00 00 00    	mov    r9d,0x0
    bea4:	41 b8 40 00 00 00    	mov    r8d,0x40
    beaa:	4c 89 f7             	mov    rdi,r14
    bead:	e8 6b a1 ff ff       	call   601d <encode_two_byte_opcode_reg>
    beb2:	0f b6 c0             	movzx  eax,al
    beb5:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bebc:	49 01 04 24          	add    QWORD PTR [r12],rax
    bec0:	e9 53 c4 ff ff       	jmp    8318 <parseInst+0x1a3>
    bec5:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    bec9:	0f 85 53 c4 ff ff    	jne    8322 <parseInst+0x1ad>
    becf:	80 bb c8 00 00 00 01 	cmp    BYTE PTR [rbx+0xc8],0x1
    bed6:	0f 85 46 c4 ff ff    	jne    8322 <parseInst+0x1ad>
    bedc:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    bee0:	e8 ff 7d 00 00       	call   13ce4 <find_reg16_index>
    bee5:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    bee9:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    bef0:	41 8d 75 ff          	lea    esi,[r13-0x1]
    bef4:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    bef8:	0f b6 d0             	movzx  edx,al
    befb:	40 0f b6 f6          	movzx  esi,sil
    beff:	41 b9 00 00 00 00    	mov    r9d,0x0
    bf05:	41 b8 10 00 00 00    	mov    r8d,0x10
    bf0b:	4c 89 f7             	mov    rdi,r14
    bf0e:	e8 c6 a5 ff ff       	call   64d9 <encode_inst_reg_rm2>
    bf13:	0f b6 c0             	movzx  eax,al
    bf16:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bf1d:	49 01 04 24          	add    QWORD PTR [r12],rax
    bf21:	e9 fc c3 ff ff       	jmp    8322 <parseInst+0x1ad>
    bf26:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    bf2a:	0f 85 fc c3 ff ff    	jne    832c <parseInst+0x1b7>
    bf30:	80 bb c8 00 00 00 01 	cmp    BYTE PTR [rbx+0xc8],0x1
    bf37:	0f 85 ef c3 ff ff    	jne    832c <parseInst+0x1b7>
    bf3d:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    bf41:	e8 e4 7c 00 00       	call   13c2a <find_reg32_index>
    bf46:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    bf4a:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    bf51:	41 8d 75 ff          	lea    esi,[r13-0x1]
    bf55:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    bf59:	0f b6 d0             	movzx  edx,al
    bf5c:	40 0f b6 f6          	movzx  esi,sil
    bf60:	41 b9 00 00 00 00    	mov    r9d,0x0
    bf66:	41 b8 20 00 00 00    	mov    r8d,0x20
    bf6c:	4c 89 f7             	mov    rdi,r14
    bf6f:	e8 65 a5 ff ff       	call   64d9 <encode_inst_reg_rm2>
    bf74:	0f b6 c0             	movzx  eax,al
    bf77:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bf7e:	49 01 04 24          	add    QWORD PTR [r12],rax
    bf82:	e9 a5 c3 ff ff       	jmp    832c <parseInst+0x1b7>
    bf87:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    bf8b:	0f 85 a5 c3 ff ff    	jne    8336 <parseInst+0x1c1>
    bf91:	80 bb c8 00 00 00 01 	cmp    BYTE PTR [rbx+0xc8],0x1
    bf98:	0f 85 98 c3 ff ff    	jne    8336 <parseInst+0x1c1>
    bf9e:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    bfa2:	e8 c9 7b 00 00       	call   13b70 <find_reg64_index>
    bfa7:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    bfab:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    bfb2:	41 8d 75 ff          	lea    esi,[r13-0x1]
    bfb6:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    bfba:	0f b6 d0             	movzx  edx,al
    bfbd:	40 0f b6 f6          	movzx  esi,sil
    bfc1:	41 b9 00 00 00 00    	mov    r9d,0x0
    bfc7:	41 b8 40 00 00 00    	mov    r8d,0x40
    bfcd:	4c 89 f7             	mov    rdi,r14
    bfd0:	e8 04 a5 ff ff       	call   64d9 <encode_inst_reg_rm2>
    bfd5:	0f b6 c0             	movzx  eax,al
    bfd8:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    bfdf:	49 01 04 24          	add    QWORD PTR [r12],rax
    bfe3:	e9 4e c3 ff ff       	jmp    8336 <parseInst+0x1c1>
    bfe8:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    bfec:	0f 85 4e c3 ff ff    	jne    8340 <parseInst+0x1cb>
    bff2:	80 bb c8 00 00 00 02 	cmp    BYTE PTR [rbx+0xc8],0x2
    bff9:	0f 85 41 c3 ff ff    	jne    8340 <parseInst+0x1cb>
    bfff:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c003:	e8 22 7c 00 00       	call   13c2a <find_reg32_index>
    c008:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c00c:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c013:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c017:	0f b6 d0             	movzx  edx,al
    c01a:	41 0f b6 f5          	movzx  esi,r13b
    c01e:	41 b9 00 00 00 00    	mov    r9d,0x0
    c024:	41 b8 20 00 00 00    	mov    r8d,0x20
    c02a:	4c 89 f7             	mov    rdi,r14
    c02d:	e8 a7 a4 ff ff       	call   64d9 <encode_inst_reg_rm2>
    c032:	0f b6 c0             	movzx  eax,al
    c035:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c03c:	49 01 04 24          	add    QWORD PTR [r12],rax
    c040:	e9 fb c2 ff ff       	jmp    8340 <parseInst+0x1cb>
    c045:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c049:	0f 85 fb c2 ff ff    	jne    834a <parseInst+0x1d5>
    c04f:	80 bb c8 00 00 00 02 	cmp    BYTE PTR [rbx+0xc8],0x2
    c056:	0f 85 ee c2 ff ff    	jne    834a <parseInst+0x1d5>
    c05c:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c060:	e8 0b 7b 00 00       	call   13b70 <find_reg64_index>
    c065:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c069:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c070:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c074:	0f b6 d0             	movzx  edx,al
    c077:	41 0f b6 f5          	movzx  esi,r13b
    c07b:	41 b9 00 00 00 00    	mov    r9d,0x0
    c081:	41 b8 40 00 00 00    	mov    r8d,0x40
    c087:	4c 89 f7             	mov    rdi,r14
    c08a:	e8 4a a4 ff ff       	call   64d9 <encode_inst_reg_rm2>
    c08f:	0f b6 c0             	movzx  eax,al
    c092:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c099:	49 01 04 24          	add    QWORD PTR [r12],rax
    c09d:	e9 a8 c2 ff ff       	jmp    834a <parseInst+0x1d5>
    c0a2:	41 bd bd ff ff ff    	mov    r13d,0xffffffbd
    c0a8:	e9 d5 c2 ff ff       	jmp    8382 <parseInst+0x20d>
    c0ad:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    c0b1:	0f 85 d5 c2 ff ff    	jne    838c <parseInst+0x217>
    c0b7:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c0bb:	e8 24 7c 00 00       	call   13ce4 <find_reg16_index>
    c0c0:	41 89 c7             	mov    r15d,eax
    c0c3:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    c0c7:	e8 18 7c 00 00       	call   13ce4 <find_reg16_index>
    c0cc:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c0d0:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c0d7:	0f b6 c8             	movzx  ecx,al
    c0da:	41 0f b6 d7          	movzx  edx,r15b
    c0de:	41 0f b6 f5          	movzx  esi,r13b
    c0e2:	41 b9 00 00 00 00    	mov    r9d,0x0
    c0e8:	41 b8 10 00 00 00    	mov    r8d,0x10
    c0ee:	4c 89 f7             	mov    rdi,r14
    c0f1:	e8 27 9f ff ff       	call   601d <encode_two_byte_opcode_reg>
    c0f6:	0f b6 c0             	movzx  eax,al
    c0f9:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c100:	49 01 04 24          	add    QWORD PTR [r12],rax
    c104:	e9 83 c2 ff ff       	jmp    838c <parseInst+0x217>
    c109:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    c10d:	0f 85 83 c2 ff ff    	jne    8396 <parseInst+0x221>
    c113:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c117:	e8 0e 7b 00 00       	call   13c2a <find_reg32_index>
    c11c:	41 89 c7             	mov    r15d,eax
    c11f:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    c123:	e8 02 7b 00 00       	call   13c2a <find_reg32_index>
    c128:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c12c:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c133:	0f b6 c8             	movzx  ecx,al
    c136:	41 0f b6 d7          	movzx  edx,r15b
    c13a:	41 0f b6 f5          	movzx  esi,r13b
    c13e:	41 b9 00 00 00 00    	mov    r9d,0x0
    c144:	41 b8 20 00 00 00    	mov    r8d,0x20
    c14a:	4c 89 f7             	mov    rdi,r14
    c14d:	e8 cb 9e ff ff       	call   601d <encode_two_byte_opcode_reg>
    c152:	0f b6 c0             	movzx  eax,al
    c155:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c15c:	49 01 04 24          	add    QWORD PTR [r12],rax
    c160:	e9 31 c2 ff ff       	jmp    8396 <parseInst+0x221>
    c165:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    c169:	0f 85 31 c2 ff ff    	jne    83a0 <parseInst+0x22b>
    c16f:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c173:	e8 f8 79 00 00       	call   13b70 <find_reg64_index>
    c178:	41 89 c7             	mov    r15d,eax
    c17b:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    c17f:	e8 ec 79 00 00       	call   13b70 <find_reg64_index>
    c184:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c188:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c18f:	0f b6 c8             	movzx  ecx,al
    c192:	41 0f b6 d7          	movzx  edx,r15b
    c196:	41 0f b6 f5          	movzx  esi,r13b
    c19a:	41 b9 00 00 00 00    	mov    r9d,0x0
    c1a0:	41 b8 40 00 00 00    	mov    r8d,0x40
    c1a6:	4c 89 f7             	mov    rdi,r14
    c1a9:	e8 6f 9e ff ff       	call   601d <encode_two_byte_opcode_reg>
    c1ae:	0f b6 c0             	movzx  eax,al
    c1b1:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c1b8:	49 01 04 24          	add    QWORD PTR [r12],rax
    c1bc:	e9 df c1 ff ff       	jmp    83a0 <parseInst+0x22b>
    c1c1:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c1c5:	0f 85 df c1 ff ff    	jne    83aa <parseInst+0x235>
    c1cb:	80 bb c8 00 00 00 02 	cmp    BYTE PTR [rbx+0xc8],0x2
    c1d2:	0f 85 d2 c1 ff ff    	jne    83aa <parseInst+0x235>
    c1d8:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c1dc:	e8 03 7b 00 00       	call   13ce4 <find_reg16_index>
    c1e1:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c1e5:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c1ec:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c1f0:	0f b6 d0             	movzx  edx,al
    c1f3:	41 0f b6 f5          	movzx  esi,r13b
    c1f7:	41 b9 00 00 00 00    	mov    r9d,0x0
    c1fd:	41 b8 10 00 00 00    	mov    r8d,0x10
    c203:	4c 89 f7             	mov    rdi,r14
    c206:	e8 ce a2 ff ff       	call   64d9 <encode_inst_reg_rm2>
    c20b:	0f b6 c0             	movzx  eax,al
    c20e:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c215:	49 01 04 24          	add    QWORD PTR [r12],rax
    c219:	e9 8c c1 ff ff       	jmp    83aa <parseInst+0x235>
    c21e:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c222:	0f 85 8c c1 ff ff    	jne    83b4 <parseInst+0x23f>
    c228:	80 bb c8 00 00 00 04 	cmp    BYTE PTR [rbx+0xc8],0x4
    c22f:	0f 85 7f c1 ff ff    	jne    83b4 <parseInst+0x23f>
    c235:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c239:	e8 ec 79 00 00       	call   13c2a <find_reg32_index>
    c23e:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c242:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c249:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c24d:	0f b6 d0             	movzx  edx,al
    c250:	41 0f b6 f5          	movzx  esi,r13b
    c254:	41 b9 00 00 00 00    	mov    r9d,0x0
    c25a:	41 b8 20 00 00 00    	mov    r8d,0x20
    c260:	4c 89 f7             	mov    rdi,r14
    c263:	e8 71 a2 ff ff       	call   64d9 <encode_inst_reg_rm2>
    c268:	0f b6 c0             	movzx  eax,al
    c26b:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c272:	49 01 04 24          	add    QWORD PTR [r12],rax
    c276:	e9 39 c1 ff ff       	jmp    83b4 <parseInst+0x23f>
    c27b:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c27f:	0f 85 39 c1 ff ff    	jne    83be <parseInst+0x249>
    c285:	80 bb c8 00 00 00 08 	cmp    BYTE PTR [rbx+0xc8],0x8
    c28c:	0f 85 2c c1 ff ff    	jne    83be <parseInst+0x249>
    c292:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c296:	e8 d5 78 00 00       	call   13b70 <find_reg64_index>
    c29b:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
    c29f:	48 89 93 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rdx
    c2a6:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c2aa:	0f b6 d0             	movzx  edx,al
    c2ad:	41 0f b6 f5          	movzx  esi,r13b
    c2b1:	41 b9 00 00 00 00    	mov    r9d,0x0
    c2b7:	41 b8 40 00 00 00    	mov    r8d,0x40
    c2bd:	4c 89 f7             	mov    rdi,r14
    c2c0:	e8 14 a2 ff ff       	call   64d9 <encode_inst_reg_rm2>
    c2c5:	0f b6 c0             	movzx  eax,al
    c2c8:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c2cf:	49 01 04 24          	add    QWORD PTR [r12],rax
    c2d3:	e9 e6 c0 ff ff       	jmp    83be <parseInst+0x249>
    c2d8:	41 bd 40 00 00 00    	mov    r13d,0x40
    c2de:	80 7b 10 0c          	cmp    BYTE PTR [rbx+0x10],0xc
    c2e2:	0f 84 4a 04 00 00    	je     c732 <parseInst+0x45bd>
    c2e8:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    c2ec:	0f 84 9c 04 00 00    	je     c78e <parseInst+0x4619>
    c2f2:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    c2f6:	0f 84 ee 04 00 00    	je     c7ea <parseInst+0x4675>
    c2fc:	80 7b 10 0c          	cmp    BYTE PTR [rbx+0x10],0xc
    c300:	0f 84 40 05 00 00    	je     c846 <parseInst+0x46d1>
    c306:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    c30a:	0f 84 86 05 00 00    	je     c896 <parseInst+0x4721>
    c310:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    c314:	0f 84 cc 05 00 00    	je     c8e6 <parseInst+0x4771>
    c31a:	ba 03 00 00 00       	mov    edx,0x3
    c31f:	48 8d 35 b6 98 00 00 	lea    rsi,[rip+0x98b6]        # 15bdc <_IO_stdin_used+0xbdc>
    c326:	48 89 ef             	mov    rdi,rbp
    c329:	e8 52 6e ff ff       	call   3180 <strncasecmp@plt>
    c32e:	85 c0                	test   eax,eax
    c330:	0f 85 1a 06 00 00    	jne    c950 <parseInst+0x47db>
    c336:	48 8d 35 a3 98 00 00 	lea    rsi,[rip+0x98a3]        # 15be0 <_IO_stdin_used+0xbe0>
    c33d:	48 89 ef             	mov    rdi,rbp
    c340:	e8 0b 6d ff ff       	call   3050 <strcasecmp@plt>
    c345:	85 c0                	test   eax,eax
    c347:	0f 84 e9 05 00 00    	je     c936 <parseInst+0x47c1>
    c34d:	48 8d 35 91 98 00 00 	lea    rsi,[rip+0x9891]        # 15be5 <_IO_stdin_used+0xbe5>
    c354:	48 89 ef             	mov    rdi,rbp
    c357:	e8 f4 6c ff ff       	call   3050 <strcasecmp@plt>
    c35c:	85 c0                	test   eax,eax
    c35e:	0f 84 a0 07 00 00    	je     cb04 <parseInst+0x498f>
    c364:	48 8d 35 80 98 00 00 	lea    rsi,[rip+0x9880]        # 15beb <_IO_stdin_used+0xbeb>
    c36b:	48 89 ef             	mov    rdi,rbp
    c36e:	e8 dd 6c ff ff       	call   3050 <strcasecmp@plt>
    c373:	85 c0                	test   eax,eax
    c375:	0f 84 94 07 00 00    	je     cb0f <parseInst+0x499a>
    c37b:	48 8d 35 6e 98 00 00 	lea    rsi,[rip+0x986e]        # 15bf0 <_IO_stdin_used+0xbf0>
    c382:	48 89 ef             	mov    rdi,rbp
    c385:	e8 c6 6c ff ff       	call   3050 <strcasecmp@plt>
    c38a:	85 c0                	test   eax,eax
    c38c:	0f 84 88 07 00 00    	je     cb1a <parseInst+0x49a5>
    c392:	48 8d 35 5c 98 00 00 	lea    rsi,[rip+0x985c]        # 15bf5 <_IO_stdin_used+0xbf5>
    c399:	48 89 ef             	mov    rdi,rbp
    c39c:	e8 af 6c ff ff       	call   3050 <strcasecmp@plt>
    c3a1:	85 c0                	test   eax,eax
    c3a3:	0f 84 7c 07 00 00    	je     cb25 <parseInst+0x49b0>
    c3a9:	48 8d 35 4c 98 00 00 	lea    rsi,[rip+0x984c]        # 15bfc <_IO_stdin_used+0xbfc>
    c3b0:	48 89 ef             	mov    rdi,rbp
    c3b3:	e8 98 6c ff ff       	call   3050 <strcasecmp@plt>
    c3b8:	85 c0                	test   eax,eax
    c3ba:	0f 84 70 07 00 00    	je     cb30 <parseInst+0x49bb>
    c3c0:	48 8d 35 3b 98 00 00 	lea    rsi,[rip+0x983b]        # 15c02 <_IO_stdin_used+0xc02>
    c3c7:	48 89 ef             	mov    rdi,rbp
    c3ca:	e8 81 6c ff ff       	call   3050 <strcasecmp@plt>
    c3cf:	85 c0                	test   eax,eax
    c3d1:	0f 84 64 07 00 00    	je     cb3b <parseInst+0x49c6>
    c3d7:	48 8d 35 2a 98 00 00 	lea    rsi,[rip+0x982a]        # 15c08 <_IO_stdin_used+0xc08>
    c3de:	48 89 ef             	mov    rdi,rbp
    c3e1:	e8 6a 6c ff ff       	call   3050 <strcasecmp@plt>
    c3e6:	85 c0                	test   eax,eax
    c3e8:	0f 84 58 07 00 00    	je     cb46 <parseInst+0x49d1>
    c3ee:	48 8d 35 19 98 00 00 	lea    rsi,[rip+0x9819]        # 15c0e <_IO_stdin_used+0xc0e>
    c3f5:	48 89 ef             	mov    rdi,rbp
    c3f8:	e8 53 6c ff ff       	call   3050 <strcasecmp@plt>
    c3fd:	85 c0                	test   eax,eax
    c3ff:	0f 84 4c 07 00 00    	je     cb51 <parseInst+0x49dc>
    c405:	48 8d 35 07 98 00 00 	lea    rsi,[rip+0x9807]        # 15c13 <_IO_stdin_used+0xc13>
    c40c:	48 89 ef             	mov    rdi,rbp
    c40f:	e8 3c 6c ff ff       	call   3050 <strcasecmp@plt>
    c414:	85 c0                	test   eax,eax
    c416:	0f 84 40 07 00 00    	je     cb5c <parseInst+0x49e7>
    c41c:	48 8d 35 f5 97 00 00 	lea    rsi,[rip+0x97f5]        # 15c18 <_IO_stdin_used+0xc18>
    c423:	48 89 ef             	mov    rdi,rbp
    c426:	e8 25 6c ff ff       	call   3050 <strcasecmp@plt>
    c42b:	85 c0                	test   eax,eax
    c42d:	0f 84 34 07 00 00    	je     cb67 <parseInst+0x49f2>
    c433:	48 8d 35 e4 97 00 00 	lea    rsi,[rip+0x97e4]        # 15c1e <_IO_stdin_used+0xc1e>
    c43a:	48 89 ef             	mov    rdi,rbp
    c43d:	e8 0e 6c ff ff       	call   3050 <strcasecmp@plt>
    c442:	85 c0                	test   eax,eax
    c444:	0f 84 28 07 00 00    	je     cb72 <parseInst+0x49fd>
    c44a:	48 8d 35 d3 97 00 00 	lea    rsi,[rip+0x97d3]        # 15c24 <_IO_stdin_used+0xc24>
    c451:	48 89 ef             	mov    rdi,rbp
    c454:	e8 f7 6b ff ff       	call   3050 <strcasecmp@plt>
    c459:	85 c0                	test   eax,eax
    c45b:	0f 84 1c 07 00 00    	je     cb7d <parseInst+0x4a08>
    c461:	48 8d 35 c2 97 00 00 	lea    rsi,[rip+0x97c2]        # 15c2a <_IO_stdin_used+0xc2a>
    c468:	48 89 ef             	mov    rdi,rbp
    c46b:	e8 e0 6b ff ff       	call   3050 <strcasecmp@plt>
    c470:	85 c0                	test   eax,eax
    c472:	0f 84 10 07 00 00    	je     cb88 <parseInst+0x4a13>
    c478:	48 8d 35 b1 97 00 00 	lea    rsi,[rip+0x97b1]        # 15c30 <_IO_stdin_used+0xc30>
    c47f:	48 89 ef             	mov    rdi,rbp
    c482:	e8 c9 6b ff ff       	call   3050 <strcasecmp@plt>
    c487:	85 c0                	test   eax,eax
    c489:	0f 84 04 07 00 00    	je     cb93 <parseInst+0x4a1e>
    c48f:	48 8d 35 9f 97 00 00 	lea    rsi,[rip+0x979f]        # 15c35 <_IO_stdin_used+0xc35>
    c496:	48 89 ef             	mov    rdi,rbp
    c499:	e8 b2 6b ff ff       	call   3050 <strcasecmp@plt>
    c49e:	85 c0                	test   eax,eax
    c4a0:	0f 84 f8 06 00 00    	je     cb9e <parseInst+0x4a29>
    c4a6:	48 8d 35 8f 97 00 00 	lea    rsi,[rip+0x978f]        # 15c3c <_IO_stdin_used+0xc3c>
    c4ad:	48 89 ef             	mov    rdi,rbp
    c4b0:	e8 9b 6b ff ff       	call   3050 <strcasecmp@plt>
    c4b5:	85 c0                	test   eax,eax
    c4b7:	0f 84 ec 06 00 00    	je     cba9 <parseInst+0x4a34>
    c4bd:	48 8d 35 7d 97 00 00 	lea    rsi,[rip+0x977d]        # 15c41 <_IO_stdin_used+0xc41>
    c4c4:	48 89 ef             	mov    rdi,rbp
    c4c7:	e8 84 6b ff ff       	call   3050 <strcasecmp@plt>
    c4cc:	85 c0                	test   eax,eax
    c4ce:	0f 84 e0 06 00 00    	je     cbb4 <parseInst+0x4a3f>
    c4d4:	48 8d 35 6c 97 00 00 	lea    rsi,[rip+0x976c]        # 15c47 <_IO_stdin_used+0xc47>
    c4db:	48 89 ef             	mov    rdi,rbp
    c4de:	e8 6d 6b ff ff       	call   3050 <strcasecmp@plt>
    c4e3:	85 c0                	test   eax,eax
    c4e5:	0f 84 d4 06 00 00    	je     cbbf <parseInst+0x4a4a>
    c4eb:	48 8d 35 5a 97 00 00 	lea    rsi,[rip+0x975a]        # 15c4c <_IO_stdin_used+0xc4c>
    c4f2:	48 89 ef             	mov    rdi,rbp
    c4f5:	e8 56 6b ff ff       	call   3050 <strcasecmp@plt>
    c4fa:	85 c0                	test   eax,eax
    c4fc:	0f 84 c8 06 00 00    	je     cbca <parseInst+0x4a55>
    c502:	48 8d 35 49 97 00 00 	lea    rsi,[rip+0x9749]        # 15c52 <_IO_stdin_used+0xc52>
    c509:	48 89 ef             	mov    rdi,rbp
    c50c:	e8 3f 6b ff ff       	call   3050 <strcasecmp@plt>
    c511:	85 c0                	test   eax,eax
    c513:	0f 84 bc 06 00 00    	je     cbd5 <parseInst+0x4a60>
    c519:	48 8d 35 38 97 00 00 	lea    rsi,[rip+0x9738]        # 15c58 <_IO_stdin_used+0xc58>
    c520:	48 89 ef             	mov    rdi,rbp
    c523:	e8 28 6b ff ff       	call   3050 <strcasecmp@plt>
    c528:	85 c0                	test   eax,eax
    c52a:	0f 84 b0 06 00 00    	je     cbe0 <parseInst+0x4a6b>
    c530:	48 8d 35 27 97 00 00 	lea    rsi,[rip+0x9727]        # 15c5e <_IO_stdin_used+0xc5e>
    c537:	48 89 ef             	mov    rdi,rbp
    c53a:	e8 11 6b ff ff       	call   3050 <strcasecmp@plt>
    c53f:	85 c0                	test   eax,eax
    c541:	0f 84 a4 06 00 00    	je     cbeb <parseInst+0x4a76>
    c547:	48 8d 35 15 97 00 00 	lea    rsi,[rip+0x9715]        # 15c63 <_IO_stdin_used+0xc63>
    c54e:	48 89 ef             	mov    rdi,rbp
    c551:	e8 fa 6a ff ff       	call   3050 <strcasecmp@plt>
    c556:	85 c0                	test   eax,eax
    c558:	0f 84 98 06 00 00    	je     cbf6 <parseInst+0x4a81>
    c55e:	48 8d 35 05 97 00 00 	lea    rsi,[rip+0x9705]        # 15c6a <_IO_stdin_used+0xc6a>
    c565:	48 89 ef             	mov    rdi,rbp
    c568:	e8 e3 6a ff ff       	call   3050 <strcasecmp@plt>
    c56d:	85 c0                	test   eax,eax
    c56f:	0f 84 8c 06 00 00    	je     cc01 <parseInst+0x4a8c>
    c575:	48 8d 35 f4 96 00 00 	lea    rsi,[rip+0x96f4]        # 15c70 <_IO_stdin_used+0xc70>
    c57c:	48 89 ef             	mov    rdi,rbp
    c57f:	e8 cc 6a ff ff       	call   3050 <strcasecmp@plt>
    c584:	85 c0                	test   eax,eax
    c586:	0f 84 80 06 00 00    	je     cc0c <parseInst+0x4a97>
    c58c:	48 8d 35 e3 96 00 00 	lea    rsi,[rip+0x96e3]        # 15c76 <_IO_stdin_used+0xc76>
    c593:	48 89 ef             	mov    rdi,rbp
    c596:	e8 b5 6a ff ff       	call   3050 <strcasecmp@plt>
    c59b:	85 c0                	test   eax,eax
    c59d:	0f 84 74 06 00 00    	je     cc17 <parseInst+0x4aa2>
    c5a3:	48 8d 35 d2 96 00 00 	lea    rsi,[rip+0x96d2]        # 15c7c <_IO_stdin_used+0xc7c>
    c5aa:	48 89 ef             	mov    rdi,rbp
    c5ad:	e8 9e 6a ff ff       	call   3050 <strcasecmp@plt>
    c5b2:	85 c0                	test   eax,eax
    c5b4:	0f 84 68 06 00 00    	je     cc22 <parseInst+0x4aad>
    c5ba:	48 8d 35 c1 96 00 00 	lea    rsi,[rip+0x96c1]        # 15c82 <_IO_stdin_used+0xc82>
    c5c1:	48 89 ef             	mov    rdi,rbp
    c5c4:	e8 87 6a ff ff       	call   3050 <strcasecmp@plt>
    c5c9:	85 c0                	test   eax,eax
    c5cb:	0f 84 5c 06 00 00    	je     cc2d <parseInst+0x4ab8>
    c5d1:	48 8d 35 af 96 00 00 	lea    rsi,[rip+0x96af]        # 15c87 <_IO_stdin_used+0xc87>
    c5d8:	48 89 ef             	mov    rdi,rbp
    c5db:	e8 70 6a ff ff       	call   3050 <strcasecmp@plt>
    c5e0:	85 c0                	test   eax,eax
    c5e2:	0f 84 50 06 00 00    	je     cc38 <parseInst+0x4ac3>
    c5e8:	41 bd 00 00 00 00    	mov    r13d,0x0
    c5ee:	e9 49 03 00 00       	jmp    c93c <parseInst+0x47c7>
    c5f3:	41 bd 41 00 00 00    	mov    r13d,0x41
    c5f9:	e9 e0 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c5fe:	41 bd 42 00 00 00    	mov    r13d,0x42
    c604:	e9 d5 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c609:	41 bd 42 00 00 00    	mov    r13d,0x42
    c60f:	e9 ca fc ff ff       	jmp    c2de <parseInst+0x4169>
    c614:	41 bd 42 00 00 00    	mov    r13d,0x42
    c61a:	e9 bf fc ff ff       	jmp    c2de <parseInst+0x4169>
    c61f:	41 bd 43 00 00 00    	mov    r13d,0x43
    c625:	e9 b4 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c62a:	41 bd 43 00 00 00    	mov    r13d,0x43
    c630:	e9 a9 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c635:	41 bd 43 00 00 00    	mov    r13d,0x43
    c63b:	e9 9e fc ff ff       	jmp    c2de <parseInst+0x4169>
    c640:	41 bd 44 00 00 00    	mov    r13d,0x44
    c646:	e9 93 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c64b:	41 bd 44 00 00 00    	mov    r13d,0x44
    c651:	e9 88 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c656:	41 bd 45 00 00 00    	mov    r13d,0x45
    c65c:	e9 7d fc ff ff       	jmp    c2de <parseInst+0x4169>
    c661:	41 bd 45 00 00 00    	mov    r13d,0x45
    c667:	e9 72 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c66c:	41 bd 46 00 00 00    	mov    r13d,0x46
    c672:	e9 67 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c677:	41 bd 46 00 00 00    	mov    r13d,0x46
    c67d:	e9 5c fc ff ff       	jmp    c2de <parseInst+0x4169>
    c682:	41 bd 47 00 00 00    	mov    r13d,0x47
    c688:	e9 51 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c68d:	41 bd 47 00 00 00    	mov    r13d,0x47
    c693:	e9 46 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c698:	41 bd 48 00 00 00    	mov    r13d,0x48
    c69e:	e9 3b fc ff ff       	jmp    c2de <parseInst+0x4169>
    c6a3:	41 bd 49 00 00 00    	mov    r13d,0x49
    c6a9:	e9 30 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c6ae:	41 bd 4a 00 00 00    	mov    r13d,0x4a
    c6b4:	e9 25 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c6b9:	41 bd 4a 00 00 00    	mov    r13d,0x4a
    c6bf:	e9 1a fc ff ff       	jmp    c2de <parseInst+0x4169>
    c6c4:	41 bd 4b 00 00 00    	mov    r13d,0x4b
    c6ca:	e9 0f fc ff ff       	jmp    c2de <parseInst+0x4169>
    c6cf:	41 bd 4b 00 00 00    	mov    r13d,0x4b
    c6d5:	e9 04 fc ff ff       	jmp    c2de <parseInst+0x4169>
    c6da:	41 bd 4c 00 00 00    	mov    r13d,0x4c
    c6e0:	e9 f9 fb ff ff       	jmp    c2de <parseInst+0x4169>
    c6e5:	41 bd 4c 00 00 00    	mov    r13d,0x4c
    c6eb:	e9 ee fb ff ff       	jmp    c2de <parseInst+0x4169>
    c6f0:	41 bd 4d 00 00 00    	mov    r13d,0x4d
    c6f6:	e9 e3 fb ff ff       	jmp    c2de <parseInst+0x4169>
    c6fb:	41 bd 4d 00 00 00    	mov    r13d,0x4d
    c701:	e9 d8 fb ff ff       	jmp    c2de <parseInst+0x4169>
    c706:	41 bd 4e 00 00 00    	mov    r13d,0x4e
    c70c:	e9 cd fb ff ff       	jmp    c2de <parseInst+0x4169>
    c711:	41 bd 4e 00 00 00    	mov    r13d,0x4e
    c717:	e9 c2 fb ff ff       	jmp    c2de <parseInst+0x4169>
    c71c:	41 bd 4f 00 00 00    	mov    r13d,0x4f
    c722:	e9 b7 fb ff ff       	jmp    c2de <parseInst+0x4169>
    c727:	41 bd 4f 00 00 00    	mov    r13d,0x4f
    c72d:	e9 ac fb ff ff       	jmp    c2de <parseInst+0x4169>
    c732:	80 7b 70 0c          	cmp    BYTE PTR [rbx+0x70],0xc
    c736:	0f 85 ac fb ff ff    	jne    c2e8 <parseInst+0x4173>
    c73c:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    c740:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    c747:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    c74b:	e8 94 75 00 00       	call   13ce4 <find_reg16_index>
    c750:	41 89 c7             	mov    r15d,eax
    c753:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c757:	e8 88 75 00 00       	call   13ce4 <find_reg16_index>
    c75c:	41 0f b6 cf          	movzx  ecx,r15b
    c760:	0f b6 d0             	movzx  edx,al
    c763:	41 0f b6 f5          	movzx  esi,r13b
    c767:	41 b9 00 00 00 00    	mov    r9d,0x0
    c76d:	41 b8 10 00 00 00    	mov    r8d,0x10
    c773:	4c 89 f7             	mov    rdi,r14
    c776:	e8 a2 98 ff ff       	call   601d <encode_two_byte_opcode_reg>
    c77b:	0f b6 c0             	movzx  eax,al
    c77e:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c785:	49 01 04 24          	add    QWORD PTR [r12],rax
    c789:	e9 5a fb ff ff       	jmp    c2e8 <parseInst+0x4173>
    c78e:	80 7b 70 0d          	cmp    BYTE PTR [rbx+0x70],0xd
    c792:	0f 85 5a fb ff ff    	jne    c2f2 <parseInst+0x417d>
    c798:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    c79c:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    c7a3:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    c7a7:	e8 7e 74 00 00       	call   13c2a <find_reg32_index>
    c7ac:	41 89 c7             	mov    r15d,eax
    c7af:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c7b3:	e8 72 74 00 00       	call   13c2a <find_reg32_index>
    c7b8:	41 0f b6 cf          	movzx  ecx,r15b
    c7bc:	0f b6 d0             	movzx  edx,al
    c7bf:	41 0f b6 f5          	movzx  esi,r13b
    c7c3:	41 b9 00 00 00 00    	mov    r9d,0x0
    c7c9:	41 b8 20 00 00 00    	mov    r8d,0x20
    c7cf:	4c 89 f7             	mov    rdi,r14
    c7d2:	e8 46 98 ff ff       	call   601d <encode_two_byte_opcode_reg>
    c7d7:	0f b6 c0             	movzx  eax,al
    c7da:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c7e1:	49 01 04 24          	add    QWORD PTR [r12],rax
    c7e5:	e9 08 fb ff ff       	jmp    c2f2 <parseInst+0x417d>
    c7ea:	80 7b 70 0e          	cmp    BYTE PTR [rbx+0x70],0xe
    c7ee:	0f 85 08 fb ff ff    	jne    c2fc <parseInst+0x4187>
    c7f4:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    c7f8:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    c7ff:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    c803:	e8 68 73 00 00       	call   13b70 <find_reg64_index>
    c808:	41 89 c7             	mov    r15d,eax
    c80b:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c80f:	e8 5c 73 00 00       	call   13b70 <find_reg64_index>
    c814:	41 0f b6 cf          	movzx  ecx,r15b
    c818:	0f b6 d0             	movzx  edx,al
    c81b:	41 0f b6 f5          	movzx  esi,r13b
    c81f:	41 b9 00 00 00 00    	mov    r9d,0x0
    c825:	41 b8 40 00 00 00    	mov    r8d,0x40
    c82b:	4c 89 f7             	mov    rdi,r14
    c82e:	e8 ea 97 ff ff       	call   601d <encode_two_byte_opcode_reg>
    c833:	0f b6 c0             	movzx  eax,al
    c836:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c83d:	49 01 04 24          	add    QWORD PTR [r12],rax
    c841:	e9 b6 fa ff ff       	jmp    c2fc <parseInst+0x4187>
    c846:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c84a:	0f 85 b6 fa ff ff    	jne    c306 <parseInst+0x4191>
    c850:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    c854:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    c85b:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c85f:	e8 80 74 00 00       	call   13ce4 <find_reg16_index>
    c864:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c868:	0f b6 d0             	movzx  edx,al
    c86b:	41 0f b6 f5          	movzx  esi,r13b
    c86f:	41 b9 00 00 00 00    	mov    r9d,0x0
    c875:	41 b8 10 00 00 00    	mov    r8d,0x10
    c87b:	4c 89 f7             	mov    rdi,r14
    c87e:	e8 56 9c ff ff       	call   64d9 <encode_inst_reg_rm2>
    c883:	0f b6 c0             	movzx  eax,al
    c886:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c88d:	49 01 04 24          	add    QWORD PTR [r12],rax
    c891:	e9 70 fa ff ff       	jmp    c306 <parseInst+0x4191>
    c896:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c89a:	0f 85 70 fa ff ff    	jne    c310 <parseInst+0x419b>
    c8a0:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    c8a4:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    c8ab:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c8af:	e8 76 73 00 00       	call   13c2a <find_reg32_index>
    c8b4:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c8b8:	0f b6 d0             	movzx  edx,al
    c8bb:	41 0f b6 f5          	movzx  esi,r13b
    c8bf:	41 b9 00 00 00 00    	mov    r9d,0x0
    c8c5:	41 b8 20 00 00 00    	mov    r8d,0x20
    c8cb:	4c 89 f7             	mov    rdi,r14
    c8ce:	e8 06 9c ff ff       	call   64d9 <encode_inst_reg_rm2>
    c8d3:	0f b6 c0             	movzx  eax,al
    c8d6:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c8dd:	49 01 04 24          	add    QWORD PTR [r12],rax
    c8e1:	e9 2a fa ff ff       	jmp    c310 <parseInst+0x419b>
    c8e6:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    c8ea:	0f 85 2a fa ff ff    	jne    c31a <parseInst+0x41a5>
    c8f0:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    c8f4:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    c8fb:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    c8ff:	e8 6c 72 00 00       	call   13b70 <find_reg64_index>
    c904:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    c908:	0f b6 d0             	movzx  edx,al
    c90b:	41 0f b6 f5          	movzx  esi,r13b
    c90f:	41 b9 00 00 00 00    	mov    r9d,0x0
    c915:	41 b8 40 00 00 00    	mov    r8d,0x40
    c91b:	4c 89 f7             	mov    rdi,r14
    c91e:	e8 b6 9b ff ff       	call   64d9 <encode_inst_reg_rm2>
    c923:	0f b6 c0             	movzx  eax,al
    c926:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    c92d:	49 01 04 24          	add    QWORD PTR [r12],rax
    c931:	e9 e4 f9 ff ff       	jmp    c31a <parseInst+0x41a5>
    c936:	41 bd 90 ff ff ff    	mov    r13d,0xffffff90
    c93c:	80 7b 10 0b          	cmp    BYTE PTR [rbx+0x10],0xb
    c940:	0f 84 fd 02 00 00    	je     cc43 <parseInst+0x4ace>
    c946:	80 7b 10 14          	cmp    BYTE PTR [rbx+0x10],0x14
    c94a:	0f 84 3a 03 00 00    	je     cc8a <parseInst+0x4b15>
    c950:	48 8d 35 37 93 00 00 	lea    rsi,[rip+0x9337]        # 15c8e <_IO_stdin_used+0xc8e>
    c957:	48 89 ef             	mov    rdi,rbp
    c95a:	e8 f1 66 ff ff       	call   3050 <strcasecmp@plt>
    c95f:	41 89 c5             	mov    r13d,eax
    c962:	85 c0                	test   eax,eax
    c964:	0f 84 b7 00 00 00    	je     ca21 <parseInst+0x48ac>
    c96a:	48 8d 35 24 93 00 00 	lea    rsi,[rip+0x9324]        # 15c95 <_IO_stdin_used+0xc95>
    c971:	48 89 ef             	mov    rdi,rbp
    c974:	e8 d7 66 ff ff       	call   3050 <strcasecmp@plt>
    c979:	85 c0                	test   eax,eax
    c97b:	0f 84 a0 00 00 00    	je     ca21 <parseInst+0x48ac>
    c981:	48 8d 35 14 93 00 00 	lea    rsi,[rip+0x9314]        # 15c9c <_IO_stdin_used+0xc9c>
    c988:	48 89 ef             	mov    rdi,rbp
    c98b:	e8 c0 66 ff ff       	call   3050 <strcasecmp@plt>
    c990:	85 c0                	test   eax,eax
    c992:	0f 84 89 00 00 00    	je     ca21 <parseInst+0x48ac>
    c998:	48 8d 35 03 93 00 00 	lea    rsi,[rip+0x9303]        # 15ca2 <_IO_stdin_used+0xca2>
    c99f:	48 89 ef             	mov    rdi,rbp
    c9a2:	e8 a9 66 ff ff       	call   3050 <strcasecmp@plt>
    c9a7:	85 c0                	test   eax,eax
    c9a9:	74 76                	je     ca21 <parseInst+0x48ac>
    c9ab:	48 8d 35 f6 92 00 00 	lea    rsi,[rip+0x92f6]        # 15ca8 <_IO_stdin_used+0xca8>
    c9b2:	48 89 ef             	mov    rdi,rbp
    c9b5:	e8 96 66 ff ff       	call   3050 <strcasecmp@plt>
    c9ba:	85 c0                	test   eax,eax
    c9bc:	74 63                	je     ca21 <parseInst+0x48ac>
    c9be:	48 8d 35 d8 92 00 00 	lea    rsi,[rip+0x92d8]        # 15c9d <_IO_stdin_used+0xc9d>
    c9c5:	48 89 ef             	mov    rdi,rbp
    c9c8:	e8 83 66 ff ff       	call   3050 <strcasecmp@plt>
    c9cd:	85 c0                	test   eax,eax
    c9cf:	74 50                	je     ca21 <parseInst+0x48ac>
    c9d1:	48 8d 35 d7 92 00 00 	lea    rsi,[rip+0x92d7]        # 15caf <_IO_stdin_used+0xcaf>
    c9d8:	48 89 ef             	mov    rdi,rbp
    c9db:	e8 70 66 ff ff       	call   3050 <strcasecmp@plt>
    c9e0:	85 c0                	test   eax,eax
    c9e2:	74 3d                	je     ca21 <parseInst+0x48ac>
    c9e4:	48 8d 35 ca 92 00 00 	lea    rsi,[rip+0x92ca]        # 15cb5 <_IO_stdin_used+0xcb5>
    c9eb:	48 89 ef             	mov    rdi,rbp
    c9ee:	e8 5d 66 ff ff       	call   3050 <strcasecmp@plt>
    c9f3:	85 c0                	test   eax,eax
    c9f5:	74 2a                	je     ca21 <parseInst+0x48ac>
    c9f7:	48 8d 35 bd 92 00 00 	lea    rsi,[rip+0x92bd]        # 15cbb <_IO_stdin_used+0xcbb>
    c9fe:	48 89 ef             	mov    rdi,rbp
    ca01:	e8 4a 66 ff ff       	call   3050 <strcasecmp@plt>
    ca06:	85 c0                	test   eax,eax
    ca08:	74 17                	je     ca21 <parseInst+0x48ac>
    ca0a:	48 8d 35 b0 92 00 00 	lea    rsi,[rip+0x92b0]        # 15cc1 <_IO_stdin_used+0xcc1>
    ca11:	48 89 ef             	mov    rdi,rbp
    ca14:	e8 37 66 ff ff       	call   3050 <strcasecmp@plt>
    ca19:	85 c0                	test   eax,eax
    ca1b:	0f 85 f2 02 00 00    	jne    cd13 <parseInst+0x4b9e>
    ca21:	45 85 ed             	test   r13d,r13d
    ca24:	0f 84 9f 02 00 00    	je     ccc9 <parseInst+0x4b54>
    ca2a:	48 8d 35 64 92 00 00 	lea    rsi,[rip+0x9264]        # 15c95 <_IO_stdin_used+0xc95>
    ca31:	48 89 ef             	mov    rdi,rbp
    ca34:	e8 17 66 ff ff       	call   3050 <strcasecmp@plt>
    ca39:	85 c0                	test   eax,eax
    ca3b:	0f 84 4c 0a 00 00    	je     d48d <parseInst+0x5318>
    ca41:	48 8d 35 54 92 00 00 	lea    rsi,[rip+0x9254]        # 15c9c <_IO_stdin_used+0xc9c>
    ca48:	48 89 ef             	mov    rdi,rbp
    ca4b:	e8 00 66 ff ff       	call   3050 <strcasecmp@plt>
    ca50:	85 c0                	test   eax,eax
    ca52:	0f 84 40 0a 00 00    	je     d498 <parseInst+0x5323>
    ca58:	48 8d 35 43 92 00 00 	lea    rsi,[rip+0x9243]        # 15ca2 <_IO_stdin_used+0xca2>
    ca5f:	48 89 ef             	mov    rdi,rbp
    ca62:	e8 e9 65 ff ff       	call   3050 <strcasecmp@plt>
    ca67:	85 c0                	test   eax,eax
    ca69:	0f 84 34 0a 00 00    	je     d4a3 <parseInst+0x532e>
    ca6f:	48 8d 35 32 92 00 00 	lea    rsi,[rip+0x9232]        # 15ca8 <_IO_stdin_used+0xca8>
    ca76:	48 89 ef             	mov    rdi,rbp
    ca79:	e8 d2 65 ff ff       	call   3050 <strcasecmp@plt>
    ca7e:	85 c0                	test   eax,eax
    ca80:	0f 84 28 0a 00 00    	je     d4ae <parseInst+0x5339>
    ca86:	48 8d 35 10 92 00 00 	lea    rsi,[rip+0x9210]        # 15c9d <_IO_stdin_used+0xc9d>
    ca8d:	48 89 ef             	mov    rdi,rbp
    ca90:	e8 bb 65 ff ff       	call   3050 <strcasecmp@plt>
    ca95:	85 c0                	test   eax,eax
    ca97:	0f 84 1c 0a 00 00    	je     d4b9 <parseInst+0x5344>
    ca9d:	48 8d 35 0b 92 00 00 	lea    rsi,[rip+0x920b]        # 15caf <_IO_stdin_used+0xcaf>
    caa4:	48 89 ef             	mov    rdi,rbp
    caa7:	e8 a4 65 ff ff       	call   3050 <strcasecmp@plt>
    caac:	85 c0                	test   eax,eax
    caae:	0f 84 10 0a 00 00    	je     d4c4 <parseInst+0x534f>
    cab4:	48 8d 35 00 92 00 00 	lea    rsi,[rip+0x9200]        # 15cbb <_IO_stdin_used+0xcbb>
    cabb:	48 89 ef             	mov    rdi,rbp
    cabe:	e8 8d 65 ff ff       	call   3050 <strcasecmp@plt>
    cac3:	85 c0                	test   eax,eax
    cac5:	0f 84 04 0a 00 00    	je     d4cf <parseInst+0x535a>
    cacb:	48 8d 35 e3 91 00 00 	lea    rsi,[rip+0x91e3]        # 15cb5 <_IO_stdin_used+0xcb5>
    cad2:	48 89 ef             	mov    rdi,rbp
    cad5:	e8 76 65 ff ff       	call   3050 <strcasecmp@plt>
    cada:	85 c0                	test   eax,eax
    cadc:	0f 84 f8 09 00 00    	je     d4da <parseInst+0x5365>
    cae2:	48 8d 35 d8 91 00 00 	lea    rsi,[rip+0x91d8]        # 15cc1 <_IO_stdin_used+0xcc1>
    cae9:	48 89 ef             	mov    rdi,rbp
    caec:	e8 5f 65 ff ff       	call   3050 <strcasecmp@plt>
    caf1:	85 c0                	test   eax,eax
    caf3:	0f 84 ec 09 00 00    	je     d4e5 <parseInst+0x5370>
    caf9:	41 bd 00 00 00 00    	mov    r13d,0x0
    caff:	e9 cb 01 00 00       	jmp    cccf <parseInst+0x4b5a>
    cb04:	41 bd 91 ff ff ff    	mov    r13d,0xffffff91
    cb0a:	e9 2d fe ff ff       	jmp    c93c <parseInst+0x47c7>
    cb0f:	41 bd 92 ff ff ff    	mov    r13d,0xffffff92
    cb15:	e9 22 fe ff ff       	jmp    c93c <parseInst+0x47c7>
    cb1a:	41 bd 92 ff ff ff    	mov    r13d,0xffffff92
    cb20:	e9 17 fe ff ff       	jmp    c93c <parseInst+0x47c7>
    cb25:	41 bd 92 ff ff ff    	mov    r13d,0xffffff92
    cb2b:	e9 0c fe ff ff       	jmp    c93c <parseInst+0x47c7>
    cb30:	41 bd 93 ff ff ff    	mov    r13d,0xffffff93
    cb36:	e9 01 fe ff ff       	jmp    c93c <parseInst+0x47c7>
    cb3b:	41 bd 93 ff ff ff    	mov    r13d,0xffffff93
    cb41:	e9 f6 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb46:	41 bd 93 ff ff ff    	mov    r13d,0xffffff93
    cb4c:	e9 eb fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb51:	41 bd 94 ff ff ff    	mov    r13d,0xffffff94
    cb57:	e9 e0 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb5c:	41 bd 94 ff ff ff    	mov    r13d,0xffffff94
    cb62:	e9 d5 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb67:	41 bd 95 ff ff ff    	mov    r13d,0xffffff95
    cb6d:	e9 ca fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb72:	41 bd 95 ff ff ff    	mov    r13d,0xffffff95
    cb78:	e9 bf fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb7d:	41 bd 96 ff ff ff    	mov    r13d,0xffffff96
    cb83:	e9 b4 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb88:	41 bd 96 ff ff ff    	mov    r13d,0xffffff96
    cb8e:	e9 a9 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb93:	41 bd 97 ff ff ff    	mov    r13d,0xffffff97
    cb99:	e9 9e fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cb9e:	41 bd 97 ff ff ff    	mov    r13d,0xffffff97
    cba4:	e9 93 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cba9:	41 bd 98 ff ff ff    	mov    r13d,0xffffff98
    cbaf:	e9 88 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbb4:	41 bd 99 ff ff ff    	mov    r13d,0xffffff99
    cbba:	e9 7d fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbbf:	41 bd 9a ff ff ff    	mov    r13d,0xffffff9a
    cbc5:	e9 72 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbca:	41 bd 9a ff ff ff    	mov    r13d,0xffffff9a
    cbd0:	e9 67 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbd5:	41 bd 9b ff ff ff    	mov    r13d,0xffffff9b
    cbdb:	e9 5c fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbe0:	41 bd 9b ff ff ff    	mov    r13d,0xffffff9b
    cbe6:	e9 51 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbeb:	41 bd 9c ff ff ff    	mov    r13d,0xffffff9c
    cbf1:	e9 46 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cbf6:	41 bd 9c ff ff ff    	mov    r13d,0xffffff9c
    cbfc:	e9 3b fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cc01:	41 bd 9d ff ff ff    	mov    r13d,0xffffff9d
    cc07:	e9 30 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cc0c:	41 bd 9d ff ff ff    	mov    r13d,0xffffff9d
    cc12:	e9 25 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cc17:	41 bd 9e ff ff ff    	mov    r13d,0xffffff9e
    cc1d:	e9 1a fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cc22:	41 bd 9e ff ff ff    	mov    r13d,0xffffff9e
    cc28:	e9 0f fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cc2d:	41 bd 9f ff ff ff    	mov    r13d,0xffffff9f
    cc33:	e9 04 fd ff ff       	jmp    c93c <parseInst+0x47c7>
    cc38:	41 bd 9f ff ff ff    	mov    r13d,0xffffff9f
    cc3e:	e9 f9 fc ff ff       	jmp    c93c <parseInst+0x47c7>
    cc43:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    cc47:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    cc4e:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    cc52:	e8 5e 71 00 00       	call   13db5 <find_reg8_index>
    cc57:	0f b6 c8             	movzx  ecx,al
    cc5a:	41 0f b6 f5          	movzx  esi,r13b
    cc5e:	41 b9 00 00 00 00    	mov    r9d,0x0
    cc64:	41 b8 08 00 00 00    	mov    r8d,0x8
    cc6a:	ba 00 00 00 00       	mov    edx,0x0
    cc6f:	4c 89 f7             	mov    rdi,r14
    cc72:	e8 a6 93 ff ff       	call   601d <encode_two_byte_opcode_reg>
    cc77:	0f b6 c0             	movzx  eax,al
    cc7a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    cc81:	49 01 04 24          	add    QWORD PTR [r12],rax
    cc85:	e9 bc fc ff ff       	jmp    c946 <parseInst+0x47d1>
    cc8a:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    cc8e:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    cc95:	48 8d 4b 18          	lea    rcx,[rbx+0x18]
    cc99:	41 0f b6 f5          	movzx  esi,r13b
    cc9d:	41 b9 00 00 00 00    	mov    r9d,0x0
    cca3:	41 b8 08 00 00 00    	mov    r8d,0x8
    cca9:	ba 00 00 00 00       	mov    edx,0x0
    ccae:	4c 89 f7             	mov    rdi,r14
    ccb1:	e8 23 98 ff ff       	call   64d9 <encode_inst_reg_rm2>
    ccb6:	0f b6 c0             	movzx  eax,al
    ccb9:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    ccc0:	49 01 04 24          	add    QWORD PTR [r12],rax
    ccc4:	e9 87 fc ff ff       	jmp    c950 <parseInst+0x47db>
    ccc9:	41 bd 28 00 00 00    	mov    r13d,0x28
    cccf:	80 7b 10 0f          	cmp    BYTE PTR [rbx+0x10],0xf
    ccd3:	0f 84 17 08 00 00    	je     d4f0 <parseInst+0x537b>
    ccd9:	80 7b 10 0f          	cmp    BYTE PTR [rbx+0x10],0xf
    ccdd:	0f 84 69 08 00 00    	je     d54c <parseInst+0x53d7>
    cce3:	48 8d 35 a4 8f 00 00 	lea    rsi,[rip+0x8fa4]        # 15c8e <_IO_stdin_used+0xc8e>
    ccea:	48 89 ef             	mov    rdi,rbp
    cced:	e8 5e 63 ff ff       	call   3050 <strcasecmp@plt>
    ccf2:	85 c0                	test   eax,eax
    ccf4:	74 13                	je     cd09 <parseInst+0x4b94>
    ccf6:	48 8d 35 98 8f 00 00 	lea    rsi,[rip+0x8f98]        # 15c95 <_IO_stdin_used+0xc95>
    ccfd:	48 89 ef             	mov    rdi,rbp
    cd00:	e8 4b 63 ff ff       	call   3050 <strcasecmp@plt>
    cd05:	85 c0                	test   eax,eax
    cd07:	75 0a                	jne    cd13 <parseInst+0x4b9e>
    cd09:	80 7b 10 14          	cmp    BYTE PTR [rbx+0x10],0x14
    cd0d:	0f 84 89 08 00 00    	je     d59c <parseInst+0x5427>
    cd13:	48 8d 35 ad 8f 00 00 	lea    rsi,[rip+0x8fad]        # 15cc7 <_IO_stdin_used+0xcc7>
    cd1a:	48 89 ef             	mov    rdi,rbp
    cd1d:	e8 2e 63 ff ff       	call   3050 <strcasecmp@plt>
    cd22:	41 89 c5             	mov    r13d,eax
    cd25:	85 c0                	test   eax,eax
    cd27:	0f 84 97 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cd2d:	48 8d 35 9a 8f 00 00 	lea    rsi,[rip+0x8f9a]        # 15cce <_IO_stdin_used+0xcce>
    cd34:	48 89 ef             	mov    rdi,rbp
    cd37:	e8 14 63 ff ff       	call   3050 <strcasecmp@plt>
    cd3c:	85 c0                	test   eax,eax
    cd3e:	0f 84 80 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cd44:	48 8d 35 8a 8f 00 00 	lea    rsi,[rip+0x8f8a]        # 15cd5 <_IO_stdin_used+0xcd5>
    cd4b:	48 89 ef             	mov    rdi,rbp
    cd4e:	e8 fd 62 ff ff       	call   3050 <strcasecmp@plt>
    cd53:	85 c0                	test   eax,eax
    cd55:	0f 84 69 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cd5b:	48 8d 35 79 8f 00 00 	lea    rsi,[rip+0x8f79]        # 15cdb <_IO_stdin_used+0xcdb>
    cd62:	48 89 ef             	mov    rdi,rbp
    cd65:	e8 e6 62 ff ff       	call   3050 <strcasecmp@plt>
    cd6a:	85 c0                	test   eax,eax
    cd6c:	0f 84 52 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cd72:	48 8d 35 68 8f 00 00 	lea    rsi,[rip+0x8f68]        # 15ce1 <_IO_stdin_used+0xce1>
    cd79:	48 89 ef             	mov    rdi,rbp
    cd7c:	e8 cf 62 ff ff       	call   3050 <strcasecmp@plt>
    cd81:	85 c0                	test   eax,eax
    cd83:	0f 84 3b 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cd89:	48 8d 35 57 8f 00 00 	lea    rsi,[rip+0x8f57]        # 15ce7 <_IO_stdin_used+0xce7>
    cd90:	48 89 ef             	mov    rdi,rbp
    cd93:	e8 b8 62 ff ff       	call   3050 <strcasecmp@plt>
    cd98:	85 c0                	test   eax,eax
    cd9a:	0f 84 24 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cda0:	48 8d 35 46 8f 00 00 	lea    rsi,[rip+0x8f46]        # 15ced <_IO_stdin_used+0xced>
    cda7:	48 89 ef             	mov    rdi,rbp
    cdaa:	e8 a1 62 ff ff       	call   3050 <strcasecmp@plt>
    cdaf:	85 c0                	test   eax,eax
    cdb1:	0f 84 0d 03 00 00    	je     d0c4 <parseInst+0x4f4f>
    cdb7:	48 8d 35 35 8f 00 00 	lea    rsi,[rip+0x8f35]        # 15cf3 <_IO_stdin_used+0xcf3>
    cdbe:	48 89 ef             	mov    rdi,rbp
    cdc1:	e8 8a 62 ff ff       	call   3050 <strcasecmp@plt>
    cdc6:	85 c0                	test   eax,eax
    cdc8:	0f 84 f6 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    cdce:	48 8d 35 24 8f 00 00 	lea    rsi,[rip+0x8f24]        # 15cf9 <_IO_stdin_used+0xcf9>
    cdd5:	48 89 ef             	mov    rdi,rbp
    cdd8:	e8 73 62 ff ff       	call   3050 <strcasecmp@plt>
    cddd:	85 c0                	test   eax,eax
    cddf:	0f 84 df 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    cde5:	48 8d 35 12 8f 00 00 	lea    rsi,[rip+0x8f12]        # 15cfe <_IO_stdin_used+0xcfe>
    cdec:	48 89 ef             	mov    rdi,rbp
    cdef:	e8 5c 62 ff ff       	call   3050 <strcasecmp@plt>
    cdf4:	85 c0                	test   eax,eax
    cdf6:	0f 84 c8 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    cdfc:	48 8d 35 01 8f 00 00 	lea    rsi,[rip+0x8f01]        # 15d04 <_IO_stdin_used+0xd04>
    ce03:	48 89 ef             	mov    rdi,rbp
    ce06:	e8 45 62 ff ff       	call   3050 <strcasecmp@plt>
    ce0b:	85 c0                	test   eax,eax
    ce0d:	0f 84 b1 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce13:	48 8d 35 ee 8e 00 00 	lea    rsi,[rip+0x8eee]        # 15d08 <_IO_stdin_used+0xd08>
    ce1a:	48 89 ef             	mov    rdi,rbp
    ce1d:	e8 2e 62 ff ff       	call   3050 <strcasecmp@plt>
    ce22:	85 c0                	test   eax,eax
    ce24:	0f 84 9a 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce2a:	48 8d 35 dc 8e 00 00 	lea    rsi,[rip+0x8edc]        # 15d0d <_IO_stdin_used+0xd0d>
    ce31:	48 89 ef             	mov    rdi,rbp
    ce34:	e8 17 62 ff ff       	call   3050 <strcasecmp@plt>
    ce39:	85 c0                	test   eax,eax
    ce3b:	0f 84 83 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce41:	48 8d 35 cd 8e 00 00 	lea    rsi,[rip+0x8ecd]        # 15d15 <_IO_stdin_used+0xd15>
    ce48:	48 89 ef             	mov    rdi,rbp
    ce4b:	e8 00 62 ff ff       	call   3050 <strcasecmp@plt>
    ce50:	85 c0                	test   eax,eax
    ce52:	0f 84 6c 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce58:	48 8d 35 be 8e 00 00 	lea    rsi,[rip+0x8ebe]        # 15d1d <_IO_stdin_used+0xd1d>
    ce5f:	48 89 ef             	mov    rdi,rbp
    ce62:	e8 e9 61 ff ff       	call   3050 <strcasecmp@plt>
    ce67:	85 c0                	test   eax,eax
    ce69:	0f 84 55 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce6f:	48 8d 35 af 8e 00 00 	lea    rsi,[rip+0x8eaf]        # 15d25 <_IO_stdin_used+0xd25>
    ce76:	48 89 ef             	mov    rdi,rbp
    ce79:	e8 d2 61 ff ff       	call   3050 <strcasecmp@plt>
    ce7e:	85 c0                	test   eax,eax
    ce80:	0f 84 3e 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce86:	48 8d 35 a0 8e 00 00 	lea    rsi,[rip+0x8ea0]        # 15d2d <_IO_stdin_used+0xd2d>
    ce8d:	48 89 ef             	mov    rdi,rbp
    ce90:	e8 bb 61 ff ff       	call   3050 <strcasecmp@plt>
    ce95:	85 c0                	test   eax,eax
    ce97:	0f 84 27 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ce9d:	48 8d 35 91 8e 00 00 	lea    rsi,[rip+0x8e91]        # 15d35 <_IO_stdin_used+0xd35>
    cea4:	48 89 ef             	mov    rdi,rbp
    cea7:	e8 a4 61 ff ff       	call   3050 <strcasecmp@plt>
    ceac:	85 c0                	test   eax,eax
    ceae:	0f 84 10 02 00 00    	je     d0c4 <parseInst+0x4f4f>
    ceb4:	48 8d 35 82 8e 00 00 	lea    rsi,[rip+0x8e82]        # 15d3d <_IO_stdin_used+0xd3d>
    cebb:	48 89 ef             	mov    rdi,rbp
    cebe:	e8 8d 61 ff ff       	call   3050 <strcasecmp@plt>
    cec3:	85 c0                	test   eax,eax
    cec5:	0f 84 f9 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cecb:	48 8d 35 75 8e 00 00 	lea    rsi,[rip+0x8e75]        # 15d47 <_IO_stdin_used+0xd47>
    ced2:	48 89 ef             	mov    rdi,rbp
    ced5:	e8 76 61 ff ff       	call   3050 <strcasecmp@plt>
    ceda:	85 c0                	test   eax,eax
    cedc:	0f 84 e2 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cee2:	48 8d 35 68 8e 00 00 	lea    rsi,[rip+0x8e68]        # 15d51 <_IO_stdin_used+0xd51>
    cee9:	48 89 ef             	mov    rdi,rbp
    ceec:	e8 5f 61 ff ff       	call   3050 <strcasecmp@plt>
    cef1:	85 c0                	test   eax,eax
    cef3:	0f 84 cb 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cef9:	48 8d 35 5b 8e 00 00 	lea    rsi,[rip+0x8e5b]        # 15d5b <_IO_stdin_used+0xd5b>
    cf00:	48 89 ef             	mov    rdi,rbp
    cf03:	e8 48 61 ff ff       	call   3050 <strcasecmp@plt>
    cf08:	85 c0                	test   eax,eax
    cf0a:	0f 84 b4 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf10:	48 8d 35 4f 8e 00 00 	lea    rsi,[rip+0x8e4f]        # 15d66 <_IO_stdin_used+0xd66>
    cf17:	48 89 ef             	mov    rdi,rbp
    cf1a:	e8 31 61 ff ff       	call   3050 <strcasecmp@plt>
    cf1f:	85 c0                	test   eax,eax
    cf21:	0f 84 9d 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf27:	48 8d 35 42 8e 00 00 	lea    rsi,[rip+0x8e42]        # 15d70 <_IO_stdin_used+0xd70>
    cf2e:	48 89 ef             	mov    rdi,rbp
    cf31:	e8 1a 61 ff ff       	call   3050 <strcasecmp@plt>
    cf36:	85 c0                	test   eax,eax
    cf38:	0f 84 86 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf3e:	48 8d 35 35 8e 00 00 	lea    rsi,[rip+0x8e35]        # 15d7a <_IO_stdin_used+0xd7a>
    cf45:	48 89 ef             	mov    rdi,rbp
    cf48:	e8 03 61 ff ff       	call   3050 <strcasecmp@plt>
    cf4d:	85 c0                	test   eax,eax
    cf4f:	0f 84 6f 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf55:	48 8d 35 28 8e 00 00 	lea    rsi,[rip+0x8e28]        # 15d84 <_IO_stdin_used+0xd84>
    cf5c:	48 89 ef             	mov    rdi,rbp
    cf5f:	e8 ec 60 ff ff       	call   3050 <strcasecmp@plt>
    cf64:	85 c0                	test   eax,eax
    cf66:	0f 84 58 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf6c:	48 8d 35 1c 8e 00 00 	lea    rsi,[rip+0x8e1c]        # 15d8f <_IO_stdin_used+0xd8f>
    cf73:	48 89 ef             	mov    rdi,rbp
    cf76:	e8 d5 60 ff ff       	call   3050 <strcasecmp@plt>
    cf7b:	85 c0                	test   eax,eax
    cf7d:	0f 84 41 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf83:	48 8d 35 0e 8e 00 00 	lea    rsi,[rip+0x8e0e]        # 15d98 <_IO_stdin_used+0xd98>
    cf8a:	48 89 ef             	mov    rdi,rbp
    cf8d:	e8 be 60 ff ff       	call   3050 <strcasecmp@plt>
    cf92:	85 c0                	test   eax,eax
    cf94:	0f 84 2a 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cf9a:	48 8d 35 00 8e 00 00 	lea    rsi,[rip+0x8e00]        # 15da1 <_IO_stdin_used+0xda1>
    cfa1:	48 89 ef             	mov    rdi,rbp
    cfa4:	e8 a7 60 ff ff       	call   3050 <strcasecmp@plt>
    cfa9:	85 c0                	test   eax,eax
    cfab:	0f 84 13 01 00 00    	je     d0c4 <parseInst+0x4f4f>
    cfb1:	48 8d 35 f2 8d 00 00 	lea    rsi,[rip+0x8df2]        # 15daa <_IO_stdin_used+0xdaa>
    cfb8:	48 89 ef             	mov    rdi,rbp
    cfbb:	e8 90 60 ff ff       	call   3050 <strcasecmp@plt>
    cfc0:	85 c0                	test   eax,eax
    cfc2:	0f 84 fc 00 00 00    	je     d0c4 <parseInst+0x4f4f>
    cfc8:	48 8d 35 e4 8d 00 00 	lea    rsi,[rip+0x8de4]        # 15db3 <_IO_stdin_used+0xdb3>
    cfcf:	48 89 ef             	mov    rdi,rbp
    cfd2:	e8 79 60 ff ff       	call   3050 <strcasecmp@plt>
    cfd7:	85 c0                	test   eax,eax
    cfd9:	0f 84 e5 00 00 00    	je     d0c4 <parseInst+0x4f4f>
    cfdf:	48 8d 35 d4 8d 00 00 	lea    rsi,[rip+0x8dd4]        # 15dba <_IO_stdin_used+0xdba>
    cfe6:	48 89 ef             	mov    rdi,rbp
    cfe9:	e8 62 60 ff ff       	call   3050 <strcasecmp@plt>
    cfee:	85 c0                	test   eax,eax
    cff0:	0f 84 ce 00 00 00    	je     d0c4 <parseInst+0x4f4f>
    cff6:	48 8d 35 c4 8d 00 00 	lea    rsi,[rip+0x8dc4]        # 15dc1 <_IO_stdin_used+0xdc1>
    cffd:	48 89 ef             	mov    rdi,rbp
    d000:	e8 4b 60 ff ff       	call   3050 <strcasecmp@plt>
    d005:	85 c0                	test   eax,eax
    d007:	0f 84 b7 00 00 00    	je     d0c4 <parseInst+0x4f4f>
    d00d:	48 8d 35 b4 8d 00 00 	lea    rsi,[rip+0x8db4]        # 15dc8 <_IO_stdin_used+0xdc8>
    d014:	48 89 ef             	mov    rdi,rbp
    d017:	e8 34 60 ff ff       	call   3050 <strcasecmp@plt>
    d01c:	85 c0                	test   eax,eax
    d01e:	0f 84 a0 00 00 00    	je     d0c4 <parseInst+0x4f4f>
    d024:	48 8d 35 a4 8d 00 00 	lea    rsi,[rip+0x8da4]        # 15dcf <_IO_stdin_used+0xdcf>
    d02b:	48 89 ef             	mov    rdi,rbp
    d02e:	e8 1d 60 ff ff       	call   3050 <strcasecmp@plt>
    d033:	85 c0                	test   eax,eax
    d035:	0f 84 89 00 00 00    	je     d0c4 <parseInst+0x4f4f>
    d03b:	48 8d 35 93 8d 00 00 	lea    rsi,[rip+0x8d93]        # 15dd5 <_IO_stdin_used+0xdd5>
    d042:	48 89 ef             	mov    rdi,rbp
    d045:	e8 06 60 ff ff       	call   3050 <strcasecmp@plt>
    d04a:	85 c0                	test   eax,eax
    d04c:	74 76                	je     d0c4 <parseInst+0x4f4f>
    d04e:	48 8d 35 86 8d 00 00 	lea    rsi,[rip+0x8d86]        # 15ddb <_IO_stdin_used+0xddb>
    d055:	48 89 ef             	mov    rdi,rbp
    d058:	e8 f3 5f ff ff       	call   3050 <strcasecmp@plt>
    d05d:	85 c0                	test   eax,eax
    d05f:	74 63                	je     d0c4 <parseInst+0x4f4f>
    d061:	48 8d 35 79 8d 00 00 	lea    rsi,[rip+0x8d79]        # 15de1 <_IO_stdin_used+0xde1>
    d068:	48 89 ef             	mov    rdi,rbp
    d06b:	e8 e0 5f ff ff       	call   3050 <strcasecmp@plt>
    d070:	85 c0                	test   eax,eax
    d072:	74 50                	je     d0c4 <parseInst+0x4f4f>
    d074:	48 8d 35 6c 8d 00 00 	lea    rsi,[rip+0x8d6c]        # 15de7 <_IO_stdin_used+0xde7>
    d07b:	48 89 ef             	mov    rdi,rbp
    d07e:	e8 cd 5f ff ff       	call   3050 <strcasecmp@plt>
    d083:	85 c0                	test   eax,eax
    d085:	74 3d                	je     d0c4 <parseInst+0x4f4f>
    d087:	48 8d 35 5f 8d 00 00 	lea    rsi,[rip+0x8d5f]        # 15ded <_IO_stdin_used+0xded>
    d08e:	48 89 ef             	mov    rdi,rbp
    d091:	e8 ba 5f ff ff       	call   3050 <strcasecmp@plt>
    d096:	85 c0                	test   eax,eax
    d098:	74 2a                	je     d0c4 <parseInst+0x4f4f>
    d09a:	48 8d 35 52 8d 00 00 	lea    rsi,[rip+0x8d52]        # 15df3 <_IO_stdin_used+0xdf3>
    d0a1:	48 89 ef             	mov    rdi,rbp
    d0a4:	e8 a7 5f ff ff       	call   3050 <strcasecmp@plt>
    d0a9:	85 c0                	test   eax,eax
    d0ab:	74 17                	je     d0c4 <parseInst+0x4f4f>
    d0ad:	48 8d 35 45 8d 00 00 	lea    rsi,[rip+0x8d45]        # 15df9 <_IO_stdin_used+0xdf9>
    d0b4:	48 89 ef             	mov    rdi,rbp
    d0b7:	e8 94 5f ff ff       	call   3050 <strcasecmp@plt>
    d0bc:	85 c0                	test   eax,eax
    d0be:	0f 85 2c 0a 00 00    	jne    daf0 <parseInst+0x597b>
    d0c4:	45 85 ed             	test   r13d,r13d
    d0c7:	0f 84 23 05 00 00    	je     d5f0 <parseInst+0x547b>
    d0cd:	48 8d 35 fa 8b 00 00 	lea    rsi,[rip+0x8bfa]        # 15cce <_IO_stdin_used+0xcce>
    d0d4:	48 89 ef             	mov    rdi,rbp
    d0d7:	e8 74 5f ff ff       	call   3050 <strcasecmp@plt>
    d0dc:	85 c0                	test   eax,eax
    d0de:	0f 84 9d 05 00 00    	je     d681 <parseInst+0x550c>
    d0e4:	48 8d 35 ea 8b 00 00 	lea    rsi,[rip+0x8bea]        # 15cd5 <_IO_stdin_used+0xcd5>
    d0eb:	48 89 ef             	mov    rdi,rbp
    d0ee:	e8 5d 5f ff ff       	call   3050 <strcasecmp@plt>
    d0f3:	85 c0                	test   eax,eax
    d0f5:	0f 84 97 05 00 00    	je     d692 <parseInst+0x551d>
    d0fb:	48 8d 35 d9 8b 00 00 	lea    rsi,[rip+0x8bd9]        # 15cdb <_IO_stdin_used+0xcdb>
    d102:	48 89 ef             	mov    rdi,rbp
    d105:	e8 46 5f ff ff       	call   3050 <strcasecmp@plt>
    d10a:	85 c0                	test   eax,eax
    d10c:	0f 84 91 05 00 00    	je     d6a3 <parseInst+0x552e>
    d112:	48 8d 35 c8 8b 00 00 	lea    rsi,[rip+0x8bc8]        # 15ce1 <_IO_stdin_used+0xce1>
    d119:	48 89 ef             	mov    rdi,rbp
    d11c:	e8 2f 5f ff ff       	call   3050 <strcasecmp@plt>
    d121:	85 c0                	test   eax,eax
    d123:	0f 84 8b 05 00 00    	je     d6b4 <parseInst+0x553f>
    d129:	48 8d 35 b7 8b 00 00 	lea    rsi,[rip+0x8bb7]        # 15ce7 <_IO_stdin_used+0xce7>
    d130:	48 89 ef             	mov    rdi,rbp
    d133:	e8 18 5f ff ff       	call   3050 <strcasecmp@plt>
    d138:	85 c0                	test   eax,eax
    d13a:	0f 84 85 05 00 00    	je     d6c5 <parseInst+0x5550>
    d140:	48 8d 35 a6 8b 00 00 	lea    rsi,[rip+0x8ba6]        # 15ced <_IO_stdin_used+0xced>
    d147:	48 89 ef             	mov    rdi,rbp
    d14a:	e8 01 5f ff ff       	call   3050 <strcasecmp@plt>
    d14f:	85 c0                	test   eax,eax
    d151:	0f 84 7f 05 00 00    	je     d6d6 <parseInst+0x5561>
    d157:	48 8d 35 95 8b 00 00 	lea    rsi,[rip+0x8b95]        # 15cf3 <_IO_stdin_used+0xcf3>
    d15e:	48 89 ef             	mov    rdi,rbp
    d161:	e8 ea 5e ff ff       	call   3050 <strcasecmp@plt>
    d166:	85 c0                	test   eax,eax
    d168:	0f 84 79 05 00 00    	je     d6e7 <parseInst+0x5572>
    d16e:	48 8d 35 84 8b 00 00 	lea    rsi,[rip+0x8b84]        # 15cf9 <_IO_stdin_used+0xcf9>
    d175:	48 89 ef             	mov    rdi,rbp
    d178:	e8 d3 5e ff ff       	call   3050 <strcasecmp@plt>
    d17d:	85 c0                	test   eax,eax
    d17f:	0f 84 73 05 00 00    	je     d6f8 <parseInst+0x5583>
    d185:	48 8d 35 72 8b 00 00 	lea    rsi,[rip+0x8b72]        # 15cfe <_IO_stdin_used+0xcfe>
    d18c:	48 89 ef             	mov    rdi,rbp
    d18f:	e8 bc 5e ff ff       	call   3050 <strcasecmp@plt>
    d194:	85 c0                	test   eax,eax
    d196:	0f 84 6d 05 00 00    	je     d709 <parseInst+0x5594>
    d19c:	48 8d 35 61 8b 00 00 	lea    rsi,[rip+0x8b61]        # 15d04 <_IO_stdin_used+0xd04>
    d1a3:	48 89 ef             	mov    rdi,rbp
    d1a6:	e8 a5 5e ff ff       	call   3050 <strcasecmp@plt>
    d1ab:	85 c0                	test   eax,eax
    d1ad:	0f 84 67 05 00 00    	je     d71a <parseInst+0x55a5>
    d1b3:	48 8d 35 4e 8b 00 00 	lea    rsi,[rip+0x8b4e]        # 15d08 <_IO_stdin_used+0xd08>
    d1ba:	48 89 ef             	mov    rdi,rbp
    d1bd:	e8 8e 5e ff ff       	call   3050 <strcasecmp@plt>
    d1c2:	85 c0                	test   eax,eax
    d1c4:	0f 84 61 05 00 00    	je     d72b <parseInst+0x55b6>
    d1ca:	48 8d 35 3c 8b 00 00 	lea    rsi,[rip+0x8b3c]        # 15d0d <_IO_stdin_used+0xd0d>
    d1d1:	48 89 ef             	mov    rdi,rbp
    d1d4:	e8 77 5e ff ff       	call   3050 <strcasecmp@plt>
    d1d9:	85 c0                	test   eax,eax
    d1db:	0f 84 5b 05 00 00    	je     d73c <parseInst+0x55c7>
    d1e1:	48 8d 35 2d 8b 00 00 	lea    rsi,[rip+0x8b2d]        # 15d15 <_IO_stdin_used+0xd15>
    d1e8:	48 89 ef             	mov    rdi,rbp
    d1eb:	e8 60 5e ff ff       	call   3050 <strcasecmp@plt>
    d1f0:	85 c0                	test   eax,eax
    d1f2:	0f 84 55 05 00 00    	je     d74d <parseInst+0x55d8>
    d1f8:	48 8d 35 1e 8b 00 00 	lea    rsi,[rip+0x8b1e]        # 15d1d <_IO_stdin_used+0xd1d>
    d1ff:	48 89 ef             	mov    rdi,rbp
    d202:	e8 49 5e ff ff       	call   3050 <strcasecmp@plt>
    d207:	85 c0                	test   eax,eax
    d209:	0f 84 4f 05 00 00    	je     d75e <parseInst+0x55e9>
    d20f:	48 8d 35 0f 8b 00 00 	lea    rsi,[rip+0x8b0f]        # 15d25 <_IO_stdin_used+0xd25>
    d216:	48 89 ef             	mov    rdi,rbp
    d219:	e8 32 5e ff ff       	call   3050 <strcasecmp@plt>
    d21e:	85 c0                	test   eax,eax
    d220:	0f 84 49 05 00 00    	je     d76f <parseInst+0x55fa>
    d226:	48 8d 35 00 8b 00 00 	lea    rsi,[rip+0x8b00]        # 15d2d <_IO_stdin_used+0xd2d>
    d22d:	48 89 ef             	mov    rdi,rbp
    d230:	e8 1b 5e ff ff       	call   3050 <strcasecmp@plt>
    d235:	85 c0                	test   eax,eax
    d237:	0f 84 43 05 00 00    	je     d780 <parseInst+0x560b>
    d23d:	48 8d 35 f1 8a 00 00 	lea    rsi,[rip+0x8af1]        # 15d35 <_IO_stdin_used+0xd35>
    d244:	48 89 ef             	mov    rdi,rbp
    d247:	e8 04 5e ff ff       	call   3050 <strcasecmp@plt>
    d24c:	85 c0                	test   eax,eax
    d24e:	0f 84 3d 05 00 00    	je     d791 <parseInst+0x561c>
    d254:	48 8d 35 e2 8a 00 00 	lea    rsi,[rip+0x8ae2]        # 15d3d <_IO_stdin_used+0xd3d>
    d25b:	48 89 ef             	mov    rdi,rbp
    d25e:	e8 ed 5d ff ff       	call   3050 <strcasecmp@plt>
    d263:	85 c0                	test   eax,eax
    d265:	0f 84 37 05 00 00    	je     d7a2 <parseInst+0x562d>
    d26b:	48 8d 35 d5 8a 00 00 	lea    rsi,[rip+0x8ad5]        # 15d47 <_IO_stdin_used+0xd47>
    d272:	48 89 ef             	mov    rdi,rbp
    d275:	e8 d6 5d ff ff       	call   3050 <strcasecmp@plt>
    d27a:	85 c0                	test   eax,eax
    d27c:	0f 84 31 05 00 00    	je     d7b3 <parseInst+0x563e>
    d282:	48 8d 35 c8 8a 00 00 	lea    rsi,[rip+0x8ac8]        # 15d51 <_IO_stdin_used+0xd51>
    d289:	48 89 ef             	mov    rdi,rbp
    d28c:	e8 bf 5d ff ff       	call   3050 <strcasecmp@plt>
    d291:	85 c0                	test   eax,eax
    d293:	0f 84 2b 05 00 00    	je     d7c4 <parseInst+0x564f>
    d299:	48 8d 35 bb 8a 00 00 	lea    rsi,[rip+0x8abb]        # 15d5b <_IO_stdin_used+0xd5b>
    d2a0:	48 89 ef             	mov    rdi,rbp
    d2a3:	e8 a8 5d ff ff       	call   3050 <strcasecmp@plt>
    d2a8:	85 c0                	test   eax,eax
    d2aa:	0f 84 25 05 00 00    	je     d7d5 <parseInst+0x5660>
    d2b0:	48 8d 35 af 8a 00 00 	lea    rsi,[rip+0x8aaf]        # 15d66 <_IO_stdin_used+0xd66>
    d2b7:	48 89 ef             	mov    rdi,rbp
    d2ba:	e8 91 5d ff ff       	call   3050 <strcasecmp@plt>
    d2bf:	85 c0                	test   eax,eax
    d2c1:	0f 84 1f 05 00 00    	je     d7e6 <parseInst+0x5671>
    d2c7:	48 8d 35 a2 8a 00 00 	lea    rsi,[rip+0x8aa2]        # 15d70 <_IO_stdin_used+0xd70>
    d2ce:	48 89 ef             	mov    rdi,rbp
    d2d1:	e8 7a 5d ff ff       	call   3050 <strcasecmp@plt>
    d2d6:	85 c0                	test   eax,eax
    d2d8:	0f 84 19 05 00 00    	je     d7f7 <parseInst+0x5682>
    d2de:	48 8d 35 95 8a 00 00 	lea    rsi,[rip+0x8a95]        # 15d7a <_IO_stdin_used+0xd7a>
    d2e5:	48 89 ef             	mov    rdi,rbp
    d2e8:	e8 63 5d ff ff       	call   3050 <strcasecmp@plt>
    d2ed:	85 c0                	test   eax,eax
    d2ef:	0f 84 13 05 00 00    	je     d808 <parseInst+0x5693>
    d2f5:	48 8d 35 88 8a 00 00 	lea    rsi,[rip+0x8a88]        # 15d84 <_IO_stdin_used+0xd84>
    d2fc:	48 89 ef             	mov    rdi,rbp
    d2ff:	e8 4c 5d ff ff       	call   3050 <strcasecmp@plt>
    d304:	85 c0                	test   eax,eax
    d306:	0f 84 0d 05 00 00    	je     d819 <parseInst+0x56a4>
    d30c:	48 8d 35 85 8a 00 00 	lea    rsi,[rip+0x8a85]        # 15d98 <_IO_stdin_used+0xd98>
    d313:	48 89 ef             	mov    rdi,rbp
    d316:	e8 35 5d ff ff       	call   3050 <strcasecmp@plt>
    d31b:	85 c0                	test   eax,eax
    d31d:	0f 84 07 05 00 00    	je     d82a <parseInst+0x56b5>
    d323:	48 8d 35 80 8a 00 00 	lea    rsi,[rip+0x8a80]        # 15daa <_IO_stdin_used+0xdaa>
    d32a:	48 89 ef             	mov    rdi,rbp
    d32d:	e8 1e 5d ff ff       	call   3050 <strcasecmp@plt>
    d332:	85 c0                	test   eax,eax
    d334:	0f 84 01 05 00 00    	je     d83b <parseInst+0x56c6>
    d33a:	48 8d 35 60 8a 00 00 	lea    rsi,[rip+0x8a60]        # 15da1 <_IO_stdin_used+0xda1>
    d341:	48 89 ef             	mov    rdi,rbp
    d344:	e8 07 5d ff ff       	call   3050 <strcasecmp@plt>
    d349:	85 c0                	test   eax,eax
    d34b:	0f 84 fb 04 00 00    	je     d84c <parseInst+0x56d7>
    d351:	48 8d 35 5b 8a 00 00 	lea    rsi,[rip+0x8a5b]        # 15db3 <_IO_stdin_used+0xdb3>
    d358:	48 89 ef             	mov    rdi,rbp
    d35b:	e8 f0 5c ff ff       	call   3050 <strcasecmp@plt>
    d360:	85 c0                	test   eax,eax
    d362:	0f 84 f5 04 00 00    	je     d85d <parseInst+0x56e8>
    d368:	48 8d 35 4b 8a 00 00 	lea    rsi,[rip+0x8a4b]        # 15dba <_IO_stdin_used+0xdba>
    d36f:	48 89 ef             	mov    rdi,rbp
    d372:	e8 d9 5c ff ff       	call   3050 <strcasecmp@plt>
    d377:	85 c0                	test   eax,eax
    d379:	0f 84 ef 04 00 00    	je     d86e <parseInst+0x56f9>
    d37f:	48 8d 35 3b 8a 00 00 	lea    rsi,[rip+0x8a3b]        # 15dc1 <_IO_stdin_used+0xdc1>
    d386:	48 89 ef             	mov    rdi,rbp
    d389:	e8 c2 5c ff ff       	call   3050 <strcasecmp@plt>
    d38e:	85 c0                	test   eax,eax
    d390:	0f 84 e9 04 00 00    	je     d87f <parseInst+0x570a>
    d396:	48 8d 35 2b 8a 00 00 	lea    rsi,[rip+0x8a2b]        # 15dc8 <_IO_stdin_used+0xdc8>
    d39d:	48 89 ef             	mov    rdi,rbp
    d3a0:	e8 ab 5c ff ff       	call   3050 <strcasecmp@plt>
    d3a5:	85 c0                	test   eax,eax
    d3a7:	0f 84 e3 04 00 00    	je     d890 <parseInst+0x571b>
    d3ad:	48 8d 35 1b 8a 00 00 	lea    rsi,[rip+0x8a1b]        # 15dcf <_IO_stdin_used+0xdcf>
    d3b4:	48 89 ef             	mov    rdi,rbp
    d3b7:	e8 94 5c ff ff       	call   3050 <strcasecmp@plt>
    d3bc:	85 c0                	test   eax,eax
    d3be:	0f 84 dd 04 00 00    	je     d8a1 <parseInst+0x572c>
    d3c4:	48 8d 35 0a 8a 00 00 	lea    rsi,[rip+0x8a0a]        # 15dd5 <_IO_stdin_used+0xdd5>
    d3cb:	48 89 ef             	mov    rdi,rbp
    d3ce:	e8 7d 5c ff ff       	call   3050 <strcasecmp@plt>
    d3d3:	85 c0                	test   eax,eax
    d3d5:	0f 84 d7 04 00 00    	je     d8b2 <parseInst+0x573d>
    d3db:	48 8d 35 f9 89 00 00 	lea    rsi,[rip+0x89f9]        # 15ddb <_IO_stdin_used+0xddb>
    d3e2:	48 89 ef             	mov    rdi,rbp
    d3e5:	e8 66 5c ff ff       	call   3050 <strcasecmp@plt>
    d3ea:	85 c0                	test   eax,eax
    d3ec:	0f 84 d1 04 00 00    	je     d8c3 <parseInst+0x574e>
    d3f2:	48 8d 35 e8 89 00 00 	lea    rsi,[rip+0x89e8]        # 15de1 <_IO_stdin_used+0xde1>
    d3f9:	48 89 ef             	mov    rdi,rbp
    d3fc:	e8 4f 5c ff ff       	call   3050 <strcasecmp@plt>
    d401:	85 c0                	test   eax,eax
    d403:	0f 84 cb 04 00 00    	je     d8d4 <parseInst+0x575f>
    d409:	48 8d 35 d7 89 00 00 	lea    rsi,[rip+0x89d7]        # 15de7 <_IO_stdin_used+0xde7>
    d410:	48 89 ef             	mov    rdi,rbp
    d413:	e8 38 5c ff ff       	call   3050 <strcasecmp@plt>
    d418:	85 c0                	test   eax,eax
    d41a:	0f 84 c5 04 00 00    	je     d8e5 <parseInst+0x5770>
    d420:	48 8d 35 c6 89 00 00 	lea    rsi,[rip+0x89c6]        # 15ded <_IO_stdin_used+0xded>
    d427:	48 89 ef             	mov    rdi,rbp
    d42a:	e8 21 5c ff ff       	call   3050 <strcasecmp@plt>
    d42f:	85 c0                	test   eax,eax
    d431:	0f 84 bf 04 00 00    	je     d8f6 <parseInst+0x5781>
    d437:	48 8d 35 51 89 00 00 	lea    rsi,[rip+0x8951]        # 15d8f <_IO_stdin_used+0xd8f>
    d43e:	48 89 ef             	mov    rdi,rbp
    d441:	e8 0a 5c ff ff       	call   3050 <strcasecmp@plt>
    d446:	85 c0                	test   eax,eax
    d448:	0f 84 b9 04 00 00    	je     d907 <parseInst+0x5792>
    d44e:	48 8d 35 9e 89 00 00 	lea    rsi,[rip+0x899e]        # 15df3 <_IO_stdin_used+0xdf3>
    d455:	48 89 ef             	mov    rdi,rbp
    d458:	e8 f3 5b ff ff       	call   3050 <strcasecmp@plt>
    d45d:	85 c0                	test   eax,eax
    d45f:	0f 84 b3 04 00 00    	je     d918 <parseInst+0x57a3>
    d465:	48 8d 35 8d 89 00 00 	lea    rsi,[rip+0x898d]        # 15df9 <_IO_stdin_used+0xdf9>
    d46c:	48 89 ef             	mov    rdi,rbp
    d46f:	e8 dc 5b ff ff       	call   3050 <strcasecmp@plt>
    d474:	85 c0                	test   eax,eax
    d476:	0f 84 ad 04 00 00    	je     d929 <parseInst+0x57b4>
    d47c:	41 bf 66 00 00 00    	mov    r15d,0x66
    d482:	41 bd 00 00 00 00    	mov    r13d,0x0
    d488:	e9 6f 01 00 00       	jmp    d5fc <parseInst+0x5487>
    d48d:	41 bd 10 00 00 00    	mov    r13d,0x10
    d493:	e9 37 f8 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d498:	41 bd 57 00 00 00    	mov    r13d,0x57
    d49e:	e9 2c f8 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4a3:	41 bd 54 00 00 00    	mov    r13d,0x54
    d4a9:	e9 21 f8 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4ae:	41 bd 55 00 00 00    	mov    r13d,0x55
    d4b4:	e9 16 f8 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4b9:	41 bd 56 00 00 00    	mov    r13d,0x56
    d4bf:	e9 0b f8 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4c4:	41 bd 58 00 00 00    	mov    r13d,0x58
    d4ca:	e9 00 f8 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4cf:	41 bd 59 00 00 00    	mov    r13d,0x59
    d4d5:	e9 f5 f7 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4da:	41 bd 5c 00 00 00    	mov    r13d,0x5c
    d4e0:	e9 ea f7 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4e5:	41 bd 5e 00 00 00    	mov    r13d,0x5e
    d4eb:	e9 df f7 ff ff       	jmp    cccf <parseInst+0x4b5a>
    d4f0:	80 7b 70 0f          	cmp    BYTE PTR [rbx+0x70],0xf
    d4f4:	0f 85 df f7 ff ff    	jne    ccd9 <parseInst+0x4b64>
    d4fa:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    d4fe:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    d505:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    d509:	e8 29 70 00 00       	call   14537 <find_xmm_index>
    d50e:	41 89 c7             	mov    r15d,eax
    d511:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    d515:	e8 1d 70 00 00       	call   14537 <find_xmm_index>
    d51a:	41 0f b6 cf          	movzx  ecx,r15b
    d51e:	0f b6 d0             	movzx  edx,al
    d521:	41 0f b6 f5          	movzx  esi,r13b
    d525:	41 b9 00 00 00 00    	mov    r9d,0x0
    d52b:	41 b8 80 00 00 00    	mov    r8d,0x80
    d531:	4c 89 f7             	mov    rdi,r14
    d534:	e8 e4 8a ff ff       	call   601d <encode_two_byte_opcode_reg>
    d539:	0f b6 c0             	movzx  eax,al
    d53c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    d543:	49 01 04 24          	add    QWORD PTR [r12],rax
    d547:	e9 8d f7 ff ff       	jmp    ccd9 <parseInst+0x4b64>
    d54c:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    d550:	0f 85 8d f7 ff ff    	jne    cce3 <parseInst+0x4b6e>
    d556:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    d55a:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    d561:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    d565:	e8 cd 6f 00 00       	call   14537 <find_xmm_index>
    d56a:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    d56e:	0f b6 d0             	movzx  edx,al
    d571:	41 0f b6 f5          	movzx  esi,r13b
    d575:	41 b9 00 00 00 00    	mov    r9d,0x0
    d57b:	41 b8 80 00 00 00    	mov    r8d,0x80
    d581:	4c 89 f7             	mov    rdi,r14
    d584:	e8 50 8f ff ff       	call   64d9 <encode_inst_reg_rm2>
    d589:	0f b6 c0             	movzx  eax,al
    d58c:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    d593:	49 01 04 24          	add    QWORD PTR [r12],rax
    d597:	e9 47 f7 ff ff       	jmp    cce3 <parseInst+0x4b6e>
    d59c:	80 7b 70 0f          	cmp    BYTE PTR [rbx+0x70],0xf
    d5a0:	0f 85 6d f7 ff ff    	jne    cd13 <parseInst+0x4b9e>
    d5a6:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    d5aa:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    d5b1:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    d5b5:	e8 7d 6f 00 00       	call   14537 <find_xmm_index>
    d5ba:	41 8d 75 01          	lea    esi,[r13+0x1]
    d5be:	48 8d 4b 18          	lea    rcx,[rbx+0x18]
    d5c2:	0f b6 d0             	movzx  edx,al
    d5c5:	40 0f b6 f6          	movzx  esi,sil
    d5c9:	41 b9 00 00 00 00    	mov    r9d,0x0
    d5cf:	41 b8 80 00 00 00    	mov    r8d,0x80
    d5d5:	4c 89 f7             	mov    rdi,r14
    d5d8:	e8 fc 8e ff ff       	call   64d9 <encode_inst_reg_rm2>
    d5dd:	0f b6 c0             	movzx  eax,al
    d5e0:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    d5e7:	49 01 04 24          	add    QWORD PTR [r12],rax
    d5eb:	e9 23 f7 ff ff       	jmp    cd13 <parseInst+0x4b9e>
    d5f0:	41 bf 66 00 00 00    	mov    r15d,0x66
    d5f6:	41 bd 6f 00 00 00    	mov    r13d,0x6f
    d5fc:	80 7b 10 0f          	cmp    BYTE PTR [rbx+0x10],0xf
    d600:	0f 84 34 03 00 00    	je     d93a <parseInst+0x57c5>
    d606:	80 7b 10 0f          	cmp    BYTE PTR [rbx+0x10],0xf
    d60a:	0f 84 86 03 00 00    	je     d996 <parseInst+0x5821>
    d610:	48 8d 35 b0 86 00 00 	lea    rsi,[rip+0x86b0]        # 15cc7 <_IO_stdin_used+0xcc7>
    d617:	48 89 ef             	mov    rdi,rbp
    d61a:	e8 31 5a ff ff       	call   3050 <strcasecmp@plt>
    d61f:	85 c0                	test   eax,eax
    d621:	74 13                	je     d636 <parseInst+0x54c1>
    d623:	48 8d 35 a4 86 00 00 	lea    rsi,[rip+0x86a4]        # 15cce <_IO_stdin_used+0xcce>
    d62a:	48 89 ef             	mov    rdi,rbp
    d62d:	e8 1e 5a ff ff       	call   3050 <strcasecmp@plt>
    d632:	85 c0                	test   eax,eax
    d634:	75 0a                	jne    d640 <parseInst+0x54cb>
    d636:	80 7b 10 14          	cmp    BYTE PTR [rbx+0x10],0x14
    d63a:	0f 84 a4 03 00 00    	je     d9e4 <parseInst+0x586f>
    d640:	48 8d 35 48 87 00 00 	lea    rsi,[rip+0x8748]        # 15d8f <_IO_stdin_used+0xd8f>
    d647:	48 89 ef             	mov    rdi,rbp
    d64a:	e8 01 5a ff ff       	call   3050 <strcasecmp@plt>
    d64f:	85 c0                	test   eax,eax
    d651:	75 14                	jne    d667 <parseInst+0x54f2>
    d653:	80 7b 10 0d          	cmp    BYTE PTR [rbx+0x10],0xd
    d657:	0f 84 d9 03 00 00    	je     da36 <parseInst+0x58c1>
    d65d:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    d661:	0f 84 2c 04 00 00    	je     da93 <parseInst+0x591e>
    d667:	48 83 bb a8 01 00 00 	cmp    QWORD PTR [rbx+0x1a8],0x0
    d66e:	00 
    d66f:	0f 84 e8 06 00 00    	je     dd5d <parseInst+0x5be8>
    d675:	0f b6 83 a8 01 00 00 	movzx  eax,BYTE PTR [rbx+0x1a8]
    d67c:	e9 11 ab ff ff       	jmp    8192 <parseInst+0x1d>
    d681:	41 bf f3 ff ff ff    	mov    r15d,0xfffffff3
    d687:	41 bd 6f 00 00 00    	mov    r13d,0x6f
    d68d:	e9 6a ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d692:	41 bf 66 00 00 00    	mov    r15d,0x66
    d698:	41 bd fc ff ff ff    	mov    r13d,0xfffffffc
    d69e:	e9 59 ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d6a3:	41 bf 66 00 00 00    	mov    r15d,0x66
    d6a9:	41 bd fd ff ff ff    	mov    r13d,0xfffffffd
    d6af:	e9 48 ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d6b4:	41 bf 66 00 00 00    	mov    r15d,0x66
    d6ba:	41 bd fe ff ff ff    	mov    r13d,0xfffffffe
    d6c0:	e9 37 ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d6c5:	41 bf 66 00 00 00    	mov    r15d,0x66
    d6cb:	41 bd f8 ff ff ff    	mov    r13d,0xfffffff8
    d6d1:	e9 26 ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d6d6:	41 bf 66 00 00 00    	mov    r15d,0x66
    d6dc:	41 bd f9 ff ff ff    	mov    r13d,0xfffffff9
    d6e2:	e9 15 ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d6e7:	41 bf 66 00 00 00    	mov    r15d,0x66
    d6ed:	41 bd fa ff ff ff    	mov    r13d,0xfffffffa
    d6f3:	e9 04 ff ff ff       	jmp    d5fc <parseInst+0x5487>
    d6f8:	41 bf 66 00 00 00    	mov    r15d,0x66
    d6fe:	41 bd db ff ff ff    	mov    r13d,0xffffffdb
    d704:	e9 f3 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d709:	41 bf 66 00 00 00    	mov    r15d,0x66
    d70f:	41 bd df ff ff ff    	mov    r13d,0xffffffdf
    d715:	e9 e2 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d71a:	41 bf 66 00 00 00    	mov    r15d,0x66
    d720:	41 bd eb ff ff ff    	mov    r13d,0xffffffeb
    d726:	e9 d1 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d72b:	41 bf 66 00 00 00    	mov    r15d,0x66
    d731:	41 bd ef ff ff ff    	mov    r13d,0xffffffef
    d737:	e9 c0 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d73c:	41 bf 66 00 00 00    	mov    r15d,0x66
    d742:	41 bd 74 00 00 00    	mov    r13d,0x74
    d748:	e9 af fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d74d:	41 bf 66 00 00 00    	mov    r15d,0x66
    d753:	41 bd 75 00 00 00    	mov    r13d,0x75
    d759:	e9 9e fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d75e:	41 bf 66 00 00 00    	mov    r15d,0x66
    d764:	41 bd 76 00 00 00    	mov    r13d,0x76
    d76a:	e9 8d fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d76f:	41 bf 66 00 00 00    	mov    r15d,0x66
    d775:	41 bd 64 00 00 00    	mov    r13d,0x64
    d77b:	e9 7c fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d780:	41 bf 66 00 00 00    	mov    r15d,0x66
    d786:	41 bd 65 00 00 00    	mov    r13d,0x65
    d78c:	e9 6b fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d791:	41 bf 66 00 00 00    	mov    r15d,0x66
    d797:	41 bd 66 00 00 00    	mov    r13d,0x66
    d79d:	e9 5a fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d7a2:	41 bf 66 00 00 00    	mov    r15d,0x66
    d7a8:	41 bd 60 00 00 00    	mov    r13d,0x60
    d7ae:	e9 49 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d7b3:	41 bf 66 00 00 00    	mov    r15d,0x66
    d7b9:	41 bd 61 00 00 00    	mov    r13d,0x61
    d7bf:	e9 38 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d7c4:	41 bf 66 00 00 00    	mov    r15d,0x66
    d7ca:	41 bd 62 00 00 00    	mov    r13d,0x62
    d7d0:	e9 27 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d7d5:	41 bf 66 00 00 00    	mov    r15d,0x66
    d7db:	41 bd 6c 00 00 00    	mov    r13d,0x6c
    d7e1:	e9 16 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d7e6:	41 bf 66 00 00 00    	mov    r15d,0x66
    d7ec:	41 bd 68 00 00 00    	mov    r13d,0x68
    d7f2:	e9 05 fe ff ff       	jmp    d5fc <parseInst+0x5487>
    d7f7:	41 bf 66 00 00 00    	mov    r15d,0x66
    d7fd:	41 bd 69 00 00 00    	mov    r13d,0x69
    d803:	e9 f4 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d808:	41 bf 66 00 00 00    	mov    r15d,0x66
    d80e:	41 bd 6a 00 00 00    	mov    r13d,0x6a
    d814:	e9 e3 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d819:	41 bf 66 00 00 00    	mov    r15d,0x66
    d81f:	41 bd 6d 00 00 00    	mov    r13d,0x6d
    d825:	e9 d2 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d82a:	41 bf 66 00 00 00    	mov    r15d,0x66
    d830:	41 bd 63 00 00 00    	mov    r13d,0x63
    d836:	e9 c1 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d83b:	41 bf 66 00 00 00    	mov    r15d,0x66
    d841:	41 bd 67 00 00 00    	mov    r13d,0x67
    d847:	e9 b0 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d84c:	41 bf 66 00 00 00    	mov    r15d,0x66
    d852:	41 bd 6b 00 00 00    	mov    r13d,0x6b
    d858:	e9 9f fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d85d:	41 bf 66 00 00 00    	mov    r15d,0x66
    d863:	41 bd de ff ff ff    	mov    r13d,0xffffffde
    d869:	e9 8e fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d86e:	41 bf 66 00 00 00    	mov    r15d,0x66
    d874:	41 bd da ff ff ff    	mov    r13d,0xffffffda
    d87a:	e9 7d fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d87f:	41 bf 66 00 00 00    	mov    r15d,0x66
    d885:	41 bd ee ff ff ff    	mov    r13d,0xffffffee
    d88b:	e9 6c fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d890:	41 bf 66 00 00 00    	mov    r15d,0x66
    d896:	41 bd ea ff ff ff    	mov    r13d,0xffffffea
    d89c:	e9 5b fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d8a1:	41 bf 66 00 00 00    	mov    r15d,0x66
    d8a7:	41 bd f1 ff ff ff    	mov    r13d,0xfffffff1
    d8ad:	e9 4a fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d8b2:	41 bf 66 00 00 00    	mov    r15d,0x66
    d8b8:	41 bd f2 ff ff ff    	mov    r13d,0xfffffff2
    d8be:	e9 39 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d8c3:	41 bf 66 00 00 00    	mov    r15d,0x66
    d8c9:	41 bd f3 ff ff ff    	mov    r13d,0xfffffff3
    d8cf:	e9 28 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d8d4:	41 bf 66 00 00 00    	mov    r15d,0x66
    d8da:	41 bd d1 ff ff ff    	mov    r13d,0xffffffd1
    d8e0:	e9 17 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d8e5:	41 bf 66 00 00 00    	mov    r15d,0x66
    d8eb:	41 bd d2 ff ff ff    	mov    r13d,0xffffffd2
    d8f1:	e9 06 fd ff ff       	jmp    d5fc <parseInst+0x5487>
    d8f6:	41 bf 66 00 00 00    	mov    r15d,0x66
    d8fc:	41 bd d3 ff ff ff    	mov    r13d,0xffffffd3
    d902:	e9 f5 fc ff ff       	jmp    d5fc <parseInst+0x5487>
    d907:	41 bf 66 00 00 00    	mov    r15d,0x66
    d90d:	41 bd d7 ff ff ff    	mov    r13d,0xffffffd7
    d913:	e9 e4 fc ff ff       	jmp    d5fc <parseInst+0x5487>
    d918:	41 bf 66 00 00 00    	mov    r15d,0x66
    d91e:	41 bd e1 ff ff ff    	mov    r13d,0xffffffe1
    d924:	e9 d3 fc ff ff       	jmp    d5fc <parseInst+0x5487>
    d929:	41 bf 66 00 00 00    	mov    r15d,0x66
    d92f:	41 bd e2 ff ff ff    	mov    r13d,0xffffffe2
    d935:	e9 c2 fc ff ff       	jmp    d5fc <parseInst+0x5487>
    d93a:	80 7b 70 0f          	cmp    BYTE PTR [rbx+0x70],0xf
    d93e:	0f 85 c2 fc ff ff    	jne    d606 <parseInst+0x5491>
    d944:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    d948:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    d94f:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    d953:	e8 df 6b 00 00       	call   14537 <find_xmm_index>
    d958:	88 44 24 08          	mov    BYTE PTR [rsp+0x8],al
    d95c:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    d960:	e8 d2 6b 00 00       	call   14537 <find_xmm_index>
    d965:	0f b6 4c 24 08       	movzx  ecx,BYTE PTR [rsp+0x8]
    d96a:	0f b6 d0             	movzx  edx,al
    d96d:	41 0f b6 f5          	movzx  esi,r13b
    d971:	45 0f b6 cf          	movzx  r9d,r15b
    d975:	41 b8 80 00 00 00    	mov    r8d,0x80
    d97b:	4c 89 f7             	mov    rdi,r14
    d97e:	e8 9a 86 ff ff       	call   601d <encode_two_byte_opcode_reg>
    d983:	0f b6 c0             	movzx  eax,al
    d986:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    d98d:	49 01 04 24          	add    QWORD PTR [r12],rax
    d991:	e9 70 fc ff ff       	jmp    d606 <parseInst+0x5491>
    d996:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    d99a:	0f 85 70 fc ff ff    	jne    d610 <parseInst+0x549b>
    d9a0:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    d9a4:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    d9ab:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    d9af:	e8 83 6b 00 00       	call   14537 <find_xmm_index>
    d9b4:	48 8d 4b 78          	lea    rcx,[rbx+0x78]
    d9b8:	0f b6 d0             	movzx  edx,al
    d9bb:	41 0f b6 f5          	movzx  esi,r13b
    d9bf:	45 0f b6 cf          	movzx  r9d,r15b
    d9c3:	41 b8 80 00 00 00    	mov    r8d,0x80
    d9c9:	4c 89 f7             	mov    rdi,r14
    d9cc:	e8 08 8b ff ff       	call   64d9 <encode_inst_reg_rm2>
    d9d1:	0f b6 c0             	movzx  eax,al
    d9d4:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    d9db:	49 01 04 24          	add    QWORD PTR [r12],rax
    d9df:	e9 2c fc ff ff       	jmp    d610 <parseInst+0x549b>
    d9e4:	80 7b 70 0f          	cmp    BYTE PTR [rbx+0x70],0xf
    d9e8:	0f 85 52 fc ff ff    	jne    d640 <parseInst+0x54cb>
    d9ee:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    d9f2:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    d9f9:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    d9fd:	e8 35 6b 00 00       	call   14537 <find_xmm_index>
    da02:	41 8d 75 10          	lea    esi,[r13+0x10]
    da06:	48 8d 4b 18          	lea    rcx,[rbx+0x18]
    da0a:	0f b6 d0             	movzx  edx,al
    da0d:	40 0f b6 f6          	movzx  esi,sil
    da11:	45 0f b6 cf          	movzx  r9d,r15b
    da15:	41 b8 80 00 00 00    	mov    r8d,0x80
    da1b:	4c 89 f7             	mov    rdi,r14
    da1e:	e8 b6 8a ff ff       	call   64d9 <encode_inst_reg_rm2>
    da23:	0f b6 c0             	movzx  eax,al
    da26:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    da2d:	49 01 04 24          	add    QWORD PTR [r12],rax
    da31:	e9 0a fc ff ff       	jmp    d640 <parseInst+0x54cb>
    da36:	80 7b 70 0f          	cmp    BYTE PTR [rbx+0x70],0xf
    da3a:	0f 85 1d fc ff ff    	jne    d65d <parseInst+0x54e8>
    da40:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    da44:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    da4b:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    da4f:	e8 e3 6a 00 00       	call   14537 <find_xmm_index>
    da54:	41 89 c5             	mov    r13d,eax
    da57:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    da5b:	e8 ca 61 00 00       	call   13c2a <find_reg32_index>
    da60:	41 0f b6 cd          	movzx  ecx,r13b
    da64:	0f b6 d0             	movzx  edx,al
    da67:	41 b9 66 00 00 00    	mov    r9d,0x66
    da6d:	41 b8 20 00 00 00    	mov    r8d,0x20
    da73:	be d7 00 00 00       	mov    esi,0xd7
    da78:	4c 89 f7             	mov    rdi,r14
    da7b:	e8 9d 85 ff ff       	call   601d <encode_two_byte_opcode_reg>
    da80:	0f b6 c0             	movzx  eax,al
    da83:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    da8a:	49 01 04 24          	add    QWORD PTR [r12],rax
    da8e:	e9 ca fb ff ff       	jmp    d65d <parseInst+0x54e8>
    da93:	80 7b 70 0f          	cmp    BYTE PTR [rbx+0x70],0xf
    da97:	0f 85 ca fb ff ff    	jne    d667 <parseInst+0x54f2>
    da9d:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    daa1:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    daa8:	48 8d 7b 78          	lea    rdi,[rbx+0x78]
    daac:	e8 86 6a 00 00       	call   14537 <find_xmm_index>
    dab1:	41 89 c5             	mov    r13d,eax
    dab4:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    dab8:	e8 b3 60 00 00       	call   13b70 <find_reg64_index>
    dabd:	41 0f b6 cd          	movzx  ecx,r13b
    dac1:	0f b6 d0             	movzx  edx,al
    dac4:	41 b9 66 00 00 00    	mov    r9d,0x66
    daca:	41 b8 20 00 00 00    	mov    r8d,0x20
    dad0:	be d7 00 00 00       	mov    esi,0xd7
    dad5:	4c 89 f7             	mov    rdi,r14
    dad8:	e8 40 85 ff ff       	call   601d <encode_two_byte_opcode_reg>
    dadd:	0f b6 c0             	movzx  eax,al
    dae0:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    dae7:	49 01 04 24          	add    QWORD PTR [r12],rax
    daeb:	e9 77 fb ff ff       	jmp    d667 <parseInst+0x54f2>
    daf0:	48 8d 35 08 83 00 00 	lea    rsi,[rip+0x8308]        # 15dff <_IO_stdin_used+0xdff>
    daf7:	48 89 ef             	mov    rdi,rbp
    dafa:	e8 51 55 ff ff       	call   3050 <strcasecmp@plt>
    daff:	85 c0                	test   eax,eax
    db01:	75 65                	jne    db68 <parseInst+0x59f3>
    db03:	80 7b 10 0e          	cmp    BYTE PTR [rbx+0x10],0xe
    db07:	0f 85 5a fb ff ff    	jne    d667 <parseInst+0x54f2>
    db0d:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
    db11:	0f 85 50 fb ff ff    	jne    d667 <parseInst+0x54f2>
    db17:	48 8d 7b 18          	lea    rdi,[rbx+0x18]
    db1b:	e8 50 60 00 00       	call   13b70 <find_reg64_index>
    db20:	48 8d 53 78          	lea    rdx,[rbx+0x78]
    db24:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    db28:	48 89 8b 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rcx
    db2f:	0f b6 f0             	movzx  esi,al
    db32:	48 83 ec 08          	sub    rsp,0x8
    db36:	6a 00                	push   0x0
    db38:	41 b9 00 00 00 00    	mov    r9d,0x0
    db3e:	41 b8 8d 00 00 00    	mov    r8d,0x8d
    db44:	b9 40 00 00 00       	mov    ecx,0x40
    db49:	4c 89 f7             	mov    rdi,r14
    db4c:	e8 6c 85 ff ff       	call   60bd <encode_inst_rm_rm>
    db51:	0f b6 c0             	movzx  eax,al
    db54:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    db5b:	49 01 04 24          	add    QWORD PTR [r12],rax
    db5f:	48 83 c4 10          	add    rsp,0x10
    db63:	e9 ff fa ff ff       	jmp    d667 <parseInst+0x54f2>
    db68:	48 8d 35 94 82 00 00 	lea    rsi,[rip+0x8294]        # 15e03 <_IO_stdin_used+0xe03>
    db6f:	48 89 ef             	mov    rdi,rbp
    db72:	e8 d9 54 ff ff       	call   3050 <strcasecmp@plt>
    db77:	85 c0                	test   eax,eax
    db79:	75 3c                	jne    dbb7 <parseInst+0x5a42>
    db7b:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    db7f:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    db86:	48 8b 83 a0 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a0]
    db8d:	c6 00 0f             	mov    BYTE PTR [rax],0xf
    db90:	48 8b 83 a0 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a0]
    db97:	c6 40 01 05          	mov    BYTE PTR [rax+0x1],0x5
    db9b:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x2
    dba2:	02 00 00 00 
    dba6:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    dbaa:	48 83 c0 02          	add    rax,0x2
    dbae:	49 89 04 24          	mov    QWORD PTR [r12],rax
    dbb2:	e9 b0 fa ff ff       	jmp    d667 <parseInst+0x54f2>
    dbb7:	48 8d 35 4d 82 00 00 	lea    rsi,[rip+0x824d]        # 15e0b <_IO_stdin_used+0xe0b>
    dbbe:	48 89 ef             	mov    rdi,rbp
    dbc1:	e8 8a 54 ff ff       	call   3050 <strcasecmp@plt>
    dbc6:	85 c0                	test   eax,eax
    dbc8:	75 31                	jne    dbfb <parseInst+0x5a86>
    dbca:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    dbce:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    dbd5:	48 8b 83 a0 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a0]
    dbdc:	c6 00 c3             	mov    BYTE PTR [rax],0xc3
    dbdf:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x1
    dbe6:	01 00 00 00 
    dbea:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    dbee:	48 83 c0 01          	add    rax,0x1
    dbf2:	49 89 04 24          	mov    QWORD PTR [r12],rax
    dbf6:	e9 6c fa ff ff       	jmp    d667 <parseInst+0x54f2>
    dbfb:	48 8d 35 0d 82 00 00 	lea    rsi,[rip+0x820d]        # 15e0f <_IO_stdin_used+0xe0f>
    dc02:	48 89 ef             	mov    rdi,rbp
    dc05:	e8 46 54 ff ff       	call   3050 <strcasecmp@plt>
    dc0a:	85 c0                	test   eax,eax
    dc0c:	75 31                	jne    dc3f <parseInst+0x5aca>
    dc0e:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    dc12:	48 89 83 98 01 00 00 	mov    QWORD PTR [rbx+0x198],rax
    dc19:	48 8b 83 a0 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a0]
    dc20:	c6 00 90             	mov    BYTE PTR [rax],0x90
    dc23:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x1
    dc2a:	01 00 00 00 
    dc2e:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
    dc32:	48 83 c0 01          	add    rax,0x1
    dc36:	49 89 04 24          	mov    QWORD PTR [r12],rax
    dc3a:	e9 28 fa ff ff       	jmp    d667 <parseInst+0x54f2>
    dc3f:	48 89 ee             	mov    rsi,rbp
    dc42:	48 8d 3d 57 c5 00 00 	lea    rdi,[rip+0xc557]        # 1a1a0 <Sign_extensions>
    dc49:	e8 58 5b 00 00       	call   137a6 <is2arrin>
    dc4e:	85 c0                	test   eax,eax
    dc50:	0f 84 11 fa ff ff    	je     d667 <parseInst+0x54f2>
    dc56:	48 8d 35 b6 81 00 00 	lea    rsi,[rip+0x81b6]        # 15e13 <_IO_stdin_used+0xe13>
    dc5d:	48 89 ef             	mov    rdi,rbp
    dc60:	e8 eb 53 ff ff       	call   3050 <strcasecmp@plt>
    dc65:	85 c0                	test   eax,eax
    dc67:	75 24                	jne    dc8d <parseInst+0x5b18>
    dc69:	41 c6 06 48          	mov    BYTE PTR [r14],0x48
    dc6d:	41 c6 46 01 99       	mov    BYTE PTR [r14+0x1],0x99
    dc72:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x2
    dc79:	02 00 00 00 
    dc7d:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    dc84:	49 01 04 24          	add    QWORD PTR [r12],rax
    dc88:	e9 da f9 ff ff       	jmp    d667 <parseInst+0x54f2>
    dc8d:	48 8d 35 83 81 00 00 	lea    rsi,[rip+0x8183]        # 15e17 <_IO_stdin_used+0xe17>
    dc94:	48 89 ef             	mov    rdi,rbp
    dc97:	e8 b4 53 ff ff       	call   3050 <strcasecmp@plt>
    dc9c:	85 c0                	test   eax,eax
    dc9e:	75 11                	jne    dcb1 <parseInst+0x5b3c>
    dca0:	41 c6 06 99          	mov    BYTE PTR [r14],0x99
    dca4:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x1
    dcab:	01 00 00 00 
    dcaf:	eb cc                	jmp    dc7d <parseInst+0x5b08>
    dcb1:	48 8d 35 63 81 00 00 	lea    rsi,[rip+0x8163]        # 15e1b <_IO_stdin_used+0xe1b>
    dcb8:	48 89 ef             	mov    rdi,rbp
    dcbb:	e8 90 53 ff ff       	call   3050 <strcasecmp@plt>
    dcc0:	85 c0                	test   eax,eax
    dcc2:	75 16                	jne    dcda <parseInst+0x5b65>
    dcc4:	41 c6 06 66          	mov    BYTE PTR [r14],0x66
    dcc8:	41 c6 46 01 99       	mov    BYTE PTR [r14+0x1],0x99
    dccd:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x2
    dcd4:	02 00 00 00 
    dcd8:	eb a3                	jmp    dc7d <parseInst+0x5b08>
    dcda:	48 8d 35 3e 81 00 00 	lea    rsi,[rip+0x813e]        # 15e1f <_IO_stdin_used+0xe1f>
    dce1:	48 89 ef             	mov    rdi,rbp
    dce4:	e8 67 53 ff ff       	call   3050 <strcasecmp@plt>
    dce9:	85 c0                	test   eax,eax
    dceb:	75 19                	jne    dd06 <parseInst+0x5b91>
    dced:	41 c6 06 48          	mov    BYTE PTR [r14],0x48
    dcf1:	41 c6 46 01 98       	mov    BYTE PTR [r14+0x1],0x98
    dcf6:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x2
    dcfd:	02 00 00 00 
    dd01:	e9 77 ff ff ff       	jmp    dc7d <parseInst+0x5b08>
    dd06:	48 8d 35 17 81 00 00 	lea    rsi,[rip+0x8117]        # 15e24 <_IO_stdin_used+0xe24>
    dd0d:	48 89 ef             	mov    rdi,rbp
    dd10:	e8 3b 53 ff ff       	call   3050 <strcasecmp@plt>
    dd15:	85 c0                	test   eax,eax
    dd17:	75 14                	jne    dd2d <parseInst+0x5bb8>
    dd19:	41 c6 06 98          	mov    BYTE PTR [r14],0x98
    dd1d:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x1
    dd24:	01 00 00 00 
    dd28:	e9 50 ff ff ff       	jmp    dc7d <parseInst+0x5b08>
    dd2d:	48 8d 35 f5 80 00 00 	lea    rsi,[rip+0x80f5]        # 15e29 <_IO_stdin_used+0xe29>
    dd34:	48 89 ef             	mov    rdi,rbp
    dd37:	e8 14 53 ff ff       	call   3050 <strcasecmp@plt>
    dd3c:	85 c0                	test   eax,eax
    dd3e:	0f 85 39 ff ff ff    	jne    dc7d <parseInst+0x5b08>
    dd44:	41 c6 06 66          	mov    BYTE PTR [r14],0x66
    dd48:	41 c6 46 01 98       	mov    BYTE PTR [r14+0x1],0x98
    dd4d:	48 c7 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],0x2
    dd54:	02 00 00 00 
    dd58:	e9 20 ff ff ff       	jmp    dc7d <parseInst+0x5b08>
    dd5d:	48 8d 3d 54 81 00 00 	lea    rdi,[rip+0x8154]        # 15eb8 <_IO_stdin_used+0xeb8>
    dd64:	e8 27 53 ff ff       	call   3090 <puts@plt>
    dd69:	0f b7 73 0a          	movzx  esi,WORD PTR [rbx+0xa]
    dd6d:	48 89 ea             	mov    rdx,rbp
    dd70:	48 8d 3d b6 80 00 00 	lea    rdi,[rip+0x80b6]        # 15e2d <_IO_stdin_used+0xe2d>
    dd77:	b8 00 00 00 00       	mov    eax,0x0
    dd7c:	e8 4f 53 ff ff       	call   30d0 <printf@plt>
    dd81:	bd 00 00 00 00       	mov    ebp,0x0
    dd86:	eb 75                	jmp    ddfd <parseInst+0x5c88>
    dd88:	48 8d 15 80 91 00 00 	lea    rdx,[rip+0x9180]        # 16f0f <_IO_stdin_used+0x1f0f>
    dd8f:	e9 a2 00 00 00       	jmp    de36 <parseInst+0x5cc1>
    dd94:	48 8d 35 6d 75 00 00 	lea    rsi,[rip+0x756d]        # 15308 <_IO_stdin_used+0x308>
    dd9b:	eb 4f                	jmp    ddec <parseInst+0x5c77>
    dd9d:	48 8d 35 32 73 00 00 	lea    rsi,[rip+0x7332]        # 150d6 <_IO_stdin_used+0xd6>
    dda4:	eb 46                	jmp    ddec <parseInst+0x5c77>
    dda6:	48 8d 35 31 73 00 00 	lea    rsi,[rip+0x7331]        # 150de <_IO_stdin_used+0xde>
    ddad:	eb 3d                	jmp    ddec <parseInst+0x5c77>
    ddaf:	48 8d 35 10 75 00 00 	lea    rsi,[rip+0x7510]        # 152c6 <_IO_stdin_used+0x2c6>
    ddb6:	eb 34                	jmp    ddec <parseInst+0x5c77>
    ddb8:	48 8d 35 35 73 00 00 	lea    rsi,[rip+0x7335]        # 150f4 <_IO_stdin_used+0xf4>
    ddbf:	eb 2b                	jmp    ddec <parseInst+0x5c77>
    ddc1:	48 8d 35 07 75 00 00 	lea    rsi,[rip+0x7507]        # 152cf <_IO_stdin_used+0x2cf>
    ddc8:	eb 22                	jmp    ddec <parseInst+0x5c77>
    ddca:	48 8d 35 39 75 00 00 	lea    rsi,[rip+0x7539]        # 1530a <_IO_stdin_used+0x30a>
    ddd1:	eb 19                	jmp    ddec <parseInst+0x5c77>
    ddd3:	48 8d 35 8e 7c 00 00 	lea    rsi,[rip+0x7c8e]        # 15a68 <_IO_stdin_used+0xa68>
    ddda:	eb 10                	jmp    ddec <parseInst+0x5c77>
    dddc:	48 8d 35 03 73 00 00 	lea    rsi,[rip+0x7303]        # 150e6 <_IO_stdin_used+0xe6>
    dde3:	eb 07                	jmp    ddec <parseInst+0x5c77>
    dde5:	48 8d 35 db 72 00 00 	lea    rsi,[rip+0x72db]        # 150c7 <_IO_stdin_used+0xc7>
    ddec:	48 8d 3d 49 80 00 00 	lea    rdi,[rip+0x8049]        # 15e3c <_IO_stdin_used+0xe3c>
    ddf3:	b8 00 00 00 00       	mov    eax,0x0
    ddf8:	e8 d3 52 ff ff       	call   30d0 <printf@plt>
    ddfd:	83 fd 02             	cmp    ebp,0x2
    de00:	7f 5f                	jg     de61 <parseInst+0x5cec>
    de02:	48 63 c5             	movsxd rax,ebp
    de05:	48 8d 04 40          	lea    rax,[rax+rax*2]
    de09:	48 c1 e0 05          	shl    rax,0x5
    de0d:	0f b6 44 03 10       	movzx  eax,BYTE PTR [rbx+rax*1+0x10]
    de12:	3c 0a                	cmp    al,0xa
    de14:	74 4b                	je     de61 <parseInst+0x5cec>
    de16:	83 c5 01             	add    ebp,0x1
    de19:	48 63 d5             	movsxd rdx,ebp
    de1c:	48 8d 14 52          	lea    rdx,[rdx+rdx*2]
    de20:	48 c1 e2 05          	shl    rdx,0x5
    de24:	80 7c 13 10 0a       	cmp    BYTE PTR [rbx+rdx*1+0x10],0xa
    de29:	0f 84 59 ff ff ff    	je     dd88 <parseInst+0x5c13>
    de2f:	48 8d 15 b2 75 00 00 	lea    rdx,[rip+0x75b2]        # 153e8 <_IO_stdin_used+0x3e8>
    de36:	3c 0b                	cmp    al,0xb
    de38:	74 ab                	je     dde5 <parseInst+0x5c70>
    de3a:	83 e8 0c             	sub    eax,0xc
    de3d:	3c 08                	cmp    al,0x8
    de3f:	0f 87 4f ff ff ff    	ja     dd94 <parseInst+0x5c1f>
    de45:	0f b6 c0             	movzx  eax,al
    de48:	48 8d 0d 19 81 00 00 	lea    rcx,[rip+0x8119]        # 15f68 <_IO_stdin_used+0xf68>
    de4f:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
    de53:	48 01 c8             	add    rax,rcx
    de56:	ff e0                	jmp    rax
    de58:	48 8d 35 6f 72 00 00 	lea    rsi,[rip+0x726f]        # 150ce <_IO_stdin_used+0xce>
    de5f:	eb 8b                	jmp    ddec <parseInst+0x5c77>
    de61:	48 8d 3d a7 90 00 00 	lea    rdi,[rip+0x90a7]        # 16f0f <_IO_stdin_used+0x1f0f>
    de68:	e8 23 52 ff ff       	call   3090 <puts@plt>
    de6d:	e9 03 f8 ff ff       	jmp    d675 <parseInst+0x5500>

000000000000de72 <emit_align>:
    de72:	41 54                	push   r12
    de74:	55                   	push   rbp
    de75:	53                   	push   rbx
    de76:	48 83 ec 10          	sub    rsp,0x10
    de7a:	48 89 fb             	mov    rbx,rdi
    de7d:	49 89 f4             	mov    r12,rsi
    de80:	48 8b 2e             	mov    rbp,QWORD PTR [rsi]
    de83:	48 c7 87 a8 01 00 00 	mov    QWORD PTR [rdi+0x1a8],0x0
    de8a:	00 00 00 00 
    de8e:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
    de92:	48 89 d0             	mov    rax,rdx
    de95:	48 03 06             	add    rax,QWORD PTR [rsi]
    de98:	48 83 e8 01          	sub    rax,0x1
    de9c:	48 f7 da             	neg    rdx
    de9f:	48 21 d0             	and    rax,rdx
    dea2:	48 89 06             	mov    QWORD PTR [rsi],rax
    dea5:	eb 38                	jmp    dedf <emit_align+0x6d>
    dea7:	0f b6 43 18          	movzx  eax,BYTE PTR [rbx+0x18]
    deab:	88 44 24 0f          	mov    BYTE PTR [rsp+0xf],al
    deaf:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    deb6:	48 8d b3 b0 01 00 00 	lea    rsi,[rbx+0x1b0]
    debd:	48 8d bb a8 01 00 00 	lea    rdi,[rbx+0x1a8]
    dec4:	48 8d 4c 24 0f       	lea    rcx,[rsp+0xf]
    dec9:	41 b8 01 00 00 00    	mov    r8d,0x1
    decf:	e8 75 66 00 00       	call   14549 <append>
    ded4:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    dedb:	48 83 c5 01          	add    rbp,0x1
    dedf:	49 3b 2c 24          	cmp    rbp,QWORD PTR [r12]
    dee3:	72 c2                	jb     dea7 <emit_align+0x35>
    dee5:	48 83 c4 10          	add    rsp,0x10
    dee9:	5b                   	pop    rbx
    deea:	5d                   	pop    rbp
    deeb:	41 5c                	pop    r12
    deed:	c3                   	ret

000000000000deee <parse_size_directives>:
    deee:	48 c7 87 a8 01 00 00 	mov    QWORD PTR [rdi+0x1a8],0x0
    def5:	00 00 00 00 
    def9:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
    defc:	3c 10                	cmp    al,0x10
    defe:	0f 87 16 02 00 00    	ja     e11a <parse_size_directives+0x22c>
    df04:	41 54                	push   r12
    df06:	55                   	push   rbp
    df07:	53                   	push   rbx
    df08:	48 83 ec 10          	sub    rsp,0x10
    df0c:	48 89 fb             	mov    rbx,rdi
    df0f:	48 89 f5             	mov    rbp,rsi
    df12:	0f b6 c0             	movzx  eax,al
    df15:	48 8d 15 70 80 00 00 	lea    rdx,[rip+0x8070]        # 15f8c <_IO_stdin_used+0xf8c>
    df1c:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
    df20:	48 01 d0             	add    rax,rdx
    df23:	ff e0                	jmp    rax
    df25:	49 63 cc             	movsxd rcx,r12d
    df28:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
    df2c:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    df33:	48 8d b3 b0 01 00 00 	lea    rsi,[rbx+0x1b0]
    df3a:	48 8d bb a8 01 00 00 	lea    rdi,[rbx+0x1a8]
    df41:	41 b8 01 00 00 00    	mov    r8d,0x1
    df47:	e8 fd 65 00 00       	call   14549 <append>
    df4c:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    df53:	41 83 c4 01          	add    r12d,0x1
    df57:	44 39 63 18          	cmp    DWORD PTR [rbx+0x18],r12d
    df5b:	7f c8                	jg     df25 <parse_size_directives+0x37>
    df5d:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
    df64:	48 01 45 00          	add    QWORD PTR [rbp+0x0],rax
    df68:	48 83 c4 10          	add    rsp,0x10
    df6c:	5b                   	pop    rbx
    df6d:	5d                   	pop    rbp
    df6e:	41 5c                	pop    r12
    df70:	c3                   	ret
    df71:	41 bc 00 00 00 00    	mov    r12d,0x0
    df77:	eb de                	jmp    df57 <parse_size_directives+0x69>
    df79:	c7 44 24 08 00 00 00 	mov    DWORD PTR [rsp+0x8],0x0
    df80:	00 
    df81:	41 bc 00 00 00 00    	mov    r12d,0x0
    df87:	eb 33                	jmp    dfbc <parse_size_directives+0xce>
    df89:	49 63 cc             	movsxd rcx,r12d
    df8c:	48 01 c9             	add    rcx,rcx
    df8f:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
    df93:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    df9a:	48 8d b3 b0 01 00 00 	lea    rsi,[rbx+0x1b0]
    dfa1:	48 8d 7c 24 08       	lea    rdi,[rsp+0x8]
    dfa6:	41 b8 02 00 00 00    	mov    r8d,0x2
    dfac:	e8 98 65 00 00       	call   14549 <append>
    dfb1:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    dfb8:	41 83 c4 01          	add    r12d,0x1
    dfbc:	44 39 63 18          	cmp    DWORD PTR [rbx+0x18],r12d
    dfc0:	7f c7                	jg     df89 <parse_size_directives+0x9b>
    dfc2:	48 63 44 24 08       	movsxd rax,DWORD PTR [rsp+0x8]
    dfc7:	48 01 c0             	add    rax,rax
    dfca:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    dfd1:	48 01 45 00          	add    QWORD PTR [rbp+0x0],rax
    dfd5:	eb 91                	jmp    df68 <parse_size_directives+0x7a>
    dfd7:	c7 44 24 08 00 00 00 	mov    DWORD PTR [rsp+0x8],0x0
    dfde:	00 
    dfdf:	41 bc 00 00 00 00    	mov    r12d,0x0
    dfe5:	eb 34                	jmp    e01b <parse_size_directives+0x12d>
    dfe7:	49 63 cc             	movsxd rcx,r12d
    dfea:	48 c1 e1 02          	shl    rcx,0x2
    dfee:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
    dff2:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    dff9:	48 8d b3 b0 01 00 00 	lea    rsi,[rbx+0x1b0]
    e000:	48 8d 7c 24 08       	lea    rdi,[rsp+0x8]
    e005:	41 b8 04 00 00 00    	mov    r8d,0x4
    e00b:	e8 39 65 00 00       	call   14549 <append>
    e010:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    e017:	41 83 c4 01          	add    r12d,0x1
    e01b:	44 39 63 18          	cmp    DWORD PTR [rbx+0x18],r12d
    e01f:	7f c6                	jg     dfe7 <parse_size_directives+0xf9>
    e021:	48 63 44 24 08       	movsxd rax,DWORD PTR [rsp+0x8]
    e026:	48 c1 e0 02          	shl    rax,0x2
    e02a:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    e031:	48 01 45 00          	add    QWORD PTR [rbp+0x0],rax
    e035:	e9 2e ff ff ff       	jmp    df68 <parse_size_directives+0x7a>
    e03a:	c7 44 24 04 00 00 00 	mov    DWORD PTR [rsp+0x4],0x0
    e041:	00 
    e042:	41 bc 00 00 00 00    	mov    r12d,0x0
    e048:	eb 2e                	jmp    e078 <parse_size_directives+0x18a>
    e04a:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    e051:	48 8d b3 b0 01 00 00 	lea    rsi,[rbx+0x1b0]
    e058:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
    e05d:	48 8d 7c 24 04       	lea    rdi,[rsp+0x4]
    e062:	41 b8 08 00 00 00    	mov    r8d,0x8
    e068:	e8 dc 64 00 00       	call   14549 <append>
    e06d:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    e074:	41 83 c4 01          	add    r12d,0x1
    e078:	44 39 63 18          	cmp    DWORD PTR [rbx+0x18],r12d
    e07c:	7e 24                	jle    e0a2 <parse_size_directives+0x1b4>
    e07e:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    e085:	00 00 
    e087:	49 63 c4             	movsxd rax,r12d
    e08a:	48 c1 e0 05          	shl    rax,0x5
    e08e:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
    e092:	83 38 01             	cmp    DWORD PTR [rax],0x1
    e095:	74 b3                	je     e04a <parse_size_directives+0x15c>
    e097:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    e09b:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
    e0a0:	eb a8                	jmp    e04a <parse_size_directives+0x15c>
    e0a2:	48 63 44 24 04       	movsxd rax,DWORD PTR [rsp+0x4]
    e0a7:	48 c1 e0 03          	shl    rax,0x3
    e0ab:	48 89 83 a8 01 00 00 	mov    QWORD PTR [rbx+0x1a8],rax
    e0b2:	48 8b 55 00          	mov    rdx,QWORD PTR [rbp+0x0]
    e0b6:	48 89 53 20          	mov    QWORD PTR [rbx+0x20],rdx
    e0ba:	48 01 d0             	add    rax,rdx
    e0bd:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
    e0c1:	e9 a2 fe ff ff       	jmp    df68 <parse_size_directives+0x7a>
    e0c6:	80 3d 1d cb 00 00 00 	cmp    BYTE PTR [rip+0xcb1d],0x0        # 1abea <obj_file>
    e0cd:	0f 85 95 fe ff ff    	jne    df68 <parse_size_directives+0x7a>
    e0d3:	c6 44 24 08 00       	mov    BYTE PTR [rsp+0x8],0x0
    e0d8:	bd 00 00 00 00       	mov    ebp,0x0
    e0dd:	eb 30                	jmp    e10f <parse_size_directives+0x221>
    e0df:	48 8b 93 a0 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a0]
    e0e6:	48 8d b3 b0 01 00 00 	lea    rsi,[rbx+0x1b0]
    e0ed:	48 8d bb a8 01 00 00 	lea    rdi,[rbx+0x1a8]
    e0f4:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
    e0f9:	41 b8 01 00 00 00    	mov    r8d,0x1
    e0ff:	e8 45 64 00 00       	call   14549 <append>
    e104:	48 89 83 a0 01 00 00 	mov    QWORD PTR [rbx+0x1a0],rax
    e10b:	48 83 c5 01          	add    rbp,0x1
    e10f:	48 3b 6b 10          	cmp    rbp,QWORD PTR [rbx+0x10]
    e113:	72 ca                	jb     e0df <parse_size_directives+0x1f1>
    e115:	e9 4e fe ff ff       	jmp    df68 <parse_size_directives+0x7a>
    e11a:	c3                   	ret

000000000000e11b <add_token>:
    e11b:	55                   	push   rbp
    e11c:	53                   	push   rbx
    e11d:	48 83 ec 18          	sub    rsp,0x18
    e121:	89 fb                	mov    ebx,edi
    e123:	48 89 f7             	mov    rdi,rsi
    e126:	89 d5                	mov    ebp,edx
    e128:	e8 c3 50 ff ff       	call   31f0 <strdup@plt>
    e12d:	48 89 04 24          	mov    QWORD PTR [rsp],rax
    e131:	89 6c 24 08          	mov    DWORD PTR [rsp+0x8],ebp
    e135:	89 5c 24 0c          	mov    DWORD PTR [rsp+0xc],ebx
    e139:	48 89 e1             	mov    rcx,rsp
    e13c:	41 b8 10 00 00 00    	mov    r8d,0x10
    e142:	48 8b 15 af ca 00 00 	mov    rdx,QWORD PTR [rip+0xcaaf]        # 1abf8 <toks>
    e149:	48 8d 35 a0 ca 00 00 	lea    rsi,[rip+0xcaa0]        # 1abf0 <toks_cap>
    e150:	48 8d 3d 9d ca 00 00 	lea    rdi,[rip+0xca9d]        # 1abf4 <toks_len>
    e157:	e8 ed 63 00 00       	call   14549 <append>
    e15c:	48 89 05 95 ca 00 00 	mov    QWORD PTR [rip+0xca95],rax        # 1abf8 <toks>
    e163:	48 83 c4 18          	add    rsp,0x18
    e167:	5b                   	pop    rbx
    e168:	5d                   	pop    rbp
    e169:	c3                   	ret

000000000000e16a <del_all_toks>:
    e16a:	55                   	push   rbp
    e16b:	53                   	push   rbx
    e16c:	48 83 ec 08          	sub    rsp,0x8
    e170:	bd 00 00 00 00       	mov    ebp,0x0
    e175:	eb 2b                	jmp    e1a2 <del_all_toks+0x38>
    e177:	48 89 eb             	mov    rbx,rbp
    e17a:	48 c1 e3 04          	shl    rbx,0x4
    e17e:	48 89 d8             	mov    rax,rbx
    e181:	48 03 05 70 ca 00 00 	add    rax,QWORD PTR [rip+0xca70]        # 1abf8 <toks>
    e188:	48 8b 38             	mov    rdi,QWORD PTR [rax]
    e18b:	e8 a0 4e ff ff       	call   3030 <free@plt>
    e190:	48 03 1d 61 ca 00 00 	add    rbx,QWORD PTR [rip+0xca61]        # 1abf8 <toks>
    e197:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
    e19e:	48 83 c5 01          	add    rbp,0x1
    e1a2:	48 63 05 4b ca 00 00 	movsxd rax,DWORD PTR [rip+0xca4b]        # 1abf4 <toks_len>
    e1a9:	48 39 c5             	cmp    rbp,rax
    e1ac:	72 c9                	jb     e177 <del_all_toks+0xd>
    e1ae:	48 8b 3d 43 ca 00 00 	mov    rdi,QWORD PTR [rip+0xca43]        # 1abf8 <toks>
    e1b5:	e8 76 4e ff ff       	call   3030 <free@plt>
    e1ba:	48 83 c4 08          	add    rsp,0x8
    e1be:	5b                   	pop    rbx
    e1bf:	5d                   	pop    rbp
    e1c0:	c3                   	ret

000000000000e1c1 <read_string>:
    e1c1:	48 89 f8             	mov    rax,rdi
    e1c4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    e1c7:	80 fa 22             	cmp    dl,0x22
    e1ca:	0f 84 a0 00 00 00    	je     e270 <read_string+0xaf>
    e1d0:	84 d2                	test   dl,dl
    e1d2:	0f 84 98 00 00 00    	je     e270 <read_string+0xaf>
    e1d8:	80 fa 5c             	cmp    dl,0x5c
    e1db:	74 0c                	je     e1e9 <read_string+0x28>
    e1dd:	48 83 c0 01          	add    rax,0x1
    e1e1:	88 16                	mov    BYTE PTR [rsi],dl
    e1e3:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e1e7:	eb db                	jmp    e1c4 <read_string+0x3>
    e1e9:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
    e1ed:	80 fa 62             	cmp    dl,0x62
    e1f0:	74 6e                	je     e260 <read_string+0x9f>
    e1f2:	7f 2f                	jg     e223 <read_string+0x62>
    e1f4:	80 fa 2f             	cmp    dl,0x2f
    e1f7:	74 57                	je     e250 <read_string+0x8f>
    e1f9:	80 fa 5c             	cmp    dl,0x5c
    e1fc:	75 0d                	jne    e20b <read_string+0x4a>
    e1fe:	c6 06 5c             	mov    BYTE PTR [rsi],0x5c
    e201:	48 83 c0 02          	add    rax,0x2
    e205:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e209:	eb b9                	jmp    e1c4 <read_string+0x3>
    e20b:	80 fa 22             	cmp    dl,0x22
    e20e:	75 0d                	jne    e21d <read_string+0x5c>
    e210:	c6 06 22             	mov    BYTE PTR [rsi],0x22
    e213:	48 83 c0 02          	add    rax,0x2
    e217:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e21b:	eb a7                	jmp    e1c4 <read_string+0x3>
    e21d:	b8 00 00 00 00       	mov    eax,0x0
    e222:	c3                   	ret
    e223:	80 fa 6e             	cmp    dl,0x6e
    e226:	74 18                	je     e240 <read_string+0x7f>
    e228:	80 fa 74             	cmp    dl,0x74
    e22b:	75 0d                	jne    e23a <read_string+0x79>
    e22d:	c6 06 09             	mov    BYTE PTR [rsi],0x9
    e230:	48 83 c0 02          	add    rax,0x2
    e234:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e238:	eb 8a                	jmp    e1c4 <read_string+0x3>
    e23a:	b8 00 00 00 00       	mov    eax,0x0
    e23f:	c3                   	ret
    e240:	c6 06 0a             	mov    BYTE PTR [rsi],0xa
    e243:	48 83 c0 02          	add    rax,0x2
    e247:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e24b:	e9 74 ff ff ff       	jmp    e1c4 <read_string+0x3>
    e250:	c6 06 2f             	mov    BYTE PTR [rsi],0x2f
    e253:	48 83 c0 02          	add    rax,0x2
    e257:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e25b:	e9 64 ff ff ff       	jmp    e1c4 <read_string+0x3>
    e260:	c6 06 08             	mov    BYTE PTR [rsi],0x8
    e263:	48 83 c0 02          	add    rax,0x2
    e267:	48 8d 76 01          	lea    rsi,[rsi+0x1]
    e26b:	e9 54 ff ff ff       	jmp    e1c4 <read_string+0x3>
    e270:	c3                   	ret

000000000000e271 <LEXER>:
    e271:	41 57                	push   r15
    e273:	41 56                	push   r14
    e275:	41 55                	push   r13
    e277:	41 54                	push   r12
    e279:	55                   	push   rbp
    e27a:	53                   	push   rbx
    e27b:	48 81 ec e8 00 20 00 	sub    rsp,0x2000e8
    e282:	48 85 ff             	test   rdi,rdi
    e285:	74 2a                	je     e2b1 <LEXER+0x40>
    e287:	49 89 fd             	mov    r13,rdi
    e28a:	48 8d bc 24 80 00 10 	lea    rdi,[rsp+0x100080]
    e291:	00 
    e292:	ba 50 00 10 00       	mov    edx,0x100050
    e297:	be 00 00 00 00       	mov    esi,0x0
    e29c:	e8 6f 4e ff ff       	call   3110 <memset@plt>
    e2a1:	bd 00 00 00 00       	mov    ebp,0x0
    e2a6:	41 bc 00 00 00 00    	mov    r12d,0x0
    e2ac:	e9 bb 00 00 00       	jmp    e36c <LEXER+0xfb>
    e2b1:	48 8b 0d 28 c9 00 00 	mov    rcx,QWORD PTR [rip+0xc928]        # 1abe0 <stderr@GLIBC_2.2.5>
    e2b8:	ba 2d 00 00 00       	mov    edx,0x2d
    e2bd:	be 01 00 00 00       	mov    esi,0x1
    e2c2:	48 8d 3d 5f 7d 00 00 	lea    rdi,[rip+0x7d5f]        # 16028 <_IO_stdin_used+0x1028>
    e2c9:	e8 12 4f ff ff       	call   31e0 <fwrite@plt>
    e2ce:	bf 01 00 00 00       	mov    edi,0x1
    e2d3:	e8 f8 4e ff ff       	call   31d0 <exit@plt>
    e2d8:	48 83 c3 01          	add    rbx,0x1
    e2dc:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    e2df:	3c 20                	cmp    al,0x20
    e2e1:	74 f5                	je     e2d8 <LEXER+0x67>
    e2e3:	84 c0                	test   al,al
    e2e5:	0f 94 c2             	sete   dl
    e2e8:	3c 0a                	cmp    al,0xa
    e2ea:	0f 94 c1             	sete   cl
    e2ed:	08 ca                	or     dl,cl
    e2ef:	75 67                	jne    e358 <LEXER+0xe7>
    e2f1:	3c 2f                	cmp    al,0x2f
    e2f3:	74 3c                	je     e331 <LEXER+0xc0>
    e2f5:	3c 3b                	cmp    al,0x3b
    e2f7:	74 5f                	je     e358 <LEXER+0xe7>
    e2f9:	45 85 e4             	test   r12d,r12d
    e2fc:	75 4d                	jne    e34b <LEXER+0xda>
    e2fe:	3c 2f                	cmp    al,0x2f
    e300:	74 37                	je     e339 <LEXER+0xc8>
    e302:	3c 5e                	cmp    al,0x5e
    e304:	0f 8f 9f 00 00 00    	jg     e3a9 <LEXER+0x138>
    e30a:	3c 24                	cmp    al,0x24
    e30c:	0f 8c 9b 01 00 00    	jl     e4ad <LEXER+0x23c>
    e312:	8d 50 dc             	lea    edx,[rax-0x24]
    e315:	80 fa 3a             	cmp    dl,0x3a
    e318:	0f 87 8f 01 00 00    	ja     e4ad <LEXER+0x23c>
    e31e:	0f b6 d2             	movzx  edx,dl
    e321:	48 8d 0d 24 7f 00 00 	lea    rcx,[rip+0x7f24]        # 1624c <_IO_stdin_used+0x124c>
    e328:	48 63 14 91          	movsxd rdx,DWORD PTR [rcx+rdx*4]
    e32c:	48 01 ca             	add    rdx,rcx
    e32f:	ff e2                	jmp    rdx
    e331:	80 7b 01 2f          	cmp    BYTE PTR [rbx+0x1],0x2f
    e335:	75 be                	jne    e2f5 <LEXER+0x84>
    e337:	eb 1f                	jmp    e358 <LEXER+0xe7>
    e339:	80 7b 01 2a          	cmp    BYTE PTR [rbx+0x1],0x2a
    e33d:	75 c3                	jne    e302 <LEXER+0x91>
    e33f:	48 83 c3 02          	add    rbx,0x2
    e343:	41 bc 01 00 00 00    	mov    r12d,0x1
    e349:	eb 08                	jmp    e353 <LEXER+0xe2>
    e34b:	3c 2a                	cmp    al,0x2a
    e34d:	74 48                	je     e397 <LEXER+0x126>
    e34f:	48 83 c3 01          	add    rbx,0x1
    e353:	80 3b 00             	cmp    BYTE PTR [rbx],0x0
    e356:	75 84                	jne    e2dc <LEXER+0x6b>
    e358:	0f b7 d5             	movzx  edx,bp
    e35b:	48 8d 35 ad 8b 00 00 	lea    rsi,[rip+0x8bad]        # 16f0f <_IO_stdin_used+0x1f0f>
    e362:	bf 17 00 00 00       	mov    edi,0x17
    e367:	e8 af fd ff ff       	call   e11b <add_token>
    e36c:	48 8d bc 24 88 00 10 	lea    rdi,[rsp+0x100088]
    e373:	00 
    e374:	4c 89 ea             	mov    rdx,r13
    e377:	be 00 00 10 00       	mov    esi,0x100000
    e37c:	e8 af 4d ff ff       	call   3130 <fgets@plt>
    e381:	48 85 c0             	test   rax,rax
    e384:	0f 84 81 12 00 00    	je     f60b <LEXER+0x139a>
    e38a:	83 c5 01             	add    ebp,0x1
    e38d:	48 8d 9c 24 88 00 10 	lea    rbx,[rsp+0x100088]
    e394:	00 
    e395:	eb bc                	jmp    e353 <LEXER+0xe2>
    e397:	80 7b 01 2f          	cmp    BYTE PTR [rbx+0x1],0x2f
    e39b:	75 b2                	jne    e34f <LEXER+0xde>
    e39d:	48 83 c3 02          	add    rbx,0x2
    e3a1:	41 bc 00 00 00 00    	mov    r12d,0x0
    e3a7:	eb aa                	jmp    e353 <LEXER+0xe2>
    e3a9:	3c 7c                	cmp    al,0x7c
    e3ab:	0f 85 fc 00 00 00    	jne    e4ad <LEXER+0x23c>
    e3b1:	48 83 c3 01          	add    rbx,0x1
    e3b5:	0f b7 d5             	movzx  edx,bp
    e3b8:	48 8d 35 29 7c 00 00 	lea    rsi,[rip+0x7c29]        # 15fe8 <_IO_stdin_used+0xfe8>
    e3bf:	bf 0b 00 00 00       	mov    edi,0xb
    e3c4:	e8 52 fd ff ff       	call   e11b <add_token>
    e3c9:	eb 88                	jmp    e353 <LEXER+0xe2>
    e3cb:	c6 84 24 de 00 20 00 	mov    BYTE PTR [rsp+0x2000de],0x24
    e3d2:	24 
    e3d3:	c6 84 24 df 00 20 00 	mov    BYTE PTR [rsp+0x2000df],0x0
    e3da:	00 
    e3db:	0f b7 d5             	movzx  edx,bp
    e3de:	48 8d b4 24 de 00 20 	lea    rsi,[rsp+0x2000de]
    e3e5:	00 
    e3e6:	bf 28 00 00 00       	mov    edi,0x28
    e3eb:	e8 2b fd ff ff       	call   e11b <add_token>
    e3f0:	48 83 c3 01          	add    rbx,0x1
    e3f4:	e9 5a ff ff ff       	jmp    e353 <LEXER+0xe2>
    e3f9:	48 83 c3 01          	add    rbx,0x1
    e3fd:	0f b7 d5             	movzx  edx,bp
    e400:	48 8d 35 db 7b 00 00 	lea    rsi,[rip+0x7bdb]        # 15fe2 <_IO_stdin_used+0xfe2>
    e407:	bf 04 00 00 00       	mov    edi,0x4
    e40c:	e8 0a fd ff ff       	call   e11b <add_token>
    e411:	e9 3d ff ff ff       	jmp    e353 <LEXER+0xe2>
    e416:	48 83 c3 01          	add    rbx,0x1
    e41a:	0f b7 d5             	movzx  edx,bp
    e41d:	48 8d 35 4f 6f 00 00 	lea    rsi,[rip+0x6f4f]        # 15373 <_IO_stdin_used+0x373>
    e424:	bf 03 00 00 00       	mov    edi,0x3
    e429:	e8 ed fc ff ff       	call   e11b <add_token>
    e42e:	e9 20 ff ff ff       	jmp    e353 <LEXER+0xe2>
    e433:	48 83 c3 01          	add    rbx,0x1
    e437:	0f b7 d5             	movzx  edx,bp
    e43a:	48 8d 35 a3 7b 00 00 	lea    rsi,[rip+0x7ba3]        # 15fe4 <_IO_stdin_used+0xfe4>
    e441:	bf 06 00 00 00       	mov    edi,0x6
    e446:	e8 d0 fc ff ff       	call   e11b <add_token>
    e44b:	e9 03 ff ff ff       	jmp    e353 <LEXER+0xe2>
    e450:	48 83 c3 01          	add    rbx,0x1
    e454:	0f b7 d5             	movzx  edx,bp
    e457:	48 8d 35 88 7b 00 00 	lea    rsi,[rip+0x7b88]        # 15fe6 <_IO_stdin_used+0xfe6>
    e45e:	bf 05 00 00 00       	mov    edi,0x5
    e463:	e8 b3 fc ff ff       	call   e11b <add_token>
    e468:	e9 e6 fe ff ff       	jmp    e353 <LEXER+0xe2>
    e46d:	48 83 c3 01          	add    rbx,0x1
    e471:	0f b7 d5             	movzx  edx,bp
    e474:	48 8d 35 6f 7b 00 00 	lea    rsi,[rip+0x7b6f]        # 15fea <_IO_stdin_used+0xfea>
    e47b:	bf 09 00 00 00       	mov    edi,0x9
    e480:	e8 96 fc ff ff       	call   e11b <add_token>
    e485:	e9 c9 fe ff ff       	jmp    e353 <LEXER+0xe2>
    e48a:	48 83 c3 01          	add    rbx,0x1
    e48e:	0f b7 d5             	movzx  edx,bp
    e491:	48 8d 35 54 7b 00 00 	lea    rsi,[rip+0x7b54]        # 15fec <_IO_stdin_used+0xfec>
    e498:	bf 0a 00 00 00       	mov    edi,0xa
    e49d:	e8 79 fc ff ff       	call   e11b <add_token>
    e4a2:	e9 ac fe ff ff       	jmp    e353 <LEXER+0xe2>
    e4a7:	80 7b 01 3e          	cmp    BYTE PTR [rbx+0x1],0x3e
    e4ab:	74 74                	je     e521 <LEXER+0x2b0>
    e4ad:	3c 3c                	cmp    al,0x3c
    e4af:	0f 84 89 00 00 00    	je     e53e <LEXER+0x2cd>
    e4b5:	3c 28                	cmp    al,0x28
    e4b7:	0f 84 a8 00 00 00    	je     e565 <LEXER+0x2f4>
    e4bd:	3c 29                	cmp    al,0x29
    e4bf:	0f 84 bd 00 00 00    	je     e582 <LEXER+0x311>
    e4c5:	8d 50 d0             	lea    edx,[rax-0x30]
    e4c8:	80 fa 09             	cmp    dl,0x9
    e4cb:	0f 86 ce 00 00 00    	jbe    e59f <LEXER+0x32e>
    e4d1:	0f be f0             	movsx  esi,al
    e4d4:	48 8b 3d 55 bc 00 00 	mov    rdi,QWORD PTR [rip+0xbc55]        # 1a130 <LETEXT>
    e4db:	e8 a0 52 00 00       	call   13780 <isin>
    e4e0:	85 c0                	test   eax,eax
    e4e2:	0f 85 e5 02 00 00    	jne    e7cd <LEXER+0x55c>
    e4e8:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
    e4eb:	80 fa 2e             	cmp    dl,0x2e
    e4ee:	0f 84 a9 09 00 00    	je     ee9d <LEXER+0xc2c>
    e4f4:	80 fa 22             	cmp    dl,0x22
    e4f7:	0f 84 f2 0b 00 00    	je     f0ef <LEXER+0xe7e>
    e4fd:	80 fa 27             	cmp    dl,0x27
    e500:	0f 84 f6 0d 00 00    	je     f2fc <LEXER+0x108b>
    e506:	80 fa 5b             	cmp    dl,0x5b
    e509:	0f 84 bd 0e 00 00    	je     f3cc <LEXER+0x115b>
    e50f:	80 fa 2c             	cmp    dl,0x2c
    e512:	0f 85 ce 10 00 00    	jne    f5e6 <LEXER+0x1375>
    e518:	48 83 c3 01          	add    rbx,0x1
    e51c:	e9 a7 10 00 00       	jmp    f5c8 <LEXER+0x1357>
    e521:	48 83 c3 02          	add    rbx,0x2
    e525:	0f b7 d5             	movzx  edx,bp
    e528:	48 8d 35 bf 7a 00 00 	lea    rsi,[rip+0x7abf]        # 15fee <_IO_stdin_used+0xfee>
    e52f:	bf 08 00 00 00       	mov    edi,0x8
    e534:	e8 e2 fb ff ff       	call   e11b <add_token>
    e539:	e9 15 fe ff ff       	jmp    e353 <LEXER+0xe2>
    e53e:	80 7b 01 3c          	cmp    BYTE PTR [rbx+0x1],0x3c
    e542:	0f 85 6d ff ff ff    	jne    e4b5 <LEXER+0x244>
    e548:	48 83 c3 02          	add    rbx,0x2
    e54c:	0f b7 d5             	movzx  edx,bp
    e54f:	48 8d 35 9b 7a 00 00 	lea    rsi,[rip+0x7a9b]        # 15ff1 <_IO_stdin_used+0xff1>
    e556:	bf 07 00 00 00       	mov    edi,0x7
    e55b:	e8 bb fb ff ff       	call   e11b <add_token>
    e560:	e9 ee fd ff ff       	jmp    e353 <LEXER+0xe2>
    e565:	48 83 c3 01          	add    rbx,0x1
    e569:	0f b7 d5             	movzx  edx,bp
    e56c:	48 8d 35 81 7a 00 00 	lea    rsi,[rip+0x7a81]        # 15ff4 <_IO_stdin_used+0xff4>
    e573:	bf 0d 00 00 00       	mov    edi,0xd
    e578:	e8 9e fb ff ff       	call   e11b <add_token>
    e57d:	e9 d1 fd ff ff       	jmp    e353 <LEXER+0xe2>
    e582:	48 83 c3 01          	add    rbx,0x1
    e586:	0f b7 d5             	movzx  edx,bp
    e589:	48 8d 35 38 7e 00 00 	lea    rsi,[rip+0x7e38]        # 163c8 <_IO_stdin_used+0x13c8>
    e590:	bf 0c 00 00 00       	mov    edi,0xc
    e595:	e8 81 fb ff ff       	call   e11b <add_token>
    e59a:	e9 b4 fd ff ff       	jmp    e353 <LEXER+0xe2>
    e59f:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
    e5a6:	00 00 00 00 00 
    e5ab:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    e5b2:	00 00 00 00 00 
    e5b7:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x0
    e5be:	00 00 00 00 00 
    e5c3:	48 c7 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],0x0
    e5ca:	00 00 00 00 00 
    e5cf:	48 c7 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],0x0
    e5d6:	00 00 00 00 00 
    e5db:	48 c7 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],0x0
    e5e2:	00 00 00 00 00 
    e5e7:	48 c7 84 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],0x0
    e5ee:	00 00 00 00 00 
    e5f3:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x0
    e5fa:	00 00 00 00 00 
    e5ff:	48 c7 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],0x0
    e606:	00 00 00 00 00 
    e60b:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x0
    e612:	00 00 00 00 00 
    e617:	48 c7 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],0x0
    e61e:	00 00 00 00 00 
    e623:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x0
    e62a:	00 00 00 00 00 
    e62f:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
    e636:	00 00 00 00 00 
    e63b:	48 c7 84 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
    e642:	00 00 00 00 00 
    e647:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
    e64e:	00 00 00 00 00 
    e653:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
    e65a:	00 00 00 00 00 
    e65f:	44 89 e1             	mov    ecx,r12d
    e662:	45 89 e0             	mov    r8d,r12d
    e665:	44 89 e2             	mov    edx,r12d
    e668:	eb 54                	jmp    e6be <LEXER+0x44d>
    e66a:	83 c1 01             	add    ecx,0x1
    e66d:	41 b8 01 00 00 00    	mov    r8d,0x1
    e673:	eb 40                	jmp    e6b5 <LEXER+0x444>
    e675:	0f b7 d5             	movzx  edx,bp
    e678:	48 8d 35 d9 79 00 00 	lea    rsi,[rip+0x79d9]        # 16058 <_IO_stdin_used+0x1058>
    e67f:	48 8b 3d 5a c5 00 00 	mov    rdi,QWORD PTR [rip+0xc55a]        # 1abe0 <stderr@GLIBC_2.2.5>
    e686:	b8 00 00 00 00       	mov    eax,0x0
    e68b:	e8 b0 4a ff ff       	call   3140 <fprintf@plt>
    e690:	bf 01 00 00 00       	mov    edi,0x1
    e695:	e8 36 4b ff ff       	call   31d0 <exit@plt>
    e69a:	3c 2e                	cmp    al,0x2e
    e69c:	75 65                	jne    e703 <LEXER+0x492>
    e69e:	83 fa 7e             	cmp    edx,0x7e
    e6a1:	7f 0d                	jg     e6b0 <LEXER+0x43f>
    e6a3:	48 63 f2             	movsxd rsi,edx
    e6a6:	88 84 34 80 00 00 00 	mov    BYTE PTR [rsp+rsi*1+0x80],al
    e6ad:	8d 52 01             	lea    edx,[rdx+0x1]
    e6b0:	80 3b 2e             	cmp    BYTE PTR [rbx],0x2e
    e6b3:	74 b5                	je     e66a <LEXER+0x3f9>
    e6b5:	83 f9 01             	cmp    ecx,0x1
    e6b8:	7f bb                	jg     e675 <LEXER+0x404>
    e6ba:	48 83 c3 01          	add    rbx,0x1
    e6be:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    e6c1:	84 c0                	test   al,al
    e6c3:	74 d5                	je     e69a <LEXER+0x429>
    e6c5:	8d 70 d0             	lea    esi,[rax-0x30]
    e6c8:	40 80 fe 09          	cmp    sil,0x9
    e6cc:	40 0f 96 c6          	setbe  sil
    e6d0:	8d 78 9f             	lea    edi,[rax-0x61]
    e6d3:	40 80 ff 05          	cmp    dil,0x5
    e6d7:	40 0f 96 c7          	setbe  dil
    e6db:	40 08 fe             	or     sil,dil
    e6de:	75 be                	jne    e69e <LEXER+0x42d>
    e6e0:	8d 70 bf             	lea    esi,[rax-0x41]
    e6e3:	40 80 fe 05          	cmp    sil,0x5
    e6e7:	76 b5                	jbe    e69e <LEXER+0x42d>
    e6e9:	3c 78                	cmp    al,0x78
    e6eb:	74 b1                	je     e69e <LEXER+0x42d>
    e6ed:	3c 58                	cmp    al,0x58
    e6ef:	74 ad                	je     e69e <LEXER+0x42d>
    e6f1:	3c 6f                	cmp    al,0x6f
    e6f3:	74 a9                	je     e69e <LEXER+0x42d>
    e6f5:	3c 4f                	cmp    al,0x4f
    e6f7:	74 a5                	je     e69e <LEXER+0x42d>
    e6f9:	3c 62                	cmp    al,0x62
    e6fb:	74 a1                	je     e69e <LEXER+0x42d>
    e6fd:	3c 42                	cmp    al,0x42
    e6ff:	75 99                	jne    e69a <LEXER+0x429>
    e701:	eb 9b                	jmp    e69e <LEXER+0x42d>
    e703:	48 63 c2             	movsxd rax,edx
    e706:	c6 84 04 80 00 00 00 	mov    BYTE PTR [rsp+rax*1+0x80],0x0
    e70d:	00 
    e70e:	45 85 c0             	test   r8d,r8d
    e711:	0f 84 ac 00 00 00    	je     e7c3 <LEXER+0x552>
    e717:	83 fa 01             	cmp    edx,0x1
    e71a:	7e 34                	jle    e750 <LEXER+0x4df>
    e71c:	0f b6 84 24 81 00 00 	movzx  eax,BYTE PTR [rsp+0x81]
    e723:	00 
    e724:	3c 78                	cmp    al,0x78
    e726:	0f 94 c1             	sete   cl
    e729:	3c 58                	cmp    al,0x58
    e72b:	40 0f 94 c6          	sete   sil
    e72f:	40 08 f1             	or     cl,sil
    e732:	75 45                	jne    e779 <LEXER+0x508>
    e734:	83 e8 42             	sub    eax,0x42
    e737:	3c 2d                	cmp    al,0x2d
    e739:	77 15                	ja     e750 <LEXER+0x4df>
    e73b:	48 be 01 20 00 00 01 	movabs rsi,0x200100002001
    e742:	20 00 00 
    e745:	89 c1                	mov    ecx,eax
    e747:	48 d3 ee             	shr    rsi,cl
    e74a:	40 f6 c6 01          	test   sil,0x1
    e74e:	75 29                	jne    e779 <LEXER+0x508>
    e750:	8d 42 ff             	lea    eax,[rdx-0x1]
    e753:	48 98                	cdqe
    e755:	80 bc 04 80 00 00 00 	cmp    BYTE PTR [rsp+rax*1+0x80],0x2e
    e75c:	2e 
    e75d:	74 3f                	je     e79e <LEXER+0x52d>
    e75f:	0f b7 d5             	movzx  edx,bp
    e762:	bf 02 00 00 00       	mov    edi,0x2
    e767:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    e76e:	00 
    e76f:	e8 a7 f9 ff ff       	call   e11b <add_token>
    e774:	e9 da fb ff ff       	jmp    e353 <LEXER+0xe2>
    e779:	0f b7 d5             	movzx  edx,bp
    e77c:	48 8d 35 d5 78 00 00 	lea    rsi,[rip+0x78d5]        # 16058 <_IO_stdin_used+0x1058>
    e783:	48 8b 3d 56 c4 00 00 	mov    rdi,QWORD PTR [rip+0xc456]        # 1abe0 <stderr@GLIBC_2.2.5>
    e78a:	b8 00 00 00 00       	mov    eax,0x0
    e78f:	e8 ac 49 ff ff       	call   3140 <fprintf@plt>
    e794:	bf 01 00 00 00       	mov    edi,0x1
    e799:	e8 32 4a ff ff       	call   31d0 <exit@plt>
    e79e:	0f b7 d5             	movzx  edx,bp
    e7a1:	48 8d 35 b0 78 00 00 	lea    rsi,[rip+0x78b0]        # 16058 <_IO_stdin_used+0x1058>
    e7a8:	48 8b 3d 31 c4 00 00 	mov    rdi,QWORD PTR [rip+0xc431]        # 1abe0 <stderr@GLIBC_2.2.5>
    e7af:	b8 00 00 00 00       	mov    eax,0x0
    e7b4:	e8 87 49 ff ff       	call   3140 <fprintf@plt>
    e7b9:	bf 01 00 00 00       	mov    edi,0x1
    e7be:	e8 0d 4a ff ff       	call   31d0 <exit@plt>
    e7c3:	0f b7 d5             	movzx  edx,bp
    e7c6:	bf 01 00 00 00       	mov    edi,0x1
    e7cb:	eb 9a                	jmp    e767 <LEXER+0x4f6>
    e7cd:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
    e7d4:	00 00 00 00 00 
    e7d9:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    e7e0:	00 00 00 00 00 
    e7e5:	48 8d bc 24 90 00 00 	lea    rdi,[rsp+0x90]
    e7ec:	00 
    e7ed:	ba f0 ff 0f 00       	mov    edx,0xffff0
    e7f2:	be 00 00 00 00       	mov    esi,0x0
    e7f7:	e8 14 49 ff ff       	call   3110 <memset@plt>
    e7fc:	45 89 e6             	mov    r14d,r12d
    e7ff:	eb 15                	jmp    e816 <LEXER+0x5a5>
    e801:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
    e804:	49 63 c6             	movsxd rax,r14d
    e807:	88 94 04 80 00 00 00 	mov    BYTE PTR [rsp+rax*1+0x80],dl
    e80e:	45 8d 76 01          	lea    r14d,[r14+0x1]
    e812:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
    e816:	0f be 33             	movsx  esi,BYTE PTR [rbx]
    e819:	48 8b 3d 10 b9 00 00 	mov    rdi,QWORD PTR [rip+0xb910]        # 1a130 <LETEXT>
    e820:	e8 5b 4f 00 00       	call   13780 <isin>
    e825:	85 c0                	test   eax,eax
    e827:	74 09                	je     e832 <LEXER+0x5c1>
    e829:	41 81 fe 00 00 10 00 	cmp    r14d,0x100000
    e830:	7e cf                	jle    e801 <LEXER+0x590>
    e832:	4d 63 f6             	movsxd r14,r14d
    e835:	42 c6 84 34 80 00 00 	mov    BYTE PTR [rsp+r14*1+0x80],0x0
    e83c:	00 00 
    e83e:	eb 04                	jmp    e844 <LEXER+0x5d3>
    e840:	48 83 c3 01          	add    rbx,0x1
    e844:	44 0f b6 33          	movzx  r14d,BYTE PTR [rbx]
    e848:	41 80 fe 20          	cmp    r14b,0x20
    e84c:	74 f2                	je     e840 <LEXER+0x5cf>
    e84e:	41 80 fe 09          	cmp    r14b,0x9
    e852:	74 ec                	je     e840 <LEXER+0x5cf>
    e854:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e85b:	00 
    e85c:	48 8d 35 93 77 00 00 	lea    rsi,[rip+0x7793]        # 15ff6 <_IO_stdin_used+0xff6>
    e863:	e8 e8 47 ff ff       	call   3050 <strcasecmp@plt>
    e868:	85 c0                	test   eax,eax
    e86a:	74 3b                	je     e8a7 <LEXER+0x636>
    e86c:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e873:	00 
    e874:	48 8d 35 82 77 00 00 	lea    rsi,[rip+0x7782]        # 15ffd <_IO_stdin_used+0xffd>
    e87b:	e8 d0 47 ff ff       	call   3050 <strcasecmp@plt>
    e880:	85 c0                	test   eax,eax
    e882:	75 7b                	jne    e8ff <LEXER+0x68e>
    e884:	80 3d 5f c3 00 00 00 	cmp    BYTE PTR [rip+0xc35f],0x0        # 1abea <obj_file>
    e88b:	74 34                	je     e8c1 <LEXER+0x650>
    e88d:	0f b7 d5             	movzx  edx,bp
    e890:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    e897:	00 
    e898:	bf 2a 00 00 00       	mov    edi,0x2a
    e89d:	e8 79 f8 ff ff       	call   e11b <add_token>
    e8a2:	e9 ac fa ff ff       	jmp    e353 <LEXER+0xe2>
    e8a7:	0f b7 d5             	movzx  edx,bp
    e8aa:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    e8b1:	00 
    e8b2:	bf 29 00 00 00       	mov    edi,0x29
    e8b7:	e8 5f f8 ff ff       	call   e11b <add_token>
    e8bc:	e9 92 fa ff ff       	jmp    e353 <LEXER+0xe2>
    e8c1:	80 3d 23 c3 00 00 00 	cmp    BYTE PTR [rip+0xc323],0x0        # 1abeb <pie_mode>
    e8c8:	74 2c                	je     e8f6 <LEXER+0x685>
    e8ca:	48 8d 0d 05 77 00 00 	lea    rcx,[rip+0x7705]        # 15fd6 <_IO_stdin_used+0xfd6>
    e8d1:	0f b7 d5             	movzx  edx,bp
    e8d4:	48 8d 35 ad 77 00 00 	lea    rsi,[rip+0x77ad]        # 16088 <_IO_stdin_used+0x1088>
    e8db:	48 8b 3d fe c2 00 00 	mov    rdi,QWORD PTR [rip+0xc2fe]        # 1abe0 <stderr@GLIBC_2.2.5>
    e8e2:	b8 00 00 00 00       	mov    eax,0x0
    e8e7:	e8 54 48 ff ff       	call   3140 <fprintf@plt>
    e8ec:	bf 01 00 00 00       	mov    edi,0x1
    e8f1:	e8 da 48 ff ff       	call   31d0 <exit@plt>
    e8f6:	48 8d 0d dd 76 00 00 	lea    rcx,[rip+0x76dd]        # 15fda <_IO_stdin_used+0xfda>
    e8fd:	eb d2                	jmp    e8d1 <LEXER+0x660>
    e8ff:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e906:	00 
    e907:	48 8b 35 d2 b8 00 00 	mov    rsi,QWORD PTR [rip+0xb8d2]        # 1a1e0 <HUMAN_AST2>
    e90e:	e8 3d 47 ff ff       	call   3050 <strcasecmp@plt>
    e913:	85 c0                	test   eax,eax
    e915:	0f 84 57 01 00 00    	je     ea72 <LEXER+0x801>
    e91b:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e922:	00 
    e923:	48 8b 35 be b8 00 00 	mov    rsi,QWORD PTR [rip+0xb8be]        # 1a1e8 <HUMAN_AST2+0x8>
    e92a:	e8 21 47 ff ff       	call   3050 <strcasecmp@plt>
    e92f:	85 c0                	test   eax,eax
    e931:	0f 84 54 01 00 00    	je     ea8b <LEXER+0x81a>
    e937:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e93e:	00 
    e93f:	48 8b 35 aa b8 00 00 	mov    rsi,QWORD PTR [rip+0xb8aa]        # 1a1f0 <HUMAN_AST2+0x10>
    e946:	e8 05 47 ff ff       	call   3050 <strcasecmp@plt>
    e94b:	85 c0                	test   eax,eax
    e94d:	0f 84 51 01 00 00    	je     eaa4 <LEXER+0x833>
    e953:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e95a:	00 
    e95b:	48 8b 35 96 b8 00 00 	mov    rsi,QWORD PTR [rip+0xb896]        # 1a1f8 <HUMAN_AST2+0x18>
    e962:	e8 e9 46 ff ff       	call   3050 <strcasecmp@plt>
    e967:	85 c0                	test   eax,eax
    e969:	0f 84 4e 01 00 00    	je     eabd <LEXER+0x84c>
    e96f:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e976:	00 
    e977:	48 8d 35 86 76 00 00 	lea    rsi,[rip+0x7686]        # 16004 <_IO_stdin_used+0x1004>
    e97e:	e8 cd 46 ff ff       	call   3050 <strcasecmp@plt>
    e983:	85 c0                	test   eax,eax
    e985:	0f 84 4b 01 00 00    	je     ead6 <LEXER+0x865>
    e98b:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e992:	00 
    e993:	48 8d 35 6f 76 00 00 	lea    rsi,[rip+0x766f]        # 16009 <_IO_stdin_used+0x1009>
    e99a:	e8 b1 46 ff ff       	call   3050 <strcasecmp@plt>
    e99f:	85 c0                	test   eax,eax
    e9a1:	0f 84 48 01 00 00    	je     eaef <LEXER+0x87e>
    e9a7:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e9ae:	00 
    e9af:	48 8d 35 58 76 00 00 	lea    rsi,[rip+0x7658]        # 1600e <_IO_stdin_used+0x100e>
    e9b6:	e8 95 46 ff ff       	call   3050 <strcasecmp@plt>
    e9bb:	85 c0                	test   eax,eax
    e9bd:	0f 84 45 01 00 00    	je     eb08 <LEXER+0x897>
    e9c3:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e9ca:	00 
    e9cb:	48 8d 35 41 76 00 00 	lea    rsi,[rip+0x7641]        # 16013 <_IO_stdin_used+0x1013>
    e9d2:	e8 79 46 ff ff       	call   3050 <strcasecmp@plt>
    e9d7:	85 c0                	test   eax,eax
    e9d9:	0f 84 42 01 00 00    	je     eb21 <LEXER+0x8b0>
    e9df:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    e9e6:	00 
    e9e7:	48 8d 35 2a 76 00 00 	lea    rsi,[rip+0x762a]        # 16018 <_IO_stdin_used+0x1018>
    e9ee:	e8 5d 46 ff ff       	call   3050 <strcasecmp@plt>
    e9f3:	41 89 c7             	mov    r15d,eax
    e9f6:	85 c0                	test   eax,eax
    e9f8:	0f 84 40 01 00 00    	je     eb3e <LEXER+0x8cd>
    e9fe:	41 80 fe 3a          	cmp    r14b,0x3a
    ea02:	0f 84 21 02 00 00    	je     ec29 <LEXER+0x9b8>
    ea08:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ea0f:	00 
    ea10:	48 8d 3d c9 b8 00 00 	lea    rdi,[rip+0xb8c9]        # 1a2e0 <CMDS>
    ea17:	e8 8a 4d 00 00       	call   137a6 <is2arrin>
    ea1c:	85 c0                	test   eax,eax
    ea1e:	0f 85 23 02 00 00    	jne    ec47 <LEXER+0x9d6>
    ea24:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ea2b:	00 
    ea2c:	48 8d 3d 4d c1 00 00 	lea    rdi,[rip+0xc14d]        # 1ab80 <regs8>
    ea33:	e8 6e 4d 00 00       	call   137a6 <is2arrin>
    ea38:	85 c0                	test   eax,eax
    ea3a:	75 1c                	jne    ea58 <LEXER+0x7e7>
    ea3c:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ea43:	00 
    ea44:	48 8d 3d d5 c0 00 00 	lea    rdi,[rip+0xc0d5]        # 1ab20 <regs8GP>
    ea4b:	e8 56 4d 00 00       	call   137a6 <is2arrin>
    ea50:	85 c0                	test   eax,eax
    ea52:	0f 84 09 02 00 00    	je     ec61 <LEXER+0x9f0>
    ea58:	0f b7 d5             	movzx  edx,bp
    ea5b:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ea62:	00 
    ea63:	bf 0f 00 00 00       	mov    edi,0xf
    ea68:	e8 ae f6 ff ff       	call   e11b <add_token>
    ea6d:	e9 e1 f8 ff ff       	jmp    e353 <LEXER+0xe2>
    ea72:	0f b7 d5             	movzx  edx,bp
    ea75:	48 8d 35 0e 6b 00 00 	lea    rsi,[rip+0x6b0e]        # 1558a <_IO_stdin_used+0x58a>
    ea7c:	bf 1f 00 00 00       	mov    edi,0x1f
    ea81:	e8 95 f6 ff ff       	call   e11b <add_token>
    ea86:	e9 c8 f8 ff ff       	jmp    e353 <LEXER+0xe2>
    ea8b:	0f b7 d5             	movzx  edx,bp
    ea8e:	48 8d 35 f0 6a 00 00 	lea    rsi,[rip+0x6af0]        # 15585 <_IO_stdin_used+0x585>
    ea95:	bf 20 00 00 00       	mov    edi,0x20
    ea9a:	e8 7c f6 ff ff       	call   e11b <add_token>
    ea9f:	e9 af f8 ff ff       	jmp    e353 <LEXER+0xe2>
    eaa4:	0f b7 d5             	movzx  edx,bp
    eaa7:	48 8d 35 d6 6a 00 00 	lea    rsi,[rip+0x6ad6]        # 15584 <_IO_stdin_used+0x584>
    eaae:	bf 21 00 00 00       	mov    edi,0x21
    eab3:	e8 63 f6 ff ff       	call   e11b <add_token>
    eab8:	e9 96 f8 ff ff       	jmp    e353 <LEXER+0xe2>
    eabd:	0f b7 d5             	movzx  edx,bp
    eac0:	48 8d 35 09 75 00 00 	lea    rsi,[rip+0x7509]        # 15fd0 <_IO_stdin_used+0xfd0>
    eac7:	bf 22 00 00 00       	mov    edi,0x22
    eacc:	e8 4a f6 ff ff       	call   e11b <add_token>
    ead1:	e9 7d f8 ff ff       	jmp    e353 <LEXER+0xe2>
    ead6:	0f b7 d5             	movzx  edx,bp
    ead9:	48 8d 35 24 75 00 00 	lea    rsi,[rip+0x7524]        # 16004 <_IO_stdin_used+0x1004>
    eae0:	bf 24 00 00 00       	mov    edi,0x24
    eae5:	e8 31 f6 ff ff       	call   e11b <add_token>
    eaea:	e9 64 f8 ff ff       	jmp    e353 <LEXER+0xe2>
    eaef:	0f b7 d5             	movzx  edx,bp
    eaf2:	48 8d 35 10 75 00 00 	lea    rsi,[rip+0x7510]        # 16009 <_IO_stdin_used+0x1009>
    eaf9:	bf 25 00 00 00       	mov    edi,0x25
    eafe:	e8 18 f6 ff ff       	call   e11b <add_token>
    eb03:	e9 4b f8 ff ff       	jmp    e353 <LEXER+0xe2>
    eb08:	0f b7 d5             	movzx  edx,bp
    eb0b:	48 8d 35 fc 74 00 00 	lea    rsi,[rip+0x74fc]        # 1600e <_IO_stdin_used+0x100e>
    eb12:	bf 26 00 00 00       	mov    edi,0x26
    eb17:	e8 ff f5 ff ff       	call   e11b <add_token>
    eb1c:	e9 32 f8 ff ff       	jmp    e353 <LEXER+0xe2>
    eb21:	0f b7 d5             	movzx  edx,bp
    eb24:	48 8d 35 e8 74 00 00 	lea    rsi,[rip+0x74e8]        # 16013 <_IO_stdin_used+0x1013>
    eb2b:	bf 27 00 00 00       	mov    edi,0x27
    eb30:	e8 e6 f5 ff ff       	call   e11b <add_token>
    eb35:	e9 19 f8 ff ff       	jmp    e353 <LEXER+0xe2>
    eb3a:	48 83 c3 01          	add    rbx,0x1
    eb3e:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    eb41:	3c 20                	cmp    al,0x20
    eb43:	74 f5                	je     eb3a <LEXER+0x8c9>
    eb45:	3c 09                	cmp    al,0x9
    eb47:	74 f1                	je     eb3a <LEXER+0x8c9>
    eb49:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
    eb50:	00 
    eb51:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    eb58:	00 00 
    eb5a:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    eb61:	00 00 
    eb63:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
    eb6a:	00 00 
    eb6c:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
    eb73:	00 00 
    eb75:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    eb7c:	00 00 
    eb7e:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    eb85:	00 00 
    eb87:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    eb8e:	00 00 
    eb90:	eb 17                	jmp    eba9 <LEXER+0x938>
    eb92:	41 83 ff 3f          	cmp    r15d,0x3f
    eb96:	7f 4c                	jg     ebe4 <LEXER+0x973>
    eb98:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
    eb9b:	49 63 c7             	movsxd rax,r15d
    eb9e:	88 14 04             	mov    BYTE PTR [rsp+rax*1],dl
    eba1:	45 8d 7f 01          	lea    r15d,[r15+0x1]
    eba5:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
    eba9:	0f be 33             	movsx  esi,BYTE PTR [rbx]
    ebac:	48 8b 3d 7d b5 00 00 	mov    rdi,QWORD PTR [rip+0xb57d]        # 1a130 <LETEXT>
    ebb3:	e8 c8 4b 00 00       	call   13780 <isin>
    ebb8:	85 c0                	test   eax,eax
    ebba:	75 d6                	jne    eb92 <LEXER+0x921>
    ebbc:	80 3b 2e             	cmp    BYTE PTR [rbx],0x2e
    ebbf:	74 d1                	je     eb92 <LEXER+0x921>
    ebc1:	4d 63 ff             	movsxd r15,r15d
    ebc4:	42 c6 04 3c 00       	mov    BYTE PTR [rsp+r15*1],0x0
    ebc9:	80 3c 24 00          	cmp    BYTE PTR [rsp],0x0
    ebcd:	74 3a                	je     ec09 <LEXER+0x998>
    ebcf:	0f b7 d5             	movzx  edx,bp
    ebd2:	48 89 e6             	mov    rsi,rsp
    ebd5:	bf 19 00 00 00       	mov    edi,0x19
    ebda:	e8 3c f5 ff ff       	call   e11b <add_token>
    ebdf:	e9 6f f7 ff ff       	jmp    e353 <LEXER+0xe2>
    ebe4:	0f b7 d5             	movzx  edx,bp
    ebe7:	48 8d 35 da 74 00 00 	lea    rsi,[rip+0x74da]        # 160c8 <_IO_stdin_used+0x10c8>
    ebee:	48 8b 3d eb bf 00 00 	mov    rdi,QWORD PTR [rip+0xbfeb]        # 1abe0 <stderr@GLIBC_2.2.5>
    ebf5:	b8 00 00 00 00       	mov    eax,0x0
    ebfa:	e8 41 45 ff ff       	call   3140 <fprintf@plt>
    ebff:	bf 01 00 00 00       	mov    edi,0x1
    ec04:	e8 c7 45 ff ff       	call   31d0 <exit@plt>
    ec09:	0f b7 d5             	movzx  edx,bp
    ec0c:	48 8d 35 dd 74 00 00 	lea    rsi,[rip+0x74dd]        # 160f0 <_IO_stdin_used+0x10f0>
    ec13:	48 8b 3d c6 bf 00 00 	mov    rdi,QWORD PTR [rip+0xbfc6]        # 1abe0 <stderr@GLIBC_2.2.5>
    ec1a:	e8 21 45 ff ff       	call   3140 <fprintf@plt>
    ec1f:	bf 01 00 00 00       	mov    edi,0x1
    ec24:	e8 a7 45 ff ff       	call   31d0 <exit@plt>
    ec29:	48 83 c3 01          	add    rbx,0x1
    ec2d:	0f b7 d5             	movzx  edx,bp
    ec30:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ec37:	00 
    ec38:	bf 0e 00 00 00       	mov    edi,0xe
    ec3d:	e8 d9 f4 ff ff       	call   e11b <add_token>
    ec42:	e9 0c f7 ff ff       	jmp    e353 <LEXER+0xe2>
    ec47:	0f b7 d5             	movzx  edx,bp
    ec4a:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ec51:	00 
    ec52:	bf 00 00 00 00       	mov    edi,0x0
    ec57:	e8 bf f4 ff ff       	call   e11b <add_token>
    ec5c:	e9 f2 f6 ff ff       	jmp    e353 <LEXER+0xe2>
    ec61:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ec68:	00 
    ec69:	48 8d 3d 50 be 00 00 	lea    rdi,[rip+0xbe50]        # 1aac0 <regs16>
    ec70:	e8 31 4b 00 00       	call   137a6 <is2arrin>
    ec75:	85 c0                	test   eax,eax
    ec77:	75 18                	jne    ec91 <LEXER+0xa20>
    ec79:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ec80:	00 
    ec81:	48 8d 3d d8 bd 00 00 	lea    rdi,[rip+0xbdd8]        # 1aa60 <regs16GP>
    ec88:	e8 19 4b 00 00       	call   137a6 <is2arrin>
    ec8d:	85 c0                	test   eax,eax
    ec8f:	74 1a                	je     ecab <LEXER+0xa3a>
    ec91:	0f b7 d5             	movzx  edx,bp
    ec94:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ec9b:	00 
    ec9c:	bf 10 00 00 00       	mov    edi,0x10
    eca1:	e8 75 f4 ff ff       	call   e11b <add_token>
    eca6:	e9 a8 f6 ff ff       	jmp    e353 <LEXER+0xe2>
    ecab:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ecb2:	00 
    ecb3:	48 8d 3d 46 bd 00 00 	lea    rdi,[rip+0xbd46]        # 1aa00 <regs32>
    ecba:	e8 e7 4a 00 00       	call   137a6 <is2arrin>
    ecbf:	85 c0                	test   eax,eax
    ecc1:	75 18                	jne    ecdb <LEXER+0xa6a>
    ecc3:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ecca:	00 
    eccb:	48 8d 3d ce bc 00 00 	lea    rdi,[rip+0xbcce]        # 1a9a0 <regs32GP>
    ecd2:	e8 cf 4a 00 00       	call   137a6 <is2arrin>
    ecd7:	85 c0                	test   eax,eax
    ecd9:	74 1a                	je     ecf5 <LEXER+0xa84>
    ecdb:	0f b7 d5             	movzx  edx,bp
    ecde:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ece5:	00 
    ece6:	bf 11 00 00 00       	mov    edi,0x11
    eceb:	e8 2b f4 ff ff       	call   e11b <add_token>
    ecf0:	e9 5e f6 ff ff       	jmp    e353 <LEXER+0xe2>
    ecf5:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ecfc:	00 
    ecfd:	48 8d 3d 3c bc 00 00 	lea    rdi,[rip+0xbc3c]        # 1a940 <regs64>
    ed04:	e8 9d 4a 00 00       	call   137a6 <is2arrin>
    ed09:	85 c0                	test   eax,eax
    ed0b:	75 18                	jne    ed25 <LEXER+0xab4>
    ed0d:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ed14:	00 
    ed15:	48 8d 3d c4 bb 00 00 	lea    rdi,[rip+0xbbc4]        # 1a8e0 <regs64GP>
    ed1c:	e8 85 4a 00 00       	call   137a6 <is2arrin>
    ed21:	85 c0                	test   eax,eax
    ed23:	74 1a                	je     ed3f <LEXER+0xace>
    ed25:	0f b7 d5             	movzx  edx,bp
    ed28:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ed2f:	00 
    ed30:	bf 12 00 00 00       	mov    edi,0x12
    ed35:	e8 e1 f3 ff ff       	call   e11b <add_token>
    ed3a:	e9 14 f6 ff ff       	jmp    e353 <LEXER+0xe2>
    ed3f:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ed46:	00 
    ed47:	48 8d 3d f2 ba 00 00 	lea    rdi,[rip+0xbaf2]        # 1a840 <Xmmregs>
    ed4e:	e8 53 4a 00 00       	call   137a6 <is2arrin>
    ed53:	85 c0                	test   eax,eax
    ed55:	0f 85 a6 00 00 00    	jne    ee01 <LEXER+0xb90>
    ed5b:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    ed62:	00 
    ed63:	48 8b 35 b6 b4 00 00 	mov    rsi,QWORD PTR [rip+0xb4b6]        # 1a220 <HUMAN_AST>
    ed6a:	e8 e1 42 ff ff       	call   3050 <strcasecmp@plt>
    ed6f:	85 c0                	test   eax,eax
    ed71:	0f 84 a4 00 00 00    	je     ee1b <LEXER+0xbaa>
    ed77:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    ed7e:	00 
    ed7f:	48 8b 35 a2 b4 00 00 	mov    rsi,QWORD PTR [rip+0xb4a2]        # 1a228 <HUMAN_AST+0x8>
    ed86:	e8 c5 42 ff ff       	call   3050 <strcasecmp@plt>
    ed8b:	85 c0                	test   eax,eax
    ed8d:	0f 84 a2 00 00 00    	je     ee35 <LEXER+0xbc4>
    ed93:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    ed9a:	00 
    ed9b:	48 8b 35 8e b4 00 00 	mov    rsi,QWORD PTR [rip+0xb48e]        # 1a230 <HUMAN_AST+0x10>
    eda2:	e8 a9 42 ff ff       	call   3050 <strcasecmp@plt>
    eda7:	85 c0                	test   eax,eax
    eda9:	0f 84 a0 00 00 00    	je     ee4f <LEXER+0xbde>
    edaf:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    edb6:	00 
    edb7:	48 8b 35 7a b4 00 00 	mov    rsi,QWORD PTR [rip+0xb47a]        # 1a238 <HUMAN_AST+0x18>
    edbe:	e8 8d 42 ff ff       	call   3050 <strcasecmp@plt>
    edc3:	85 c0                	test   eax,eax
    edc5:	0f 84 9e 00 00 00    	je     ee69 <LEXER+0xbf8>
    edcb:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
    edd2:	00 
    edd3:	48 8d 35 46 72 00 00 	lea    rsi,[rip+0x7246]        # 16020 <_IO_stdin_used+0x1020>
    edda:	e8 71 42 ff ff       	call   3050 <strcasecmp@plt>
    eddf:	85 c0                	test   eax,eax
    ede1:	0f 85 9c 00 00 00    	jne    ee83 <LEXER+0xc12>
    ede7:	0f b7 d5             	movzx  edx,bp
    edea:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    edf1:	00 
    edf2:	bf 14 00 00 00       	mov    edi,0x14
    edf7:	e8 1f f3 ff ff       	call   e11b <add_token>
    edfc:	e9 52 f5 ff ff       	jmp    e353 <LEXER+0xe2>
    ee01:	0f b7 d5             	movzx  edx,bp
    ee04:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ee0b:	00 
    ee0c:	bf 13 00 00 00       	mov    edi,0x13
    ee11:	e8 05 f3 ff ff       	call   e11b <add_token>
    ee16:	e9 38 f5 ff ff       	jmp    e353 <LEXER+0xe2>
    ee1b:	0f b7 d5             	movzx  edx,bp
    ee1e:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ee25:	00 
    ee26:	bf 1a 00 00 00       	mov    edi,0x1a
    ee2b:	e8 eb f2 ff ff       	call   e11b <add_token>
    ee30:	e9 1e f5 ff ff       	jmp    e353 <LEXER+0xe2>
    ee35:	0f b7 d5             	movzx  edx,bp
    ee38:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ee3f:	00 
    ee40:	bf 1b 00 00 00       	mov    edi,0x1b
    ee45:	e8 d1 f2 ff ff       	call   e11b <add_token>
    ee4a:	e9 04 f5 ff ff       	jmp    e353 <LEXER+0xe2>
    ee4f:	0f b7 d5             	movzx  edx,bp
    ee52:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ee59:	00 
    ee5a:	bf 1c 00 00 00       	mov    edi,0x1c
    ee5f:	e8 b7 f2 ff ff       	call   e11b <add_token>
    ee64:	e9 ea f4 ff ff       	jmp    e353 <LEXER+0xe2>
    ee69:	0f b7 d5             	movzx  edx,bp
    ee6c:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ee73:	00 
    ee74:	bf 1d 00 00 00       	mov    edi,0x1d
    ee79:	e8 9d f2 ff ff       	call   e11b <add_token>
    ee7e:	e9 d0 f4 ff ff       	jmp    e353 <LEXER+0xe2>
    ee83:	0f b7 d5             	movzx  edx,bp
    ee86:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    ee8d:	00 
    ee8e:	bf 0e 00 00 00       	mov    edi,0xe
    ee93:	e8 83 f2 ff ff       	call   e11b <add_token>
    ee98:	e9 b6 f4 ff ff       	jmp    e353 <LEXER+0xe2>
    ee9d:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
    eea4:	00 00 00 00 00 
    eea9:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    eeb0:	00 00 00 00 00 
    eeb5:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x0
    eebc:	00 00 00 00 00 
    eec1:	48 c7 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],0x0
    eec8:	00 00 00 00 00 
    eecd:	48 c7 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],0x0
    eed4:	00 00 00 00 00 
    eed9:	48 c7 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],0x0
    eee0:	00 00 00 00 00 
    eee5:	48 c7 84 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],0x0
    eeec:	00 00 00 00 00 
    eef1:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x0
    eef8:	00 00 00 00 00 
    eefd:	48 c7 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],0x0
    ef04:	00 00 00 00 00 
    ef09:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x0
    ef10:	00 00 00 00 00 
    ef15:	48 c7 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],0x0
    ef1c:	00 00 00 00 00 
    ef21:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x0
    ef28:	00 00 00 00 00 
    ef2d:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
    ef34:	00 00 00 00 00 
    ef39:	48 c7 84 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
    ef40:	00 00 00 00 00 
    ef45:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
    ef4c:	00 00 00 00 00 
    ef51:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
    ef58:	00 00 00 00 00 
    ef5d:	48 c7 84 24 00 01 00 	mov    QWORD PTR [rsp+0x100],0x0
    ef64:	00 00 00 00 00 
    ef69:	48 c7 84 24 08 01 00 	mov    QWORD PTR [rsp+0x108],0x0
    ef70:	00 00 00 00 00 
    ef75:	48 c7 84 24 10 01 00 	mov    QWORD PTR [rsp+0x110],0x0
    ef7c:	00 00 00 00 00 
    ef81:	48 c7 84 24 18 01 00 	mov    QWORD PTR [rsp+0x118],0x0
    ef88:	00 00 00 00 00 
    ef8d:	48 c7 84 24 20 01 00 	mov    QWORD PTR [rsp+0x120],0x0
    ef94:	00 00 00 00 00 
    ef99:	48 c7 84 24 28 01 00 	mov    QWORD PTR [rsp+0x128],0x0
    efa0:	00 00 00 00 00 
    efa5:	48 c7 84 24 30 01 00 	mov    QWORD PTR [rsp+0x130],0x0
    efac:	00 00 00 00 00 
    efb1:	48 c7 84 24 38 01 00 	mov    QWORD PTR [rsp+0x138],0x0
    efb8:	00 00 00 00 00 
    efbd:	48 c7 84 24 40 01 00 	mov    QWORD PTR [rsp+0x140],0x0
    efc4:	00 00 00 00 00 
    efc9:	48 c7 84 24 48 01 00 	mov    QWORD PTR [rsp+0x148],0x0
    efd0:	00 00 00 00 00 
    efd5:	48 c7 84 24 50 01 00 	mov    QWORD PTR [rsp+0x150],0x0
    efdc:	00 00 00 00 00 
    efe1:	48 c7 84 24 58 01 00 	mov    QWORD PTR [rsp+0x158],0x0
    efe8:	00 00 00 00 00 
    efed:	48 c7 84 24 60 01 00 	mov    QWORD PTR [rsp+0x160],0x0
    eff4:	00 00 00 00 00 
    eff9:	48 c7 84 24 68 01 00 	mov    QWORD PTR [rsp+0x168],0x0
    f000:	00 00 00 00 00 
    f005:	48 c7 84 24 70 01 00 	mov    QWORD PTR [rsp+0x170],0x0
    f00c:	00 00 00 00 00 
    f011:	48 c7 84 24 78 01 00 	mov    QWORD PTR [rsp+0x178],0x0
    f018:	00 00 00 00 00 
    f01d:	c6 84 24 80 00 00 00 	mov    BYTE PTR [rsp+0x80],0x2e
    f024:	2e 
    f025:	48 83 c3 01          	add    rbx,0x1
    f029:	41 be 01 00 00 00    	mov    r14d,0x1
    f02f:	eb 15                	jmp    f046 <LEXER+0xdd5>
    f031:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
    f034:	49 63 c6             	movsxd rax,r14d
    f037:	88 94 04 80 00 00 00 	mov    BYTE PTR [rsp+rax*1+0x80],dl
    f03e:	45 8d 76 01          	lea    r14d,[r14+0x1]
    f042:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
    f046:	0f be 33             	movsx  esi,BYTE PTR [rbx]
    f049:	48 8b 3d e0 b0 00 00 	mov    rdi,QWORD PTR [rip+0xb0e0]        # 1a130 <LETEXT>
    f050:	e8 2b 47 00 00       	call   13780 <isin>
    f055:	85 c0                	test   eax,eax
    f057:	75 d8                	jne    f031 <LEXER+0xdc0>
    f059:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
    f060:	00 
    f061:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    f068:	00 00 
    f06a:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    f071:	00 00 
    f073:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
    f07a:	00 00 
    f07c:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
    f083:	00 00 
    f085:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    f08c:	00 00 
    f08e:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    f095:	00 00 
    f097:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    f09e:	00 00 
    f0a0:	48 8d 8c 24 80 00 00 	lea    rcx,[rsp+0x80]
    f0a7:	00 
    f0a8:	48 89 e7             	mov    rdi,rsp
    f0ab:	48 8d 15 8c 6d 00 00 	lea    rdx,[rip+0x6d8c]        # 15e3e <_IO_stdin_used+0xe3e>
    f0b2:	be 40 00 00 00       	mov    esi,0x40
    f0b7:	e8 34 40 ff ff       	call   30f0 <snprintf@plt>
    f0bc:	80 3b 3a             	cmp    BYTE PTR [rbx],0x3a
    f0bf:	74 15                	je     f0d6 <LEXER+0xe65>
    f0c1:	0f b7 d5             	movzx  edx,bp
    f0c4:	48 89 e6             	mov    rsi,rsp
    f0c7:	bf 0e 00 00 00       	mov    edi,0xe
    f0cc:	e8 4a f0 ff ff       	call   e11b <add_token>
    f0d1:	e9 7d f2 ff ff       	jmp    e353 <LEXER+0xe2>
    f0d6:	48 83 c3 01          	add    rbx,0x1
    f0da:	0f b7 d5             	movzx  edx,bp
    f0dd:	48 89 e6             	mov    rsi,rsp
    f0e0:	bf 0e 00 00 00       	mov    edi,0xe
    f0e5:	e8 31 f0 ff ff       	call   e11b <add_token>
    f0ea:	e9 64 f2 ff ff       	jmp    e353 <LEXER+0xe2>
    f0ef:	48 8d 7b 01          	lea    rdi,[rbx+0x1]
    f0f3:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
    f0fa:	00 00 00 00 00 
    f0ff:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    f106:	00 00 00 00 00 
    f10b:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x0
    f112:	00 00 00 00 00 
    f117:	48 c7 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],0x0
    f11e:	00 00 00 00 00 
    f123:	48 c7 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],0x0
    f12a:	00 00 00 00 00 
    f12f:	48 c7 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],0x0
    f136:	00 00 00 00 00 
    f13b:	48 c7 84 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],0x0
    f142:	00 00 00 00 00 
    f147:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x0
    f14e:	00 00 00 00 00 
    f153:	48 c7 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],0x0
    f15a:	00 00 00 00 00 
    f15f:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x0
    f166:	00 00 00 00 00 
    f16b:	48 c7 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],0x0
    f172:	00 00 00 00 00 
    f177:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x0
    f17e:	00 00 00 00 00 
    f183:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
    f18a:	00 00 00 00 00 
    f18f:	48 c7 84 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
    f196:	00 00 00 00 00 
    f19b:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
    f1a2:	00 00 00 00 00 
    f1a7:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
    f1ae:	00 00 00 00 00 
    f1b3:	48 c7 84 24 00 01 00 	mov    QWORD PTR [rsp+0x100],0x0
    f1ba:	00 00 00 00 00 
    f1bf:	48 c7 84 24 08 01 00 	mov    QWORD PTR [rsp+0x108],0x0
    f1c6:	00 00 00 00 00 
    f1cb:	48 c7 84 24 10 01 00 	mov    QWORD PTR [rsp+0x110],0x0
    f1d2:	00 00 00 00 00 
    f1d7:	48 c7 84 24 18 01 00 	mov    QWORD PTR [rsp+0x118],0x0
    f1de:	00 00 00 00 00 
    f1e3:	48 c7 84 24 20 01 00 	mov    QWORD PTR [rsp+0x120],0x0
    f1ea:	00 00 00 00 00 
    f1ef:	48 c7 84 24 28 01 00 	mov    QWORD PTR [rsp+0x128],0x0
    f1f6:	00 00 00 00 00 
    f1fb:	48 c7 84 24 30 01 00 	mov    QWORD PTR [rsp+0x130],0x0
    f202:	00 00 00 00 00 
    f207:	48 c7 84 24 38 01 00 	mov    QWORD PTR [rsp+0x138],0x0
    f20e:	00 00 00 00 00 
    f213:	48 c7 84 24 40 01 00 	mov    QWORD PTR [rsp+0x140],0x0
    f21a:	00 00 00 00 00 
    f21f:	48 c7 84 24 48 01 00 	mov    QWORD PTR [rsp+0x148],0x0
    f226:	00 00 00 00 00 
    f22b:	48 c7 84 24 50 01 00 	mov    QWORD PTR [rsp+0x150],0x0
    f232:	00 00 00 00 00 
    f237:	48 c7 84 24 58 01 00 	mov    QWORD PTR [rsp+0x158],0x0
    f23e:	00 00 00 00 00 
    f243:	48 c7 84 24 60 01 00 	mov    QWORD PTR [rsp+0x160],0x0
    f24a:	00 00 00 00 00 
    f24f:	48 c7 84 24 68 01 00 	mov    QWORD PTR [rsp+0x168],0x0
    f256:	00 00 00 00 00 
    f25b:	48 c7 84 24 70 01 00 	mov    QWORD PTR [rsp+0x170],0x0
    f262:	00 00 00 00 00 
    f267:	48 c7 84 24 78 01 00 	mov    QWORD PTR [rsp+0x178],0x0
    f26e:	00 00 00 00 00 
    f273:	44 0f b7 f5          	movzx  r14d,bp
    f277:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    f27e:	00 
    f27f:	44 89 f2             	mov    edx,r14d
    f282:	e8 3a ef ff ff       	call   e1c1 <read_string>
    f287:	48 89 c3             	mov    rbx,rax
    f28a:	48 85 c0             	test   rax,rax
    f28d:	74 23                	je     f2b2 <LEXER+0x1041>
    f28f:	80 38 22             	cmp    BYTE PTR [rax],0x22
    f292:	75 43                	jne    f2d7 <LEXER+0x1066>
    f294:	48 83 c3 01          	add    rbx,0x1
    f298:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    f29f:	00 
    f2a0:	44 89 f2             	mov    edx,r14d
    f2a3:	bf 16 00 00 00       	mov    edi,0x16
    f2a8:	e8 6e ee ff ff       	call   e11b <add_token>
    f2ad:	e9 a1 f0 ff ff       	jmp    e353 <LEXER+0xe2>
    f2b2:	44 89 f2             	mov    edx,r14d
    f2b5:	48 8d 35 9c 6e 00 00 	lea    rsi,[rip+0x6e9c]        # 16158 <_IO_stdin_used+0x1158>
    f2bc:	48 8b 3d 1d b9 00 00 	mov    rdi,QWORD PTR [rip+0xb91d]        # 1abe0 <stderr@GLIBC_2.2.5>
    f2c3:	b8 00 00 00 00       	mov    eax,0x0
    f2c8:	e8 73 3e ff ff       	call   3140 <fprintf@plt>
    f2cd:	bf 01 00 00 00       	mov    edi,0x1
    f2d2:	e8 f9 3e ff ff       	call   31d0 <exit@plt>
    f2d7:	44 89 f2             	mov    edx,r14d
    f2da:	48 8d 35 9f 6e 00 00 	lea    rsi,[rip+0x6e9f]        # 16180 <_IO_stdin_used+0x1180>
    f2e1:	48 8b 3d f8 b8 00 00 	mov    rdi,QWORD PTR [rip+0xb8f8]        # 1abe0 <stderr@GLIBC_2.2.5>
    f2e8:	b8 00 00 00 00       	mov    eax,0x0
    f2ed:	e8 4e 3e ff ff       	call   3140 <fprintf@plt>
    f2f2:	bf 01 00 00 00       	mov    edi,0x1
    f2f7:	e8 d4 3e ff ff       	call   31d0 <exit@plt>
    f2fc:	0f b6 43 01          	movzx  eax,BYTE PTR [rbx+0x1]
    f300:	3c 5c                	cmp    al,0x5c
    f302:	74 3a                	je     f33e <LEXER+0x10cd>
    f304:	48 83 c3 02          	add    rbx,0x2
    f308:	80 3b 27             	cmp    BYTE PTR [rbx],0x27
    f30b:	0f 85 96 00 00 00    	jne    f3a7 <LEXER+0x1136>
    f311:	48 83 c3 01          	add    rbx,0x1
    f315:	88 84 24 80 00 00 00 	mov    BYTE PTR [rsp+0x80],al
    f31c:	c6 84 24 81 00 00 00 	mov    BYTE PTR [rsp+0x81],0x0
    f323:	00 
    f324:	0f b7 d5             	movzx  edx,bp
    f327:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    f32e:	00 
    f32f:	bf 1e 00 00 00       	mov    edi,0x1e
    f334:	e8 e2 ed ff ff       	call   e11b <add_token>
    f339:	e9 15 f0 ff ff       	jmp    e353 <LEXER+0xe2>
    f33e:	0f b6 43 02          	movzx  eax,BYTE PTR [rbx+0x2]
    f342:	3c 5c                	cmp    al,0x5c
    f344:	74 15                	je     f35b <LEXER+0x10ea>
    f346:	7f 19                	jg     f361 <LEXER+0x10f0>
    f348:	3c 27                	cmp    al,0x27
    f34a:	74 0f                	je     f35b <LEXER+0x10ea>
    f34c:	3c 30                	cmp    al,0x30
    f34e:	75 07                	jne    f357 <LEXER+0x10e6>
    f350:	b8 00 00 00 00       	mov    eax,0x0
    f355:	eb 04                	jmp    f35b <LEXER+0x10ea>
    f357:	3c 22                	cmp    al,0x22
    f359:	75 20                	jne    f37b <LEXER+0x110a>
    f35b:	48 83 c3 03          	add    rbx,0x3
    f35f:	eb a7                	jmp    f308 <LEXER+0x1097>
    f361:	3c 72                	cmp    al,0x72
    f363:	74 3b                	je     f3a0 <LEXER+0x112f>
    f365:	3c 74                	cmp    al,0x74
    f367:	75 07                	jne    f370 <LEXER+0x10ff>
    f369:	b8 09 00 00 00       	mov    eax,0x9
    f36e:	eb eb                	jmp    f35b <LEXER+0x10ea>
    f370:	3c 6e                	cmp    al,0x6e
    f372:	75 07                	jne    f37b <LEXER+0x110a>
    f374:	b8 0a 00 00 00       	mov    eax,0xa
    f379:	eb e0                	jmp    f35b <LEXER+0x10ea>
    f37b:	0f b7 d5             	movzx  edx,bp
    f37e:	48 8d 35 23 6e 00 00 	lea    rsi,[rip+0x6e23]        # 161a8 <_IO_stdin_used+0x11a8>
    f385:	48 8b 3d 54 b8 00 00 	mov    rdi,QWORD PTR [rip+0xb854]        # 1abe0 <stderr@GLIBC_2.2.5>
    f38c:	b8 00 00 00 00       	mov    eax,0x0
    f391:	e8 aa 3d ff ff       	call   3140 <fprintf@plt>
    f396:	bf 01 00 00 00       	mov    edi,0x1
    f39b:	e8 30 3e ff ff       	call   31d0 <exit@plt>
    f3a0:	b8 0d 00 00 00       	mov    eax,0xd
    f3a5:	eb b4                	jmp    f35b <LEXER+0x10ea>
    f3a7:	0f b7 d5             	movzx  edx,bp
    f3aa:	48 8d 35 1f 6e 00 00 	lea    rsi,[rip+0x6e1f]        # 161d0 <_IO_stdin_used+0x11d0>
    f3b1:	48 8b 3d 28 b8 00 00 	mov    rdi,QWORD PTR [rip+0xb828]        # 1abe0 <stderr@GLIBC_2.2.5>
    f3b8:	b8 00 00 00 00       	mov    eax,0x0
    f3bd:	e8 7e 3d ff ff       	call   3140 <fprintf@plt>
    f3c2:	bf 01 00 00 00       	mov    edi,0x1
    f3c7:	e8 04 3e ff ff       	call   31d0 <exit@plt>
    f3cc:	48 83 c3 01          	add    rbx,0x1
    f3d0:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
    f3d7:	00 
    f3d8:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    f3df:	00 00 
    f3e1:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    f3e8:	00 00 
    f3ea:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
    f3f1:	00 00 
    f3f3:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
    f3fa:	00 00 
    f3fc:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    f403:	00 00 
    f405:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    f40c:	00 00 
    f40e:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    f415:	00 00 
    f417:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
    f41e:	00 00 
    f420:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
    f427:	00 00 
    f429:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
    f430:	00 00 
    f432:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
    f439:	00 00 
    f43b:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
    f442:	00 00 
    f444:	48 c7 44 24 68 00 00 	mov    QWORD PTR [rsp+0x68],0x0
    f44b:	00 00 
    f44d:	48 c7 44 24 70 00 00 	mov    QWORD PTR [rsp+0x70],0x0
    f454:	00 00 
    f456:	48 c7 44 24 78 00 00 	mov    QWORD PTR [rsp+0x78],0x0
    f45d:	00 00 
    f45f:	89 c1                	mov    ecx,eax
    f461:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
    f464:	84 d2                	test   dl,dl
    f466:	74 19                	je     f481 <LEXER+0x1210>
    f468:	80 fa 5d             	cmp    dl,0x5d
    f46b:	74 14                	je     f481 <LEXER+0x1210>
    f46d:	83 f9 7e             	cmp    ecx,0x7e
    f470:	7f ef                	jg     f461 <LEXER+0x11f0>
    f472:	48 83 c3 01          	add    rbx,0x1
    f476:	48 63 f1             	movsxd rsi,ecx
    f479:	88 14 34             	mov    BYTE PTR [rsp+rsi*1],dl
    f47c:	8d 49 01             	lea    ecx,[rcx+0x1]
    f47f:	eb e0                	jmp    f461 <LEXER+0x11f0>
    f481:	80 fa 5d             	cmp    dl,0x5d
    f484:	0f 85 cf 00 00 00    	jne    f559 <LEXER+0x12e8>
    f48a:	48 83 c3 01          	add    rbx,0x1
    f48e:	48 63 c9             	movsxd rcx,ecx
    f491:	c6 04 0c 00          	mov    BYTE PTR [rsp+rcx*1],0x0
    f495:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
    f49c:	00 00 00 00 00 
    f4a1:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    f4a8:	00 00 00 00 00 
    f4ad:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x0
    f4b4:	00 00 00 00 00 
    f4b9:	48 c7 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],0x0
    f4c0:	00 00 00 00 00 
    f4c5:	48 c7 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],0x0
    f4cc:	00 00 00 00 00 
    f4d1:	48 c7 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],0x0
    f4d8:	00 00 00 00 00 
    f4dd:	48 c7 84 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],0x0
    f4e4:	00 00 00 00 00 
    f4e9:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x0
    f4f0:	00 00 00 00 00 
    f4f5:	48 c7 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],0x0
    f4fc:	00 00 00 00 00 
    f501:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x0
    f508:	00 00 00 00 00 
    f50d:	48 c7 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],0x0
    f514:	00 00 00 00 00 
    f519:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x0
    f520:	00 00 00 00 00 
    f525:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
    f52c:	00 00 00 00 00 
    f531:	48 c7 84 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
    f538:	00 00 00 00 00 
    f53d:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
    f544:	00 00 00 00 00 
    f549:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
    f550:	00 00 00 00 00 
    f555:	89 c1                	mov    ecx,eax
    f557:	eb 28                	jmp    f581 <LEXER+0x1310>
    f559:	0f b7 d5             	movzx  edx,bp
    f55c:	48 8d 35 9d 6c 00 00 	lea    rsi,[rip+0x6c9d]        # 16200 <_IO_stdin_used+0x1200>
    f563:	48 8b 3d 76 b6 00 00 	mov    rdi,QWORD PTR [rip+0xb676]        # 1abe0 <stderr@GLIBC_2.2.5>
    f56a:	b8 00 00 00 00       	mov    eax,0x0
    f56f:	e8 cc 3b ff ff       	call   3140 <fprintf@plt>
    f574:	bf 01 00 00 00       	mov    edi,0x1
    f579:	e8 52 3c ff ff       	call   31d0 <exit@plt>
    f57e:	83 c1 01             	add    ecx,0x1
    f581:	48 63 d1             	movsxd rdx,ecx
    f584:	0f b6 14 14          	movzx  edx,BYTE PTR [rsp+rdx*1]
    f588:	84 d2                	test   dl,dl
    f58a:	74 14                	je     f5a0 <LEXER+0x132f>
    f58c:	80 fa 20             	cmp    dl,0x20
    f58f:	74 ed                	je     f57e <LEXER+0x130d>
    f591:	48 63 f0             	movsxd rsi,eax
    f594:	88 94 34 80 00 00 00 	mov    BYTE PTR [rsp+rsi*1+0x80],dl
    f59b:	8d 40 01             	lea    eax,[rax+0x1]
    f59e:	eb de                	jmp    f57e <LEXER+0x130d>
    f5a0:	48 98                	cdqe
    f5a2:	c6 84 04 80 00 00 00 	mov    BYTE PTR [rsp+rax*1+0x80],0x0
    f5a9:	00 
    f5aa:	0f b7 d5             	movzx  edx,bp
    f5ad:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    f5b4:	00 
    f5b5:	bf 15 00 00 00       	mov    edi,0x15
    f5ba:	e8 5c eb ff ff       	call   e11b <add_token>
    f5bf:	e9 8f ed ff ff       	jmp    e353 <LEXER+0xe2>
    f5c4:	48 83 c3 01          	add    rbx,0x1
    f5c8:	80 3b 20             	cmp    BYTE PTR [rbx],0x20
    f5cb:	74 f7                	je     f5c4 <LEXER+0x1353>
    f5cd:	0f b7 d5             	movzx  edx,bp
    f5d0:	48 8d 35 4f 6a 00 00 	lea    rsi,[rip+0x6a4f]        # 16026 <_IO_stdin_used+0x1026>
    f5d7:	bf 23 00 00 00       	mov    edi,0x23
    f5dc:	e8 3a eb ff ff       	call   e11b <add_token>
    f5e1:	e9 6d ed ff ff       	jmp    e353 <LEXER+0xe2>
    f5e6:	0f b7 d5             	movzx  edx,bp
    f5e9:	48 8d 35 38 6c 00 00 	lea    rsi,[rip+0x6c38]        # 16228 <_IO_stdin_used+0x1228>
    f5f0:	48 8b 3d e9 b5 00 00 	mov    rdi,QWORD PTR [rip+0xb5e9]        # 1abe0 <stderr@GLIBC_2.2.5>
    f5f7:	b8 00 00 00 00       	mov    eax,0x0
    f5fc:	e8 3f 3b ff ff       	call   3140 <fprintf@plt>
    f601:	bf 01 00 00 00       	mov    edi,0x1
    f606:	e8 c5 3b ff ff       	call   31d0 <exit@plt>
    f60b:	0f b7 ed             	movzx  ebp,bp
    f60e:	89 ea                	mov    edx,ebp
    f610:	48 8d 35 f8 78 00 00 	lea    rsi,[rip+0x78f8]        # 16f0f <_IO_stdin_used+0x1f0f>
    f617:	bf 18 00 00 00       	mov    edi,0x18
    f61c:	e8 fa ea ff ff       	call   e11b <add_token>
    f621:	89 e8                	mov    eax,ebp
    f623:	48 81 c4 e8 00 20 00 	add    rsp,0x2000e8
    f62a:	5b                   	pop    rbx
    f62b:	5d                   	pop    rbp
    f62c:	41 5c                	pop    r12
    f62e:	41 5d                	pop    r13
    f630:	41 5e                	pop    r14
    f632:	41 5f                	pop    r15
    f634:	c3                   	ret

000000000000f635 <expand_local_labels>:
    f635:	41 57                	push   r15
    f637:	41 56                	push   r14
    f639:	41 55                	push   r13
    f63b:	41 54                	push   r12
    f63d:	55                   	push   rbp
    f63e:	53                   	push   rbx
    f63f:	48 81 ec 98 00 00 00 	sub    rsp,0x98
    f646:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
    f64d:	00 00 
    f64f:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
    f656:	00 00 
    f658:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
    f65f:	00 00 
    f661:	48 c7 44 24 68 00 00 	mov    QWORD PTR [rsp+0x68],0x0
    f668:	00 00 
    f66a:	48 c7 44 24 70 00 00 	mov    QWORD PTR [rsp+0x70],0x0
    f671:	00 00 
    f673:	48 c7 44 24 78 00 00 	mov    QWORD PTR [rsp+0x78],0x0
    f67a:	00 00 
    f67c:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
    f683:	00 00 00 00 00 
    f688:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
    f68f:	00 00 00 00 00 
    f694:	c7 04 24 00 00 00 00 	mov    DWORD PTR [rsp],0x0
    f69b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [rsp+0x4],0x0
    f6a2:	00 
    f6a3:	eb 68                	jmp    f70d <expand_local_labels+0xd8>
    f6a5:	41 80 7c 24 10 2e    	cmp    BYTE PTR [r12+0x10],0x2e
    f6ab:	0f 85 a1 00 00 00    	jne    f752 <expand_local_labels+0x11d>
    f6b1:	41 80 7c 24 11 2e    	cmp    BYTE PTR [r12+0x11],0x2e
    f6b7:	0f 84 bb 00 00 00    	je     f778 <expand_local_labels+0x143>
    f6bd:	83 7c 24 04 00       	cmp    DWORD PTR [rsp+0x4],0x0
    f6c2:	0f 84 dd 00 00 00    	je     f7a5 <expand_local_labels+0x170>
    f6c8:	49 8d 5c 24 10       	lea    rbx,[r12+0x10]
    f6cd:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
    f6d2:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    f6d7:	49 89 d8             	mov    r8,rbx
    f6da:	48 8d 15 5b 67 00 00 	lea    rdx,[rip+0x675b]        # 15e3c <_IO_stdin_used+0xe3c>
    f6e1:	be 40 00 00 00       	mov    esi,0x40
    f6e6:	48 89 ef             	mov    rdi,rbp
    f6e9:	b8 00 00 00 00       	mov    eax,0x0
    f6ee:	e8 fd 39 ff ff       	call   30f0 <snprintf@plt>
    f6f3:	ba 3f 00 00 00       	mov    edx,0x3f
    f6f8:	48 89 ee             	mov    rsi,rbp
    f6fb:	48 89 df             	mov    rdi,rbx
    f6fe:	e8 5d 39 ff ff       	call   3060 <strncpy@plt>
    f703:	41 c6 44 24 4f 00    	mov    BYTE PTR [r12+0x4f],0x0
    f709:	83 04 24 01          	add    DWORD PTR [rsp],0x1
    f70d:	8b 04 24             	mov    eax,DWORD PTR [rsp]
    f710:	39 05 ee b8 00 00    	cmp    DWORD PTR [rip+0xb8ee],eax        # 1b004 <ast_len>
    f716:	0f 8e a6 03 00 00    	jle    fac2 <expand_local_labels+0x48d>
    f71c:	4c 63 24 24          	movsxd r12,DWORD PTR [rsp]
    f720:	4d 69 e4 b8 01 00 00 	imul   r12,r12,0x1b8
    f727:	4c 03 25 da b8 00 00 	add    r12,QWORD PTR [rip+0xb8da]        # 1b008 <ast>
    f72e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
    f733:	3c 08                	cmp    al,0x8
    f735:	0f 84 6a ff ff ff    	je     f6a5 <expand_local_labels+0x70>
    f73b:	3c 01                	cmp    al,0x1
    f73d:	0f 84 23 02 00 00    	je     f966 <expand_local_labels+0x331>
    f743:	3c 05                	cmp    al,0x5
    f745:	75 c2                	jne    f709 <expand_local_labels+0xd4>
    f747:	41 be 00 00 00 00    	mov    r14d,0x0
    f74d:	e9 48 03 00 00       	jmp    fa9a <expand_local_labels+0x465>
    f752:	49 8d 74 24 10       	lea    rsi,[r12+0x10]
    f757:	48 8d 7c 24 50       	lea    rdi,[rsp+0x50]
    f75c:	ba 3f 00 00 00       	mov    edx,0x3f
    f761:	e8 fa 38 ff ff       	call   3060 <strncpy@plt>
    f766:	c6 84 24 8f 00 00 00 	mov    BYTE PTR [rsp+0x8f],0x0
    f76d:	00 
    f76e:	c7 44 24 04 01 00 00 	mov    DWORD PTR [rsp+0x4],0x1
    f775:	00 
    f776:	eb 91                	jmp    f709 <expand_local_labels+0xd4>
    f778:	49 8d 4c 24 10       	lea    rcx,[r12+0x10]
    f77d:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    f783:	48 8d 35 ae 6b 00 00 	lea    rsi,[rip+0x6bae]        # 16338 <_IO_stdin_used+0x1338>
    f78a:	48 8b 3d 4f b4 00 00 	mov    rdi,QWORD PTR [rip+0xb44f]        # 1abe0 <stderr@GLIBC_2.2.5>
    f791:	b8 00 00 00 00       	mov    eax,0x0
    f796:	e8 a5 39 ff ff       	call   3140 <fprintf@plt>
    f79b:	bf 01 00 00 00       	mov    edi,0x1
    f7a0:	e8 2b 3a ff ff       	call   31d0 <exit@plt>
    f7a5:	49 8d 4c 24 10       	lea    rcx,[r12+0x10]
    f7aa:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    f7b0:	48 8d 35 b1 6b 00 00 	lea    rsi,[rip+0x6bb1]        # 16368 <_IO_stdin_used+0x1368>
    f7b7:	48 8b 3d 22 b4 00 00 	mov    rdi,QWORD PTR [rip+0xb422]        # 1abe0 <stderr@GLIBC_2.2.5>
    f7be:	b8 00 00 00 00       	mov    eax,0x0
    f7c3:	e8 78 39 ff ff       	call   3140 <fprintf@plt>
    f7c8:	bf 01 00 00 00       	mov    edi,0x1
    f7cd:	e8 fe 39 ff ff       	call   31d0 <exit@plt>
    f7d2:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    f7d8:	48 8d 35 59 6b 00 00 	lea    rsi,[rip+0x6b59]        # 16338 <_IO_stdin_used+0x1338>
    f7df:	48 8b 3d fa b3 00 00 	mov    rdi,QWORD PTR [rip+0xb3fa]        # 1abe0 <stderr@GLIBC_2.2.5>
    f7e6:	b8 00 00 00 00       	mov    eax,0x0
    f7eb:	e8 50 39 ff ff       	call   3140 <fprintf@plt>
    f7f0:	bf 01 00 00 00       	mov    edi,0x1
    f7f5:	e8 d6 39 ff ff       	call   31d0 <exit@plt>
    f7fa:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    f800:	48 8d 35 91 6b 00 00 	lea    rsi,[rip+0x6b91]        # 16398 <_IO_stdin_used+0x1398>
    f807:	48 8b 3d d2 b3 00 00 	mov    rdi,QWORD PTR [rip+0xb3d2]        # 1abe0 <stderr@GLIBC_2.2.5>
    f80e:	b8 00 00 00 00       	mov    eax,0x0
    f813:	e8 28 39 ff ff       	call   3140 <fprintf@plt>
    f818:	bf 01 00 00 00       	mov    edi,0x1
    f81d:	e8 ae 39 ff ff       	call   31d0 <exit@plt>
    f822:	83 c5 01             	add    ebp,0x1
    f825:	49 63 c5             	movsxd rax,r13d
    f828:	48 8d 04 40          	lea    rax,[rax+rax*2]
    f82c:	48 c1 e0 05          	shl    rax,0x5
    f830:	41 0f b6 44 04 18    	movzx  eax,BYTE PTR [r12+rax*1+0x18]
    f836:	39 e8                	cmp    eax,ebp
    f838:	0f 8e f9 00 00 00    	jle    f937 <expand_local_labels+0x302>
    f83e:	49 63 c5             	movsxd rax,r13d
    f841:	48 8d 04 40          	lea    rax,[rax+rax*2]
    f845:	48 c1 e0 05          	shl    rax,0x5
    f849:	48 63 dd             	movsxd rbx,ebp
    f84c:	48 c1 e3 04          	shl    rbx,0x4
    f850:	48 89 de             	mov    rsi,rbx
    f853:	49 03 74 04 20       	add    rsi,QWORD PTR [r12+rax*1+0x20]
    f858:	80 3e 0e             	cmp    BYTE PTR [rsi],0xe
    f85b:	75 c5                	jne    f822 <expand_local_labels+0x1ed>
    f85d:	48 8b 4e 08          	mov    rcx,QWORD PTR [rsi+0x8]
    f861:	80 39 2e             	cmp    BYTE PTR [rcx],0x2e
    f864:	75 bc                	jne    f822 <expand_local_labels+0x1ed>
    f866:	80 79 01 2e          	cmp    BYTE PTR [rcx+0x1],0x2e
    f86a:	0f 84 62 ff ff ff    	je     f7d2 <expand_local_labels+0x19d>
    f870:	83 7c 24 04 00       	cmp    DWORD PTR [rsp+0x4],0x0
    f875:	74 83                	je     f7fa <expand_local_labels+0x1c5>
    f877:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    f87e:	00 00 
    f880:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
    f887:	00 00 
    f889:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
    f890:	00 00 
    f892:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    f899:	00 00 
    f89b:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    f8a2:	00 00 
    f8a4:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    f8ab:	00 00 
    f8ad:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
    f8b4:	00 00 
    f8b6:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
    f8bd:	00 00 
    f8bf:	4d 63 fd             	movsxd r15,r13d
    f8c2:	4f 8d 34 3f          	lea    r14,[r15+r15*1]
    f8c6:	4b 8d 04 3e          	lea    rax,[r14+r15*1]
    f8ca:	48 c1 e0 05          	shl    rax,0x5
    f8ce:	48 89 da             	mov    rdx,rbx
    f8d1:	49 03 54 04 20       	add    rdx,QWORD PTR [r12+rax*1+0x20]
    f8d6:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
    f8db:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    f8e0:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
    f8e4:	48 8d 15 51 65 00 00 	lea    rdx,[rip+0x6551]        # 15e3c <_IO_stdin_used+0xe3c>
    f8eb:	be 40 00 00 00       	mov    esi,0x40
    f8f0:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
    f8f5:	b8 00 00 00 00       	mov    eax,0x0
    f8fa:	e8 f1 37 ff ff       	call   30f0 <snprintf@plt>
    f8ff:	4b 8d 04 3e          	lea    rax,[r14+r15*1]
    f903:	48 c1 e0 05          	shl    rax,0x5
    f907:	48 89 da             	mov    rdx,rbx
    f90a:	49 03 54 04 20       	add    rdx,QWORD PTR [r12+rax*1+0x20]
    f90f:	48 8b 7a 08          	mov    rdi,QWORD PTR [rdx+0x8]
    f913:	e8 18 37 ff ff       	call   3030 <free@plt>
    f918:	4d 01 fe             	add    r14,r15
    f91b:	49 c1 e6 05          	shl    r14,0x5
    f91f:	4b 03 5c 34 20       	add    rbx,QWORD PTR [r12+r14*1+0x20]
    f924:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    f929:	e8 c2 38 ff ff       	call   31f0 <strdup@plt>
    f92e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
    f932:	e9 eb fe ff ff       	jmp    f822 <expand_local_labels+0x1ed>
    f937:	41 83 c5 01          	add    r13d,0x1
    f93b:	45 39 ac 24 90 01 00 	cmp    DWORD PTR [r12+0x190],r13d
    f942:	00 
    f943:	0f 8e c0 fd ff ff    	jle    f709 <expand_local_labels+0xd4>
    f949:	49 63 c5             	movsxd rax,r13d
    f94c:	48 8d 04 40          	lea    rax,[rax+rax*2]
    f950:	48 c1 e0 05          	shl    rax,0x5
    f954:	41 80 7c 04 10 10    	cmp    BYTE PTR [r12+rax*1+0x10],0x10
    f95a:	75 db                	jne    f937 <expand_local_labels+0x302>
    f95c:	bd 00 00 00 00       	mov    ebp,0x0
    f961:	e9 bf fe ff ff       	jmp    f825 <expand_local_labels+0x1f0>
    f966:	41 bd 00 00 00 00    	mov    r13d,0x0
    f96c:	eb cd                	jmp    f93b <expand_local_labels+0x306>
    f96e:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    f974:	48 8d 35 bd 69 00 00 	lea    rsi,[rip+0x69bd]        # 16338 <_IO_stdin_used+0x1338>
    f97b:	48 8b 3d 5e b2 00 00 	mov    rdi,QWORD PTR [rip+0xb25e]        # 1abe0 <stderr@GLIBC_2.2.5>
    f982:	b8 00 00 00 00       	mov    eax,0x0
    f987:	e8 b4 37 ff ff       	call   3140 <fprintf@plt>
    f98c:	bf 01 00 00 00       	mov    edi,0x1
    f991:	e8 3a 38 ff ff       	call   31d0 <exit@plt>
    f996:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    f99c:	48 8d 35 f5 69 00 00 	lea    rsi,[rip+0x69f5]        # 16398 <_IO_stdin_used+0x1398>
    f9a3:	48 8b 3d 36 b2 00 00 	mov    rdi,QWORD PTR [rip+0xb236]        # 1abe0 <stderr@GLIBC_2.2.5>
    f9aa:	b8 00 00 00 00       	mov    eax,0x0
    f9af:	e8 8c 37 ff ff       	call   3140 <fprintf@plt>
    f9b4:	bf 01 00 00 00       	mov    edi,0x1
    f9b9:	e8 12 38 ff ff       	call   31d0 <exit@plt>
    f9be:	83 c5 01             	add    ebp,0x1
    f9c1:	41 0f b6 45 08       	movzx  eax,BYTE PTR [r13+0x8]
    f9c6:	39 e8                	cmp    eax,ebp
    f9c8:	0f 8e c8 00 00 00    	jle    fa96 <expand_local_labels+0x461>
    f9ce:	48 63 dd             	movsxd rbx,ebp
    f9d1:	48 c1 e3 04          	shl    rbx,0x4
    f9d5:	48 89 d8             	mov    rax,rbx
    f9d8:	49 03 45 10          	add    rax,QWORD PTR [r13+0x10]
    f9dc:	80 38 0e             	cmp    BYTE PTR [rax],0xe
    f9df:	75 dd                	jne    f9be <expand_local_labels+0x389>
    f9e1:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    f9e5:	80 39 2e             	cmp    BYTE PTR [rcx],0x2e
    f9e8:	75 d4                	jne    f9be <expand_local_labels+0x389>
    f9ea:	80 79 01 2e          	cmp    BYTE PTR [rcx+0x1],0x2e
    f9ee:	0f 84 7a ff ff ff    	je     f96e <expand_local_labels+0x339>
    f9f4:	83 7c 24 04 00       	cmp    DWORD PTR [rsp+0x4],0x0
    f9f9:	74 9b                	je     f996 <expand_local_labels+0x361>
    f9fb:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
    fa02:	00 00 
    fa04:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
    fa0b:	00 00 
    fa0d:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
    fa14:	00 00 
    fa16:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
    fa1d:	00 00 
    fa1f:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
    fa26:	00 00 
    fa28:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
    fa2f:	00 00 
    fa31:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
    fa38:	00 00 
    fa3a:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
    fa41:	00 00 
    fa43:	48 89 d8             	mov    rax,rbx
    fa46:	49 03 45 10          	add    rax,QWORD PTR [r13+0x10]
    fa4a:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
    fa4f:	4c 8d 7c 24 10       	lea    r15,[rsp+0x10]
    fa54:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
    fa58:	48 8d 15 dd 63 00 00 	lea    rdx,[rip+0x63dd]        # 15e3c <_IO_stdin_used+0xe3c>
    fa5f:	be 40 00 00 00       	mov    esi,0x40
    fa64:	4c 89 ff             	mov    rdi,r15
    fa67:	b8 00 00 00 00       	mov    eax,0x0
    fa6c:	e8 7f 36 ff ff       	call   30f0 <snprintf@plt>
    fa71:	48 89 d8             	mov    rax,rbx
    fa74:	49 03 45 10          	add    rax,QWORD PTR [r13+0x10]
    fa78:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
    fa7c:	e8 af 35 ff ff       	call   3030 <free@plt>
    fa81:	49 03 5d 10          	add    rbx,QWORD PTR [r13+0x10]
    fa85:	4c 89 ff             	mov    rdi,r15
    fa88:	e8 63 37 ff ff       	call   31f0 <strdup@plt>
    fa8d:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
    fa91:	e9 28 ff ff ff       	jmp    f9be <expand_local_labels+0x389>
    fa96:	41 83 c6 01          	add    r14d,0x1
    fa9a:	45 39 74 24 18       	cmp    DWORD PTR [r12+0x18],r14d
    fa9f:	0f 8e 64 fc ff ff    	jle    f709 <expand_local_labels+0xd4>
    faa5:	4d 63 ee             	movsxd r13,r14d
    faa8:	49 c1 e5 05          	shl    r13,0x5
    faac:	4d 03 6c 24 10       	add    r13,QWORD PTR [r12+0x10]
    fab1:	41 83 7d 00 01       	cmp    DWORD PTR [r13+0x0],0x1
    fab6:	75 de                	jne    fa96 <expand_local_labels+0x461>
    fab8:	bd 00 00 00 00       	mov    ebp,0x0
    fabd:	e9 ff fe ff ff       	jmp    f9c1 <expand_local_labels+0x38c>
    fac2:	48 81 c4 98 00 00 00 	add    rsp,0x98
    fac9:	5b                   	pop    rbx
    faca:	5d                   	pop    rbp
    facb:	41 5c                	pop    r12
    facd:	41 5d                	pop    r13
    facf:	41 5e                	pop    r14
    fad1:	41 5f                	pop    r15
    fad3:	c3                   	ret

000000000000fad4 <collect_labels_sections>:
    fad4:	41 57                	push   r15
    fad6:	41 56                	push   r14
    fad8:	41 55                	push   r13
    fada:	41 54                	push   r12
    fadc:	55                   	push   rbp
    fadd:	53                   	push   rbx
    fade:	48 83 ec 18          	sub    rsp,0x18
    fae2:	80 3d 02 b1 00 00 00 	cmp    BYTE PTR [rip+0xb102],0x0        # 1abeb <pie_mode>
    fae9:	74 21                	je     fb0c <collect_labels_sections+0x38>
    faeb:	41 bd 00 10 00 00    	mov    r13d,0x1000
    faf1:	bd 00 00 00 00       	mov    ebp,0x0
    faf6:	41 bf 00 00 00 00    	mov    r15d,0x0
    fafc:	41 be 00 00 00 00    	mov    r14d,0x0
    fb02:	c6 44 24 07 00       	mov    BYTE PTR [rsp+0x7],0x0
    fb07:	e9 c7 01 00 00       	jmp    fcd3 <collect_labels_sections+0x1ff>
    fb0c:	41 bd 00 10 40 00    	mov    r13d,0x401000
    fb12:	eb dd                	jmp    faf1 <collect_labels_sections+0x1d>
    fb14:	83 c3 01             	add    ebx,0x1
    fb17:	39 dd                	cmp    ebp,ebx
    fb19:	7e 61                	jle    fb7c <collect_labels_sections+0xa8>
    fb1b:	48 8b 05 e6 b4 00 00 	mov    rax,QWORD PTR [rip+0xb4e6]        # 1b008 <ast>
    fb22:	48 63 fb             	movsxd rdi,ebx
    fb25:	48 69 ff b8 01 00 00 	imul   rdi,rdi,0x1b8
    fb2c:	48 01 c7             	add    rdi,rax
    fb2f:	80 3f 08             	cmp    BYTE PTR [rdi],0x8
    fb32:	75 e0                	jne    fb14 <collect_labels_sections+0x40>
    fb34:	4a 8d 74 20 10       	lea    rsi,[rax+r12*1+0x10]
    fb39:	48 83 c7 10          	add    rdi,0x10
    fb3d:	e8 fe 4c 00 00       	call   14840 <astrcmp>
    fb42:	85 c0                	test   eax,eax
    fb44:	75 ce                	jne    fb14 <collect_labels_sections+0x40>
    fb46:	4c 03 25 bb b4 00 00 	add    r12,QWORD PTR [rip+0xb4bb]        # 1b008 <ast>
    fb4d:	49 8d 4c 24 10       	lea    rcx,[r12+0x10]
    fb52:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    fb58:	48 8d 35 89 68 00 00 	lea    rsi,[rip+0x6889]        # 163e8 <_IO_stdin_used+0x13e8>
    fb5f:	48 8b 3d 7a b0 00 00 	mov    rdi,QWORD PTR [rip+0xb07a]        # 1abe0 <stderr@GLIBC_2.2.5>
    fb66:	e8 d5 35 ff ff       	call   3140 <fprintf@plt>
    fb6b:	bf 01 00 00 00       	mov    edi,0x1
    fb70:	e8 5b 36 ff ff       	call   31d0 <exit@plt>
    fb75:	bb 00 00 00 00       	mov    ebx,0x0
    fb7a:	eb 9b                	jmp    fb17 <collect_labels_sections+0x43>
    fb7c:	0f b6 05 68 b0 00 00 	movzx  eax,BYTE PTR [rip+0xb068]        # 1abeb <pie_mode>
    fb83:	84 c0                	test   al,al
    fb85:	75 7a                	jne    fc01 <collect_labels_sections+0x12d>
    fb87:	49 8d 8d 00 00 c0 ff 	lea    rcx,[r13-0x400000]
    fb8e:	4c 89 e2             	mov    rdx,r12
    fb91:	48 03 15 70 b4 00 00 	add    rdx,QWORD PTR [rip+0xb470]        # 1b008 <ast>
    fb98:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
    fb9f:	4c 89 aa 98 00 00 00 	mov    QWORD PTR [rdx+0x98],r13
    fba6:	80 3d 3f b0 00 00 00 	cmp    BYTE PTR [rip+0xb03f],0x0        # 1abec <debug>
    fbad:	74 1f                	je     fbce <collect_labels_sections+0xfa>
    fbaf:	84 c0                	test   al,al
    fbb1:	75 03                	jne    fbb6 <collect_labels_sections+0xe2>
    fbb3:	4c 89 e9             	mov    rcx,r13
    fbb6:	48 83 c2 10          	add    rdx,0x10
    fbba:	44 89 f6             	mov    esi,r14d
    fbbd:	48 8d 3d 4c 68 00 00 	lea    rdi,[rip+0x684c]        # 16410 <_IO_stdin_used+0x1410>
    fbc4:	b8 00 00 00 00       	mov    eax,0x0
    fbc9:	e8 02 35 ff ff       	call   30d0 <printf@plt>
    fbce:	41 83 c6 01          	add    r14d,0x1
    fbd2:	4c 03 25 2f b4 00 00 	add    r12,QWORD PTR [rip+0xb42f]        # 1b008 <ast>
    fbd9:	49 8d 7c 24 10       	lea    rdi,[r12+0x10]
    fbde:	48 8d 35 f5 67 00 00 	lea    rsi,[rip+0x67f5]        # 163da <_IO_stdin_used+0x13da>
    fbe5:	e8 56 4c 00 00       	call   14840 <astrcmp>
    fbea:	85 c0                	test   eax,eax
    fbec:	0f 85 de 00 00 00    	jne    fcd0 <collect_labels_sections+0x1fc>
    fbf2:	4c 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],r13
    fbf7:	c6 44 24 07 01       	mov    BYTE PTR [rsp+0x7],0x1
    fbfc:	e9 cf 00 00 00       	jmp    fcd0 <collect_labels_sections+0x1fc>
    fc01:	4c 89 e9             	mov    rcx,r13
    fc04:	eb 88                	jmp    fb8e <collect_labels_sections+0xba>
    fc06:	83 c3 01             	add    ebx,0x1
    fc09:	39 dd                	cmp    ebp,ebx
    fc0b:	7e 61                	jle    fc6e <collect_labels_sections+0x19a>
    fc0d:	48 8b 05 f4 b3 00 00 	mov    rax,QWORD PTR [rip+0xb3f4]        # 1b008 <ast>
    fc14:	48 63 fb             	movsxd rdi,ebx
    fc17:	48 69 ff b8 01 00 00 	imul   rdi,rdi,0x1b8
    fc1e:	48 01 c7             	add    rdi,rax
    fc21:	80 3f 0b             	cmp    BYTE PTR [rdi],0xb
    fc24:	75 e0                	jne    fc06 <collect_labels_sections+0x132>
    fc26:	4a 8d 74 20 10       	lea    rsi,[rax+r12*1+0x10]
    fc2b:	48 83 c7 10          	add    rdi,0x10
    fc2f:	e8 0c 4c 00 00       	call   14840 <astrcmp>
    fc34:	85 c0                	test   eax,eax
    fc36:	75 ce                	jne    fc06 <collect_labels_sections+0x132>
    fc38:	4c 03 25 c9 b3 00 00 	add    r12,QWORD PTR [rip+0xb3c9]        # 1b008 <ast>
    fc3f:	49 8d 4c 24 10       	lea    rcx,[r12+0x10]
    fc44:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
    fc4a:	48 8d 35 e7 67 00 00 	lea    rsi,[rip+0x67e7]        # 16438 <_IO_stdin_used+0x1438>
    fc51:	48 8b 3d 88 af 00 00 	mov    rdi,QWORD PTR [rip+0xaf88]        # 1abe0 <stderr@GLIBC_2.2.5>
    fc58:	e8 e3 34 ff ff       	call   3140 <fprintf@plt>
    fc5d:	bf 01 00 00 00       	mov    edi,0x1
    fc62:	e8 69 35 ff ff       	call   31d0 <exit@plt>
    fc67:	bb 00 00 00 00       	mov    ebx,0x0
    fc6c:	eb 9b                	jmp    fc09 <collect_labels_sections+0x135>
    fc6e:	0f b6 05 76 af 00 00 	movzx  eax,BYTE PTR [rip+0xaf76]        # 1abeb <pie_mode>
    fc75:	84 c0                	test   al,al
    fc77:	75 47                	jne    fcc0 <collect_labels_sections+0x1ec>
    fc79:	49 8d 8d 00 00 c0 ff 	lea    rcx,[r13-0x400000]
    fc80:	4c 03 25 81 b3 00 00 	add    r12,QWORD PTR [rip+0xb381]        # 1b008 <ast>
    fc87:	49 89 4c 24 50       	mov    QWORD PTR [r12+0x50],rcx
    fc8c:	4d 89 6c 24 58       	mov    QWORD PTR [r12+0x58],r13
    fc91:	80 3d 54 af 00 00 00 	cmp    BYTE PTR [rip+0xaf54],0x0        # 1abec <debug>
    fc98:	74 20                	je     fcba <collect_labels_sections+0x1e6>
    fc9a:	84 c0                	test   al,al
    fc9c:	75 03                	jne    fca1 <collect_labels_sections+0x1cd>
    fc9e:	4c 89 e9             	mov    rcx,r13
    fca1:	49 8d 54 24 10       	lea    rdx,[r12+0x10]
    fca6:	44 89 fe             	mov    esi,r15d
    fca9:	48 8d 3d b8 67 00 00 	lea    rdi,[rip+0x67b8]        # 16468 <_IO_stdin_used+0x1468>
    fcb0:	b8 00 00 00 00       	mov    eax,0x0
    fcb5:	e8 16 34 ff ff       	call   30d0 <printf@plt>
    fcba:	41 83 c7 01          	add    r15d,0x1
    fcbe:	eb 10                	jmp    fcd0 <collect_labels_sections+0x1fc>
    fcc0:	4c 89 e9             	mov    rcx,r13
    fcc3:	eb bb                	jmp    fc80 <collect_labels_sections+0x1ac>
    fcc5:	3c 10                	cmp    al,0x10
    fcc7:	74 67                	je     fd30 <collect_labels_sections+0x25c>
    fcc9:	4c 03 aa a8 01 00 00 	add    r13,QWORD PTR [rdx+0x1a8]
    fcd0:	83 c5 01             	add    ebp,0x1
    fcd3:	39 2d 2b b3 00 00    	cmp    DWORD PTR [rip+0xb32b],ebp        # 1b004 <ast_len>
    fcd9:	7e 60                	jle    fd3b <collect_labels_sections+0x267>
    fcdb:	4c 63 e5             	movsxd r12,ebp
    fcde:	4d 69 e4 b8 01 00 00 	imul   r12,r12,0x1b8
    fce5:	4c 89 e2             	mov    rdx,r12
    fce8:	48 03 15 19 b3 00 00 	add    rdx,QWORD PTR [rip+0xb319]        # 1b008 <ast>
    fcef:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    fcf2:	3c 08                	cmp    al,0x8
    fcf4:	0f 84 7b fe ff ff    	je     fb75 <collect_labels_sections+0xa1>
    fcfa:	3c 0b                	cmp    al,0xb
    fcfc:	0f 84 65 ff ff ff    	je     fc67 <collect_labels_sections+0x193>
    fd02:	8d 48 ff             	lea    ecx,[rax-0x1]
    fd05:	80 f9 04             	cmp    cl,0x4
    fd08:	77 0a                	ja     fd14 <collect_labels_sections+0x240>
    fd0a:	48 83 ba a8 01 00 00 	cmp    QWORD PTR [rdx+0x1a8],0x0
    fd11:	00 
    fd12:	75 b1                	jne    fcc5 <collect_labels_sections+0x1f1>
    fd14:	3c 10                	cmp    al,0x10
    fd16:	0f 94 c1             	sete   cl
    fd19:	3c 06                	cmp    al,0x6
    fd1b:	40 0f 94 c6          	sete   sil
    fd1f:	40 08 f1             	or     cl,sil
    fd22:	74 ac                	je     fcd0 <collect_labels_sections+0x1fc>
    fd24:	48 83 ba a8 01 00 00 	cmp    QWORD PTR [rdx+0x1a8],0x0
    fd2b:	00 
    fd2c:	74 a2                	je     fcd0 <collect_labels_sections+0x1fc>
    fd2e:	eb 95                	jmp    fcc5 <collect_labels_sections+0x1f1>
    fd30:	80 3d b3 ae 00 00 00 	cmp    BYTE PTR [rip+0xaeb3],0x0        # 1abea <obj_file>
    fd37:	74 90                	je     fcc9 <collect_labels_sections+0x1f5>
    fd39:	eb 95                	jmp    fcd0 <collect_labels_sections+0x1fc>
    fd3b:	80 7c 24 07 00       	cmp    BYTE PTR [rsp+0x7],0x0
    fd40:	75 49                	jne    fd8b <collect_labels_sections+0x2b7>
    fd42:	80 3d a1 ae 00 00 00 	cmp    BYTE PTR [rip+0xaea1],0x0        # 1abea <obj_file>
    fd49:	75 40                	jne    fd8b <collect_labels_sections+0x2b7>
    fd4b:	0f b6 05 99 ae 00 00 	movzx  eax,BYTE PTR [rip+0xae99]        # 1abeb <pie_mode>
    fd52:	84 c0                	test   al,al
    fd54:	74 49                	je     fd9f <collect_labels_sections+0x2cb>
    fd56:	48 8d 15 67 66 00 00 	lea    rdx,[rip+0x6667]        # 163c4 <_IO_stdin_used+0x13c4>
    fd5d:	84 c0                	test   al,al
    fd5f:	74 47                	je     fda8 <collect_labels_sections+0x2d4>
    fd61:	48 8d 35 62 66 00 00 	lea    rsi,[rip+0x6662]        # 163ca <_IO_stdin_used+0x13ca>
    fd68:	48 8d 3d 21 67 00 00 	lea    rdi,[rip+0x6721]        # 16490 <_IO_stdin_used+0x1490>
    fd6f:	b8 00 00 00 00       	mov    eax,0x0
    fd74:	e8 57 33 ff ff       	call   30d0 <printf@plt>
    fd79:	80 3d 6b ae 00 00 00 	cmp    BYTE PTR [rip+0xae6b],0x0        # 1abeb <pie_mode>
    fd80:	74 2f                	je     fdb1 <collect_labels_sections+0x2dd>
    fd82:	48 c7 44 24 08 00 10 	mov    QWORD PTR [rsp+0x8],0x1000
    fd89:	00 00 
    fd8b:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    fd90:	48 83 c4 18          	add    rsp,0x18
    fd94:	5b                   	pop    rbx
    fd95:	5d                   	pop    rbp
    fd96:	41 5c                	pop    r12
    fd98:	41 5d                	pop    r13
    fd9a:	41 5e                	pop    r14
    fd9c:	41 5f                	pop    r15
    fd9e:	c3                   	ret
    fd9f:	48 8d 15 69 71 00 00 	lea    rdx,[rip+0x7169]        # 16f0f <_IO_stdin_used+0x1f0f>
    fda6:	eb b5                	jmp    fd5d <collect_labels_sections+0x289>
    fda8:	48 8d 35 22 66 00 00 	lea    rsi,[rip+0x6622]        # 163d1 <_IO_stdin_used+0x13d1>
    fdaf:	eb b7                	jmp    fd68 <collect_labels_sections+0x294>
    fdb1:	48 c7 44 24 08 00 10 	mov    QWORD PTR [rsp+0x8],0x401000
    fdb8:	40 00 
    fdba:	eb cf                	jmp    fd8b <collect_labels_sections+0x2b7>

000000000000fdbc <resolve_expr>:
    fdbc:	41 56                	push   r14
    fdbe:	41 55                	push   r13
    fdc0:	41 54                	push   r12
    fdc2:	55                   	push   rbp
    fdc3:	53                   	push   rbx
    fdc4:	49 89 fd             	mov    r13,rdi
    fdc7:	41 89 f6             	mov    r14d,esi
    fdca:	c6 05 2f ae 00 00 00 	mov    BYTE PTR [rip+0xae2f],0x0        # 1ac00 <buffer.0>
    fdd1:	bd 00 00 00 00       	mov    ebp,0x0
    fdd6:	41 bc 00 00 00 00    	mov    r12d,0x0
    fddc:	eb 3a                	jmp    fe18 <resolve_expr+0x5c>
    fdde:	3c 28                	cmp    al,0x28
    fde0:	0f 85 a8 01 00 00    	jne    ff8e <resolve_expr+0x1d2>
    fde6:	be 00 04 00 00       	mov    esi,0x400
    fdeb:	44 29 e6             	sub    esi,r12d
    fdee:	48 63 f6             	movsxd rsi,esi
    fdf1:	49 63 fc             	movsxd rdi,r12d
    fdf4:	48 8d 05 05 ae 00 00 	lea    rax,[rip+0xae05]        # 1ac00 <buffer.0>
    fdfb:	48 01 c7             	add    rdi,rax
    fdfe:	4c 89 e9             	mov    rcx,r13
    fe01:	48 8d 15 1a 67 00 00 	lea    rdx,[rip+0x671a]        # 16522 <_IO_stdin_used+0x1522>
    fe08:	b8 00 00 00 00       	mov    eax,0x0
    fe0d:	e8 de 32 ff ff       	call   30f0 <snprintf@plt>
    fe12:	41 01 c4             	add    r12d,eax
    fe15:	83 c5 01             	add    ebp,0x1
    fe18:	0f b6 44 24 30       	movzx  eax,BYTE PTR [rsp+0x30]
    fe1d:	39 e8                	cmp    eax,ebp
    fe1f:	0f 8e 9e 01 00 00    	jle    ffc3 <resolve_expr+0x207>
    fe25:	48 63 dd             	movsxd rbx,ebp
    fe28:	48 c1 e3 04          	shl    rbx,0x4
    fe2c:	48 03 5c 24 38       	add    rbx,QWORD PTR [rsp+0x38]
    fe31:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    fe34:	3c 1e                	cmp    al,0x1e
    fe36:	0f 84 1a 01 00 00    	je     ff56 <resolve_expr+0x19a>
    fe3c:	77 a0                	ja     fdde <resolve_expr+0x22>
    fe3e:	3c 0e                	cmp    al,0xe
    fe40:	74 4b                	je     fe8d <resolve_expr+0xd1>
    fe42:	3c 19                	cmp    al,0x19
    fe44:	0f 85 44 01 00 00    	jne    ff8e <resolve_expr+0x1d2>
    fe4a:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
    fe4e:	e8 c4 3c 00 00       	call   13b17 <find_sec_addr>
    fe53:	48 89 c1             	mov    rcx,rax
    fe56:	48 85 c0             	test   rax,rax
    fe59:	0f 84 ce 00 00 00    	je     ff2d <resolve_expr+0x171>
    fe5f:	be 00 04 00 00       	mov    esi,0x400
    fe64:	44 29 e6             	sub    esi,r12d
    fe67:	48 63 f6             	movsxd rsi,esi
    fe6a:	49 63 fc             	movsxd rdi,r12d
    fe6d:	48 8d 05 8c ad 00 00 	lea    rax,[rip+0xad8c]        # 1ac00 <buffer.0>
    fe74:	48 01 c7             	add    rdi,rax
    fe77:	48 8d 15 a4 66 00 00 	lea    rdx,[rip+0x66a4]        # 16522 <_IO_stdin_used+0x1522>
    fe7e:	b8 00 00 00 00       	mov    eax,0x0
    fe83:	e8 68 32 ff ff       	call   30f0 <snprintf@plt>
    fe88:	41 01 c4             	add    r12d,eax
    fe8b:	eb 88                	jmp    fe15 <resolve_expr+0x59>
    fe8d:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
    fe91:	80 3f 2e             	cmp    BYTE PTR [rdi],0x2e
    fe94:	74 49                	je     fedf <resolve_expr+0x123>
    fe96:	e8 09 3c 00 00       	call   13aa4 <find_lab_addr>
    fe9b:	48 89 c1             	mov    rcx,rax
    fe9e:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    fea2:	74 60                	je     ff04 <resolve_expr+0x148>
    fea4:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
    fea8:	0f 84 24 01 00 00    	je     ffd2 <resolve_expr+0x216>
    feae:	be 00 04 00 00       	mov    esi,0x400
    feb3:	44 29 e6             	sub    esi,r12d
    feb6:	48 63 f6             	movsxd rsi,esi
    feb9:	49 63 fc             	movsxd rdi,r12d
    febc:	48 8d 05 3d ad 00 00 	lea    rax,[rip+0xad3d]        # 1ac00 <buffer.0>
    fec3:	48 01 c7             	add    rdi,rax
    fec6:	48 8d 15 55 66 00 00 	lea    rdx,[rip+0x6655]        # 16522 <_IO_stdin_used+0x1522>
    fecd:	b8 00 00 00 00       	mov    eax,0x0
    fed2:	e8 19 32 ff ff       	call   30f0 <snprintf@plt>
    fed7:	41 01 c4             	add    r12d,eax
    feda:	e9 36 ff ff ff       	jmp    fe15 <resolve_expr+0x59>
    fedf:	44 89 f2             	mov    edx,r14d
    fee2:	48 8d 35 ef 65 00 00 	lea    rsi,[rip+0x65ef]        # 164d8 <_IO_stdin_used+0x14d8>
    fee9:	48 8b 3d f0 ac 00 00 	mov    rdi,QWORD PTR [rip+0xacf0]        # 1abe0 <stderr@GLIBC_2.2.5>
    fef0:	b8 00 00 00 00       	mov    eax,0x0
    fef5:	e8 46 32 ff ff       	call   3140 <fprintf@plt>
    fefa:	bf 01 00 00 00       	mov    edi,0x1
    feff:	e8 cc 32 ff ff       	call   31d0 <exit@plt>
    ff04:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
    ff08:	44 89 f2             	mov    edx,r14d
    ff0b:	48 8d 35 ee 65 00 00 	lea    rsi,[rip+0x65ee]        # 16500 <_IO_stdin_used+0x1500>
    ff12:	48 8b 3d c7 ac 00 00 	mov    rdi,QWORD PTR [rip+0xacc7]        # 1abe0 <stderr@GLIBC_2.2.5>
    ff19:	b8 00 00 00 00       	mov    eax,0x0
    ff1e:	e8 1d 32 ff ff       	call   3140 <fprintf@plt>
    ff23:	bf 01 00 00 00       	mov    edi,0x1
    ff28:	e8 a3 32 ff ff       	call   31d0 <exit@plt>
    ff2d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
    ff31:	44 89 f2             	mov    edx,r14d
    ff34:	48 8d 35 c5 65 00 00 	lea    rsi,[rip+0x65c5]        # 16500 <_IO_stdin_used+0x1500>
    ff3b:	48 8b 3d 9e ac 00 00 	mov    rdi,QWORD PTR [rip+0xac9e]        # 1abe0 <stderr@GLIBC_2.2.5>
    ff42:	b8 00 00 00 00       	mov    eax,0x0
    ff47:	e8 f4 31 ff ff       	call   3140 <fprintf@plt>
    ff4c:	bf 01 00 00 00       	mov    edi,0x1
    ff51:	e8 7a 32 ff ff       	call   31d0 <exit@plt>
    ff56:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
    ff5a:	be 00 04 00 00       	mov    esi,0x400
    ff5f:	44 29 e6             	sub    esi,r12d
    ff62:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
    ff65:	48 63 f6             	movsxd rsi,esi
    ff68:	49 63 fc             	movsxd rdi,r12d
    ff6b:	48 8d 05 8e ac 00 00 	lea    rax,[rip+0xac8e]        # 1ac00 <buffer.0>
    ff72:	48 01 c7             	add    rdi,rax
    ff75:	48 8d 15 fb 53 00 00 	lea    rdx,[rip+0x53fb]        # 15377 <_IO_stdin_used+0x377>
    ff7c:	b8 00 00 00 00       	mov    eax,0x0
    ff81:	e8 6a 31 ff ff       	call   30f0 <snprintf@plt>
    ff86:	41 01 c4             	add    r12d,eax
    ff89:	e9 87 fe ff ff       	jmp    fe15 <resolve_expr+0x59>
    ff8e:	be 00 04 00 00       	mov    esi,0x400
    ff93:	44 29 e6             	sub    esi,r12d
    ff96:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
    ff9a:	48 63 f6             	movsxd rsi,esi
    ff9d:	49 63 fc             	movsxd rdi,r12d
    ffa0:	48 8d 05 59 ac 00 00 	lea    rax,[rip+0xac59]        # 1ac00 <buffer.0>
    ffa7:	48 01 c7             	add    rdi,rax
    ffaa:	48 8d 15 8d 5e 00 00 	lea    rdx,[rip+0x5e8d]        # 15e3e <_IO_stdin_used+0xe3e>
    ffb1:	b8 00 00 00 00       	mov    eax,0x0
    ffb6:	e8 35 31 ff ff       	call   30f0 <snprintf@plt>
    ffbb:	41 01 c4             	add    r12d,eax
    ffbe:	e9 52 fe ff ff       	jmp    fe15 <resolve_expr+0x59>
    ffc3:	48 8d 3d 36 ac 00 00 	lea    rdi,[rip+0xac36]        # 1ac00 <buffer.0>
    ffca:	e8 91 43 00 00       	call   14360 <eval_expr>
    ffcf:	48 89 c1             	mov    rcx,rax
    ffd2:	48 89 c8             	mov    rax,rcx
    ffd5:	5b                   	pop    rbx
    ffd6:	5d                   	pop    rbp
    ffd7:	41 5c                	pop    r12
    ffd9:	41 5d                	pop    r13
    ffdb:	41 5e                	pop    r14
    ffdd:	c3                   	ret

000000000000ffde <resolve_labels>:
    ffde:	41 57                	push   r15
    ffe0:	41 56                	push   r14
    ffe2:	41 55                	push   r13
    ffe4:	41 54                	push   r12
    ffe6:	55                   	push   rbp
    ffe7:	53                   	push   rbx
    ffe8:	48 81 ec 28 01 00 00 	sub    rsp,0x128
    ffef:	41 be 00 00 00 00    	mov    r14d,0x0
    fff5:	eb 7a                	jmp    10071 <resolve_labels+0x93>
    fff7:	3c 01                	cmp    al,0x1
    fff9:	0f 84 ba 00 00 00    	je     100b9 <resolve_labels+0xdb>
    ffff:	48 8d 6b 01          	lea    rbp,[rbx+0x1]
   10003:	48 8d 35 96 55 00 00 	lea    rsi,[rip+0x5596]        # 155a0 <_IO_stdin_used+0x5a0>
   1000a:	48 89 ef             	mov    rdi,rbp
   1000d:	e8 3e 30 ff ff       	call   3050 <strcasecmp@plt>
   10012:	85 c0                	test   eax,eax
   10014:	74 17                	je     1002d <resolve_labels+0x4f>
   10016:	48 8d 35 e9 5d 00 00 	lea    rsi,[rip+0x5de9]        # 15e06 <_IO_stdin_used+0xe06>
   1001d:	48 89 ef             	mov    rdi,rbp
   10020:	e8 2b 30 ff ff       	call   3050 <strcasecmp@plt>
   10025:	85 c0                	test   eax,eax
   10027:	0f 85 a0 02 00 00    	jne    102cd <resolve_labels+0x2ef>
   1002d:	0f b6 43 10          	movzx  eax,BYTE PTR [rbx+0x10]
   10031:	83 e8 10             	sub    eax,0x10
   10034:	3c 01                	cmp    al,0x1
   10036:	0f 86 ad 02 00 00    	jbe    102e9 <resolve_labels+0x30b>
   1003c:	0f b6 43 10          	movzx  eax,BYTE PTR [rbx+0x10]
   10040:	3c 14                	cmp    al,0x14
   10042:	0f 84 00 03 00 00    	je     10348 <resolve_labels+0x36a>
   10048:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
   1004c:	0f 84 2e 04 00 00    	je     10480 <resolve_labels+0x4a2>
   10052:	80 3b 05             	cmp    BYTE PTR [rbx],0x5
   10055:	0f 84 82 05 00 00    	je     105dd <resolve_labels+0x5ff>
   1005b:	80 3b 0e             	cmp    BYTE PTR [rbx],0xe
   1005e:	0f 84 bd 05 00 00    	je     10621 <resolve_labels+0x643>
   10064:	80 3b 0f             	cmp    BYTE PTR [rbx],0xf
   10067:	0f 84 85 06 00 00    	je     106f2 <resolve_labels+0x714>
   1006d:	41 83 c6 01          	add    r14d,0x1
   10071:	44 39 35 8c af 00 00 	cmp    DWORD PTR [rip+0xaf8c],r14d        # 1b004 <ast_len>
   10078:	0f 8e 7c 06 00 00    	jle    106fa <resolve_labels+0x71c>
   1007e:	4d 63 e6             	movsxd r12,r14d
   10081:	4d 69 e4 b8 01 00 00 	imul   r12,r12,0x1b8
   10088:	4c 89 e3             	mov    rbx,r12
   1008b:	48 03 1d 76 af 00 00 	add    rbx,QWORD PTR [rip+0xaf76]        # 1b008 <ast>
   10092:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   10095:	3c 01                	cmp    al,0x1
   10097:	0f 95 c1             	setne  cl
   1009a:	3c 05                	cmp    al,0x5
   1009c:	0f 95 c2             	setne  dl
   1009f:	84 d1                	test   cl,dl
   100a1:	0f 84 50 ff ff ff    	je     fff7 <resolve_labels+0x19>
   100a7:	3c 0e                	cmp    al,0xe
   100a9:	0f 84 48 ff ff ff    	je     fff7 <resolve_labels+0x19>
   100af:	3c 0f                	cmp    al,0xf
   100b1:	0f 84 40 ff ff ff    	je     fff7 <resolve_labels+0x19>
   100b7:	eb b4                	jmp    1006d <resolve_labels+0x8f>
   100b9:	f3 0f 6f 43 10       	movdqu xmm0,XMMWORD PTR [rbx+0x10]
   100be:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
   100c2:	f3 0f 6f 4b 20       	movdqu xmm1,XMMWORD PTR [rbx+0x20]
   100c7:	0f 29 4c 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm1
   100cc:	f3 0f 6f 53 30       	movdqu xmm2,XMMWORD PTR [rbx+0x30]
   100d1:	0f 29 54 24 20       	movaps XMMWORD PTR [rsp+0x20],xmm2
   100d6:	f3 0f 6f 5b 40       	movdqu xmm3,XMMWORD PTR [rbx+0x40]
   100db:	0f 29 5c 24 30       	movaps XMMWORD PTR [rsp+0x30],xmm3
   100e0:	f3 0f 6f 63 50       	movdqu xmm4,XMMWORD PTR [rbx+0x50]
   100e5:	0f 29 64 24 40       	movaps XMMWORD PTR [rsp+0x40],xmm4
   100ea:	f3 0f 6f 6b 60       	movdqu xmm5,XMMWORD PTR [rbx+0x60]
   100ef:	0f 29 6c 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm5
   100f4:	f3 0f 6f 73 70       	movdqu xmm6,XMMWORD PTR [rbx+0x70]
   100f9:	0f 29 74 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm6
   100fe:	f3 0f 6f bb 80 00 00 	movdqu xmm7,XMMWORD PTR [rbx+0x80]
   10105:	00 
   10106:	0f 29 7c 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm7
   1010b:	f3 0f 6f 83 90 00 00 	movdqu xmm0,XMMWORD PTR [rbx+0x90]
   10112:	00 
   10113:	0f 29 84 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm0
   1011a:	00 
   1011b:	f3 0f 6f 8b a0 00 00 	movdqu xmm1,XMMWORD PTR [rbx+0xa0]
   10122:	00 
   10123:	0f 29 8c 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm1
   1012a:	00 
   1012b:	f3 0f 6f 93 b0 00 00 	movdqu xmm2,XMMWORD PTR [rbx+0xb0]
   10132:	00 
   10133:	0f 29 94 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm2
   1013a:	00 
   1013b:	f3 0f 6f 9b c0 00 00 	movdqu xmm3,XMMWORD PTR [rbx+0xc0]
   10142:	00 
   10143:	0f 29 9c 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm3
   1014a:	00 
   1014b:	f3 0f 6f a3 d0 00 00 	movdqu xmm4,XMMWORD PTR [rbx+0xd0]
   10152:	00 
   10153:	0f 29 a4 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm4
   1015a:	00 
   1015b:	f3 0f 6f ab e0 00 00 	movdqu xmm5,XMMWORD PTR [rbx+0xe0]
   10162:	00 
   10163:	0f 29 ac 24 d0 00 00 	movaps XMMWORD PTR [rsp+0xd0],xmm5
   1016a:	00 
   1016b:	f3 0f 6f b3 f0 00 00 	movdqu xmm6,XMMWORD PTR [rbx+0xf0]
   10172:	00 
   10173:	0f 29 b4 24 e0 00 00 	movaps XMMWORD PTR [rsp+0xe0],xmm6
   1017a:	00 
   1017b:	f3 0f 6f bb 00 01 00 	movdqu xmm7,XMMWORD PTR [rbx+0x100]
   10182:	00 
   10183:	0f 29 bc 24 f0 00 00 	movaps XMMWORD PTR [rsp+0xf0],xmm7
   1018a:	00 
   1018b:	f3 0f 6f 83 10 01 00 	movdqu xmm0,XMMWORD PTR [rbx+0x110]
   10192:	00 
   10193:	0f 29 84 24 00 01 00 	movaps XMMWORD PTR [rsp+0x100],xmm0
   1019a:	00 
   1019b:	f3 0f 6f 8b 20 01 00 	movdqu xmm1,XMMWORD PTR [rbx+0x120]
   101a2:	00 
   101a3:	0f 29 8c 24 10 01 00 	movaps XMMWORD PTR [rsp+0x110],xmm1
   101aa:	00 
   101ab:	0f b6 ab c8 00 00 00 	movzx  ebp,BYTE PTR [rbx+0xc8]
   101b2:	40 80 fd 08          	cmp    bpl,0x8
   101b6:	74 65                	je     1021d <resolve_labels+0x23f>
   101b8:	41 89 ed             	mov    r13d,ebp
   101bb:	48 8d 73 01          	lea    rsi,[rbx+0x1]
   101bf:	48 8d 3d 7a 9f 00 00 	lea    rdi,[rip+0x9f7a]        # 1a140 <short_imm_instructions>
   101c6:	e8 db 35 00 00       	call   137a6 <is2arrin>
   101cb:	85 c0                	test   eax,eax
   101cd:	74 0c                	je     101db <resolve_labels+0x1fd>
   101cf:	0f b6 44 24 60       	movzx  eax,BYTE PTR [rsp+0x60]
   101d4:	83 e8 10             	sub    eax,0x10
   101d7:	3c 01                	cmp    al,0x1
   101d9:	76 4a                	jbe    10225 <resolve_labels+0x247>
   101db:	0f b6 04 24          	movzx  eax,BYTE PTR [rsp]
   101df:	3c 0e                	cmp    al,0xe
   101e1:	0f 84 96 00 00 00    	je     1027d <resolve_labels+0x29f>
   101e7:	3c 0d                	cmp    al,0xd
   101e9:	0f 84 b6 00 00 00    	je     102a5 <resolve_labels+0x2c7>
   101ef:	3c 14                	cmp    al,0x14
   101f1:	0f 85 08 fe ff ff    	jne    ffff <resolve_labels+0x21>
   101f7:	0f b6 44 24 60       	movzx  eax,BYTE PTR [rsp+0x60]
   101fc:	83 e8 10             	sub    eax,0x10
   101ff:	3c 01                	cmp    al,0x1
   10201:	0f 87 f8 fd ff ff    	ja     ffff <resolve_labels+0x21>
   10207:	41 0f b6 d5          	movzx  edx,r13b
   1020b:	be 01 00 00 00       	mov    esi,0x1
   10210:	48 89 df             	mov    rdi,rbx
   10213:	e8 72 36 00 00       	call   1388a <resolve_imm>
   10218:	e9 e2 fd ff ff       	jmp    ffff <resolve_labels+0x21>
   1021d:	41 bd 04 00 00 00    	mov    r13d,0x4
   10223:	eb 96                	jmp    101bb <resolve_labels+0x1dd>
   10225:	0f b6 04 24          	movzx  eax,BYTE PTR [rsp]
   10229:	3c 14                	cmp    al,0x14
   1022b:	74 1e                	je     1024b <resolve_labels+0x26d>
   1022d:	83 e8 0d             	sub    eax,0xd
   10230:	3c 01                	cmp    al,0x1
   10232:	76 23                	jbe    10257 <resolve_labels+0x279>
   10234:	ba 00 00 00 00       	mov    edx,0x0
   10239:	be 01 00 00 00       	mov    esi,0x1
   1023e:	48 89 df             	mov    rdi,rbx
   10241:	e8 44 36 00 00       	call   1388a <resolve_imm>
   10246:	e9 b4 fd ff ff       	jmp    ffff <resolve_labels+0x21>
   1024b:	40 80 fd 08          	cmp    bpl,0x8
   1024f:	74 17                	je     10268 <resolve_labels+0x28a>
   10251:	40 0f b6 d5          	movzx  edx,bpl
   10255:	eb e2                	jmp    10239 <resolve_labels+0x25b>
   10257:	40 84 ed             	test   bpl,bpl
   1025a:	74 13                	je     1026f <resolve_labels+0x291>
   1025c:	40 80 fd 08          	cmp    bpl,0x8
   10260:	74 14                	je     10276 <resolve_labels+0x298>
   10262:	40 0f b6 d5          	movzx  edx,bpl
   10266:	eb d1                	jmp    10239 <resolve_labels+0x25b>
   10268:	ba 04 00 00 00       	mov    edx,0x4
   1026d:	eb ca                	jmp    10239 <resolve_labels+0x25b>
   1026f:	ba 04 00 00 00       	mov    edx,0x4
   10274:	eb c3                	jmp    10239 <resolve_labels+0x25b>
   10276:	ba 04 00 00 00       	mov    edx,0x4
   1027b:	eb bc                	jmp    10239 <resolve_labels+0x25b>
   1027d:	0f b6 4c 24 60       	movzx  ecx,BYTE PTR [rsp+0x60]
   10282:	8d 51 f0             	lea    edx,[rcx-0x10]
   10285:	80 fa 01             	cmp    dl,0x1
   10288:	0f 87 59 ff ff ff    	ja     101e7 <resolve_labels+0x209>
   1028e:	ba 08 00 00 00       	mov    edx,0x8
   10293:	be 01 00 00 00       	mov    esi,0x1
   10298:	48 89 df             	mov    rdi,rbx
   1029b:	e8 ea 35 00 00       	call   1388a <resolve_imm>
   102a0:	e9 5a fd ff ff       	jmp    ffff <resolve_labels+0x21>
   102a5:	0f b6 4c 24 60       	movzx  ecx,BYTE PTR [rsp+0x60]
   102aa:	8d 51 f0             	lea    edx,[rcx-0x10]
   102ad:	80 fa 01             	cmp    dl,0x1
   102b0:	0f 87 39 ff ff ff    	ja     101ef <resolve_labels+0x211>
   102b6:	ba 04 00 00 00       	mov    edx,0x4
   102bb:	be 01 00 00 00       	mov    esi,0x1
   102c0:	48 89 df             	mov    rdi,rbx
   102c3:	e8 c2 35 00 00       	call   1388a <resolve_imm>
   102c8:	e9 32 fd ff ff       	jmp    ffff <resolve_labels+0x21>
   102cd:	48 89 ee             	mov    rsi,rbp
   102d0:	48 8d 3d 89 9f 00 00 	lea    rdi,[rip+0x9f89]        # 1a260 <JCC>
   102d7:	e8 ca 34 00 00       	call   137a6 <is2arrin>
   102dc:	85 c0                	test   eax,eax
   102de:	0f 84 58 fd ff ff    	je     1003c <resolve_labels+0x5e>
   102e4:	e9 44 fd ff ff       	jmp    1002d <resolve_labels+0x4f>
   102e9:	0f b7 73 0a          	movzx  esi,WORD PTR [rbx+0xa]
   102ed:	48 8b bb 98 01 00 00 	mov    rdi,QWORD PTR [rbx+0x198]
   102f4:	48 83 ec 20          	sub    rsp,0x20
   102f8:	f3 0f 6f 5b 18       	movdqu xmm3,XMMWORD PTR [rbx+0x18]
   102fd:	0f 11 1c 24          	movups XMMWORD PTR [rsp],xmm3
   10301:	48 8b 43 28          	mov    rax,QWORD PTR [rbx+0x28]
   10305:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
   1030a:	e8 ad fa ff ff       	call   fdbc <resolve_expr>
   1030f:	48 83 c4 20          	add    rsp,0x20
   10313:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
   10317:	74 28                	je     10341 <resolve_labels+0x363>
   10319:	48 8b 93 a8 01 00 00 	mov    rdx,QWORD PTR [rbx+0x1a8]
   10320:	03 93 98 01 00 00    	add    edx,DWORD PTR [rbx+0x198]
   10326:	29 d0                	sub    eax,edx
   10328:	48 8b 8b a8 01 00 00 	mov    rcx,QWORD PTR [rbx+0x1a8]
   1032f:	48 8d 51 fc          	lea    rdx,[rcx-0x4]
   10333:	48 03 93 a0 01 00 00 	add    rdx,QWORD PTR [rbx+0x1a0]
   1033a:	89 02                	mov    DWORD PTR [rdx],eax
   1033c:	e9 fb fc ff ff       	jmp    1003c <resolve_labels+0x5e>
   10341:	b8 00 00 00 00       	mov    eax,0x0
   10346:	eb e0                	jmp    10328 <resolve_labels+0x34a>
   10348:	80 7b 23 00          	cmp    BYTE PTR [rbx+0x23],0x0
   1034c:	0f 84 f6 fc ff ff    	je     10048 <resolve_labels+0x6a>
   10352:	3c 14                	cmp    al,0x14
   10354:	0f 84 38 01 00 00    	je     10492 <resolve_labels+0x4b4>
   1035a:	bd 00 00 00 00       	mov    ebp,0x0
   1035f:	80 7b 70 14          	cmp    BYTE PTR [rbx+0x70],0x14
   10363:	0f 84 43 01 00 00    	je     104ac <resolve_labels+0x4ce>
   10369:	b8 00 00 00 00       	mov    eax,0x0
   1036e:	09 e8                	or     eax,ebp
   10370:	0f 84 dc fc ff ff    	je     10052 <resolve_labels+0x74>
   10376:	83 f5 01             	xor    ebp,0x1
   10379:	48 63 c5             	movsxd rax,ebp
   1037c:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10380:	48 c1 e0 05          	shl    rax,0x5
   10384:	80 7c 03 24 00       	cmp    BYTE PTR [rbx+rax*1+0x24],0x0
   10389:	0f 84 3a 01 00 00    	je     104c9 <resolve_labels+0x4eb>
   1038f:	48 63 c5             	movsxd rax,ebp
   10392:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10396:	48 c1 e0 05          	shl    rax,0x5
   1039a:	4c 8d 7c 03 24       	lea    r15,[rbx+rax*1+0x24]
   1039f:	4c 89 ff             	mov    rdi,r15
   103a2:	e8 fd 36 00 00       	call   13aa4 <find_lab_addr>
   103a7:	49 89 c5             	mov    r13,rax
   103aa:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
   103ae:	0f 84 44 01 00 00    	je     104f8 <resolve_labels+0x51a>
   103b4:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
   103b8:	0f 84 6c 01 00 00    	je     1052a <resolve_labels+0x54c>
   103be:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
   103c5:	03 83 98 01 00 00    	add    eax,DWORD PTR [rbx+0x198]
   103cb:	41 29 c5             	sub    r13d,eax
   103ce:	48 63 c5             	movsxd rax,ebp
   103d1:	48 8d 04 40          	lea    rax,[rax+rax*2]
   103d5:	48 c1 e0 05          	shl    rax,0x5
   103d9:	44 03 6c 03 1c       	add    r13d,DWORD PTR [rbx+rax*1+0x1c]
   103de:	44 0f b6 bb c8 00 00 	movzx  r15d,BYTE PTR [rbx+0xc8]
   103e5:	00 
   103e6:	41 80 ff 08          	cmp    r15b,0x8
   103ea:	0f 84 6c 01 00 00    	je     1055c <resolve_labels+0x57e>
   103f0:	48 63 ed             	movsxd rbp,ebp
   103f3:	48 8d 44 6d 00       	lea    rax,[rbp+rbp*2+0x0]
   103f8:	48 c1 e0 05          	shl    rax,0x5
   103fc:	0f b6 44 03 64       	movzx  eax,BYTE PTR [rbx+rax*1+0x64]
   10401:	48 03 83 a0 01 00 00 	add    rax,QWORD PTR [rbx+0x1a0]
   10408:	44 89 28             	mov    DWORD PTR [rax],r13d
   1040b:	80 7b 70 10          	cmp    BYTE PTR [rbx+0x70],0x10
   1040f:	0f 85 3d fc ff ff    	jne    10052 <resolve_labels+0x74>
   10415:	0f b7 73 0a          	movzx  esi,WORD PTR [rbx+0xa]
   10419:	48 8b bb 98 01 00 00 	mov    rdi,QWORD PTR [rbx+0x198]
   10420:	48 83 ec 20          	sub    rsp,0x20
   10424:	f3 0f 6f 63 78       	movdqu xmm4,XMMWORD PTR [rbx+0x78]
   10429:	0f 11 24 24          	movups XMMWORD PTR [rsp],xmm4
   1042d:	48 8b 83 88 00 00 00 	mov    rax,QWORD PTR [rbx+0x88]
   10434:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
   10439:	e8 7e f9 ff ff       	call   fdbc <resolve_expr>
   1043e:	48 83 c4 20          	add    rsp,0x20
   10442:	83 f8 fe             	cmp    eax,0xfffffffe
   10445:	0f 84 1c 01 00 00    	je     10567 <resolve_labels+0x589>
   1044b:	48 8b 8b a8 01 00 00 	mov    rcx,QWORD PTR [rbx+0x1a8]
   10452:	48 8d 51 fc          	lea    rdx,[rcx-0x4]
   10456:	48 03 93 a0 01 00 00 	add    rdx,QWORD PTR [rbx+0x1a0]
   1045d:	89 02                	mov    DWORD PTR [rdx],eax
   1045f:	45 0f b6 ff          	movzx  r15d,r15b
   10463:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
   1046a:	4c 29 f8             	sub    rax,r15
   1046d:	48 83 e8 04          	sub    rax,0x4
   10471:	48 03 83 a0 01 00 00 	add    rax,QWORD PTR [rbx+0x1a0]
   10478:	44 89 28             	mov    DWORD PTR [rax],r13d
   1047b:	e9 d2 fb ff ff       	jmp    10052 <resolve_labels+0x74>
   10480:	80 bb 83 00 00 00 00 	cmp    BYTE PTR [rbx+0x83],0x0
   10487:	0f 84 c5 fb ff ff    	je     10052 <resolve_labels+0x74>
   1048d:	e9 c0 fe ff ff       	jmp    10352 <resolve_labels+0x374>
   10492:	80 7b 23 00          	cmp    BYTE PTR [rbx+0x23],0x0
   10496:	75 0a                	jne    104a2 <resolve_labels+0x4c4>
   10498:	bd 00 00 00 00       	mov    ebp,0x0
   1049d:	e9 bd fe ff ff       	jmp    1035f <resolve_labels+0x381>
   104a2:	bd 01 00 00 00       	mov    ebp,0x1
   104a7:	e9 b3 fe ff ff       	jmp    1035f <resolve_labels+0x381>
   104ac:	80 bb 83 00 00 00 00 	cmp    BYTE PTR [rbx+0x83],0x0
   104b3:	75 0a                	jne    104bf <resolve_labels+0x4e1>
   104b5:	b8 00 00 00 00       	mov    eax,0x0
   104ba:	e9 af fe ff ff       	jmp    1036e <resolve_labels+0x390>
   104bf:	b8 01 00 00 00       	mov    eax,0x1
   104c4:	e9 a5 fe ff ff       	jmp    1036e <resolve_labels+0x390>
   104c9:	4c 03 25 38 ab 00 00 	add    r12,QWORD PTR [rip+0xab38]        # 1b008 <ast>
   104d0:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
   104d6:	48 8d 35 4b 60 00 00 	lea    rsi,[rip+0x604b]        # 16528 <_IO_stdin_used+0x1528>
   104dd:	48 8b 3d fc a6 00 00 	mov    rdi,QWORD PTR [rip+0xa6fc]        # 1abe0 <stderr@GLIBC_2.2.5>
   104e4:	b8 00 00 00 00       	mov    eax,0x0
   104e9:	e8 52 2c ff ff       	call   3140 <fprintf@plt>
   104ee:	bf 01 00 00 00       	mov    edi,0x1
   104f3:	e8 d8 2c ff ff       	call   31d0 <exit@plt>
   104f8:	4c 03 25 09 ab 00 00 	add    r12,QWORD PTR [rip+0xab09]        # 1b008 <ast>
   104ff:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
   10505:	4c 89 f9             	mov    rcx,r15
   10508:	48 8d 35 61 60 00 00 	lea    rsi,[rip+0x6061]        # 16570 <_IO_stdin_used+0x1570>
   1050f:	48 8b 3d ca a6 00 00 	mov    rdi,QWORD PTR [rip+0xa6ca]        # 1abe0 <stderr@GLIBC_2.2.5>
   10516:	b8 00 00 00 00       	mov    eax,0x0
   1051b:	e8 20 2c ff ff       	call   3140 <fprintf@plt>
   10520:	bf 01 00 00 00       	mov    edi,0x1
   10525:	e8 a6 2c ff ff       	call   31d0 <exit@plt>
   1052a:	4c 03 25 d7 aa 00 00 	add    r12,QWORD PTR [rip+0xaad7]        # 1b008 <ast>
   10531:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
   10537:	4c 89 f9             	mov    rcx,r15
   1053a:	48 8d 35 6f 60 00 00 	lea    rsi,[rip+0x606f]        # 165b0 <_IO_stdin_used+0x15b0>
   10541:	48 8b 3d 98 a6 00 00 	mov    rdi,QWORD PTR [rip+0xa698]        # 1abe0 <stderr@GLIBC_2.2.5>
   10548:	b8 00 00 00 00       	mov    eax,0x0
   1054d:	e8 ee 2b ff ff       	call   3140 <fprintf@plt>
   10552:	bf 01 00 00 00       	mov    edi,0x1
   10557:	e8 74 2c ff ff       	call   31d0 <exit@plt>
   1055c:	41 bf 04 00 00 00    	mov    r15d,0x4
   10562:	e9 89 fe ff ff       	jmp    103f0 <resolve_labels+0x412>
   10567:	48 8b 83 a8 01 00 00 	mov    rax,QWORD PTR [rbx+0x1a8]
   1056e:	48 83 e8 04          	sub    rax,0x4
   10572:	48 03 83 a0 01 00 00 	add    rax,QWORD PTR [rbx+0x1a0]
   10579:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   1057f:	e9 db fe ff ff       	jmp    1045f <resolve_labels+0x481>
   10584:	41 83 c5 08          	add    r13d,0x8
   10588:	83 c5 01             	add    ebp,0x1
   1058b:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
   1058e:	0f 8e c7 fa ff ff    	jle    1005b <resolve_labels+0x7d>
   10594:	48 63 c5             	movsxd rax,ebp
   10597:	48 c1 e0 05          	shl    rax,0x5
   1059b:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
   1059f:	83 38 01             	cmp    DWORD PTR [rax],0x1
   105a2:	75 e0                	jne    10584 <resolve_labels+0x5a6>
   105a4:	4d 63 fd             	movsxd r15,r13d
   105a7:	0f b7 73 0a          	movzx  esi,WORD PTR [rbx+0xa]
   105ab:	4c 89 ff             	mov    rdi,r15
   105ae:	48 03 7b 20          	add    rdi,QWORD PTR [rbx+0x20]
   105b2:	48 83 ec 20          	sub    rsp,0x20
   105b6:	f3 0f 6f 50 08       	movdqu xmm2,XMMWORD PTR [rax+0x8]
   105bb:	0f 11 14 24          	movups XMMWORD PTR [rsp],xmm2
   105bf:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   105c3:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
   105c8:	e8 ef f7 ff ff       	call   fdbc <resolve_expr>
   105cd:	4c 03 bb a0 01 00 00 	add    r15,QWORD PTR [rbx+0x1a0]
   105d4:	49 89 07             	mov    QWORD PTR [r15],rax
   105d7:	48 83 c4 20          	add    rsp,0x20
   105db:	eb a7                	jmp    10584 <resolve_labels+0x5a6>
   105dd:	bd 00 00 00 00       	mov    ebp,0x0
   105e2:	41 bd 00 00 00 00    	mov    r13d,0x0
   105e8:	eb a1                	jmp    1058b <resolve_labels+0x5ad>
   105ea:	4c 03 6b 10          	add    r13,QWORD PTR [rbx+0x10]
   105ee:	4c 03 25 13 aa 00 00 	add    r12,QWORD PTR [rip+0xaa13]        # 1b008 <ast>
   105f5:	49 8b 4d 00          	mov    rcx,QWORD PTR [r13+0x0]
   105f9:	41 0f b7 54 24 0a    	movzx  edx,WORD PTR [r12+0xa]
   105ff:	48 8d 35 f2 5f 00 00 	lea    rsi,[rip+0x5ff2]        # 165f8 <_IO_stdin_used+0x15f8>
   10606:	48 8b 3d d3 a5 00 00 	mov    rdi,QWORD PTR [rip+0xa5d3]        # 1abe0 <stderr@GLIBC_2.2.5>
   1060d:	b8 00 00 00 00       	mov    eax,0x0
   10612:	e8 29 2b ff ff       	call   3140 <fprintf@plt>
   10617:	bf 01 00 00 00       	mov    edi,0x1
   1061c:	e8 af 2b ff ff       	call   31d0 <exit@plt>
   10621:	bd 00 00 00 00       	mov    ebp,0x0
   10626:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
   10629:	0f 8e 35 fa ff ff    	jle    10064 <resolve_labels+0x86>
   1062f:	4c 63 ed             	movsxd r13,ebp
   10632:	49 c1 e5 03          	shl    r13,0x3
   10636:	4c 89 e8             	mov    rax,r13
   10639:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
   1063d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   10640:	e8 5a 33 00 00       	call   1399f <get_lab_indx>
   10645:	85 c0                	test   eax,eax
   10647:	78 a1                	js     105ea <resolve_labels+0x60c>
   10649:	48 98                	cdqe
   1064b:	48 69 c0 b8 01 00 00 	imul   rax,rax,0x1b8
   10652:	48 03 05 af a9 00 00 	add    rax,QWORD PTR [rip+0xa9af]        # 1b008 <ast>
   10659:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
   10660:	00 00 00 
   10663:	83 c5 01             	add    ebp,0x1
   10666:	eb be                	jmp    10626 <resolve_labels+0x648>
   10668:	4c 03 25 99 a9 00 00 	add    r12,QWORD PTR [rip+0xa999]        # 1b008 <ast>
   1066f:	49 8d 54 24 10       	lea    rdx,[r12+0x10]
   10674:	41 0f b7 74 24 0a    	movzx  esi,WORD PTR [r12+0xa]
   1067a:	48 8d 3d 9f 5f 00 00 	lea    rdi,[rip+0x5f9f]        # 16620 <_IO_stdin_used+0x1620>
   10681:	e8 4a 2a ff ff       	call   30d0 <printf@plt>
   10686:	bf 01 00 00 00       	mov    edi,0x1
   1068b:	e8 40 2b ff ff       	call   31d0 <exit@plt>
   10690:	41 83 c5 01          	add    r13d,0x1
   10694:	44 39 2d 69 a9 00 00 	cmp    DWORD PTR [rip+0xa969],r13d        # 1b004 <ast_len>
   1069b:	0f 8e cc f9 ff ff    	jle    1006d <resolve_labels+0x8f>
   106a1:	4d 63 e5             	movsxd r12,r13d
   106a4:	4d 69 e4 b8 01 00 00 	imul   r12,r12,0x1b8
   106ab:	4c 89 e0             	mov    rax,r12
   106ae:	48 03 05 53 a9 00 00 	add    rax,QWORD PTR [rip+0xa953]        # 1b008 <ast>
   106b5:	80 38 08             	cmp    BYTE PTR [rax],0x8
   106b8:	75 d6                	jne    10690 <resolve_labels+0x6b2>
   106ba:	bd 00 00 00 00       	mov    ebp,0x0
   106bf:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
   106c2:	7e cc                	jle    10690 <resolve_labels+0x6b2>
   106c4:	48 63 c5             	movsxd rax,ebp
   106c7:	48 c1 e0 03          	shl    rax,0x3
   106cb:	48 03 43 10          	add    rax,QWORD PTR [rbx+0x10]
   106cf:	4c 89 e7             	mov    rdi,r12
   106d2:	48 03 3d 2f a9 00 00 	add    rdi,QWORD PTR [rip+0xa92f]        # 1b008 <ast>
   106d9:	48 83 c7 10          	add    rdi,0x10
   106dd:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   106e0:	e8 5b 41 00 00       	call   14840 <astrcmp>
   106e5:	85 c0                	test   eax,eax
   106e7:	0f 84 7b ff ff ff    	je     10668 <resolve_labels+0x68a>
   106ed:	83 c5 01             	add    ebp,0x1
   106f0:	eb cd                	jmp    106bf <resolve_labels+0x6e1>
   106f2:	41 bd 00 00 00 00    	mov    r13d,0x0
   106f8:	eb 9a                	jmp    10694 <resolve_labels+0x6b6>
   106fa:	48 81 c4 28 01 00 00 	add    rsp,0x128
   10701:	5b                   	pop    rbx
   10702:	5d                   	pop    rbp
   10703:	41 5c                	pop    r12
   10705:	41 5d                	pop    r13
   10707:	41 5e                	pop    r14
   10709:	41 5f                	pop    r15
   1070b:	c3                   	ret

000000000001070c <compiler>:
   1070c:	48 85 ff             	test   rdi,rdi
   1070f:	0f 84 c6 01 00 00    	je     108db <compiler+0x1cf>
   10715:	41 56                	push   r14
   10717:	41 55                	push   r13
   10719:	41 54                	push   r12
   1071b:	55                   	push   rbp
   1071c:	53                   	push   rbx
   1071d:	48 83 ec 10          	sub    rsp,0x10
   10721:	49 89 fd             	mov    r13,rdi
   10724:	49 89 f6             	mov    r14,rsi
   10727:	48 89 d5             	mov    rbp,rdx
   1072a:	80 3d ba a4 00 00 00 	cmp    BYTE PTR [rip+0xa4ba],0x0        # 1abeb <pie_mode>
   10731:	74 11                	je     10744 <compiler+0x38>
   10733:	b8 00 10 00 00       	mov    eax,0x1000
   10738:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
   1073d:	bb 00 00 00 00       	mov    ebx,0x0
   10742:	eb 14                	jmp    10758 <compiler+0x4c>
   10744:	b8 00 10 40 00       	mov    eax,0x401000
   10749:	eb ed                	jmp    10738 <compiler+0x2c>
   1074b:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
   10750:	e8 20 7a ff ff       	call   8175 <parseInst>
   10755:	83 c3 01             	add    ebx,0x1
   10758:	39 1d a6 a8 00 00    	cmp    DWORD PTR [rip+0xa8a6],ebx        # 1b004 <ast_len>
   1075e:	7e 46                	jle    107a6 <compiler+0x9a>
   10760:	48 63 fb             	movsxd rdi,ebx
   10763:	48 69 ff b8 01 00 00 	imul   rdi,rdi,0x1b8
   1076a:	48 03 3d 97 a8 00 00 	add    rdi,QWORD PTR [rip+0xa897]        # 1b008 <ast>
   10771:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   10774:	3c 01                	cmp    al,0x1
   10776:	74 d3                	je     1074b <compiler+0x3f>
   10778:	3c 06                	cmp    al,0x6
   1077a:	74 1e                	je     1079a <compiler+0x8e>
   1077c:	8d 50 fe             	lea    edx,[rax-0x2]
   1077f:	80 fa 03             	cmp    dl,0x3
   10782:	0f 96 c2             	setbe  dl
   10785:	3c 10                	cmp    al,0x10
   10787:	0f 94 c0             	sete   al
   1078a:	08 c2                	or     dl,al
   1078c:	74 c7                	je     10755 <compiler+0x49>
   1078e:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
   10793:	e8 56 d7 ff ff       	call   deee <parse_size_directives>
   10798:	eb bb                	jmp    10755 <compiler+0x49>
   1079a:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
   1079f:	e8 ce d6 ff ff       	call   de72 <emit_align>
   107a4:	eb af                	jmp    10755 <compiler+0x49>
   107a6:	b8 00 00 00 00       	mov    eax,0x0
   107ab:	e8 85 ee ff ff       	call   f635 <expand_local_labels>
   107b0:	b8 00 00 00 00       	mov    eax,0x0
   107b5:	e8 1a f3 ff ff       	call   fad4 <collect_labels_sections>
   107ba:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
   107be:	b8 00 00 00 00       	mov    eax,0x0
   107c3:	e8 16 f8 ff ff       	call   ffde <resolve_labels>
   107c8:	bd 00 00 00 00       	mov    ebp,0x0
   107cd:	41 bc 00 00 00 00    	mov    r12d,0x0
   107d3:	eb 07                	jmp    107dc <compiler+0xd0>
   107d5:	84 c0                	test   al,al
   107d7:	75 2e                	jne    10807 <compiler+0xfb>
   107d9:	83 c5 01             	add    ebp,0x1
   107dc:	39 2d 22 a8 00 00    	cmp    DWORD PTR [rip+0xa822],ebp        # 1b004 <ast_len>
   107e2:	0f 8e e3 00 00 00    	jle    108cb <compiler+0x1bf>
   107e8:	48 63 dd             	movsxd rbx,ebp
   107eb:	48 69 db b8 01 00 00 	imul   rbx,rbx,0x1b8
   107f2:	48 89 da             	mov    rdx,rbx
   107f5:	48 03 15 0c a8 00 00 	add    rdx,QWORD PTR [rip+0xa80c]        # 1b008 <ast>
   107fc:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   107ff:	3c 06                	cmp    al,0x6
   10801:	76 d2                	jbe    107d5 <compiler+0xc9>
   10803:	3c 10                	cmp    al,0x10
   10805:	75 d2                	jne    107d9 <compiler+0xcd>
   10807:	41 81 fc ff ff 0f 00 	cmp    r12d,0xfffff
   1080e:	7f 41                	jg     10851 <compiler+0x145>
   10810:	3c 10                	cmp    al,0x10
   10812:	0f 85 87 00 00 00    	jne    1089f <compiler+0x193>
   10818:	80 3d cb a3 00 00 00 	cmp    BYTE PTR [rip+0xa3cb],0x0        # 1abea <obj_file>
   1081f:	75 b8                	jne    107d9 <compiler+0xcd>
   10821:	48 8b 92 a8 01 00 00 	mov    rdx,QWORD PTR [rdx+0x1a8]
   10828:	48 81 fa 00 00 10 00 	cmp    rdx,0x100000
   1082f:	77 47                	ja     10878 <compiler+0x16c>
   10831:	49 63 fc             	movsxd rdi,r12d
   10834:	4c 01 ef             	add    rdi,r13
   10837:	be 00 00 00 00       	mov    esi,0x0
   1083c:	e8 cf 28 ff ff       	call   3110 <memset@plt>
   10841:	48 03 1d c0 a7 00 00 	add    rbx,QWORD PTR [rip+0xa7c0]        # 1b008 <ast>
   10848:	44 03 a3 a8 01 00 00 	add    r12d,DWORD PTR [rbx+0x1a8]
   1084f:	eb 88                	jmp    107d9 <compiler+0xcd>
   10851:	48 8b 0d 88 a3 00 00 	mov    rcx,QWORD PTR [rip+0xa388]        # 1abe0 <stderr@GLIBC_2.2.5>
   10858:	ba 26 00 00 00       	mov    edx,0x26
   1085d:	be 01 00 00 00       	mov    esi,0x1
   10862:	48 8d 3d df 5d 00 00 	lea    rdi,[rip+0x5ddf]        # 16648 <_IO_stdin_used+0x1648>
   10869:	e8 72 29 ff ff       	call   31e0 <fwrite@plt>
   1086e:	bf 01 00 00 00       	mov    edi,0x1
   10873:	e8 58 29 ff ff       	call   31d0 <exit@plt>
   10878:	48 8b 0d 61 a3 00 00 	mov    rcx,QWORD PTR [rip+0xa361]        # 1abe0 <stderr@GLIBC_2.2.5>
   1087f:	ba 26 00 00 00       	mov    edx,0x26
   10884:	be 01 00 00 00       	mov    esi,0x1
   10889:	48 8d 3d b8 5d 00 00 	lea    rdi,[rip+0x5db8]        # 16648 <_IO_stdin_used+0x1648>
   10890:	e8 4b 29 ff ff       	call   31e0 <fwrite@plt>
   10895:	bf 01 00 00 00       	mov    edi,0x1
   1089a:	e8 31 29 ff ff       	call   31d0 <exit@plt>
   1089f:	48 8b b2 a0 01 00 00 	mov    rsi,QWORD PTR [rdx+0x1a0]
   108a6:	49 63 fc             	movsxd rdi,r12d
   108a9:	4c 01 ef             	add    rdi,r13
   108ac:	48 8b 92 a8 01 00 00 	mov    rdx,QWORD PTR [rdx+0x1a8]
   108b3:	e8 a8 28 ff ff       	call   3160 <memcpy@plt>
   108b8:	48 03 1d 49 a7 00 00 	add    rbx,QWORD PTR [rip+0xa749]        # 1b008 <ast>
   108bf:	44 03 a3 a8 01 00 00 	add    r12d,DWORD PTR [rbx+0x1a8]
   108c6:	e9 0e ff ff ff       	jmp    107d9 <compiler+0xcd>
   108cb:	45 89 26             	mov    DWORD PTR [r14],r12d
   108ce:	48 83 c4 10          	add    rsp,0x10
   108d2:	5b                   	pop    rbx
   108d3:	5d                   	pop    rbp
   108d4:	41 5c                	pop    r12
   108d6:	41 5d                	pop    r13
   108d8:	41 5e                	pop    r14
   108da:	c3                   	ret
   108db:	c3                   	ret

00000000000108dc <handl_pipeline>:
   108dc:	41 54                	push   r12
   108de:	55                   	push   rbp
   108df:	53                   	push   rbx
   108e0:	48 81 ec 10 00 10 00 	sub    rsp,0x100010
   108e7:	48 89 f3             	mov    rbx,rsi
   108ea:	48 8b 3e             	mov    rdi,QWORD PTR [rsi]
   108ed:	e8 a4 2c 00 00       	call   13596 <Preprocess>
   108f2:	48 89 c5             	mov    rbp,rax
   108f5:	80 3d ed a2 00 00 00 	cmp    BYTE PTR [rip+0xa2ed],0x0        # 1abe9 <stop_compile>
   108fc:	0f 85 d8 00 00 00    	jne    109da <handl_pipeline+0xfe>
   10902:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
   10909:	00 
   1090a:	80 3d da a2 00 00 00 	cmp    BYTE PTR [rip+0xa2da],0x0        # 1abeb <pie_mode>
   10911:	0f 84 e9 00 00 00    	je     10a00 <handl_pipeline+0x124>
   10917:	b8 00 10 00 00       	mov    eax,0x1000
   1091c:	48 89 04 24          	mov    QWORD PTR [rsp],rax
   10920:	48 8d 35 79 51 00 00 	lea    rsi,[rip+0x5179]        # 15aa0 <_IO_stdin_used+0xaa0>
   10927:	48 89 ef             	mov    rdi,rbp
   1092a:	e8 91 28 ff ff       	call   31c0 <fopen@plt>
   1092f:	49 89 c4             	mov    r12,rax
   10932:	48 89 c7             	mov    rdi,rax
   10935:	e8 37 d9 ff ff       	call   e271 <LEXER>
   1093a:	b8 00 00 00 00       	mov    eax,0x0
   1093f:	e8 b5 29 ff ff       	call   32f9 <DEBUG_PRINT_TOKENS>
   10944:	4c 89 e7             	mov    rdi,r12
   10947:	e8 64 27 ff ff       	call   30b0 <fclose@plt>
   1094c:	48 89 ef             	mov    rdi,rbp
   1094f:	e8 1c 27 ff ff       	call   3070 <remove@plt>
   10954:	b8 00 00 00 00       	mov    eax,0x0
   10959:	e8 97 03 00 00       	call   10cf5 <PARSE>
   1095e:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
   10962:	48 8d 35 35 54 00 00 	lea    rsi,[rip+0x5435]        # 15d9e <_IO_stdin_used+0xd9e>
   10969:	e8 52 28 ff ff       	call   31c0 <fopen@plt>
   1096e:	49 89 c4             	mov    r12,rax
   10971:	48 89 e2             	mov    rdx,rsp
   10974:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
   10979:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
   1097e:	e8 89 fd ff ff       	call   1070c <compiler>
   10983:	b8 00 00 00 00       	mov    eax,0x0
   10988:	e8 e6 2b ff ff       	call   3573 <DEBUG_PRINT_AST>
   1098d:	80 3d 56 a2 00 00 00 	cmp    BYTE PTR [rip+0xa256],0x0        # 1abea <obj_file>
   10994:	74 74                	je     10a0a <handl_pipeline+0x12e>
   10996:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   10999:	4c 89 e7             	mov    rdi,r12
   1099c:	e8 4f 34 ff ff       	call   3df0 <GenObjElfFile>
   109a1:	89 c5                	mov    ebp,eax
   109a3:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
   109a7:	be fd 01 00 00       	mov    esi,0x1fd
   109ac:	e8 ff 27 ff ff       	call   31b0 <chmod@plt>
   109b1:	4c 89 e7             	mov    rdi,r12
   109b4:	e8 f7 26 ff ff       	call   30b0 <fclose@plt>
   109b9:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
   109bd:	89 ea                	mov    edx,ebp
   109bf:	48 8d 3d d2 5c 00 00 	lea    rdi,[rip+0x5cd2]        # 16698 <_IO_stdin_used+0x1698>
   109c6:	b8 00 00 00 00       	mov    eax,0x0
   109cb:	e8 00 27 ff ff       	call   30d0 <printf@plt>
   109d0:	bf 00 00 00 00       	mov    edi,0x0
   109d5:	e8 f6 27 ff ff       	call   31d0 <exit@plt>
   109da:	48 89 c6             	mov    rsi,rax
   109dd:	48 8d 3d 8c 5c 00 00 	lea    rdi,[rip+0x5c8c]        # 16670 <_IO_stdin_used+0x1670>
   109e4:	b8 00 00 00 00       	mov    eax,0x0
   109e9:	e8 e2 26 ff ff       	call   30d0 <printf@plt>
   109ee:	48 89 ef             	mov    rdi,rbp
   109f1:	e8 3a 26 ff ff       	call   3030 <free@plt>
   109f6:	bf 00 00 00 00       	mov    edi,0x0
   109fb:	e8 d0 27 ff ff       	call   31d0 <exit@plt>
   10a00:	b8 00 10 40 00       	mov    eax,0x401000
   10a05:	e9 12 ff ff ff       	jmp    1091c <handl_pipeline+0x40>
   10a0a:	48 63 4c 24 0c       	movsxd rcx,DWORD PTR [rsp+0xc]
   10a0f:	48 8d 54 24 10       	lea    rdx,[rsp+0x10]
   10a14:	44 0f b6 05 cf a1 00 	movzx  r8d,BYTE PTR [rip+0xa1cf]        # 1abeb <pie_mode>
   10a1b:	00 
   10a1c:	48 8b 34 24          	mov    rsi,QWORD PTR [rsp]
   10a20:	4c 89 e7             	mov    rdi,r12
   10a23:	e8 ec 4b ff ff       	call   5614 <ELFgenfile>
   10a28:	89 c5                	mov    ebp,eax
   10a2a:	e9 74 ff ff ff       	jmp    109a3 <handl_pipeline+0xc7>

0000000000010a2f <main>:
   10a2f:	41 57                	push   r15
   10a31:	41 56                	push   r14
   10a33:	41 55                	push   r13
   10a35:	41 54                	push   r12
   10a37:	55                   	push   rbp
   10a38:	53                   	push   rbx
   10a39:	48 83 ec 28          	sub    rsp,0x28
   10a3d:	83 ff 01             	cmp    edi,0x1
   10a40:	7e 1d                	jle    10a5f <main+0x30>
   10a42:	41 89 fe             	mov    r14d,edi
   10a45:	49 89 f5             	mov    r13,rsi
   10a48:	bb 01 00 00 00       	mov    ebx,0x1
   10a4d:	4c 8d 3d 72 5c 00 00 	lea    r15,[rip+0x5c72]        # 166c6 <_IO_stdin_used+0x16c6>
   10a54:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
   10a5b:	00 00 
   10a5d:	eb 3b                	jmp    10a9a <main+0x6b>
   10a5f:	48 8d 35 66 5c 00 00 	lea    rsi,[rip+0x5c66]        # 166cc <_IO_stdin_used+0x16cc>
   10a66:	48 8d 3d c3 5c 00 00 	lea    rdi,[rip+0x5cc3]        # 16730 <_IO_stdin_used+0x1730>
   10a6d:	b8 00 00 00 00       	mov    eax,0x0
   10a72:	e8 59 26 ff ff       	call   30d0 <printf@plt>
   10a77:	e9 09 02 00 00       	jmp    10c85 <main+0x256>
   10a7c:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10a80:	48 8d 35 4e 5c 00 00 	lea    rsi,[rip+0x5c4e]        # 166d5 <_IO_stdin_used+0x16d5>
   10a87:	e8 b4 3d 00 00       	call   14840 <astrcmp>
   10a8c:	85 c0                	test   eax,eax
   10a8e:	75 39                	jne    10ac9 <main+0x9a>
   10a90:	c6 05 54 a1 00 00 01 	mov    BYTE PTR [rip+0xa154],0x1        # 1abeb <pie_mode>
   10a97:	83 c3 01             	add    ebx,0x1
   10a9a:	44 39 f3             	cmp    ebx,r14d
   10a9d:	0f 8d a6 01 00 00    	jge    10c49 <main+0x21a>
   10aa3:	4c 63 e3             	movsxd r12,ebx
   10aa6:	4b 8d 6c e5 00       	lea    rbp,[r13+r12*8+0x0]
   10aab:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10aaf:	48 8d 35 1c 5c 00 00 	lea    rsi,[rip+0x5c1c]        # 166d2 <_IO_stdin_used+0x16d2>
   10ab6:	e8 85 3d 00 00       	call   14840 <astrcmp>
   10abb:	85 c0                	test   eax,eax
   10abd:	75 bd                	jne    10a7c <main+0x4d>
   10abf:	4f 8b 7c e5 08       	mov    r15,QWORD PTR [r13+r12*8+0x8]
   10ac4:	83 c3 01             	add    ebx,0x1
   10ac7:	eb ce                	jmp    10a97 <main+0x68>
   10ac9:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10acd:	48 8d 35 06 5c 00 00 	lea    rsi,[rip+0x5c06]        # 166da <_IO_stdin_used+0x16da>
   10ad4:	e8 67 3d 00 00       	call   14840 <astrcmp>
   10ad9:	85 c0                	test   eax,eax
   10adb:	75 09                	jne    10ae6 <main+0xb7>
   10add:	c6 05 05 a1 00 00 01 	mov    BYTE PTR [rip+0xa105],0x1        # 1abe9 <stop_compile>
   10ae4:	eb b1                	jmp    10a97 <main+0x68>
   10ae6:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10aea:	48 8d 35 ec 5b 00 00 	lea    rsi,[rip+0x5bec]        # 166dd <_IO_stdin_used+0x16dd>
   10af1:	e8 4a 3d 00 00       	call   14840 <astrcmp>
   10af6:	85 c0                	test   eax,eax
   10af8:	75 11                	jne    10b0b <main+0xdc>
   10afa:	4f 8b 7c e5 08       	mov    r15,QWORD PTR [r13+r12*8+0x8]
   10aff:	83 c3 01             	add    ebx,0x1
   10b02:	c6 05 e1 a0 00 00 01 	mov    BYTE PTR [rip+0xa0e1],0x1        # 1abea <obj_file>
   10b09:	eb 8c                	jmp    10a97 <main+0x68>
   10b0b:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10b0f:	48 8d 35 ca 5b 00 00 	lea    rsi,[rip+0x5bca]        # 166e0 <_IO_stdin_used+0x16e0>
   10b16:	e8 25 3d 00 00       	call   14840 <astrcmp>
   10b1b:	85 c0                	test   eax,eax
   10b1d:	74 34                	je     10b53 <main+0x124>
   10b1f:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10b23:	48 8d 35 ca 5b 00 00 	lea    rsi,[rip+0x5bca]        # 166f4 <_IO_stdin_used+0x16f4>
   10b2a:	e8 11 3d 00 00       	call   14840 <astrcmp>
   10b2f:	85 c0                	test   eax,eax
   10b31:	74 14                	je     10b47 <main+0x118>
   10b33:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10b37:	48 8d 35 b9 5b 00 00 	lea    rsi,[rip+0x5bb9]        # 166f7 <_IO_stdin_used+0x16f7>
   10b3e:	e8 fd 3c 00 00       	call   14840 <astrcmp>
   10b43:	85 c0                	test   eax,eax
   10b45:	75 29                	jne    10b70 <main+0x141>
   10b47:	c6 05 9e a0 00 00 01 	mov    BYTE PTR [rip+0xa09e],0x1        # 1abec <debug>
   10b4e:	e9 44 ff ff ff       	jmp    10a97 <main+0x68>
   10b53:	48 8d 35 72 5b 00 00 	lea    rsi,[rip+0x5b72]        # 166cc <_IO_stdin_used+0x16cc>
   10b5a:	48 8d 3d 82 5b 00 00 	lea    rdi,[rip+0x5b82]        # 166e3 <_IO_stdin_used+0x16e3>
   10b61:	e8 6a 25 ff ff       	call   30d0 <printf@plt>
   10b66:	bf 00 00 00 00       	mov    edi,0x0
   10b6b:	e8 60 26 ff ff       	call   31d0 <exit@plt>
   10b70:	48 8d 35 88 5b 00 00 	lea    rsi,[rip+0x5b88]        # 166ff <_IO_stdin_used+0x16ff>
   10b77:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10b7b:	e8 c0 3c 00 00       	call   14840 <astrcmp>
   10b80:	85 c0                	test   eax,eax
   10b82:	74 2b                	je     10baf <main+0x180>
   10b84:	48 8d 35 77 5b 00 00 	lea    rsi,[rip+0x5b77]        # 16702 <_IO_stdin_used+0x1702>
   10b8b:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   10b8f:	e8 ac 3c 00 00       	call   14840 <astrcmp>
   10b94:	85 c0                	test   eax,eax
   10b96:	74 17                	je     10baf <main+0x180>
   10b98:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   10b9c:	80 38 2d             	cmp    BYTE PTR [rax],0x2d
   10b9f:	0f 84 f2 fe ff ff    	je     10a97 <main+0x68>
   10ba5:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
   10baa:	e9 e8 fe ff ff       	jmp    10a97 <main+0x68>
   10baf:	48 8d 3d 53 5b 00 00 	lea    rdi,[rip+0x5b53]        # 16709 <_IO_stdin_used+0x1709>
   10bb6:	e8 d5 24 ff ff       	call   3090 <puts@plt>
   10bbb:	48 8d 3d 5d 5b 00 00 	lea    rdi,[rip+0x5b5d]        # 1671f <_IO_stdin_used+0x171f>
   10bc2:	e8 c9 24 ff ff       	call   3090 <puts@plt>
   10bc7:	48 8d 3d 92 5b 00 00 	lea    rdi,[rip+0x5b92]        # 16760 <_IO_stdin_used+0x1760>
   10bce:	e8 bd 24 ff ff       	call   3090 <puts@plt>
   10bd3:	48 8d 3d 4c 5b 00 00 	lea    rdi,[rip+0x5b4c]        # 16726 <_IO_stdin_used+0x1726>
   10bda:	e8 b1 24 ff ff       	call   3090 <puts@plt>
   10bdf:	48 8d 3d a2 5b 00 00 	lea    rdi,[rip+0x5ba2]        # 16788 <_IO_stdin_used+0x1788>
   10be6:	e8 a5 24 ff ff       	call   3090 <puts@plt>
   10beb:	48 8d 3d c6 5b 00 00 	lea    rdi,[rip+0x5bc6]        # 167b8 <_IO_stdin_used+0x17b8>
   10bf2:	e8 99 24 ff ff       	call   3090 <puts@plt>
   10bf7:	48 8d 3d 02 5c 00 00 	lea    rdi,[rip+0x5c02]        # 16800 <_IO_stdin_used+0x1800>
   10bfe:	e8 8d 24 ff ff       	call   3090 <puts@plt>
   10c03:	48 8d 3d 36 5c 00 00 	lea    rdi,[rip+0x5c36]        # 16840 <_IO_stdin_used+0x1840>
   10c0a:	e8 81 24 ff ff       	call   3090 <puts@plt>
   10c0f:	48 8d 3d 6a 5c 00 00 	lea    rdi,[rip+0x5c6a]        # 16880 <_IO_stdin_used+0x1880>
   10c16:	e8 75 24 ff ff       	call   3090 <puts@plt>
   10c1b:	48 8d 3d 96 5c 00 00 	lea    rdi,[rip+0x5c96]        # 168b8 <_IO_stdin_used+0x18b8>
   10c22:	e8 69 24 ff ff       	call   3090 <puts@plt>
   10c27:	48 8d 3d c2 5c 00 00 	lea    rdi,[rip+0x5cc2]        # 168f0 <_IO_stdin_used+0x18f0>
   10c2e:	e8 5d 24 ff ff       	call   3090 <puts@plt>
   10c33:	48 8d 3d fe 5c 00 00 	lea    rdi,[rip+0x5cfe]        # 16938 <_IO_stdin_used+0x1938>
   10c3a:	e8 51 24 ff ff       	call   3090 <puts@plt>
   10c3f:	bf 00 00 00 00       	mov    edi,0x0
   10c44:	e8 87 25 ff ff       	call   31d0 <exit@plt>
   10c49:	48 83 7c 24 08 00    	cmp    QWORD PTR [rsp+0x8],0x0
   10c4f:	74 48                	je     10c99 <main+0x26a>
   10c51:	4d 85 ff             	test   r15,r15
   10c54:	74 62                	je     10cb8 <main+0x289>
   10c56:	80 3d 8e 9f 00 00 00 	cmp    BYTE PTR [rip+0x9f8e],0x0        # 1abeb <pie_mode>
   10c5d:	74 78                	je     10cd7 <main+0x2a8>
   10c5f:	80 3d 84 9f 00 00 00 	cmp    BYTE PTR [rip+0x9f84],0x0        # 1abea <obj_file>
   10c66:	74 6f                	je     10cd7 <main+0x2a8>
   10c68:	48 8b 0d 71 9f 00 00 	mov    rcx,QWORD PTR [rip+0x9f71]        # 1abe0 <stderr@GLIBC_2.2.5>
   10c6f:	ba 2e 00 00 00       	mov    edx,0x2e
   10c74:	be 01 00 00 00       	mov    esi,0x1
   10c79:	48 8d 3d 60 5d 00 00 	lea    rdi,[rip+0x5d60]        # 169e0 <_IO_stdin_used+0x19e0>
   10c80:	e8 5b 25 ff ff       	call   31e0 <fwrite@plt>
   10c85:	b8 01 00 00 00       	mov    eax,0x1
   10c8a:	48 83 c4 28          	add    rsp,0x28
   10c8e:	5b                   	pop    rbx
   10c8f:	5d                   	pop    rbp
   10c90:	41 5c                	pop    r12
   10c92:	41 5d                	pop    r13
   10c94:	41 5e                	pop    r14
   10c96:	41 5f                	pop    r15
   10c98:	c3                   	ret
   10c99:	48 8b 0d 40 9f 00 00 	mov    rcx,QWORD PTR [rip+0x9f40]        # 1abe0 <stderr@GLIBC_2.2.5>
   10ca0:	ba 2e 00 00 00       	mov    edx,0x2e
   10ca5:	be 01 00 00 00       	mov    esi,0x1
   10caa:	48 8d 3d c7 5c 00 00 	lea    rdi,[rip+0x5cc7]        # 16978 <_IO_stdin_used+0x1978>
   10cb1:	e8 2a 25 ff ff       	call   31e0 <fwrite@plt>
   10cb6:	eb cd                	jmp    10c85 <main+0x256>
   10cb8:	48 8b 0d 21 9f 00 00 	mov    rcx,QWORD PTR [rip+0x9f21]        # 1abe0 <stderr@GLIBC_2.2.5>
   10cbf:	ba 32 00 00 00       	mov    edx,0x32
   10cc4:	be 01 00 00 00       	mov    esi,0x1
   10cc9:	48 8d 3d d8 5c 00 00 	lea    rdi,[rip+0x5cd8]        # 169a8 <_IO_stdin_used+0x19a8>
   10cd0:	e8 0b 25 ff ff       	call   31e0 <fwrite@plt>
   10cd5:	eb ae                	jmp    10c85 <main+0x256>
   10cd7:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
   10cdc:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
   10ce1:	4c 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],r15
   10ce6:	48 8d 74 24 10       	lea    rsi,[rsp+0x10]
   10ceb:	bf 02 00 00 00       	mov    edi,0x2
   10cf0:	e8 e7 fb ff ff       	call   108dc <handl_pipeline>

0000000000010cf5 <PARSE>:
   10cf5:	41 55                	push   r13
   10cf7:	41 54                	push   r12
   10cf9:	55                   	push   rbp
   10cfa:	53                   	push   rbx
   10cfb:	48 81 ec 78 02 00 00 	sub    rsp,0x278
   10d02:	bb 00 00 00 00       	mov    ebx,0x0
   10d07:	e9 c9 11 00 00       	jmp    11ed5 <PARSE+0x11e0>
   10d0c:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x1
   10d13:	01 
   10d14:	48 8b 75 00          	mov    rsi,QWORD PTR [rbp+0x0]
   10d18:	48 8d bc 24 b1 00 00 	lea    rdi,[rsp+0xb1]
   10d1f:	00 
   10d20:	ba 08 00 00 00       	mov    edx,0x8
   10d25:	e8 36 23 ff ff       	call   3060 <strncpy@plt>
   10d2a:	83 c3 01             	add    ebx,0x1
   10d2d:	39 1d c1 9e 00 00    	cmp    DWORD PTR [rip+0x9ec1],ebx        # 1abf4 <toks_len>
   10d33:	0f 8e 2a 06 00 00    	jle    11363 <PARSE+0x66e>
   10d39:	48 8b 15 b8 9e 00 00 	mov    rdx,QWORD PTR [rip+0x9eb8]        # 1abf8 <toks>
   10d40:	48 63 cb             	movsxd rcx,ebx
   10d43:	49 89 cc             	mov    r12,rcx
   10d46:	49 c1 e4 04          	shl    r12,0x4
   10d4a:	4a 8d 34 22          	lea    rsi,[rdx+r12*1]
   10d4e:	8b 6e 0c             	mov    ebp,DWORD PTR [rsi+0xc]
   10d51:	83 fd 23             	cmp    ebp,0x23
   10d54:	0f 84 ca 00 00 00    	je     10e24 <PARSE+0x12f>
   10d5a:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10d61:	83 f8 03             	cmp    eax,0x3
   10d64:	0f 8f c2 00 00 00    	jg     10e2c <PARSE+0x137>
   10d6a:	8d 7d f1             	lea    edi,[rbp-0xf]
   10d6d:	83 ff 04             	cmp    edi,0x4
   10d70:	0f 86 e0 00 00 00    	jbe    10e56 <PARSE+0x161>
   10d76:	8d 7d e1             	lea    edi,[rbp-0x1f]
   10d79:	83 ff 03             	cmp    edi,0x3
   10d7c:	0f 86 04 02 00 00    	jbe    10f86 <PARSE+0x291>
   10d82:	83 fd 15             	cmp    ebp,0x15
   10d85:	0f 84 89 02 00 00    	je     11014 <PARSE+0x31f>
   10d8b:	83 fd 1e             	cmp    ebp,0x1e
   10d8e:	0f 84 01 03 00 00    	je     11095 <PARSE+0x3a0>
   10d94:	83 fd 01             	cmp    ebp,0x1
   10d97:	40 0f 94 c7          	sete   dil
   10d9b:	83 fd 04             	cmp    ebp,0x4
   10d9e:	41 0f 94 c0          	sete   r8b
   10da2:	44 08 c7             	or     dil,r8b
   10da5:	74 22                	je     10dc9 <PARSE+0xd4>
   10da7:	83 fd 01             	cmp    ebp,0x1
   10daa:	0f 84 2f 03 00 00    	je     110df <PARSE+0x3ea>
   10db0:	bf 02 00 00 00       	mov    edi,0x2
   10db5:	01 df                	add    edi,ebx
   10db7:	48 63 ff             	movsxd rdi,edi
   10dba:	48 c1 e7 04          	shl    rdi,0x4
   10dbe:	83 7c 3a 0c 17       	cmp    DWORD PTR [rdx+rdi*1+0xc],0x17
   10dc3:	0f 84 1d 03 00 00    	je     110e6 <PARSE+0x3f1>
   10dc9:	83 fd 28             	cmp    ebp,0x28
   10dcc:	77 29                	ja     10df7 <PARSE+0x102>
   10dce:	ba 01 00 00 00       	mov    edx,0x1
   10dd3:	89 e9                	mov    ecx,ebp
   10dd5:	48 d3 e2             	shl    rdx,cl
   10dd8:	48 b9 1a 60 00 40 00 	movabs rcx,0x1004000601a
   10ddf:	01 00 00 
   10de2:	48 85 ca             	test   rdx,rcx
   10de5:	0f 85 ac 03 00 00    	jne    11197 <PARSE+0x4a2>
   10deb:	f7 c2 00 00 80 01    	test   edx,0x1800000
   10df1:	0f 85 57 05 00 00    	jne    1134e <PARSE+0x659>
   10df7:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   10dfe:	00 
   10dff:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   10e02:	48 8d 35 af 5c 00 00 	lea    rsi,[rip+0x5caf]        # 16ab8 <_IO_stdin_used+0x1ab8>
   10e09:	48 8b 3d d0 9d 00 00 	mov    rdi,QWORD PTR [rip+0x9dd0]        # 1abe0 <stderr@GLIBC_2.2.5>
   10e10:	b8 00 00 00 00       	mov    eax,0x0
   10e15:	e8 26 23 ff ff       	call   3140 <fprintf@plt>
   10e1a:	bf 01 00 00 00       	mov    edi,0x1
   10e1f:	e8 ac 23 ff ff       	call   31d0 <exit@plt>
   10e24:	83 c3 01             	add    ebx,0x1
   10e27:	e9 01 ff ff ff       	jmp    10d2d <PARSE+0x38>
   10e2c:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   10e33:	00 
   10e34:	48 8d 35 d9 5b 00 00 	lea    rsi,[rip+0x5bd9]        # 16a14 <_IO_stdin_used+0x1a14>
   10e3b:	48 8b 3d 9e 9d 00 00 	mov    rdi,QWORD PTR [rip+0x9d9e]        # 1abe0 <stderr@GLIBC_2.2.5>
   10e42:	b8 00 00 00 00       	mov    eax,0x0
   10e47:	e8 f4 22 ff ff       	call   3140 <fprintf@plt>
   10e4c:	bf 01 00 00 00       	mov    edi,0x1
   10e51:	e8 7a 23 ff ff       	call   31d0 <exit@plt>
   10e56:	83 c3 01             	add    ebx,0x1
   10e59:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
   10e5c:	48 98                	cdqe
   10e5e:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10e62:	48 c1 e0 05          	shl    rax,0x5
   10e66:	48 8d bc 04 c8 00 00 	lea    rdi,[rsp+rax*1+0xc8]
   10e6d:	00 
   10e6e:	ba 08 00 00 00       	mov    edx,0x8
   10e73:	e8 e8 21 ff ff       	call   3060 <strncpy@plt>
   10e78:	83 ed 0f             	sub    ebp,0xf
   10e7b:	83 fd 04             	cmp    ebp,0x4
   10e7e:	0f 87 da 00 00 00    	ja     10f5e <PARSE+0x269>
   10e84:	89 ed                	mov    ebp,ebp
   10e86:	48 8d 15 0f 5f 00 00 	lea    rdx,[rip+0x5f0f]        # 16d9c <_IO_stdin_used+0x1d9c>
   10e8d:	48 63 04 aa          	movsxd rax,DWORD PTR [rdx+rbp*4]
   10e91:	48 01 d0             	add    rax,rdx
   10e94:	ff e0                	jmp    rax
   10e96:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10e9d:	8d 50 01             	lea    edx,[rax+0x1]
   10ea0:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   10ea7:	48 98                	cdqe
   10ea9:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10ead:	48 c1 e0 05          	shl    rax,0x5
   10eb1:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xb
   10eb8:	0b 
   10eb9:	e9 6f fe ff ff       	jmp    10d2d <PARSE+0x38>
   10ebe:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10ec5:	8d 50 01             	lea    edx,[rax+0x1]
   10ec8:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   10ecf:	48 98                	cdqe
   10ed1:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10ed5:	48 c1 e0 05          	shl    rax,0x5
   10ed9:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xc
   10ee0:	0c 
   10ee1:	e9 47 fe ff ff       	jmp    10d2d <PARSE+0x38>
   10ee6:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10eed:	8d 50 01             	lea    edx,[rax+0x1]
   10ef0:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   10ef7:	48 98                	cdqe
   10ef9:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10efd:	48 c1 e0 05          	shl    rax,0x5
   10f01:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xd
   10f08:	0d 
   10f09:	e9 1f fe ff ff       	jmp    10d2d <PARSE+0x38>
   10f0e:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10f15:	8d 50 01             	lea    edx,[rax+0x1]
   10f18:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   10f1f:	48 98                	cdqe
   10f21:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10f25:	48 c1 e0 05          	shl    rax,0x5
   10f29:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xe
   10f30:	0e 
   10f31:	e9 f7 fd ff ff       	jmp    10d2d <PARSE+0x38>
   10f36:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10f3d:	8d 50 01             	lea    edx,[rax+0x1]
   10f40:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   10f47:	48 98                	cdqe
   10f49:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10f4d:	48 c1 e0 05          	shl    rax,0x5
   10f51:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xf
   10f58:	0f 
   10f59:	e9 cf fd ff ff       	jmp    10d2d <PARSE+0x38>
   10f5e:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   10f65:	8d 50 01             	lea    edx,[rax+0x1]
   10f68:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   10f6f:	48 98                	cdqe
   10f71:	48 8d 04 40          	lea    rax,[rax+rax*2]
   10f75:	48 c1 e0 05          	shl    rax,0x5
   10f79:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xa
   10f80:	0a 
   10f81:	e9 a7 fd ff ff       	jmp    10d2d <PARSE+0x38>
   10f86:	80 bc 24 78 01 00 00 	cmp    BYTE PTR [rsp+0x178],0x0
   10f8d:	00 
   10f8e:	75 32                	jne    10fc2 <PARSE+0x2cd>
   10f90:	83 c3 01             	add    ebx,0x1
   10f93:	4c 89 e0             	mov    rax,r12
   10f96:	48 03 05 5b 9c 00 00 	add    rax,QWORD PTR [rip+0x9c5b]        # 1abf8 <toks>
   10f9d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   10fa0:	83 f8 21             	cmp    eax,0x21
   10fa3:	74 62                	je     11007 <PARSE+0x312>
   10fa5:	7f 3d                	jg     10fe4 <PARSE+0x2ef>
   10fa7:	83 f8 1f             	cmp    eax,0x1f
   10faa:	74 4e                	je     10ffa <PARSE+0x305>
   10fac:	83 f8 20             	cmp    eax,0x20
   10faf:	0f 85 78 fd ff ff    	jne    10d2d <PARSE+0x38>
   10fb5:	c6 84 24 78 01 00 00 	mov    BYTE PTR [rsp+0x178],0x2
   10fbc:	02 
   10fbd:	e9 6b fd ff ff       	jmp    10d2d <PARSE+0x38>
   10fc2:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   10fc9:	00 
   10fca:	48 8d 35 67 5a 00 00 	lea    rsi,[rip+0x5a67]        # 16a38 <_IO_stdin_used+0x1a38>
   10fd1:	48 8b 3d 08 9c 00 00 	mov    rdi,QWORD PTR [rip+0x9c08]        # 1abe0 <stderr@GLIBC_2.2.5>
   10fd8:	b8 00 00 00 00       	mov    eax,0x0
   10fdd:	e8 5e 21 ff ff       	call   3140 <fprintf@plt>
   10fe2:	eb ac                	jmp    10f90 <PARSE+0x29b>
   10fe4:	83 f8 22             	cmp    eax,0x22
   10fe7:	0f 85 40 fd ff ff    	jne    10d2d <PARSE+0x38>
   10fed:	c6 84 24 78 01 00 00 	mov    BYTE PTR [rsp+0x178],0x8
   10ff4:	08 
   10ff5:	e9 33 fd ff ff       	jmp    10d2d <PARSE+0x38>
   10ffa:	c6 84 24 78 01 00 00 	mov    BYTE PTR [rsp+0x178],0x1
   11001:	01 
   11002:	e9 26 fd ff ff       	jmp    10d2d <PARSE+0x38>
   11007:	c6 84 24 78 01 00 00 	mov    BYTE PTR [rsp+0x178],0x4
   1100e:	04 
   1100f:	e9 19 fd ff ff       	jmp    10d2d <PARSE+0x38>
   11014:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
   11017:	48 98                	cdqe
   11019:	48 8d 04 40          	lea    rax,[rax+rax*2]
   1101d:	48 c1 e0 05          	shl    rax,0x5
   11021:	48 8d ac 04 c0 00 00 	lea    rbp,[rsp+rax*1+0xc0]
   11028:	00 
   11029:	48 89 e7             	mov    rdi,rsp
   1102c:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   11033:	00 
   11034:	e8 e9 47 ff ff       	call   5822 <parse_addr_expr>
   11039:	f3 0f 6f 1c 24       	movdqu xmm3,XMMWORD PTR [rsp]
   1103e:	0f 11 5d 08          	movups XMMWORD PTR [rbp+0x8],xmm3
   11042:	f3 0f 6f 64 24 10    	movdqu xmm4,XMMWORD PTR [rsp+0x10]
   11048:	0f 11 65 18          	movups XMMWORD PTR [rbp+0x18],xmm4
   1104c:	f3 0f 6f 6c 24 20    	movdqu xmm5,XMMWORD PTR [rsp+0x20]
   11052:	0f 11 6d 28          	movups XMMWORD PTR [rbp+0x28],xmm5
   11056:	f3 0f 6f 74 24 30    	movdqu xmm6,XMMWORD PTR [rsp+0x30]
   1105c:	0f 11 75 38          	movups XMMWORD PTR [rbp+0x38],xmm6
   11060:	f3 0f 6f 7c 24 40    	movdqu xmm7,XMMWORD PTR [rsp+0x40]
   11066:	0f 11 7d 48          	movups XMMWORD PTR [rbp+0x48],xmm7
   1106a:	83 c3 01             	add    ebx,0x1
   1106d:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   11074:	8d 50 01             	lea    edx,[rax+0x1]
   11077:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   1107e:	48 98                	cdqe
   11080:	48 8d 04 40          	lea    rax,[rax+rax*2]
   11084:	48 c1 e0 05          	shl    rax,0x5
   11088:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0x14
   1108f:	14 
   11090:	e9 98 fc ff ff       	jmp    10d2d <PARSE+0x38>
   11095:	48 8d 79 01          	lea    rdi,[rcx+0x1]
   11099:	48 c1 e7 04          	shl    rdi,0x4
   1109d:	83 7c 3a 0c 17       	cmp    DWORD PTR [rdx+rdi*1+0xc],0x17
   110a2:	0f 85 ec fc ff ff    	jne    10d94 <PARSE+0x9f>
   110a8:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   110ab:	0f b6 3a             	movzx  edi,BYTE PTR [rdx]
   110ae:	48 63 c8             	movsxd rcx,eax
   110b1:	48 8d 14 09          	lea    rdx,[rcx+rcx*1]
   110b5:	48 8d 34 0a          	lea    rsi,[rdx+rcx*1]
   110b9:	48 c1 e6 05          	shl    rsi,0x5
   110bd:	40 88 bc 34 c8 00 00 	mov    BYTE PTR [rsp+rsi*1+0xc8],dil
   110c4:	00 
   110c5:	83 c0 01             	add    eax,0x1
   110c8:	89 84 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],eax
   110cf:	c6 84 34 c0 00 00 00 	mov    BYTE PTR [rsp+rsi*1+0xc0],0x12
   110d6:	12 
   110d7:	83 c3 01             	add    ebx,0x1
   110da:	e9 4e fc ff ff       	jmp    10d2d <PARSE+0x38>
   110df:	89 ef                	mov    edi,ebp
   110e1:	e9 cf fc ff ff       	jmp    10db5 <PARSE+0xc0>
   110e6:	83 fd 04             	cmp    ebp,0x4
   110e9:	75 12                	jne    110fd <PARSE+0x408>
   110eb:	48 83 c1 01          	add    rcx,0x1
   110ef:	48 c1 e1 04          	shl    rcx,0x4
   110f3:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   110f7:	83 78 0c 01          	cmp    DWORD PTR [rax+0xc],0x1
   110fb:	74 4e                	je     1114b <PARSE+0x456>
   110fd:	48 8b 3e             	mov    rdi,QWORD PTR [rsi]
   11100:	e8 5b 32 00 00       	call   14360 <eval_expr>
   11105:	48 89 c2             	mov    rdx,rax
   11108:	48 63 84 24 40 02 00 	movsxd rax,DWORD PTR [rsp+0x240]
   1110f:	00 
   11110:	48 8d 04 40          	lea    rax,[rax+rax*2]
   11114:	48 c1 e0 05          	shl    rax,0x5
   11118:	48 89 94 04 c8 00 00 	mov    QWORD PTR [rsp+rax*1+0xc8],rdx
   1111f:	00 
   11120:	83 c3 01             	add    ebx,0x1
   11123:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   1112a:	8d 50 01             	lea    edx,[rax+0x1]
   1112d:	89 94 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],edx
   11134:	48 98                	cdqe
   11136:	48 8d 04 40          	lea    rax,[rax+rax*2]
   1113a:	48 c1 e0 05          	shl    rax,0x5
   1113e:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0x13
   11145:	13 
   11146:	e9 e2 fb ff ff       	jmp    10d2d <PARSE+0x38>
   1114b:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   1114e:	48 8d 6c 24 70       	lea    rbp,[rsp+0x70]
   11153:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   11156:	48 8d 15 df 4c 00 00 	lea    rdx,[rip+0x4cdf]        # 15e3c <_IO_stdin_used+0xe3c>
   1115d:	be 40 00 00 00       	mov    esi,0x40
   11162:	48 89 ef             	mov    rdi,rbp
   11165:	b8 00 00 00 00       	mov    eax,0x0
   1116a:	e8 81 1f ff ff       	call   30f0 <snprintf@plt>
   1116f:	48 89 ef             	mov    rdi,rbp
   11172:	e8 e9 31 00 00       	call   14360 <eval_expr>
   11177:	48 89 c2             	mov    rdx,rax
   1117a:	48 63 84 24 40 02 00 	movsxd rax,DWORD PTR [rsp+0x240]
   11181:	00 
   11182:	48 8d 04 40          	lea    rax,[rax+rax*2]
   11186:	48 c1 e0 05          	shl    rax,0x5
   1118a:	48 89 94 04 c8 00 00 	mov    QWORD PTR [rsp+rax*1+0xc8],rdx
   11191:	00 
   11192:	83 c3 02             	add    ebx,0x2
   11195:	eb 8c                	jmp    11123 <PARSE+0x42e>
   11197:	66 0f ef c0          	pxor   xmm0,xmm0
   1119b:	0f 29 44 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm0
   111a0:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
   111a7:	00 00 00 00 00 
   111ac:	48 63 eb             	movsxd rbp,ebx
   111af:	48 c1 e5 04          	shl    rbp,0x4
   111b3:	48 89 e8             	mov    rax,rbp
   111b6:	48 03 05 3b 9a 00 00 	add    rax,QWORD PTR [rip+0x9a3b]        # 1abf8 <toks>
   111bd:	8b 78 0c             	mov    edi,DWORD PTR [rax+0xc]
   111c0:	83 ff 23             	cmp    edi,0x23
   111c3:	0f 95 c2             	setne  dl
   111c6:	83 ff 17             	cmp    edi,0x17
   111c9:	0f 95 c0             	setne  al
   111cc:	84 c2                	test   dl,al
   111ce:	0f 84 9b 00 00 00    	je     1126f <PARSE+0x57a>
   111d4:	83 ff 18             	cmp    edi,0x18
   111d7:	0f 84 92 00 00 00    	je     1126f <PARSE+0x57a>
   111dd:	40 0f b6 ff          	movzx  edi,dil
   111e1:	e8 2f 36 00 00       	call   14815 <is_expr_token>
   111e6:	84 c0                	test   al,al
   111e8:	74 5a                	je     11244 <PARSE+0x54f>
   111ea:	48 03 2d 07 9a 00 00 	add    rbp,QWORD PTR [rip+0x9a07]        # 1abf8 <toks>
   111f1:	8b 45 0c             	mov    eax,DWORD PTR [rbp+0xc]
   111f4:	88 44 24 50          	mov    BYTE PTR [rsp+0x50],al
   111f8:	48 8b 7d 00          	mov    rdi,QWORD PTR [rbp+0x0]
   111fc:	e8 ef 1f ff ff       	call   31f0 <strdup@plt>
   11201:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   11206:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
   1120b:	48 8d b4 24 84 00 00 	lea    rsi,[rsp+0x84]
   11212:	00 
   11213:	48 8d bc 24 80 00 00 	lea    rdi,[rsp+0x80]
   1121a:	00 
   1121b:	41 b8 10 00 00 00    	mov    r8d,0x10
   11221:	48 8b 54 24 78       	mov    rdx,QWORD PTR [rsp+0x78]
   11226:	e8 1e 33 00 00       	call   14549 <append>
   1122b:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   11230:	0f b6 44 24 70       	movzx  eax,BYTE PTR [rsp+0x70]
   11235:	83 c0 01             	add    eax,0x1
   11238:	88 44 24 70          	mov    BYTE PTR [rsp+0x70],al
   1123c:	83 c3 01             	add    ebx,0x1
   1123f:	e9 68 ff ff ff       	jmp    111ac <PARSE+0x4b7>
   11244:	48 03 2d ad 99 00 00 	add    rbp,QWORD PTR [rip+0x99ad]        # 1abf8 <toks>
   1124b:	48 8b 4d 00          	mov    rcx,QWORD PTR [rbp+0x0]
   1124f:	8b 55 08             	mov    edx,DWORD PTR [rbp+0x8]
   11252:	48 8d 35 1f 58 00 00 	lea    rsi,[rip+0x581f]        # 16a78 <_IO_stdin_used+0x1a78>
   11259:	48 8b 3d 80 99 00 00 	mov    rdi,QWORD PTR [rip+0x9980]        # 1abe0 <stderr@GLIBC_2.2.5>
   11260:	e8 db 1e ff ff       	call   3140 <fprintf@plt>
   11265:	bf 01 00 00 00       	mov    edi,0x1
   1126a:	e8 61 1f ff ff       	call   31d0 <exit@plt>
   1126f:	48 8d 7c 24 70       	lea    rdi,[rsp+0x70]
   11274:	e8 6b 25 00 00       	call   137e4 <expr_is_const>
   11279:	83 f8 01             	cmp    eax,0x1
   1127c:	74 59                	je     112d7 <PARSE+0x5e2>
   1127e:	83 f8 02             	cmp    eax,0x2
   11281:	0f 84 88 00 00 00    	je     1130f <PARSE+0x61a>
   11287:	48 63 94 24 40 02 00 	movsxd rdx,DWORD PTR [rsp+0x240]
   1128e:	00 
   1128f:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
   11293:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
   11297:	48 c1 e1 05          	shl    rcx,0x5
   1129b:	c6 84 0c c0 00 00 00 	mov    BYTE PTR [rsp+rcx*1+0xc0],0x10
   112a2:	10 
   112a3:	48 8d 84 0c c0 00 00 	lea    rax,[rsp+rcx*1+0xc0]
   112aa:	00 
   112ab:	66 0f 6f 54 24 70    	movdqa xmm2,XMMWORD PTR [rsp+0x70]
   112b1:	0f 11 50 08          	movups XMMWORD PTR [rax+0x8],xmm2
   112b5:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   112bc:	00 
   112bd:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
   112c1:	8b 84 24 40 02 00 00 	mov    eax,DWORD PTR [rsp+0x240]
   112c8:	83 c0 01             	add    eax,0x1
   112cb:	89 84 24 40 02 00 00 	mov    DWORD PTR [rsp+0x240],eax
   112d2:	e9 56 fa ff ff       	jmp    10d2d <PARSE+0x38>
   112d7:	4c 63 a4 24 40 02 00 	movsxd r12,DWORD PTR [rsp+0x240]
   112de:	00 
   112df:	4b 8d 2c 24          	lea    rbp,[r12+r12*1]
   112e3:	4a 8d 44 25 00       	lea    rax,[rbp+r12*1+0x0]
   112e8:	48 c1 e0 05          	shl    rax,0x5
   112ec:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0x13
   112f3:	13 
   112f4:	48 8d 7c 24 70       	lea    rdi,[rsp+0x70]
   112f9:	e8 7c 30 00 00       	call   1437a <eval_const_expr>
   112fe:	4c 01 e5             	add    rbp,r12
   11301:	48 c1 e5 05          	shl    rbp,0x5
   11305:	48 89 84 2c c8 00 00 	mov    QWORD PTR [rsp+rbp*1+0xc8],rax
   1130c:	00 
   1130d:	eb b2                	jmp    112c1 <PARSE+0x5cc>
   1130f:	48 63 94 24 40 02 00 	movsxd rdx,DWORD PTR [rsp+0x240]
   11316:	00 
   11317:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
   1131b:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
   1131f:	48 c1 e1 05          	shl    rcx,0x5
   11323:	c6 84 0c c0 00 00 00 	mov    BYTE PTR [rsp+rcx*1+0xc0],0x11
   1132a:	11 
   1132b:	48 8d 84 0c c0 00 00 	lea    rax,[rsp+rcx*1+0xc0]
   11332:	00 
   11333:	66 0f 6f 5c 24 70    	movdqa xmm3,XMMWORD PTR [rsp+0x70]
   11339:	0f 11 58 08          	movups XMMWORD PTR [rax+0x8],xmm3
   1133d:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   11344:	00 
   11345:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
   11349:	e9 73 ff ff ff       	jmp    112c1 <PARSE+0x5cc>
   1134e:	48 98                	cdqe
   11350:	48 8d 04 40          	lea    rax,[rax+rax*2]
   11354:	48 c1 e0 05          	shl    rax,0x5
   11358:	c6 84 04 c0 00 00 00 	mov    BYTE PTR [rsp+rax*1+0xc0],0xa
   1135f:	0a 
   11360:	83 c3 01             	add    ebx,0x1
   11363:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   1136a:	00 
   1136b:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   11371:	48 8b 15 90 9c 00 00 	mov    rdx,QWORD PTR [rip+0x9c90]        # 1b008 <ast>
   11378:	48 8d 35 81 9c 00 00 	lea    rsi,[rip+0x9c81]        # 1b000 <ast_cap>
   1137f:	48 8d 3d 7e 9c 00 00 	lea    rdi,[rip+0x9c7e]        # 1b004 <ast_len>
   11386:	e8 be 31 00 00       	call   14549 <append>
   1138b:	48 89 05 76 9c 00 00 	mov    QWORD PTR [rip+0x9c76],rax        # 1b008 <ast>
   11392:	39 1d 5c 98 00 00    	cmp    DWORD PTR [rip+0x985c],ebx        # 1abf4 <toks_len>
   11398:	0f 8e 37 0b 00 00    	jle    11ed5 <PARSE+0x11e0>
   1139e:	48 8b 15 53 98 00 00 	mov    rdx,QWORD PTR [rip+0x9853]        # 1abf8 <toks>
   113a5:	48 63 c3             	movsxd rax,ebx
   113a8:	48 c1 e0 04          	shl    rax,0x4
   113ac:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   113b1:	0f 85 1e 0b 00 00    	jne    11ed5 <PARSE+0x11e0>
   113b7:	eb 03                	jmp    113bc <PARSE+0x6c7>
   113b9:	83 c3 01             	add    ebx,0x1
   113bc:	48 63 c3             	movsxd rax,ebx
   113bf:	48 c1 e0 04          	shl    rax,0x4
   113c3:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   113c8:	74 ef                	je     113b9 <PARSE+0x6c4>
   113ca:	e9 06 0b 00 00       	jmp    11ed5 <PARSE+0x11e0>
   113cf:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x8
   113d6:	08 
   113d7:	4c 8b 6d 00          	mov    r13,QWORD PTR [rbp+0x0]
   113db:	4c 89 ef             	mov    rdi,r13
   113de:	e8 dd 1c ff ff       	call   30c0 <strlen@plt>
   113e3:	48 83 f8 7f          	cmp    rax,0x7f
   113e7:	77 61                	ja     1144a <PARSE+0x755>
   113e9:	8b 45 0c             	mov    eax,DWORD PTR [rbp+0xc]
   113ec:	83 e8 17             	sub    eax,0x17
   113ef:	83 f8 01             	cmp    eax,0x1
   113f2:	77 7c                	ja     11470 <PARSE+0x77b>
   113f4:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   113fb:	00 
   113fc:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   11402:	48 8b 15 ff 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9bff]        # 1b008 <ast>
   11409:	48 8d 35 f0 9b 00 00 	lea    rsi,[rip+0x9bf0]        # 1b000 <ast_cap>
   11410:	48 8d 3d ed 9b 00 00 	lea    rdi,[rip+0x9bed]        # 1b004 <ast_len>
   11417:	e8 2d 31 00 00       	call   14549 <append>
   1141c:	48 89 05 e5 9b 00 00 	mov    QWORD PTR [rip+0x9be5],rax        # 1b008 <ast>
   11423:	39 1d cb 97 00 00    	cmp    DWORD PTR [rip+0x97cb],ebx        # 1abf4 <toks_len>
   11429:	0f 8e a6 0a 00 00    	jle    11ed5 <PARSE+0x11e0>
   1142f:	48 8b 15 c2 97 00 00 	mov    rdx,QWORD PTR [rip+0x97c2]        # 1abf8 <toks>
   11436:	48 63 c3             	movsxd rax,ebx
   11439:	48 c1 e0 04          	shl    rax,0x4
   1143d:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11442:	0f 85 8d 0a 00 00    	jne    11ed5 <PARSE+0x11e0>
   11448:	eb 46                	jmp    11490 <PARSE+0x79b>
   1144a:	41 0f b7 d4          	movzx  edx,r12w
   1144e:	48 8d 35 8b 56 00 00 	lea    rsi,[rip+0x568b]        # 16ae0 <_IO_stdin_used+0x1ae0>
   11455:	48 8b 3d 84 97 00 00 	mov    rdi,QWORD PTR [rip+0x9784]        # 1abe0 <stderr@GLIBC_2.2.5>
   1145c:	b8 00 00 00 00       	mov    eax,0x0
   11461:	e8 da 1c ff ff       	call   3140 <fprintf@plt>
   11466:	bf 01 00 00 00       	mov    edi,0x1
   1146b:	e8 60 1d ff ff       	call   31d0 <exit@plt>
   11470:	83 c3 01             	add    ebx,0x1
   11473:	48 8d bc 24 c0 00 00 	lea    rdi,[rsp+0xc0]
   1147a:	00 
   1147b:	ba 80 00 00 00       	mov    edx,0x80
   11480:	4c 89 ee             	mov    rsi,r13
   11483:	e8 d8 1b ff ff       	call   3060 <strncpy@plt>
   11488:	e9 67 ff ff ff       	jmp    113f4 <PARSE+0x6ff>
   1148d:	83 c3 01             	add    ebx,0x1
   11490:	48 63 c3             	movsxd rax,ebx
   11493:	48 c1 e0 04          	shl    rax,0x4
   11497:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   1149c:	74 ef                	je     1148d <PARSE+0x798>
   1149e:	e9 32 0a 00 00       	jmp    11ed5 <PARSE+0x11e0>
   114a3:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0xb
   114aa:	0b 
   114ab:	83 e8 17             	sub    eax,0x17
   114ae:	83 f8 01             	cmp    eax,0x1
   114b1:	77 56                	ja     11509 <PARSE+0x814>
   114b3:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   114ba:	00 
   114bb:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   114c1:	48 8b 15 40 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b40]        # 1b008 <ast>
   114c8:	48 8d 35 31 9b 00 00 	lea    rsi,[rip+0x9b31]        # 1b000 <ast_cap>
   114cf:	48 8d 3d 2e 9b 00 00 	lea    rdi,[rip+0x9b2e]        # 1b004 <ast_len>
   114d6:	e8 6e 30 00 00       	call   14549 <append>
   114db:	48 89 05 26 9b 00 00 	mov    QWORD PTR [rip+0x9b26],rax        # 1b008 <ast>
   114e2:	39 1d 0c 97 00 00    	cmp    DWORD PTR [rip+0x970c],ebx        # 1abf4 <toks_len>
   114e8:	0f 8e e7 09 00 00    	jle    11ed5 <PARSE+0x11e0>
   114ee:	48 8b 15 03 97 00 00 	mov    rdx,QWORD PTR [rip+0x9703]        # 1abf8 <toks>
   114f5:	48 63 c3             	movsxd rax,ebx
   114f8:	48 c1 e0 04          	shl    rax,0x4
   114fc:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11501:	0f 85 ce 09 00 00    	jne    11ed5 <PARSE+0x11e0>
   11507:	eb 1e                	jmp    11527 <PARSE+0x832>
   11509:	83 c3 01             	add    ebx,0x1
   1150c:	48 8b 75 00          	mov    rsi,QWORD PTR [rbp+0x0]
   11510:	48 8d bc 24 c0 00 00 	lea    rdi,[rsp+0xc0]
   11517:	00 
   11518:	ba 40 00 00 00       	mov    edx,0x40
   1151d:	e8 3e 1b ff ff       	call   3060 <strncpy@plt>
   11522:	eb 8f                	jmp    114b3 <PARSE+0x7be>
   11524:	83 c3 01             	add    ebx,0x1
   11527:	48 63 c3             	movsxd rax,ebx
   1152a:	48 c1 e0 04          	shl    rax,0x4
   1152e:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11533:	74 ef                	je     11524 <PARSE+0x82f>
   11535:	e9 9b 09 00 00       	jmp    11ed5 <PARSE+0x11e0>
   1153a:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0xe
   11541:	0e 
   11542:	83 c3 01             	add    ebx,0x1
   11545:	39 1d a9 96 00 00    	cmp    DWORD PTR [rip+0x96a9],ebx        # 1abf4 <toks_len>
   1154b:	0f 8e 82 00 00 00    	jle    115d3 <PARSE+0x8de>
   11551:	48 63 c3             	movsxd rax,ebx
   11554:	48 c1 e0 04          	shl    rax,0x4
   11558:	48 03 05 99 96 00 00 	add    rax,QWORD PTR [rip+0x9699]        # 1abf8 <toks>
   1155f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   11562:	8d 4a e9             	lea    ecx,[rdx-0x17]
   11565:	83 f9 01             	cmp    ecx,0x1
   11568:	76 69                	jbe    115d3 <PARSE+0x8de>
   1156a:	83 fa 23             	cmp    edx,0x23
   1156d:	74 32                	je     115a1 <PARSE+0x8ac>
   1156f:	83 fa 0e             	cmp    edx,0xe
   11572:	75 32                	jne    115a6 <PARSE+0x8b1>
   11574:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   11577:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   1157e:	00 
   1157f:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   11586:	00 
   11587:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   1158e:	00 
   1158f:	e8 31 30 00 00       	call   145c5 <TwoDappend>
   11594:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   1159b:	00 
   1159c:	83 c3 01             	add    ebx,0x1
   1159f:	eb a4                	jmp    11545 <PARSE+0x850>
   115a1:	83 c3 01             	add    ebx,0x1
   115a4:	eb 9f                	jmp    11545 <PARSE+0x850>
   115a6:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   115ad:	00 
   115ae:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   115b1:	48 8d 35 50 55 00 00 	lea    rsi,[rip+0x5550]        # 16b08 <_IO_stdin_used+0x1b08>
   115b8:	48 8b 3d 21 96 00 00 	mov    rdi,QWORD PTR [rip+0x9621]        # 1abe0 <stderr@GLIBC_2.2.5>
   115bf:	b8 00 00 00 00       	mov    eax,0x0
   115c4:	e8 77 1b ff ff       	call   3140 <fprintf@plt>
   115c9:	bf 01 00 00 00       	mov    edi,0x1
   115ce:	e8 fd 1b ff ff       	call   31d0 <exit@plt>
   115d3:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   115da:	00 
   115db:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   115e1:	48 8b 15 20 9a 00 00 	mov    rdx,QWORD PTR [rip+0x9a20]        # 1b008 <ast>
   115e8:	48 8d 35 11 9a 00 00 	lea    rsi,[rip+0x9a11]        # 1b000 <ast_cap>
   115ef:	48 8d 3d 0e 9a 00 00 	lea    rdi,[rip+0x9a0e]        # 1b004 <ast_len>
   115f6:	e8 4e 2f 00 00       	call   14549 <append>
   115fb:	48 89 05 06 9a 00 00 	mov    QWORD PTR [rip+0x9a06],rax        # 1b008 <ast>
   11602:	39 1d ec 95 00 00    	cmp    DWORD PTR [rip+0x95ec],ebx        # 1abf4 <toks_len>
   11608:	0f 8e c7 08 00 00    	jle    11ed5 <PARSE+0x11e0>
   1160e:	48 8b 15 e3 95 00 00 	mov    rdx,QWORD PTR [rip+0x95e3]        # 1abf8 <toks>
   11615:	48 63 c3             	movsxd rax,ebx
   11618:	48 c1 e0 04          	shl    rax,0x4
   1161c:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11621:	0f 85 ae 08 00 00    	jne    11ed5 <PARSE+0x11e0>
   11627:	eb 03                	jmp    1162c <PARSE+0x937>
   11629:	83 c3 01             	add    ebx,0x1
   1162c:	48 63 c3             	movsxd rax,ebx
   1162f:	48 c1 e0 04          	shl    rax,0x4
   11633:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11638:	74 ef                	je     11629 <PARSE+0x934>
   1163a:	e9 96 08 00 00       	jmp    11ed5 <PARSE+0x11e0>
   1163f:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0xf
   11646:	0f 
   11647:	83 c3 01             	add    ebx,0x1
   1164a:	39 1d a4 95 00 00    	cmp    DWORD PTR [rip+0x95a4],ebx        # 1abf4 <toks_len>
   11650:	0f 8e 82 00 00 00    	jle    116d8 <PARSE+0x9e3>
   11656:	48 63 c3             	movsxd rax,ebx
   11659:	48 c1 e0 04          	shl    rax,0x4
   1165d:	48 03 05 94 95 00 00 	add    rax,QWORD PTR [rip+0x9594]        # 1abf8 <toks>
   11664:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   11667:	8d 4a e9             	lea    ecx,[rdx-0x17]
   1166a:	83 f9 01             	cmp    ecx,0x1
   1166d:	76 69                	jbe    116d8 <PARSE+0x9e3>
   1166f:	83 fa 23             	cmp    edx,0x23
   11672:	74 32                	je     116a6 <PARSE+0x9b1>
   11674:	83 fa 0e             	cmp    edx,0xe
   11677:	75 32                	jne    116ab <PARSE+0x9b6>
   11679:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1167c:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   11683:	00 
   11684:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   1168b:	00 
   1168c:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11693:	00 
   11694:	e8 2c 2f 00 00       	call   145c5 <TwoDappend>
   11699:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   116a0:	00 
   116a1:	83 c3 01             	add    ebx,0x1
   116a4:	eb a4                	jmp    1164a <PARSE+0x955>
   116a6:	83 c3 01             	add    ebx,0x1
   116a9:	eb 9f                	jmp    1164a <PARSE+0x955>
   116ab:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   116b2:	00 
   116b3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   116b6:	48 8d 35 73 54 00 00 	lea    rsi,[rip+0x5473]        # 16b30 <_IO_stdin_used+0x1b30>
   116bd:	48 8b 3d 1c 95 00 00 	mov    rdi,QWORD PTR [rip+0x951c]        # 1abe0 <stderr@GLIBC_2.2.5>
   116c4:	b8 00 00 00 00       	mov    eax,0x0
   116c9:	e8 72 1a ff ff       	call   3140 <fprintf@plt>
   116ce:	bf 01 00 00 00       	mov    edi,0x1
   116d3:	e8 f8 1a ff ff       	call   31d0 <exit@plt>
   116d8:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   116df:	00 
   116e0:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   116e6:	48 8b 15 1b 99 00 00 	mov    rdx,QWORD PTR [rip+0x991b]        # 1b008 <ast>
   116ed:	48 8d 35 0c 99 00 00 	lea    rsi,[rip+0x990c]        # 1b000 <ast_cap>
   116f4:	48 8d 3d 09 99 00 00 	lea    rdi,[rip+0x9909]        # 1b004 <ast_len>
   116fb:	e8 49 2e 00 00       	call   14549 <append>
   11700:	48 89 05 01 99 00 00 	mov    QWORD PTR [rip+0x9901],rax        # 1b008 <ast>
   11707:	39 1d e7 94 00 00    	cmp    DWORD PTR [rip+0x94e7],ebx        # 1abf4 <toks_len>
   1170d:	0f 8e c2 07 00 00    	jle    11ed5 <PARSE+0x11e0>
   11713:	48 8b 15 de 94 00 00 	mov    rdx,QWORD PTR [rip+0x94de]        # 1abf8 <toks>
   1171a:	48 63 c3             	movsxd rax,ebx
   1171d:	48 c1 e0 04          	shl    rax,0x4
   11721:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11726:	0f 85 a9 07 00 00    	jne    11ed5 <PARSE+0x11e0>
   1172c:	eb 03                	jmp    11731 <PARSE+0xa3c>
   1172e:	83 c3 01             	add    ebx,0x1
   11731:	48 63 c3             	movsxd rax,ebx
   11734:	48 c1 e0 04          	shl    rax,0x4
   11738:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   1173d:	74 ef                	je     1172e <PARSE+0xa39>
   1173f:	e9 91 07 00 00       	jmp    11ed5 <PARSE+0x11e0>
   11744:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x2
   1174b:	02 
   1174c:	83 c3 01             	add    ebx,0x1
   1174f:	39 1d 9f 94 00 00    	cmp    DWORD PTR [rip+0x949f],ebx        # 1abf4 <toks_len>
   11755:	0f 8e 25 01 00 00    	jle    11880 <PARSE+0xb8b>
   1175b:	48 63 c3             	movsxd rax,ebx
   1175e:	48 c1 e0 04          	shl    rax,0x4
   11762:	48 03 05 8f 94 00 00 	add    rax,QWORD PTR [rip+0x948f]        # 1abf8 <toks>
   11769:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   1176c:	8d 4a e9             	lea    ecx,[rdx-0x17]
   1176f:	83 f9 01             	cmp    ecx,0x1
   11772:	0f 86 08 01 00 00    	jbe    11880 <PARSE+0xb8b>
   11778:	83 fa 23             	cmp    edx,0x23
   1177b:	74 1b                	je     11798 <PARSE+0xaa3>
   1177d:	83 fa 1e             	cmp    edx,0x1e
   11780:	74 1b                	je     1179d <PARSE+0xaa8>
   11782:	83 fa 01             	cmp    edx,0x1
   11785:	74 4c                	je     117d3 <PARSE+0xade>
   11787:	83 fa 16             	cmp    edx,0x16
   1178a:	0f 85 c6 00 00 00    	jne    11856 <PARSE+0xb61>
   11790:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   11793:	e9 b1 00 00 00       	jmp    11849 <PARSE+0xb54>
   11798:	83 c3 01             	add    ebx,0x1
   1179b:	eb b2                	jmp    1174f <PARSE+0xa5a>
   1179d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   117a0:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   117a7:	00 
   117a8:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   117af:	00 
   117b0:	41 b8 01 00 00 00    	mov    r8d,0x1
   117b6:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   117bd:	00 
   117be:	e8 86 2d 00 00       	call   14549 <append>
   117c3:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   117ca:	00 
   117cb:	83 c3 01             	add    ebx,0x1
   117ce:	e9 7c ff ff ff       	jmp    1174f <PARSE+0xa5a>
   117d3:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   117d6:	e8 85 2b 00 00       	call   14360 <eval_expr>
   117db:	88 44 24 70          	mov    BYTE PTR [rsp+0x70],al
   117df:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   117e4:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   117eb:	00 
   117ec:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   117f3:	00 
   117f4:	41 b8 01 00 00 00    	mov    r8d,0x1
   117fa:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11801:	00 
   11802:	e8 42 2d 00 00       	call   14549 <append>
   11807:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   1180e:	00 
   1180f:	83 c3 01             	add    ebx,0x1
   11812:	e9 38 ff ff ff       	jmp    1174f <PARSE+0xa5a>
   11817:	48 8d 69 01          	lea    rbp,[rcx+0x1]
   1181b:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   11822:	00 
   11823:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   1182a:	00 
   1182b:	41 b8 01 00 00 00    	mov    r8d,0x1
   11831:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11838:	00 
   11839:	e8 0b 2d 00 00       	call   14549 <append>
   1183e:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11845:	00 
   11846:	48 89 e9             	mov    rcx,rbp
   11849:	80 39 00             	cmp    BYTE PTR [rcx],0x0
   1184c:	75 c9                	jne    11817 <PARSE+0xb22>
   1184e:	83 c3 01             	add    ebx,0x1
   11851:	e9 f9 fe ff ff       	jmp    1174f <PARSE+0xa5a>
   11856:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   1185d:	00 
   1185e:	48 8d 35 f3 52 00 00 	lea    rsi,[rip+0x52f3]        # 16b58 <_IO_stdin_used+0x1b58>
   11865:	48 8b 3d 74 93 00 00 	mov    rdi,QWORD PTR [rip+0x9374]        # 1abe0 <stderr@GLIBC_2.2.5>
   1186c:	b8 00 00 00 00       	mov    eax,0x0
   11871:	e8 ca 18 ff ff       	call   3140 <fprintf@plt>
   11876:	bf 01 00 00 00       	mov    edi,0x1
   1187b:	e8 50 19 ff ff       	call   31d0 <exit@plt>
   11880:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   11887:	00 
   11888:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   1188e:	48 8b 15 73 97 00 00 	mov    rdx,QWORD PTR [rip+0x9773]        # 1b008 <ast>
   11895:	48 8d 35 64 97 00 00 	lea    rsi,[rip+0x9764]        # 1b000 <ast_cap>
   1189c:	48 8d 3d 61 97 00 00 	lea    rdi,[rip+0x9761]        # 1b004 <ast_len>
   118a3:	e8 a1 2c 00 00       	call   14549 <append>
   118a8:	48 89 05 59 97 00 00 	mov    QWORD PTR [rip+0x9759],rax        # 1b008 <ast>
   118af:	39 1d 3f 93 00 00    	cmp    DWORD PTR [rip+0x933f],ebx        # 1abf4 <toks_len>
   118b5:	0f 8e 1a 06 00 00    	jle    11ed5 <PARSE+0x11e0>
   118bb:	48 8b 15 36 93 00 00 	mov    rdx,QWORD PTR [rip+0x9336]        # 1abf8 <toks>
   118c2:	48 63 c3             	movsxd rax,ebx
   118c5:	48 c1 e0 04          	shl    rax,0x4
   118c9:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   118ce:	0f 85 01 06 00 00    	jne    11ed5 <PARSE+0x11e0>
   118d4:	eb 03                	jmp    118d9 <PARSE+0xbe4>
   118d6:	83 c3 01             	add    ebx,0x1
   118d9:	48 63 c3             	movsxd rax,ebx
   118dc:	48 c1 e0 04          	shl    rax,0x4
   118e0:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   118e5:	74 ef                	je     118d6 <PARSE+0xbe1>
   118e7:	e9 e9 05 00 00       	jmp    11ed5 <PARSE+0x11e0>
   118ec:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x3
   118f3:	03 
   118f4:	83 c3 01             	add    ebx,0x1
   118f7:	39 1d f7 92 00 00    	cmp    DWORD PTR [rip+0x92f7],ebx        # 1abf4 <toks_len>
   118fd:	0f 8e 8f 00 00 00    	jle    11992 <PARSE+0xc9d>
   11903:	48 63 c3             	movsxd rax,ebx
   11906:	48 c1 e0 04          	shl    rax,0x4
   1190a:	48 03 05 e7 92 00 00 	add    rax,QWORD PTR [rip+0x92e7]        # 1abf8 <toks>
   11911:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   11914:	8d 4a e9             	lea    ecx,[rdx-0x17]
   11917:	83 f9 01             	cmp    ecx,0x1
   1191a:	76 76                	jbe    11992 <PARSE+0xc9d>
   1191c:	83 fa 23             	cmp    edx,0x23
   1191f:	74 47                	je     11968 <PARSE+0xc73>
   11921:	83 fa 01             	cmp    edx,0x1
   11924:	75 47                	jne    1196d <PARSE+0xc78>
   11926:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11929:	e8 32 2a 00 00       	call   14360 <eval_expr>
   1192e:	66 89 44 24 70       	mov    WORD PTR [rsp+0x70],ax
   11933:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   11938:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   1193f:	00 
   11940:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   11947:	00 
   11948:	41 b8 02 00 00 00    	mov    r8d,0x2
   1194e:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11955:	00 
   11956:	e8 ee 2b 00 00       	call   14549 <append>
   1195b:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11962:	00 
   11963:	83 c3 01             	add    ebx,0x1
   11966:	eb 8f                	jmp    118f7 <PARSE+0xc02>
   11968:	83 c3 01             	add    ebx,0x1
   1196b:	eb 8a                	jmp    118f7 <PARSE+0xc02>
   1196d:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
   11970:	48 8d 35 09 52 00 00 	lea    rsi,[rip+0x5209]        # 16b80 <_IO_stdin_used+0x1b80>
   11977:	48 8b 3d 62 92 00 00 	mov    rdi,QWORD PTR [rip+0x9262]        # 1abe0 <stderr@GLIBC_2.2.5>
   1197e:	b8 00 00 00 00       	mov    eax,0x0
   11983:	e8 b8 17 ff ff       	call   3140 <fprintf@plt>
   11988:	bf 01 00 00 00       	mov    edi,0x1
   1198d:	e8 3e 18 ff ff       	call   31d0 <exit@plt>
   11992:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   11999:	00 
   1199a:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   119a0:	48 8b 15 61 96 00 00 	mov    rdx,QWORD PTR [rip+0x9661]        # 1b008 <ast>
   119a7:	48 8d 35 52 96 00 00 	lea    rsi,[rip+0x9652]        # 1b000 <ast_cap>
   119ae:	48 8d 3d 4f 96 00 00 	lea    rdi,[rip+0x964f]        # 1b004 <ast_len>
   119b5:	e8 8f 2b 00 00       	call   14549 <append>
   119ba:	48 89 05 47 96 00 00 	mov    QWORD PTR [rip+0x9647],rax        # 1b008 <ast>
   119c1:	39 1d 2d 92 00 00    	cmp    DWORD PTR [rip+0x922d],ebx        # 1abf4 <toks_len>
   119c7:	0f 8e 08 05 00 00    	jle    11ed5 <PARSE+0x11e0>
   119cd:	48 8b 15 24 92 00 00 	mov    rdx,QWORD PTR [rip+0x9224]        # 1abf8 <toks>
   119d4:	48 63 c3             	movsxd rax,ebx
   119d7:	48 c1 e0 04          	shl    rax,0x4
   119db:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   119e0:	0f 85 ef 04 00 00    	jne    11ed5 <PARSE+0x11e0>
   119e6:	eb 03                	jmp    119eb <PARSE+0xcf6>
   119e8:	83 c3 01             	add    ebx,0x1
   119eb:	48 63 c3             	movsxd rax,ebx
   119ee:	48 c1 e0 04          	shl    rax,0x4
   119f2:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   119f7:	74 ef                	je     119e8 <PARSE+0xcf3>
   119f9:	e9 d7 04 00 00       	jmp    11ed5 <PARSE+0x11e0>
   119fe:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x4
   11a05:	04 
   11a06:	83 c3 01             	add    ebx,0x1
   11a09:	39 1d e5 91 00 00    	cmp    DWORD PTR [rip+0x91e5],ebx        # 1abf4 <toks_len>
   11a0f:	0f 8e ec 00 00 00    	jle    11b01 <PARSE+0xe0c>
   11a15:	48 63 c3             	movsxd rax,ebx
   11a18:	48 c1 e0 04          	shl    rax,0x4
   11a1c:	48 03 05 d5 91 00 00 	add    rax,QWORD PTR [rip+0x91d5]        # 1abf8 <toks>
   11a23:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   11a26:	8d 4a e9             	lea    ecx,[rdx-0x17]
   11a29:	83 f9 01             	cmp    ecx,0x1
   11a2c:	0f 86 cf 00 00 00    	jbe    11b01 <PARSE+0xe0c>
   11a32:	83 fa 23             	cmp    edx,0x23
   11a35:	74 59                	je     11a90 <PARSE+0xd9b>
   11a37:	83 fa 01             	cmp    edx,0x1
   11a3a:	74 5c                	je     11a98 <PARSE+0xda3>
   11a3c:	83 fa 02             	cmp    edx,0x2
   11a3f:	0f 85 97 00 00 00    	jne    11adc <PARSE+0xde7>
   11a45:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11a48:	be 00 00 00 00       	mov    esi,0x0
   11a4d:	e8 ae 16 ff ff       	call   3100 <strtof@plt>
   11a52:	f3 0f 11 44 24 70    	movss  DWORD PTR [rsp+0x70],xmm0
   11a58:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   11a5d:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   11a64:	00 
   11a65:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   11a6c:	00 
   11a6d:	41 b8 04 00 00 00    	mov    r8d,0x4
   11a73:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11a7a:	00 
   11a7b:	e8 c9 2a 00 00       	call   14549 <append>
   11a80:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11a87:	00 
   11a88:	83 c3 01             	add    ebx,0x1
   11a8b:	e9 79 ff ff ff       	jmp    11a09 <PARSE+0xd14>
   11a90:	83 c3 01             	add    ebx,0x1
   11a93:	e9 71 ff ff ff       	jmp    11a09 <PARSE+0xd14>
   11a98:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11a9b:	e8 c0 28 00 00       	call   14360 <eval_expr>
   11aa0:	89 44 24 70          	mov    DWORD PTR [rsp+0x70],eax
   11aa4:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   11aa9:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   11ab0:	00 
   11ab1:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   11ab8:	00 
   11ab9:	41 b8 04 00 00 00    	mov    r8d,0x4
   11abf:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11ac6:	00 
   11ac7:	e8 7d 2a 00 00       	call   14549 <append>
   11acc:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11ad3:	00 
   11ad4:	83 c3 01             	add    ebx,0x1
   11ad7:	e9 2d ff ff ff       	jmp    11a09 <PARSE+0xd14>
   11adc:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
   11adf:	48 8d 35 c2 50 00 00 	lea    rsi,[rip+0x50c2]        # 16ba8 <_IO_stdin_used+0x1ba8>
   11ae6:	48 8b 3d f3 90 00 00 	mov    rdi,QWORD PTR [rip+0x90f3]        # 1abe0 <stderr@GLIBC_2.2.5>
   11aed:	b8 00 00 00 00       	mov    eax,0x0
   11af2:	e8 49 16 ff ff       	call   3140 <fprintf@plt>
   11af7:	bf 01 00 00 00       	mov    edi,0x1
   11afc:	e8 cf 16 ff ff       	call   31d0 <exit@plt>
   11b01:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   11b08:	00 
   11b09:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   11b0f:	48 8b 15 f2 94 00 00 	mov    rdx,QWORD PTR [rip+0x94f2]        # 1b008 <ast>
   11b16:	48 8d 35 e3 94 00 00 	lea    rsi,[rip+0x94e3]        # 1b000 <ast_cap>
   11b1d:	48 8d 3d e0 94 00 00 	lea    rdi,[rip+0x94e0]        # 1b004 <ast_len>
   11b24:	e8 20 2a 00 00       	call   14549 <append>
   11b29:	48 89 05 d8 94 00 00 	mov    QWORD PTR [rip+0x94d8],rax        # 1b008 <ast>
   11b30:	39 1d be 90 00 00    	cmp    DWORD PTR [rip+0x90be],ebx        # 1abf4 <toks_len>
   11b36:	0f 8e 99 03 00 00    	jle    11ed5 <PARSE+0x11e0>
   11b3c:	48 8b 15 b5 90 00 00 	mov    rdx,QWORD PTR [rip+0x90b5]        # 1abf8 <toks>
   11b43:	48 63 c3             	movsxd rax,ebx
   11b46:	48 c1 e0 04          	shl    rax,0x4
   11b4a:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11b4f:	0f 85 80 03 00 00    	jne    11ed5 <PARSE+0x11e0>
   11b55:	eb 03                	jmp    11b5a <PARSE+0xe65>
   11b57:	83 c3 01             	add    ebx,0x1
   11b5a:	48 63 c3             	movsxd rax,ebx
   11b5d:	48 c1 e0 04          	shl    rax,0x4
   11b61:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11b66:	74 ef                	je     11b57 <PARSE+0xe62>
   11b68:	e9 68 03 00 00       	jmp    11ed5 <PARSE+0x11e0>
   11b6d:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x5
   11b74:	05 
   11b75:	83 c3 01             	add    ebx,0x1
   11b78:	39 1d 76 90 00 00    	cmp    DWORD PTR [rip+0x9076],ebx        # 1abf4 <toks_len>
   11b7e:	0f 8e ce 01 00 00    	jle    11d52 <PARSE+0x105d>
   11b84:	48 8b 35 6d 90 00 00 	mov    rsi,QWORD PTR [rip+0x906d]        # 1abf8 <toks>
   11b8b:	48 63 d3             	movsxd rdx,ebx
   11b8e:	48 89 d0             	mov    rax,rdx
   11b91:	48 c1 e0 04          	shl    rax,0x4
   11b95:	48 01 f0             	add    rax,rsi
   11b98:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   11b9b:	83 f9 17             	cmp    ecx,0x17
   11b9e:	0f 84 ae 01 00 00    	je     11d52 <PARSE+0x105d>
   11ba4:	83 f9 18             	cmp    ecx,0x18
   11ba7:	0f 84 a5 01 00 00    	je     11d52 <PARSE+0x105d>
   11bad:	83 f9 23             	cmp    ecx,0x23
   11bb0:	0f 84 83 00 00 00    	je     11c39 <PARSE+0xf44>
   11bb6:	83 f9 01             	cmp    ecx,0x1
   11bb9:	0f 85 82 00 00 00    	jne    11c41 <PARSE+0xf4c>
   11bbf:	48 83 c2 01          	add    rdx,0x1
   11bc3:	48 c1 e2 04          	shl    rdx,0x4
   11bc7:	8b 54 16 0c          	mov    edx,DWORD PTR [rsi+rdx*1+0xc]
   11bcb:	83 fa 23             	cmp    edx,0x23
   11bce:	40 0f 94 c6          	sete   sil
   11bd2:	83 fa 17             	cmp    edx,0x17
   11bd5:	40 0f 94 c7          	sete   dil
   11bd9:	40 08 fe             	or     sil,dil
   11bdc:	75 05                	jne    11be3 <PARSE+0xeee>
   11bde:	83 fa 18             	cmp    edx,0x18
   11be1:	75 5e                	jne    11c41 <PARSE+0xf4c>
   11be3:	66 0f ef c0          	pxor   xmm0,xmm0
   11be7:	0f 29 44 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm0
   11bec:	0f 29 84 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm0
   11bf3:	00 
   11bf4:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11bf7:	e8 64 27 00 00       	call   14360 <eval_expr>
   11bfc:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   11c01:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   11c06:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   11c0d:	00 
   11c0e:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   11c15:	00 
   11c16:	41 b8 20 00 00 00    	mov    r8d,0x20
   11c1c:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11c23:	00 
   11c24:	e8 20 29 00 00       	call   14549 <append>
   11c29:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11c30:	00 
   11c31:	83 c3 01             	add    ebx,0x1
   11c34:	e9 3f ff ff ff       	jmp    11b78 <PARSE+0xe83>
   11c39:	83 c3 01             	add    ebx,0x1
   11c3c:	e9 37 ff ff ff       	jmp    11b78 <PARSE+0xe83>
   11c41:	83 f9 28             	cmp    ecx,0x28
   11c44:	77 12                	ja     11c58 <PARSE+0xf63>
   11c46:	48 ba 1a 60 00 40 00 	movabs rdx,0x1004000601a
   11c4d:	01 00 00 
   11c50:	48 d3 ea             	shr    rdx,cl
   11c53:	f6 c2 01             	test   dl,0x1
   11c56:	75 25                	jne    11c7d <PARSE+0xf88>
   11c58:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
   11c5b:	48 8d 35 6e 4f 00 00 	lea    rsi,[rip+0x4f6e]        # 16bd0 <_IO_stdin_used+0x1bd0>
   11c62:	48 8b 3d 77 8f 00 00 	mov    rdi,QWORD PTR [rip+0x8f77]        # 1abe0 <stderr@GLIBC_2.2.5>
   11c69:	b8 00 00 00 00       	mov    eax,0x0
   11c6e:	e8 cd 14 ff ff       	call   3140 <fprintf@plt>
   11c73:	bf 01 00 00 00       	mov    edi,0x1
   11c78:	e8 53 15 ff ff       	call   31d0 <exit@plt>
   11c7d:	66 0f ef c0          	pxor   xmm0,xmm0
   11c81:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
   11c86:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
   11c8d:	00 00 
   11c8f:	39 1d 5f 8f 00 00    	cmp    DWORD PTR [rip+0x8f5f],ebx        # 1abf4 <toks_len>
   11c95:	7e 66                	jle    11cfd <PARSE+0x1008>
   11c97:	48 63 c3             	movsxd rax,ebx
   11c9a:	48 c1 e0 04          	shl    rax,0x4
   11c9e:	48 03 05 53 8f 00 00 	add    rax,QWORD PTR [rip+0x8f53]        # 1abf8 <toks>
   11ca5:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   11ca8:	83 fa 23             	cmp    edx,0x23
   11cab:	74 50                	je     11cfd <PARSE+0x1008>
   11cad:	83 fa 17             	cmp    edx,0x17
   11cb0:	74 4b                	je     11cfd <PARSE+0x1008>
   11cb2:	83 fa 18             	cmp    edx,0x18
   11cb5:	74 46                	je     11cfd <PARSE+0x1008>
   11cb7:	88 54 24 70          	mov    BYTE PTR [rsp+0x70],dl
   11cbb:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11cbe:	e8 2d 15 ff ff       	call   31f0 <strdup@plt>
   11cc3:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   11cc8:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   11ccd:	48 8d 74 24 64       	lea    rsi,[rsp+0x64]
   11cd2:	48 8d 7c 24 60       	lea    rdi,[rsp+0x60]
   11cd7:	41 b8 10 00 00 00    	mov    r8d,0x10
   11cdd:	48 8b 54 24 58       	mov    rdx,QWORD PTR [rsp+0x58]
   11ce2:	e8 62 28 00 00       	call   14549 <append>
   11ce7:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   11cec:	0f b6 44 24 50       	movzx  eax,BYTE PTR [rsp+0x50]
   11cf1:	83 c0 01             	add    eax,0x1
   11cf4:	88 44 24 50          	mov    BYTE PTR [rsp+0x50],al
   11cf8:	83 c3 01             	add    ebx,0x1
   11cfb:	eb 92                	jmp    11c8f <PARSE+0xf9a>
   11cfd:	c7 44 24 70 01 00 00 	mov    DWORD PTR [rsp+0x70],0x1
   11d04:	00 
   11d05:	66 0f 6f 4c 24 50    	movdqa xmm1,XMMWORD PTR [rsp+0x50]
   11d0b:	0f 11 4c 24 78       	movups XMMWORD PTR [rsp+0x78],xmm1
   11d10:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
   11d15:	48 89 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],rax
   11d1c:	00 
   11d1d:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   11d22:	48 8d b4 24 cc 00 00 	lea    rsi,[rsp+0xcc]
   11d29:	00 
   11d2a:	48 8d bc 24 c8 00 00 	lea    rdi,[rsp+0xc8]
   11d31:	00 
   11d32:	41 b8 20 00 00 00    	mov    r8d,0x20
   11d38:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   11d3f:	00 
   11d40:	e8 04 28 00 00       	call   14549 <append>
   11d45:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11d4c:	00 
   11d4d:	e9 26 fe ff ff       	jmp    11b78 <PARSE+0xe83>
   11d52:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   11d59:	00 
   11d5a:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   11d60:	48 8b 15 a1 92 00 00 	mov    rdx,QWORD PTR [rip+0x92a1]        # 1b008 <ast>
   11d67:	48 8d 35 92 92 00 00 	lea    rsi,[rip+0x9292]        # 1b000 <ast_cap>
   11d6e:	48 8d 3d 8f 92 00 00 	lea    rdi,[rip+0x928f]        # 1b004 <ast_len>
   11d75:	e8 cf 27 00 00       	call   14549 <append>
   11d7a:	48 89 05 87 92 00 00 	mov    QWORD PTR [rip+0x9287],rax        # 1b008 <ast>
   11d81:	39 1d 6d 8e 00 00    	cmp    DWORD PTR [rip+0x8e6d],ebx        # 1abf4 <toks_len>
   11d87:	0f 8e 48 01 00 00    	jle    11ed5 <PARSE+0x11e0>
   11d8d:	48 8b 15 64 8e 00 00 	mov    rdx,QWORD PTR [rip+0x8e64]        # 1abf8 <toks>
   11d94:	48 63 c3             	movsxd rax,ebx
   11d97:	48 c1 e0 04          	shl    rax,0x4
   11d9b:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11da0:	0f 85 2f 01 00 00    	jne    11ed5 <PARSE+0x11e0>
   11da6:	eb 03                	jmp    11dab <PARSE+0x10b6>
   11da8:	83 c3 01             	add    ebx,0x1
   11dab:	48 63 c3             	movsxd rax,ebx
   11dae:	48 c1 e0 04          	shl    rax,0x4
   11db2:	83 7c 02 0c 17       	cmp    DWORD PTR [rdx+rax*1+0xc],0x17
   11db7:	74 ef                	je     11da8 <PARSE+0x10b3>
   11db9:	e9 17 01 00 00       	jmp    11ed5 <PARSE+0x11e0>
   11dbe:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x6
   11dc5:	06 
   11dc6:	8d 43 01             	lea    eax,[rbx+0x1]
   11dc9:	48 98                	cdqe
   11dcb:	48 c1 e0 04          	shl    rax,0x4
   11dcf:	48 01 f0             	add    rax,rsi
   11dd2:	83 78 0c 01          	cmp    DWORD PTR [rax+0xc],0x1
   11dd6:	0f 85 68 01 00 00    	jne    11f44 <PARSE+0x124f>
   11ddc:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11ddf:	e8 7c 25 00 00       	call   14360 <eval_expr>
   11de4:	48 85 c0             	test   rax,rax
   11de7:	0f 88 7d 01 00 00    	js     11f6a <PARSE+0x1275>
   11ded:	0f 8e a1 01 00 00    	jle    11f94 <PARSE+0x129f>
   11df3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
   11df7:	48 85 c2             	test   rdx,rax
   11dfa:	0f 85 94 01 00 00    	jne    11f94 <PARSE+0x129f>
   11e00:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   11e07:	00 
   11e08:	8d 6b 02             	lea    ebp,[rbx+0x2]
   11e0b:	48 8b 05 e6 8d 00 00 	mov    rax,QWORD PTR [rip+0x8de6]        # 1abf8 <toks>
   11e12:	48 63 d5             	movsxd rdx,ebp
   11e15:	48 c1 e2 04          	shl    rdx,0x4
   11e19:	83 7c 10 0c 23       	cmp    DWORD PTR [rax+rdx*1+0xc],0x23
   11e1e:	0f 84 9a 01 00 00    	je     11fbe <PARSE+0x12c9>
   11e24:	48 63 d5             	movsxd rdx,ebp
   11e27:	48 c1 e2 04          	shl    rdx,0x4
   11e2b:	48 01 d0             	add    rax,rdx
   11e2e:	83 78 0c 01          	cmp    DWORD PTR [rax+0xc],0x1
   11e32:	0f 85 8e 01 00 00    	jne    11fc6 <PARSE+0x12d1>
   11e38:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   11e3b:	e8 20 25 00 00       	call   14360 <eval_expr>
   11e40:	48 85 c0             	test   rax,rax
   11e43:	0f 88 a7 01 00 00    	js     11ff0 <PARSE+0x12fb>
   11e49:	48 8d 90 80 00 00 00 	lea    rdx,[rax+0x80]
   11e50:	48 81 fa 7f 01 00 00 	cmp    rdx,0x17f
   11e57:	0f 87 93 01 00 00    	ja     11ff0 <PARSE+0x12fb>
   11e5d:	88 84 24 c8 00 00 00 	mov    BYTE PTR [rsp+0xc8],al
   11e64:	8d 5d 01             	lea    ebx,[rbp+0x1]
   11e67:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   11e6e:	00 
   11e6f:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   11e75:	48 8b 15 8c 91 00 00 	mov    rdx,QWORD PTR [rip+0x918c]        # 1b008 <ast>
   11e7c:	48 8d 35 7d 91 00 00 	lea    rsi,[rip+0x917d]        # 1b000 <ast_cap>
   11e83:	48 8d 3d 7a 91 00 00 	lea    rdi,[rip+0x917a]        # 1b004 <ast_len>
   11e8a:	e8 ba 26 00 00       	call   14549 <append>
   11e8f:	48 89 05 72 91 00 00 	mov    QWORD PTR [rip+0x9172],rax        # 1b008 <ast>
   11e96:	39 1d 58 8d 00 00    	cmp    DWORD PTR [rip+0x8d58],ebx        # 1abf4 <toks_len>
   11e9c:	7e 18                	jle    11eb6 <PARSE+0x11c1>
   11e9e:	48 63 c3             	movsxd rax,ebx
   11ea1:	48 c1 e0 04          	shl    rax,0x4
   11ea5:	48 03 05 4c 8d 00 00 	add    rax,QWORD PTR [rip+0x8d4c]        # 1abf8 <toks>
   11eac:	83 78 0c 17          	cmp    DWORD PTR [rax+0xc],0x17
   11eb0:	0f 84 64 01 00 00    	je     1201a <PARSE+0x1325>
   11eb6:	39 1d 38 8d 00 00    	cmp    DWORD PTR [rip+0x8d38],ebx        # 1abf4 <toks_len>
   11ebc:	7e 17                	jle    11ed5 <PARSE+0x11e0>
   11ebe:	48 63 c3             	movsxd rax,ebx
   11ec1:	48 c1 e0 04          	shl    rax,0x4
   11ec5:	48 03 05 2c 8d 00 00 	add    rax,QWORD PTR [rip+0x8d2c]        # 1abf8 <toks>
   11ecc:	83 78 0c 18          	cmp    DWORD PTR [rax+0xc],0x18
   11ed0:	74 03                	je     11ed5 <PARSE+0x11e0>
   11ed2:	83 c3 01             	add    ebx,0x1
   11ed5:	39 1d 19 8d 00 00    	cmp    DWORD PTR [rip+0x8d19],ebx        # 1abf4 <toks_len>
   11edb:	0f 8e ea 02 00 00    	jle    121cb <PARSE+0x14d6>
   11ee1:	48 8b 35 10 8d 00 00 	mov    rsi,QWORD PTR [rip+0x8d10]        # 1abf8 <toks>
   11ee8:	48 63 d3             	movsxd rdx,ebx
   11eeb:	48 89 d5             	mov    rbp,rdx
   11eee:	48 c1 e5 04          	shl    rbp,0x4
   11ef2:	48 01 f5             	add    rbp,rsi
   11ef5:	83 7d 0c 18          	cmp    DWORD PTR [rbp+0xc],0x18
   11ef9:	0f 84 cc 02 00 00    	je     121cb <PARSE+0x14d6>
   11eff:	48 8d bc 24 b0 00 00 	lea    rdi,[rsp+0xb0]
   11f06:	00 
   11f07:	b9 37 00 00 00       	mov    ecx,0x37
   11f0c:	b8 00 00 00 00       	mov    eax,0x0
   11f11:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
   11f14:	44 8b 65 08          	mov    r12d,DWORD PTR [rbp+0x8]
   11f18:	66 44 89 a4 24 ba 00 	mov    WORD PTR [rsp+0xba],r12w
   11f1f:	00 00 
   11f21:	8b 45 0c             	mov    eax,DWORD PTR [rbp+0xc]
   11f24:	83 f8 17             	cmp    eax,0x17
   11f27:	74 8d                	je     11eb6 <PARSE+0x11c1>
   11f29:	83 f8 2a             	cmp    eax,0x2a
   11f2c:	0f 87 74 02 00 00    	ja     121a6 <PARSE+0x14b1>
   11f32:	89 c1                	mov    ecx,eax
   11f34:	48 8d 3d 75 4e 00 00 	lea    rdi,[rip+0x4e75]        # 16db0 <_IO_stdin_used+0x1db0>
   11f3b:	48 63 0c 8f          	movsxd rcx,DWORD PTR [rdi+rcx*4]
   11f3f:	48 01 f9             	add    rcx,rdi
   11f42:	ff e1                	jmp    rcx
   11f44:	41 0f b7 d4          	movzx  edx,r12w
   11f48:	48 8d 35 a9 4c 00 00 	lea    rsi,[rip+0x4ca9]        # 16bf8 <_IO_stdin_used+0x1bf8>
   11f4f:	48 8b 3d 8a 8c 00 00 	mov    rdi,QWORD PTR [rip+0x8c8a]        # 1abe0 <stderr@GLIBC_2.2.5>
   11f56:	b8 00 00 00 00       	mov    eax,0x0
   11f5b:	e8 e0 11 ff ff       	call   3140 <fprintf@plt>
   11f60:	bf 01 00 00 00       	mov    edi,0x1
   11f65:	e8 66 12 ff ff       	call   31d0 <exit@plt>
   11f6a:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   11f71:	00 
   11f72:	48 8d 35 af 4c 00 00 	lea    rsi,[rip+0x4caf]        # 16c28 <_IO_stdin_used+0x1c28>
   11f79:	48 8b 3d 60 8c 00 00 	mov    rdi,QWORD PTR [rip+0x8c60]        # 1abe0 <stderr@GLIBC_2.2.5>
   11f80:	b8 00 00 00 00       	mov    eax,0x0
   11f85:	e8 b6 11 ff ff       	call   3140 <fprintf@plt>
   11f8a:	bf 01 00 00 00       	mov    edi,0x1
   11f8f:	e8 3c 12 ff ff       	call   31d0 <exit@plt>
   11f94:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   11f9b:	00 
   11f9c:	48 8d 35 ad 4c 00 00 	lea    rsi,[rip+0x4cad]        # 16c50 <_IO_stdin_used+0x1c50>
   11fa3:	48 8b 3d 36 8c 00 00 	mov    rdi,QWORD PTR [rip+0x8c36]        # 1abe0 <stderr@GLIBC_2.2.5>
   11faa:	b8 00 00 00 00       	mov    eax,0x0
   11faf:	e8 8c 11 ff ff       	call   3140 <fprintf@plt>
   11fb4:	bf 01 00 00 00       	mov    edi,0x1
   11fb9:	e8 12 12 ff ff       	call   31d0 <exit@plt>
   11fbe:	8d 6b 03             	lea    ebp,[rbx+0x3]
   11fc1:	e9 5e fe ff ff       	jmp    11e24 <PARSE+0x112f>
   11fc6:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   11fcd:	00 
   11fce:	48 8d 35 ab 4c 00 00 	lea    rsi,[rip+0x4cab]        # 16c80 <_IO_stdin_used+0x1c80>
   11fd5:	48 8b 3d 04 8c 00 00 	mov    rdi,QWORD PTR [rip+0x8c04]        # 1abe0 <stderr@GLIBC_2.2.5>
   11fdc:	b8 00 00 00 00       	mov    eax,0x0
   11fe1:	e8 5a 11 ff ff       	call   3140 <fprintf@plt>
   11fe6:	bf 01 00 00 00       	mov    edi,0x1
   11feb:	e8 e0 11 ff ff       	call   31d0 <exit@plt>
   11ff0:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   11ff7:	00 
   11ff8:	48 8d 35 c1 4c 00 00 	lea    rsi,[rip+0x4cc1]        # 16cc0 <_IO_stdin_used+0x1cc0>
   11fff:	48 8b 3d da 8b 00 00 	mov    rdi,QWORD PTR [rip+0x8bda]        # 1abe0 <stderr@GLIBC_2.2.5>
   12006:	b8 00 00 00 00       	mov    eax,0x0
   1200b:	e8 30 11 ff ff       	call   3140 <fprintf@plt>
   12010:	bf 01 00 00 00       	mov    edi,0x1
   12015:	e8 b6 11 ff ff       	call   31d0 <exit@plt>
   1201a:	8d 5d 02             	lea    ebx,[rbp+0x2]
   1201d:	e9 94 fe ff ff       	jmp    11eb6 <PARSE+0x11c1>
   12022:	c6 84 24 b0 00 00 00 	mov    BYTE PTR [rsp+0xb0],0x10
   12029:	10 
   1202a:	48 8d 6a 01          	lea    rbp,[rdx+0x1]
   1202e:	48 c1 e5 04          	shl    rbp,0x4
   12032:	48 01 ee             	add    rsi,rbp
   12035:	83 7e 0c 01          	cmp    DWORD PTR [rsi+0xc],0x1
   12039:	75 53                	jne    1208e <PARSE+0x1399>
   1203b:	48 8b 3e             	mov    rdi,QWORD PTR [rsi]
   1203e:	e8 1d 23 00 00       	call   14360 <eval_expr>
   12043:	48 85 c0             	test   rax,rax
   12046:	0f 88 ae 00 00 00    	js     120fa <PARSE+0x1405>
   1204c:	48 8b 15 a5 8b 00 00 	mov    rdx,QWORD PTR [rip+0x8ba5]        # 1abf8 <toks>
   12053:	48 8b 54 2a f0       	mov    rdx,QWORD PTR [rdx+rbp*1-0x10]
   12058:	0f b6 52 03          	movzx  edx,BYTE PTR [rdx+0x3]
   1205c:	80 fa 71             	cmp    dl,0x71
   1205f:	0f 84 2e 01 00 00    	je     12193 <PARSE+0x149e>
   12065:	0f 8f b9 00 00 00    	jg     12124 <PARSE+0x142f>
   1206b:	80 fa 62             	cmp    dl,0x62
   1206e:	0f 84 c2 00 00 00    	je     12136 <PARSE+0x1441>
   12074:	80 fa 64             	cmp    dl,0x64
   12077:	0f 85 c1 00 00 00    	jne    1213e <PARSE+0x1449>
   1207d:	48 c1 e0 02          	shl    rax,0x2
   12081:	48 01 84 24 c0 00 00 	add    QWORD PTR [rsp+0xc0],rax
   12088:	00 
   12089:	e9 b0 00 00 00       	jmp    1213e <PARSE+0x1449>
   1208e:	83 f8 26             	cmp    eax,0x26
   12091:	74 43                	je     120d6 <PARSE+0x13e1>
   12093:	7f 33                	jg     120c8 <PARSE+0x13d3>
   12095:	83 f8 24             	cmp    eax,0x24
   12098:	74 45                	je     120df <PARSE+0x13ea>
   1209a:	83 f8 25             	cmp    eax,0x25
   1209d:	75 49                	jne    120e8 <PARSE+0x13f3>
   1209f:	48 8d 15 6d 3f 00 00 	lea    rdx,[rip+0x3f6d]        # 16013 <_IO_stdin_used+0x1013>
   120a6:	48 8d 35 3b 4c 00 00 	lea    rsi,[rip+0x4c3b]        # 16ce8 <_IO_stdin_used+0x1ce8>
   120ad:	48 8b 3d 2c 8b 00 00 	mov    rdi,QWORD PTR [rip+0x8b2c]        # 1abe0 <stderr@GLIBC_2.2.5>
   120b4:	b8 00 00 00 00       	mov    eax,0x0
   120b9:	e8 82 10 ff ff       	call   3140 <fprintf@plt>
   120be:	bf 01 00 00 00       	mov    edi,0x1
   120c3:	e8 08 11 ff ff       	call   31d0 <exit@plt>
   120c8:	83 f8 27             	cmp    eax,0x27
   120cb:	75 24                	jne    120f1 <PARSE+0x13fc>
   120cd:	48 8d 15 3b 49 00 00 	lea    rdx,[rip+0x493b]        # 16a0f <_IO_stdin_used+0x1a0f>
   120d4:	eb d0                	jmp    120a6 <PARSE+0x13b1>
   120d6:	48 8d 15 31 3f 00 00 	lea    rdx,[rip+0x3f31]        # 1600e <_IO_stdin_used+0x100e>
   120dd:	eb c7                	jmp    120a6 <PARSE+0x13b1>
   120df:	48 8d 15 1e 3f 00 00 	lea    rdx,[rip+0x3f1e]        # 16004 <_IO_stdin_used+0x1004>
   120e6:	eb be                	jmp    120a6 <PARSE+0x13b1>
   120e8:	48 8d 15 19 32 00 00 	lea    rdx,[rip+0x3219]        # 15308 <_IO_stdin_used+0x308>
   120ef:	eb b5                	jmp    120a6 <PARSE+0x13b1>
   120f1:	48 8d 15 10 32 00 00 	lea    rdx,[rip+0x3210]        # 15308 <_IO_stdin_used+0x308>
   120f8:	eb ac                	jmp    120a6 <PARSE+0x13b1>
   120fa:	0f b7 94 24 ba 00 00 	movzx  edx,WORD PTR [rsp+0xba]
   12101:	00 
   12102:	48 8d 35 1f 4c 00 00 	lea    rsi,[rip+0x4c1f]        # 16d28 <_IO_stdin_used+0x1d28>
   12109:	48 8b 3d d0 8a 00 00 	mov    rdi,QWORD PTR [rip+0x8ad0]        # 1abe0 <stderr@GLIBC_2.2.5>
   12110:	b8 00 00 00 00       	mov    eax,0x0
   12115:	e8 26 10 ff ff       	call   3140 <fprintf@plt>
   1211a:	bf 01 00 00 00       	mov    edi,0x1
   1211f:	e8 ac 10 ff ff       	call   31d0 <exit@plt>
   12124:	80 fa 77             	cmp    dl,0x77
   12127:	75 15                	jne    1213e <PARSE+0x1449>
   12129:	48 01 c0             	add    rax,rax
   1212c:	48 01 84 24 c0 00 00 	add    QWORD PTR [rsp+0xc0],rax
   12133:	00 
   12134:	eb 08                	jmp    1213e <PARSE+0x1449>
   12136:	48 01 84 24 c0 00 00 	add    QWORD PTR [rsp+0xc0],rax
   1213d:	00 
   1213e:	8d 6b 02             	lea    ebp,[rbx+0x2]
   12141:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   12148:	00 
   12149:	41 b8 b8 01 00 00    	mov    r8d,0x1b8
   1214f:	48 8b 15 b2 8e 00 00 	mov    rdx,QWORD PTR [rip+0x8eb2]        # 1b008 <ast>
   12156:	48 8d 35 a3 8e 00 00 	lea    rsi,[rip+0x8ea3]        # 1b000 <ast_cap>
   1215d:	48 8d 3d a0 8e 00 00 	lea    rdi,[rip+0x8ea0]        # 1b004 <ast_len>
   12164:	e8 e0 23 00 00       	call   14549 <append>
   12169:	48 89 05 98 8e 00 00 	mov    QWORD PTR [rip+0x8e98],rax        # 1b008 <ast>
   12170:	39 2d 7e 8a 00 00    	cmp    DWORD PTR [rip+0x8a7e],ebp        # 1abf4 <toks_len>
   12176:	7e 14                	jle    1218c <PARSE+0x1497>
   12178:	48 63 c5             	movsxd rax,ebp
   1217b:	48 c1 e0 04          	shl    rax,0x4
   1217f:	48 03 05 72 8a 00 00 	add    rax,QWORD PTR [rip+0x8a72]        # 1abf8 <toks>
   12186:	83 78 0c 17          	cmp    DWORD PTR [rax+0xc],0x17
   1218a:	74 15                	je     121a1 <PARSE+0x14ac>
   1218c:	89 eb                	mov    ebx,ebp
   1218e:	e9 42 fd ff ff       	jmp    11ed5 <PARSE+0x11e0>
   12193:	48 c1 e0 03          	shl    rax,0x3
   12197:	48 01 84 24 c0 00 00 	add    QWORD PTR [rsp+0xc0],rax
   1219e:	00 
   1219f:	eb 9d                	jmp    1213e <PARSE+0x1449>
   121a1:	8d 6b 03             	lea    ebp,[rbx+0x3]
   121a4:	eb e6                	jmp    1218c <PARSE+0x1497>
   121a6:	8b 55 08             	mov    edx,DWORD PTR [rbp+0x8]
   121a9:	48 8d 35 a0 4b 00 00 	lea    rsi,[rip+0x4ba0]        # 16d50 <_IO_stdin_used+0x1d50>
   121b0:	48 8b 3d 29 8a 00 00 	mov    rdi,QWORD PTR [rip+0x8a29]        # 1abe0 <stderr@GLIBC_2.2.5>
   121b7:	b8 00 00 00 00       	mov    eax,0x0
   121bc:	e8 7f 0f ff ff       	call   3140 <fprintf@plt>
   121c1:	bf 01 00 00 00       	mov    edi,0x1
   121c6:	e8 05 10 ff ff       	call   31d0 <exit@plt>
   121cb:	e8 9a bf ff ff       	call   e16a <del_all_toks>
   121d0:	48 8b 05 31 8e 00 00 	mov    rax,QWORD PTR [rip+0x8e31]        # 1b008 <ast>
   121d7:	48 81 c4 78 02 00 00 	add    rsp,0x278
   121de:	5b                   	pop    rbx
   121df:	5d                   	pop    rbp
   121e0:	41 5c                	pop    r12
   121e2:	41 5d                	pop    r13
   121e4:	c3                   	ret

00000000000121e5 <SkipComment>:
   121e5:	48 89 f8             	mov    rax,rdi
   121e8:	eb 04                	jmp    121ee <SkipComment+0x9>
   121ea:	48 83 c0 01          	add    rax,0x1
   121ee:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   121f1:	80 fa 20             	cmp    dl,0x20
   121f4:	74 f4                	je     121ea <SkipComment+0x5>
   121f6:	80 fa 09             	cmp    dl,0x9
   121f9:	74 ef                	je     121ea <SkipComment+0x5>
   121fb:	80 fa 3b             	cmp    dl,0x3b
   121fe:	74 17                	je     12217 <SkipComment+0x32>
   12200:	80 fa 2f             	cmp    dl,0x2f
   12203:	74 06                	je     1220b <SkipComment+0x26>
   12205:	80 38 2f             	cmp    BYTE PTR [rax],0x2f
   12208:	74 1b                	je     12225 <SkipComment+0x40>
   1220a:	c3                   	ret
   1220b:	80 78 01 2f          	cmp    BYTE PTR [rax+0x1],0x2f
   1220f:	75 f4                	jne    12205 <SkipComment+0x20>
   12211:	eb 04                	jmp    12217 <SkipComment+0x32>
   12213:	48 83 c0 01          	add    rax,0x1
   12217:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1221a:	84 d2                	test   dl,dl
   1221c:	74 e7                	je     12205 <SkipComment+0x20>
   1221e:	80 fa 0a             	cmp    dl,0xa
   12221:	75 f0                	jne    12213 <SkipComment+0x2e>
   12223:	eb e0                	jmp    12205 <SkipComment+0x20>
   12225:	80 78 01 2a          	cmp    BYTE PTR [rax+0x1],0x2a
   12229:	75 df                	jne    1220a <SkipComment+0x25>
   1222b:	48 83 c0 02          	add    rax,0x2
   1222f:	eb 04                	jmp    12235 <SkipComment+0x50>
   12231:	48 83 c0 01          	add    rax,0x1
   12235:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   12238:	84 d2                	test   dl,dl
   1223a:	74 19                	je     12255 <SkipComment+0x70>
   1223c:	80 fa 2a             	cmp    dl,0x2a
   1223f:	74 0e                	je     1224f <SkipComment+0x6a>
   12241:	80 fa 0a             	cmp    dl,0xa
   12244:	75 eb                	jne    12231 <SkipComment+0x4c>
   12246:	8b 0e                	mov    ecx,DWORD PTR [rsi]
   12248:	8d 51 01             	lea    edx,[rcx+0x1]
   1224b:	89 16                	mov    DWORD PTR [rsi],edx
   1224d:	eb e2                	jmp    12231 <SkipComment+0x4c>
   1224f:	80 78 01 2f          	cmp    BYTE PTR [rax+0x1],0x2f
   12253:	75 ec                	jne    12241 <SkipComment+0x5c>
   12255:	84 d2                	test   dl,dl
   12257:	74 06                	je     1225f <SkipComment+0x7a>
   12259:	48 83 c0 02          	add    rax,0x2
   1225d:	eb ab                	jmp    1220a <SkipComment+0x25>
   1225f:	48 83 ec 08          	sub    rsp,0x8
   12263:	8b 16                	mov    edx,DWORD PTR [rsi]
   12265:	48 8d 35 f4 4b 00 00 	lea    rsi,[rip+0x4bf4]        # 16e60 <_IO_stdin_used+0x1e60>
   1226c:	48 8b 3d 6d 89 00 00 	mov    rdi,QWORD PTR [rip+0x896d]        # 1abe0 <stderr@GLIBC_2.2.5>
   12273:	b8 00 00 00 00       	mov    eax,0x0
   12278:	e8 c3 0e ff ff       	call   3140 <fprintf@plt>
   1227d:	bf 01 00 00 00       	mov    edi,0x1
   12282:	e8 49 0f ff ff       	call   31d0 <exit@plt>

0000000000012287 <ParseMacroName>:
   12287:	48 89 f8             	mov    rax,rdi
   1228a:	bf 00 00 00 00       	mov    edi,0x0
   1228f:	eb 24                	jmp    122b5 <ParseMacroName+0x2e>
   12291:	48 83 c0 01          	add    rax,0x1
   12295:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   12298:	80 f9 20             	cmp    cl,0x20
   1229b:	74 f4                	je     12291 <ParseMacroName+0xa>
   1229d:	80 f9 09             	cmp    cl,0x9
   122a0:	74 ef                	je     12291 <ParseMacroName+0xa>
   122a2:	48 85 f6             	test   rsi,rsi
   122a5:	74 07                	je     122ae <ParseMacroName+0x27>
   122a7:	4c 63 c7             	movsxd r8,edi
   122aa:	42 88 0c 06          	mov    BYTE PTR [rsi+r8*1],cl
   122ae:	48 83 c0 01          	add    rax,0x1
   122b2:	83 c7 01             	add    edi,0x1
   122b5:	83 ff 3e             	cmp    edi,0x3e
   122b8:	7f 1f                	jg     122d9 <ParseMacroName+0x52>
   122ba:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   122bd:	84 c9                	test   cl,cl
   122bf:	74 18                	je     122d9 <ParseMacroName+0x52>
   122c1:	80 f9 28             	cmp    cl,0x28
   122c4:	77 cf                	ja     12295 <ParseMacroName+0xe>
   122c6:	49 b8 00 04 00 00 01 	movabs r8,0x10100000400
   122cd:	01 00 00 
   122d0:	49 d3 e8             	shr    r8,cl
   122d3:	41 f6 c0 01          	test   r8b,0x1
   122d7:	74 bc                	je     12295 <ParseMacroName+0xe>
   122d9:	48 85 f6             	test   rsi,rsi
   122dc:	74 38                	je     12316 <ParseMacroName+0x8f>
   122de:	48 63 ff             	movsxd rdi,edi
   122e1:	c6 04 3e 00          	mov    BYTE PTR [rsi+rdi*1],0x0
   122e5:	80 3e 00             	cmp    BYTE PTR [rsi],0x0
   122e8:	75 2c                	jne    12316 <ParseMacroName+0x8f>
   122ea:	48 83 ec 08          	sub    rsp,0x8
   122ee:	8b 12                	mov    edx,DWORD PTR [rdx]
   122f0:	48 8d 35 91 4b 00 00 	lea    rsi,[rip+0x4b91]        # 16e88 <_IO_stdin_used+0x1e88>
   122f7:	48 8b 3d e2 88 00 00 	mov    rdi,QWORD PTR [rip+0x88e2]        # 1abe0 <stderr@GLIBC_2.2.5>
   122fe:	b8 00 00 00 00       	mov    eax,0x0
   12303:	e8 38 0e ff ff       	call   3140 <fprintf@plt>
   12308:	bf 01 00 00 00       	mov    edi,0x1
   1230d:	e8 be 0e ff ff       	call   31d0 <exit@plt>
   12312:	48 83 c0 01          	add    rax,0x1
   12316:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   12319:	80 f9 20             	cmp    cl,0x20
   1231c:	74 f4                	je     12312 <ParseMacroName+0x8b>
   1231e:	80 f9 09             	cmp    cl,0x9
   12321:	74 ef                	je     12312 <ParseMacroName+0x8b>
   12323:	eb 0b                	jmp    12330 <ParseMacroName+0xa9>
   12325:	48 83 c0 01          	add    rax,0x1
   12329:	8b 32                	mov    esi,DWORD PTR [rdx]
   1232b:	8d 4e 01             	lea    ecx,[rsi+0x1]
   1232e:	89 0a                	mov    DWORD PTR [rdx],ecx
   12330:	80 38 0a             	cmp    BYTE PTR [rax],0xa
   12333:	74 f0                	je     12325 <ParseMacroName+0x9e>
   12335:	eb 04                	jmp    1233b <ParseMacroName+0xb4>
   12337:	48 83 c0 01          	add    rax,0x1
   1233b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1233e:	80 fa 20             	cmp    dl,0x20
   12341:	74 f4                	je     12337 <ParseMacroName+0xb0>
   12343:	80 fa 09             	cmp    dl,0x9
   12346:	74 ef                	je     12337 <ParseMacroName+0xb0>
   12348:	c3                   	ret

0000000000012349 <ParseArgs>:
   12349:	41 55                	push   r13
   1234b:	41 54                	push   r12
   1234d:	55                   	push   rbp
   1234e:	53                   	push   rbx
   1234f:	48 83 ec 48          	sub    rsp,0x48
   12353:	49 89 d4             	mov    r12,rdx
   12356:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
   1235d:	00 
   1235e:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
   12365:	00 00 
   12367:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
   1236e:	00 00 
   12370:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
   12377:	00 00 
   12379:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   12380:	00 00 
   12382:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
   12389:	00 00 
   1238b:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
   12392:	00 00 
   12394:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   1239b:	00 00 
   1239d:	80 3f 28             	cmp    BYTE PTR [rdi],0x28
   123a0:	0f 85 e4 01 00 00    	jne    1258a <ParseArgs+0x241>
   123a6:	49 89 f5             	mov    r13,rsi
   123a9:	48 8d 5f 01          	lea    rbx,[rdi+0x1]
   123ad:	eb 04                	jmp    123b3 <ParseArgs+0x6a>
   123af:	48 83 c3 01          	add    rbx,0x1
   123b3:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   123b6:	3c 20                	cmp    al,0x20
   123b8:	74 f5                	je     123af <ParseArgs+0x66>
   123ba:	3c 09                	cmp    al,0x9
   123bc:	74 f1                	je     123af <ParseArgs+0x66>
   123be:	eb 0f                	jmp    123cf <ParseArgs+0x86>
   123c0:	48 83 c3 01          	add    rbx,0x1
   123c4:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   123c8:	83 c0 01             	add    eax,0x1
   123cb:	41 89 04 24          	mov    DWORD PTR [r12],eax
   123cf:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   123d2:	74 ec                	je     123c0 <ParseArgs+0x77>
   123d4:	eb 04                	jmp    123da <ParseArgs+0x91>
   123d6:	48 83 c3 01          	add    rbx,0x1
   123da:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   123dd:	3c 20                	cmp    al,0x20
   123df:	74 f5                	je     123d6 <ParseArgs+0x8d>
   123e1:	3c 09                	cmp    al,0x9
   123e3:	74 f1                	je     123d6 <ParseArgs+0x8d>
   123e5:	e9 f0 00 00 00       	jmp    124da <ParseArgs+0x191>
   123ea:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   123ee:	48 8d 35 b3 4a 00 00 	lea    rsi,[rip+0x4ab3]        # 16ea8 <_IO_stdin_used+0x1ea8>
   123f5:	48 8b 3d e4 87 00 00 	mov    rdi,QWORD PTR [rip+0x87e4]        # 1abe0 <stderr@GLIBC_2.2.5>
   123fc:	e8 3f 0d ff ff       	call   3140 <fprintf@plt>
   12401:	bf 01 00 00 00       	mov    edi,0x1
   12406:	e8 c5 0d ff ff       	call   31d0 <exit@plt>
   1240b:	80 f9 7b             	cmp    cl,0x7b
   1240e:	74 50                	je     12460 <ParseArgs+0x117>
   12410:	0f be f1             	movsx  esi,cl
   12413:	48 8b 3d 16 7d 00 00 	mov    rdi,QWORD PTR [rip+0x7d16]        # 1a130 <LETEXT>
   1241a:	e8 61 13 00 00       	call   13780 <isin>
   1241f:	85 c0                	test   eax,eax
   12421:	74 c7                	je     123ea <ParseArgs+0xa1>
   12423:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
   12426:	48 63 c5             	movsxd rax,ebp
   12429:	88 14 04             	mov    BYTE PTR [rsp+rax*1],dl
   1242c:	83 c5 01             	add    ebp,0x1
   1242f:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
   12433:	0f b6 0b             	movzx  ecx,BYTE PTR [rbx]
   12436:	84 c9                	test   cl,cl
   12438:	0f 95 c2             	setne  dl
   1243b:	80 f9 29             	cmp    cl,0x29
   1243e:	0f 95 c0             	setne  al
   12441:	84 c2                	test   dl,al
   12443:	74 1b                	je     12460 <ParseArgs+0x117>
   12445:	80 f9 2c             	cmp    cl,0x2c
   12448:	7f c1                	jg     1240b <ParseArgs+0xc2>
   1244a:	80 f9 0a             	cmp    cl,0xa
   1244d:	7c c1                	jl     12410 <ParseArgs+0xc7>
   1244f:	48 b8 00 04 00 00 01 	movabs rax,0x100100000400
   12456:	10 00 00 
   12459:	48 d3 e8             	shr    rax,cl
   1245c:	a8 01                	test   al,0x1
   1245e:	74 b0                	je     12410 <ParseArgs+0xc7>
   12460:	80 f9 2c             	cmp    cl,0x2c
   12463:	75 31                	jne    12496 <ParseArgs+0x14d>
   12465:	48 83 c3 01          	add    rbx,0x1
   12469:	eb 04                	jmp    1246f <ParseArgs+0x126>
   1246b:	48 83 c3 01          	add    rbx,0x1
   1246f:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12472:	3c 20                	cmp    al,0x20
   12474:	74 f5                	je     1246b <ParseArgs+0x122>
   12476:	3c 09                	cmp    al,0x9
   12478:	74 f1                	je     1246b <ParseArgs+0x122>
   1247a:	eb 0f                	jmp    1248b <ParseArgs+0x142>
   1247c:	48 83 c3 01          	add    rbx,0x1
   12480:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   12484:	83 c0 01             	add    eax,0x1
   12487:	41 89 04 24          	mov    DWORD PTR [r12],eax
   1248b:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   1248e:	74 ec                	je     1247c <ParseArgs+0x133>
   12490:	eb 04                	jmp    12496 <ParseArgs+0x14d>
   12492:	48 83 c3 01          	add    rbx,0x1
   12496:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12499:	3c 20                	cmp    al,0x20
   1249b:	74 f5                	je     12492 <ParseArgs+0x149>
   1249d:	3c 09                	cmp    al,0x9
   1249f:	74 f1                	je     12492 <ParseArgs+0x149>
   124a1:	eb 0f                	jmp    124b2 <ParseArgs+0x169>
   124a3:	48 83 c3 01          	add    rbx,0x1
   124a7:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   124ab:	83 c0 01             	add    eax,0x1
   124ae:	41 89 04 24          	mov    DWORD PTR [r12],eax
   124b2:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   124b5:	74 ec                	je     124a3 <ParseArgs+0x15a>
   124b7:	eb 04                	jmp    124bd <ParseArgs+0x174>
   124b9:	48 83 c3 01          	add    rbx,0x1
   124bd:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   124c0:	3c 20                	cmp    al,0x20
   124c2:	74 f5                	je     124b9 <ParseArgs+0x170>
   124c4:	3c 09                	cmp    al,0x9
   124c6:	74 f1                	je     124b9 <ParseArgs+0x170>
   124c8:	48 63 ed             	movsxd rbp,ebp
   124cb:	c6 04 2c 00          	mov    BYTE PTR [rsp+rbp*1],0x0
   124cf:	4d 85 ed             	test   r13,r13
   124d2:	74 06                	je     124da <ParseArgs+0x191>
   124d4:	80 3c 24 00          	cmp    BYTE PTR [rsp],0x0
   124d8:	75 15                	jne    124ef <ParseArgs+0x1a6>
   124da:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   124dd:	3c 29                	cmp    al,0x29
   124df:	74 34                	je     12515 <ParseArgs+0x1cc>
   124e1:	3c 7b                	cmp    al,0x7b
   124e3:	74 30                	je     12515 <ParseArgs+0x1cc>
   124e5:	bd 00 00 00 00       	mov    ebp,0x0
   124ea:	e9 44 ff ff ff       	jmp    12433 <ParseArgs+0xea>
   124ef:	48 89 e1             	mov    rcx,rsp
   124f2:	49 8b 95 80 00 00 00 	mov    rdx,QWORD PTR [r13+0x80]
   124f9:	49 8d b5 8c 00 00 00 	lea    rsi,[r13+0x8c]
   12500:	49 8d bd 88 00 00 00 	lea    rdi,[r13+0x88]
   12507:	e8 b9 20 00 00       	call   145c5 <TwoDappend>
   1250c:	49 89 85 80 00 00 00 	mov    QWORD PTR [r13+0x80],rax
   12513:	eb c5                	jmp    124da <ParseArgs+0x191>
   12515:	3c 29                	cmp    al,0x29
   12517:	75 4b                	jne    12564 <ParseArgs+0x21b>
   12519:	48 8d 43 01          	lea    rax,[rbx+0x1]
   1251d:	eb 04                	jmp    12523 <ParseArgs+0x1da>
   1251f:	48 83 c0 01          	add    rax,0x1
   12523:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   12526:	80 fa 20             	cmp    dl,0x20
   12529:	74 f4                	je     1251f <ParseArgs+0x1d6>
   1252b:	80 fa 09             	cmp    dl,0x9
   1252e:	74 ef                	je     1251f <ParseArgs+0x1d6>
   12530:	eb 0f                	jmp    12541 <ParseArgs+0x1f8>
   12532:	48 83 c0 01          	add    rax,0x1
   12536:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
   1253a:	8d 57 01             	lea    edx,[rdi+0x1]
   1253d:	41 89 14 24          	mov    DWORD PTR [r12],edx
   12541:	80 38 0a             	cmp    BYTE PTR [rax],0xa
   12544:	74 ec                	je     12532 <ParseArgs+0x1e9>
   12546:	eb 04                	jmp    1254c <ParseArgs+0x203>
   12548:	48 83 c0 01          	add    rax,0x1
   1254c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1254f:	80 fa 20             	cmp    dl,0x20
   12552:	74 f4                	je     12548 <ParseArgs+0x1ff>
   12554:	80 fa 09             	cmp    dl,0x9
   12557:	74 ef                	je     12548 <ParseArgs+0x1ff>
   12559:	48 83 c4 48          	add    rsp,0x48
   1255d:	5b                   	pop    rbx
   1255e:	5d                   	pop    rbp
   1255f:	41 5c                	pop    r12
   12561:	41 5d                	pop    r13
   12563:	c3                   	ret
   12564:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   12568:	48 8d 35 6f 49 00 00 	lea    rsi,[rip+0x496f]        # 16ede <_IO_stdin_used+0x1ede>
   1256f:	48 8b 3d 6a 86 00 00 	mov    rdi,QWORD PTR [rip+0x866a]        # 1abe0 <stderr@GLIBC_2.2.5>
   12576:	b8 00 00 00 00       	mov    eax,0x0
   1257b:	e8 c0 0b ff ff       	call   3140 <fprintf@plt>
   12580:	bf 01 00 00 00       	mov    edi,0x1
   12585:	e8 46 0c ff ff       	call   31d0 <exit@plt>
   1258a:	8b 12                	mov    edx,DWORD PTR [rdx]
   1258c:	48 8d 35 64 49 00 00 	lea    rsi,[rip+0x4964]        # 16ef7 <_IO_stdin_used+0x1ef7>
   12593:	48 8b 3d 46 86 00 00 	mov    rdi,QWORD PTR [rip+0x8646]        # 1abe0 <stderr@GLIBC_2.2.5>
   1259a:	b8 00 00 00 00       	mov    eax,0x0
   1259f:	e8 9c 0b ff ff       	call   3140 <fprintf@plt>
   125a4:	bf 01 00 00 00       	mov    edi,0x1
   125a9:	e8 22 0c ff ff       	call   31d0 <exit@plt>

00000000000125ae <ParseArgsOfCalledMacro>:
   125ae:	41 57                	push   r15
   125b0:	41 56                	push   r14
   125b2:	41 55                	push   r13
   125b4:	41 54                	push   r12
   125b6:	55                   	push   rbp
   125b7:	53                   	push   rbx
   125b8:	48 81 ec 18 01 00 00 	sub    rsp,0x118
   125bf:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
   125c4:	49 89 d7             	mov    r15,rdx
   125c7:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
   125ce:	00 00 
   125d0:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
   125d7:	00 00 
   125d9:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   125e0:	00 00 
   125e2:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
   125e9:	00 00 
   125eb:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
   125f2:	00 00 
   125f4:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   125fb:	00 00 
   125fd:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   12604:	00 00 
   12606:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   1260d:	00 00 
   1260f:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   12616:	00 00 
   12618:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   1261f:	00 00 
   12621:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
   12628:	00 00 
   1262a:	48 c7 44 24 68 00 00 	mov    QWORD PTR [rsp+0x68],0x0
   12631:	00 00 
   12633:	48 c7 44 24 70 00 00 	mov    QWORD PTR [rsp+0x70],0x0
   1263a:	00 00 
   1263c:	48 c7 44 24 78 00 00 	mov    QWORD PTR [rsp+0x78],0x0
   12643:	00 00 
   12645:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
   1264c:	00 00 00 00 00 
   12651:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
   12658:	00 00 00 00 00 
   1265d:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   12664:	00 00 00 00 00 
   12669:	48 c7 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],0x0
   12670:	00 00 00 00 00 
   12675:	48 c7 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],0x0
   1267c:	00 00 00 00 00 
   12681:	48 c7 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],0x0
   12688:	00 00 00 00 00 
   1268d:	48 c7 84 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],0x0
   12694:	00 00 00 00 00 
   12699:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x0
   126a0:	00 00 00 00 00 
   126a5:	48 c7 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],0x0
   126ac:	00 00 00 00 00 
   126b1:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x0
   126b8:	00 00 00 00 00 
   126bd:	48 c7 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],0x0
   126c4:	00 00 00 00 00 
   126c9:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x0
   126d0:	00 00 00 00 00 
   126d5:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
   126dc:	00 00 00 00 00 
   126e1:	48 c7 84 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
   126e8:	00 00 00 00 00 
   126ed:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
   126f4:	00 00 00 00 00 
   126f9:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
   12700:	00 00 00 00 00 
   12705:	48 c7 84 24 00 01 00 	mov    QWORD PTR [rsp+0x100],0x0
   1270c:	00 00 00 00 00 
   12711:	48 c7 84 24 08 01 00 	mov    QWORD PTR [rsp+0x108],0x0
   12718:	00 00 00 00 00 
   1271d:	80 3f 28             	cmp    BYTE PTR [rdi],0x28
   12720:	75 09                	jne    1272b <ParseArgsOfCalledMacro+0x17d>
   12722:	48 89 fb             	mov    rbx,rdi
   12725:	48 83 c3 01          	add    rbx,0x1
   12729:	eb 28                	jmp    12753 <ParseArgsOfCalledMacro+0x1a5>
   1272b:	8b 12                	mov    edx,DWORD PTR [rdx]
   1272d:	48 8d 35 c3 47 00 00 	lea    rsi,[rip+0x47c3]        # 16ef7 <_IO_stdin_used+0x1ef7>
   12734:	48 8b 3d a5 84 00 00 	mov    rdi,QWORD PTR [rip+0x84a5]        # 1abe0 <stderr@GLIBC_2.2.5>
   1273b:	b8 00 00 00 00       	mov    eax,0x0
   12740:	e8 fb 09 ff ff       	call   3140 <fprintf@plt>
   12745:	bf 01 00 00 00       	mov    edi,0x1
   1274a:	e8 81 0a ff ff       	call   31d0 <exit@plt>
   1274f:	48 83 c3 01          	add    rbx,0x1
   12753:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12756:	3c 20                	cmp    al,0x20
   12758:	74 f5                	je     1274f <ParseArgsOfCalledMacro+0x1a1>
   1275a:	3c 09                	cmp    al,0x9
   1275c:	74 f1                	je     1274f <ParseArgsOfCalledMacro+0x1a1>
   1275e:	eb 0d                	jmp    1276d <ParseArgsOfCalledMacro+0x1bf>
   12760:	48 83 c3 01          	add    rbx,0x1
   12764:	41 8b 07             	mov    eax,DWORD PTR [r15]
   12767:	83 c0 01             	add    eax,0x1
   1276a:	41 89 07             	mov    DWORD PTR [r15],eax
   1276d:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   12770:	74 ee                	je     12760 <ParseArgsOfCalledMacro+0x1b2>
   12772:	eb 04                	jmp    12778 <ParseArgsOfCalledMacro+0x1ca>
   12774:	48 83 c3 01          	add    rbx,0x1
   12778:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   1277b:	3c 20                	cmp    al,0x20
   1277d:	74 f5                	je     12774 <ParseArgsOfCalledMacro+0x1c6>
   1277f:	3c 09                	cmp    al,0x9
   12781:	74 f1                	je     12774 <ParseArgsOfCalledMacro+0x1c6>
   12783:	41 bc 00 00 00 00    	mov    r12d,0x0
   12789:	bd 00 00 00 00       	mov    ebp,0x0
   1278e:	41 be 00 00 00 00    	mov    r14d,0x0
   12794:	41 bd 00 00 00 00    	mov    r13d,0x0
   1279a:	e9 14 01 00 00       	jmp    128b3 <ParseArgsOfCalledMacro+0x305>
   1279f:	89 ee                	mov    esi,ebp
   127a1:	44 08 e6             	or     sil,r12b
   127a4:	0f 85 ba 00 00 00    	jne    12864 <ParseArgsOfCalledMacro+0x2b6>
   127aa:	45 85 ed             	test   r13d,r13d
   127ad:	0f 84 8e 01 00 00    	je     12941 <ParseArgsOfCalledMacro+0x393>
   127b3:	ba 00 00 00 00       	mov    edx,0x0
   127b8:	eb 5f                	jmp    12819 <ParseArgsOfCalledMacro+0x26b>
   127ba:	89 ee                	mov    esi,ebp
   127bc:	44 08 e6             	or     sil,r12b
   127bf:	74 63                	je     12824 <ParseArgsOfCalledMacro+0x276>
   127c1:	48 8d 7b 01          	lea    rdi,[rbx+0x1]
   127c5:	8d 4a 01             	lea    ecx,[rdx+0x1]
   127c8:	48 63 f2             	movsxd rsi,edx
   127cb:	88 44 34 10          	mov    BYTE PTR [rsp+rsi*1+0x10],al
   127cf:	0f b6 43 01          	movzx  eax,BYTE PTR [rbx+0x1]
   127d3:	84 c0                	test   al,al
   127d5:	74 10                	je     127e7 <ParseArgsOfCalledMacro+0x239>
   127d7:	48 83 c3 02          	add    rbx,0x2
   127db:	83 c2 02             	add    edx,0x2
   127de:	48 63 c9             	movsxd rcx,ecx
   127e1:	88 44 0c 10          	mov    BYTE PTR [rsp+rcx*1+0x10],al
   127e5:	eb 32                	jmp    12819 <ParseArgsOfCalledMacro+0x26b>
   127e7:	89 ca                	mov    edx,ecx
   127e9:	48 89 fb             	mov    rbx,rdi
   127ec:	eb 2b                	jmp    12819 <ParseArgsOfCalledMacro+0x26b>
   127ee:	45 84 e4             	test   r12b,r12b
   127f1:	75 35                	jne    12828 <ParseArgsOfCalledMacro+0x27a>
   127f3:	83 f5 01             	xor    ebp,0x1
   127f6:	eb 34                	jmp    1282c <ParseArgsOfCalledMacro+0x27e>
   127f8:	40 84 ed             	test   bpl,bpl
   127fb:	75 2f                	jne    1282c <ParseArgsOfCalledMacro+0x27e>
   127fd:	41 83 f4 01          	xor    r12d,0x1
   12801:	eb 29                	jmp    1282c <ParseArgsOfCalledMacro+0x27e>
   12803:	41 83 c5 01          	add    r13d,0x1
   12807:	3c 2c                	cmp    al,0x2c
   12809:	74 4f                	je     1285a <ParseArgsOfCalledMacro+0x2ac>
   1280b:	48 83 c3 01          	add    rbx,0x1
   1280f:	48 63 ca             	movsxd rcx,edx
   12812:	88 44 0c 10          	mov    BYTE PTR [rsp+rcx*1+0x10],al
   12816:	8d 52 01             	lea    edx,[rdx+0x1]
   12819:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   1281c:	84 c0                	test   al,al
   1281e:	74 4d                	je     1286d <ParseArgsOfCalledMacro+0x2bf>
   12820:	3c 5c                	cmp    al,0x5c
   12822:	74 96                	je     127ba <ParseArgsOfCalledMacro+0x20c>
   12824:	3c 22                	cmp    al,0x22
   12826:	74 c6                	je     127ee <ParseArgsOfCalledMacro+0x240>
   12828:	3c 27                	cmp    al,0x27
   1282a:	74 cc                	je     127f8 <ParseArgsOfCalledMacro+0x24a>
   1282c:	89 ef                	mov    edi,ebp
   1282e:	44 08 e7             	or     dil,r12b
   12831:	75 d8                	jne    1280b <ParseArgsOfCalledMacro+0x25d>
   12833:	3c 28                	cmp    al,0x28
   12835:	74 cc                	je     12803 <ParseArgsOfCalledMacro+0x255>
   12837:	3c 29                	cmp    al,0x29
   12839:	74 0e                	je     12849 <ParseArgsOfCalledMacro+0x29b>
   1283b:	3c 5b                	cmp    al,0x5b
   1283d:	74 15                	je     12854 <ParseArgsOfCalledMacro+0x2a6>
   1283f:	3c 5d                	cmp    al,0x5d
   12841:	75 c4                	jne    12807 <ParseArgsOfCalledMacro+0x259>
   12843:	41 83 ee 01          	sub    r14d,0x1
   12847:	eb be                	jmp    12807 <ParseArgsOfCalledMacro+0x259>
   12849:	45 85 ed             	test   r13d,r13d
   1284c:	74 1f                	je     1286d <ParseArgsOfCalledMacro+0x2bf>
   1284e:	41 83 ed 01          	sub    r13d,0x1
   12852:	eb b3                	jmp    12807 <ParseArgsOfCalledMacro+0x259>
   12854:	41 83 c6 01          	add    r14d,0x1
   12858:	eb ad                	jmp    12807 <ParseArgsOfCalledMacro+0x259>
   1285a:	44 89 ee             	mov    esi,r13d
   1285d:	44 09 f6             	or     esi,r14d
   12860:	75 a9                	jne    1280b <ParseArgsOfCalledMacro+0x25d>
   12862:	eb 09                	jmp    1286d <ParseArgsOfCalledMacro+0x2bf>
   12864:	ba 00 00 00 00       	mov    edx,0x0
   12869:	eb ae                	jmp    12819 <ParseArgsOfCalledMacro+0x26b>
   1286b:	89 f2                	mov    edx,esi
   1286d:	85 d2                	test   edx,edx
   1286f:	7e 23                	jle    12894 <ParseArgsOfCalledMacro+0x2e6>
   12871:	8d 72 ff             	lea    esi,[rdx-0x1]
   12874:	48 63 c6             	movsxd rax,esi
   12877:	0f b6 44 04 10       	movzx  eax,BYTE PTR [rsp+rax*1+0x10]
   1287c:	3c 20                	cmp    al,0x20
   1287e:	0f 94 c1             	sete   cl
   12881:	3c 09                	cmp    al,0x9
   12883:	40 0f 94 c7          	sete   dil
   12887:	40 08 f9             	or     cl,dil
   1288a:	75 df                	jne    1286b <ParseArgsOfCalledMacro+0x2bd>
   1288c:	3c 0a                	cmp    al,0xa
   1288e:	75 04                	jne    12894 <ParseArgsOfCalledMacro+0x2e6>
   12890:	89 f2                	mov    edx,esi
   12892:	eb d9                	jmp    1286d <ParseArgsOfCalledMacro+0x2bf>
   12894:	48 63 c2             	movsxd rax,edx
   12897:	c6 44 04 10 00       	mov    BYTE PTR [rsp+rax*1+0x10],0x0
   1289c:	48 83 7c 24 08 00    	cmp    QWORD PTR [rsp+0x8],0x0
   128a2:	0f 95 c0             	setne  al
   128a5:	85 d2                	test   edx,edx
   128a7:	0f 95 c2             	setne  dl
   128aa:	84 c2                	test   dl,al
   128ac:	75 22                	jne    128d0 <ParseArgsOfCalledMacro+0x322>
   128ae:	80 3b 2c             	cmp    BYTE PTR [rbx],0x2c
   128b1:	74 4f                	je     12902 <ParseArgsOfCalledMacro+0x354>
   128b3:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   128b6:	84 c0                	test   al,al
   128b8:	0f 84 83 00 00 00    	je     12941 <ParseArgsOfCalledMacro+0x393>
   128be:	3c 29                	cmp    al,0x29
   128c0:	0f 84 d9 fe ff ff    	je     1279f <ParseArgsOfCalledMacro+0x1f1>
   128c6:	ba 00 00 00 00       	mov    edx,0x0
   128cb:	e9 49 ff ff ff       	jmp    12819 <ParseArgsOfCalledMacro+0x26b>
   128d0:	48 8d 4c 24 10       	lea    rcx,[rsp+0x10]
   128d5:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
   128da:	48 8b 90 80 00 00 00 	mov    rdx,QWORD PTR [rax+0x80]
   128e1:	48 8d b0 8c 00 00 00 	lea    rsi,[rax+0x8c]
   128e8:	48 8d b8 88 00 00 00 	lea    rdi,[rax+0x88]
   128ef:	e8 d1 1c 00 00       	call   145c5 <TwoDappend>
   128f4:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
   128f9:	48 89 86 80 00 00 00 	mov    QWORD PTR [rsi+0x80],rax
   12900:	eb ac                	jmp    128ae <ParseArgsOfCalledMacro+0x300>
   12902:	48 83 c3 01          	add    rbx,0x1
   12906:	eb 04                	jmp    1290c <ParseArgsOfCalledMacro+0x35e>
   12908:	48 83 c3 01          	add    rbx,0x1
   1290c:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   1290f:	3c 20                	cmp    al,0x20
   12911:	74 f5                	je     12908 <ParseArgsOfCalledMacro+0x35a>
   12913:	3c 09                	cmp    al,0x9
   12915:	74 f1                	je     12908 <ParseArgsOfCalledMacro+0x35a>
   12917:	eb 0d                	jmp    12926 <ParseArgsOfCalledMacro+0x378>
   12919:	48 83 c3 01          	add    rbx,0x1
   1291d:	41 8b 07             	mov    eax,DWORD PTR [r15]
   12920:	83 c0 01             	add    eax,0x1
   12923:	41 89 07             	mov    DWORD PTR [r15],eax
   12926:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   12929:	74 ee                	je     12919 <ParseArgsOfCalledMacro+0x36b>
   1292b:	eb 04                	jmp    12931 <ParseArgsOfCalledMacro+0x383>
   1292d:	48 83 c3 01          	add    rbx,0x1
   12931:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12934:	3c 20                	cmp    al,0x20
   12936:	74 f5                	je     1292d <ParseArgsOfCalledMacro+0x37f>
   12938:	3c 09                	cmp    al,0x9
   1293a:	74 f1                	je     1292d <ParseArgsOfCalledMacro+0x37f>
   1293c:	e9 72 ff ff ff       	jmp    128b3 <ParseArgsOfCalledMacro+0x305>
   12941:	3c 29                	cmp    al,0x29
   12943:	75 06                	jne    1294b <ParseArgsOfCalledMacro+0x39d>
   12945:	48 8d 43 01          	lea    rax,[rbx+0x1]
   12949:	eb 29                	jmp    12974 <ParseArgsOfCalledMacro+0x3c6>
   1294b:	41 8b 17             	mov    edx,DWORD PTR [r15]
   1294e:	48 8d 35 89 45 00 00 	lea    rsi,[rip+0x4589]        # 16ede <_IO_stdin_used+0x1ede>
   12955:	48 8b 3d 84 82 00 00 	mov    rdi,QWORD PTR [rip+0x8284]        # 1abe0 <stderr@GLIBC_2.2.5>
   1295c:	b8 00 00 00 00       	mov    eax,0x0
   12961:	e8 da 07 ff ff       	call   3140 <fprintf@plt>
   12966:	bf 01 00 00 00       	mov    edi,0x1
   1296b:	e8 60 08 ff ff       	call   31d0 <exit@plt>
   12970:	48 83 c0 01          	add    rax,0x1
   12974:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   12977:	80 fa 20             	cmp    dl,0x20
   1297a:	74 f4                	je     12970 <ParseArgsOfCalledMacro+0x3c2>
   1297c:	80 fa 09             	cmp    dl,0x9
   1297f:	74 ef                	je     12970 <ParseArgsOfCalledMacro+0x3c2>
   12981:	eb 0d                	jmp    12990 <ParseArgsOfCalledMacro+0x3e2>
   12983:	48 83 c0 01          	add    rax,0x1
   12987:	41 8b 1f             	mov    ebx,DWORD PTR [r15]
   1298a:	8d 53 01             	lea    edx,[rbx+0x1]
   1298d:	41 89 17             	mov    DWORD PTR [r15],edx
   12990:	80 38 0a             	cmp    BYTE PTR [rax],0xa
   12993:	74 ee                	je     12983 <ParseArgsOfCalledMacro+0x3d5>
   12995:	eb 04                	jmp    1299b <ParseArgsOfCalledMacro+0x3ed>
   12997:	48 83 c0 01          	add    rax,0x1
   1299b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1299e:	80 fa 20             	cmp    dl,0x20
   129a1:	74 f4                	je     12997 <ParseArgsOfCalledMacro+0x3e9>
   129a3:	80 fa 09             	cmp    dl,0x9
   129a6:	74 ef                	je     12997 <ParseArgsOfCalledMacro+0x3e9>
   129a8:	48 81 c4 18 01 00 00 	add    rsp,0x118
   129af:	5b                   	pop    rbx
   129b0:	5d                   	pop    rbp
   129b1:	41 5c                	pop    r12
   129b3:	41 5d                	pop    r13
   129b5:	41 5e                	pop    r14
   129b7:	41 5f                	pop    r15
   129b9:	c3                   	ret

00000000000129ba <ParseMacroBody>:
   129ba:	41 57                	push   r15
   129bc:	41 56                	push   r14
   129be:	41 55                	push   r13
   129c0:	41 54                	push   r12
   129c2:	55                   	push   rbp
   129c3:	53                   	push   rbx
   129c4:	48 81 ec 08 10 00 00 	sub    rsp,0x1008
   129cb:	48 89 fb             	mov    rbx,rdi
   129ce:	49 89 d5             	mov    r13,rdx
   129d1:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
   129d8:	00 
   129d9:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
   129e0:	00 00 
   129e2:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
   129e7:	b9 fe 01 00 00       	mov    ecx,0x1fe
   129ec:	b8 00 00 00 00       	mov    eax,0x0
   129f1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
   129f4:	80 3b 7b             	cmp    BYTE PTR [rbx],0x7b
   129f7:	0f 85 b6 02 00 00    	jne    12cb3 <ParseMacroBody+0x2f9>
   129fd:	49 89 f6             	mov    r14,rsi
   12a00:	48 83 c3 01          	add    rbx,0x1
   12a04:	bd 00 00 00 00       	mov    ebp,0x0
   12a09:	41 bc 00 00 00 00    	mov    r12d,0x0
   12a0f:	e9 53 01 00 00       	jmp    12b67 <ParseMacroBody+0x1ad>
   12a14:	48 83 c3 01          	add    rbx,0x1
   12a18:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12a1b:	3c 20                	cmp    al,0x20
   12a1d:	74 f5                	je     12a14 <ParseMacroBody+0x5a>
   12a1f:	3c 09                	cmp    al,0x9
   12a21:	74 f1                	je     12a14 <ParseMacroBody+0x5a>
   12a23:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   12a26:	75 15                	jne    12a3d <ParseMacroBody+0x83>
   12a28:	48 83 c3 01          	add    rbx,0x1
   12a2c:	41 8b 45 00          	mov    eax,DWORD PTR [r13+0x0]
   12a30:	83 c0 01             	add    eax,0x1
   12a33:	41 89 45 00          	mov    DWORD PTR [r13+0x0],eax
   12a37:	eb ea                	jmp    12a23 <ParseMacroBody+0x69>
   12a39:	48 83 c3 01          	add    rbx,0x1
   12a3d:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12a40:	3c 20                	cmp    al,0x20
   12a42:	74 f5                	je     12a39 <ParseMacroBody+0x7f>
   12a44:	3c 09                	cmp    al,0x9
   12a46:	74 f1                	je     12a39 <ParseMacroBody+0x7f>
   12a48:	3c 7d                	cmp    al,0x7d
   12a4a:	0f 84 20 01 00 00    	je     12b70 <ParseMacroBody+0x1b6>
   12a50:	ba 00 00 00 00       	mov    edx,0x0
   12a55:	be 00 00 00 00       	mov    esi,0x0
   12a5a:	e9 46 01 00 00       	jmp    12ba5 <ParseMacroBody+0x1eb>
   12a5f:	40 84 ed             	test   bpl,bpl
   12a62:	0f 84 58 01 00 00    	je     12bc0 <ParseMacroBody+0x206>
   12a68:	4c 8d 43 01          	lea    r8,[rbx+0x1]
   12a6c:	8d 4a 01             	lea    ecx,[rdx+0x1]
   12a6f:	48 63 fa             	movsxd rdi,edx
   12a72:	88 04 3c             	mov    BYTE PTR [rsp+rdi*1],al
   12a75:	0f b6 43 01          	movzx  eax,BYTE PTR [rbx+0x1]
   12a79:	84 c0                	test   al,al
   12a7b:	74 12                	je     12a8f <ParseMacroBody+0xd5>
   12a7d:	48 83 c3 02          	add    rbx,0x2
   12a81:	83 c2 02             	add    edx,0x2
   12a84:	48 63 c9             	movsxd rcx,ecx
   12a87:	88 04 0c             	mov    BYTE PTR [rsp+rcx*1],al
   12a8a:	e9 16 01 00 00       	jmp    12ba5 <ParseMacroBody+0x1eb>
   12a8f:	4c 89 c3             	mov    rbx,r8
   12a92:	89 ca                	mov    edx,ecx
   12a94:	e9 0c 01 00 00       	jmp    12ba5 <ParseMacroBody+0x1eb>
   12a99:	44 89 e7             	mov    edi,r12d
   12a9c:	40 08 f7             	or     dil,sil
   12a9f:	0f 85 23 01 00 00    	jne    12bc8 <ParseMacroBody+0x20e>
   12aa5:	83 f5 01             	xor    ebp,0x1
   12aa8:	e9 1b 01 00 00       	jmp    12bc8 <ParseMacroBody+0x20e>
   12aad:	89 ef                	mov    edi,ebp
   12aaf:	40 08 f7             	or     dil,sil
   12ab2:	0f 85 18 01 00 00    	jne    12bd0 <ParseMacroBody+0x216>
   12ab8:	41 83 f4 01          	xor    r12d,0x1
   12abc:	e9 0f 01 00 00       	jmp    12bd0 <ParseMacroBody+0x216>
   12ac1:	be 01 00 00 00       	mov    esi,0x1
   12ac6:	e9 0d 01 00 00       	jmp    12bd8 <ParseMacroBody+0x21e>
   12acb:	44 89 e1             	mov    ecx,r12d
   12ace:	09 f1                	or     ecx,esi
   12ad0:	40 08 e9             	or     cl,bpl
   12ad3:	0f 85 07 01 00 00    	jne    12be0 <ParseMacroBody+0x226>
   12ad9:	48 63 c2             	movsxd rax,edx
   12adc:	c6 04 04 00          	mov    BYTE PTR [rsp+rax*1],0x0
   12ae0:	81 fa ff 0f 00 00    	cmp    edx,0xfff
   12ae6:	0f 8f 14 01 00 00    	jg     12c00 <ParseMacroBody+0x246>
   12aec:	4d 85 f6             	test   r14,r14
   12aef:	74 76                	je     12b67 <ParseMacroBody+0x1ad>
   12af1:	48 89 e7             	mov    rdi,rsp
   12af4:	ba 05 00 00 00       	mov    edx,0x5
   12af9:	48 8d 35 c6 44 00 00 	lea    rsi,[rip+0x44c6]        # 16fc6 <_IO_stdin_used+0x1fc6>
   12b00:	e8 7b 06 ff ff       	call   3180 <strncasecmp@plt>
   12b05:	85 c0                	test   eax,eax
   12b07:	75 19                	jne    12b22 <ParseMacroBody+0x168>
   12b09:	0f b6 54 24 05       	movzx  edx,BYTE PTR [rsp+0x5]
   12b0e:	80 fa 20             	cmp    dl,0x20
   12b11:	0f 94 c0             	sete   al
   12b14:	80 fa 09             	cmp    dl,0x9
   12b17:	0f 94 c2             	sete   dl
   12b1a:	08 d0                	or     al,dl
   12b1c:	0f 85 04 01 00 00    	jne    12c26 <ParseMacroBody+0x26c>
   12b22:	4c 89 f7             	mov    rdi,r14
   12b25:	e8 96 05 ff ff       	call   30c0 <strlen@plt>
   12b2a:	49 89 c7             	mov    r15,rax
   12b2d:	48 89 e6             	mov    rsi,rsp
   12b30:	48 89 c2             	mov    rdx,rax
   12b33:	4c 89 f7             	mov    rdi,r14
   12b36:	e8 45 05 ff ff       	call   3080 <strncmp@plt>
   12b3b:	85 c0                	test   eax,eax
   12b3d:	0f 84 09 01 00 00    	je     12c4c <ParseMacroBody+0x292>
   12b43:	48 89 e1             	mov    rcx,rsp
   12b46:	49 8b 96 90 00 00 00 	mov    rdx,QWORD PTR [r14+0x90]
   12b4d:	49 8d b6 9c 00 00 00 	lea    rsi,[r14+0x9c]
   12b54:	49 8d be 98 00 00 00 	lea    rdi,[r14+0x98]
   12b5b:	e8 65 1a 00 00       	call   145c5 <TwoDappend>
   12b60:	49 89 86 90 00 00 00 	mov    QWORD PTR [r14+0x90],rax
   12b67:	80 3b 00             	cmp    BYTE PTR [rbx],0x0
   12b6a:	0f 85 a8 fe ff ff    	jne    12a18 <ParseMacroBody+0x5e>
   12b70:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12b73:	84 c0                	test   al,al
   12b75:	0f 84 17 01 00 00    	je     12c92 <ParseMacroBody+0x2d8>
   12b7b:	3c 7d                	cmp    al,0x7d
   12b7d:	0f 84 54 01 00 00    	je     12cd7 <ParseMacroBody+0x31d>
   12b83:	48 89 d8             	mov    rax,rbx
   12b86:	48 81 c4 08 10 00 00 	add    rsp,0x1008
   12b8d:	5b                   	pop    rbx
   12b8e:	5d                   	pop    rbp
   12b8f:	41 5c                	pop    r12
   12b91:	41 5d                	pop    r13
   12b93:	41 5e                	pop    r14
   12b95:	41 5f                	pop    r15
   12b97:	c3                   	ret
   12b98:	48 83 c3 01          	add    rbx,0x1
   12b9c:	48 63 ca             	movsxd rcx,edx
   12b9f:	88 04 0c             	mov    BYTE PTR [rsp+rcx*1],al
   12ba2:	8d 52 01             	lea    edx,[rdx+0x1]
   12ba5:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12ba8:	84 c0                	test   al,al
   12baa:	0f 84 29 ff ff ff    	je     12ad9 <ParseMacroBody+0x11f>
   12bb0:	3c 0a                	cmp    al,0xa
   12bb2:	0f 84 21 ff ff ff    	je     12ad9 <ParseMacroBody+0x11f>
   12bb8:	3c 5c                	cmp    al,0x5c
   12bba:	0f 84 9f fe ff ff    	je     12a5f <ParseMacroBody+0xa5>
   12bc0:	3c 22                	cmp    al,0x22
   12bc2:	0f 84 d1 fe ff ff    	je     12a99 <ParseMacroBody+0xdf>
   12bc8:	3c 27                	cmp    al,0x27
   12bca:	0f 84 dd fe ff ff    	je     12aad <ParseMacroBody+0xf3>
   12bd0:	3c 3b                	cmp    al,0x3b
   12bd2:	0f 84 e9 fe ff ff    	je     12ac1 <ParseMacroBody+0x107>
   12bd8:	3c 7d                	cmp    al,0x7d
   12bda:	0f 84 eb fe ff ff    	je     12acb <ParseMacroBody+0x111>
   12be0:	3c 2f                	cmp    al,0x2f
   12be2:	75 b4                	jne    12b98 <ParseMacroBody+0x1de>
   12be4:	44 89 e1             	mov    ecx,r12d
   12be7:	09 f1                	or     ecx,esi
   12be9:	40 08 e9             	or     cl,bpl
   12bec:	75 aa                	jne    12b98 <ParseMacroBody+0x1de>
   12bee:	48 83 c3 01          	add    rbx,0x1
   12bf2:	83 c2 01             	add    edx,0x1
   12bf5:	48 63 ca             	movsxd rcx,edx
   12bf8:	88 04 0c             	mov    BYTE PTR [rsp+rcx*1],al
   12bfb:	e9 d9 fe ff ff       	jmp    12ad9 <ParseMacroBody+0x11f>
   12c00:	41 8b 55 00          	mov    edx,DWORD PTR [r13+0x0]
   12c04:	48 8d 35 05 43 00 00 	lea    rsi,[rip+0x4305]        # 16f10 <_IO_stdin_used+0x1f10>
   12c0b:	48 8b 3d ce 7f 00 00 	mov    rdi,QWORD PTR [rip+0x7fce]        # 1abe0 <stderr@GLIBC_2.2.5>
   12c12:	b8 00 00 00 00       	mov    eax,0x0
   12c17:	e8 24 05 ff ff       	call   3140 <fprintf@plt>
   12c1c:	bf 01 00 00 00       	mov    edi,0x1
   12c21:	e8 aa 05 ff ff       	call   31d0 <exit@plt>
   12c26:	41 8b 55 00          	mov    edx,DWORD PTR [r13+0x0]
   12c2a:	48 8d 35 0f 43 00 00 	lea    rsi,[rip+0x430f]        # 16f40 <_IO_stdin_used+0x1f40>
   12c31:	48 8b 3d a8 7f 00 00 	mov    rdi,QWORD PTR [rip+0x7fa8]        # 1abe0 <stderr@GLIBC_2.2.5>
   12c38:	b8 00 00 00 00       	mov    eax,0x0
   12c3d:	e8 fe 04 ff ff       	call   3140 <fprintf@plt>
   12c42:	bf 01 00 00 00       	mov    edi,0x1
   12c47:	e8 84 05 ff ff       	call   31d0 <exit@plt>
   12c4c:	4a 8d 04 3c          	lea    rax,[rsp+r15*1]
   12c50:	eb 04                	jmp    12c56 <ParseMacroBody+0x29c>
   12c52:	48 83 c0 01          	add    rax,0x1
   12c56:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   12c59:	80 fa 20             	cmp    dl,0x20
   12c5c:	74 f4                	je     12c52 <ParseMacroBody+0x298>
   12c5e:	80 fa 09             	cmp    dl,0x9
   12c61:	74 ef                	je     12c52 <ParseMacroBody+0x298>
   12c63:	80 fa 28             	cmp    dl,0x28
   12c66:	0f 85 d7 fe ff ff    	jne    12b43 <ParseMacroBody+0x189>
   12c6c:	41 8b 55 00          	mov    edx,DWORD PTR [r13+0x0]
   12c70:	48 8d 35 f1 42 00 00 	lea    rsi,[rip+0x42f1]        # 16f68 <_IO_stdin_used+0x1f68>
   12c77:	48 8b 3d 62 7f 00 00 	mov    rdi,QWORD PTR [rip+0x7f62]        # 1abe0 <stderr@GLIBC_2.2.5>
   12c7e:	b8 00 00 00 00       	mov    eax,0x0
   12c83:	e8 b8 04 ff ff       	call   3140 <fprintf@plt>
   12c88:	bf 01 00 00 00       	mov    edi,0x1
   12c8d:	e8 3e 05 ff ff       	call   31d0 <exit@plt>
   12c92:	41 8b 55 00          	mov    edx,DWORD PTR [r13+0x0]
   12c96:	48 8d 35 fb 42 00 00 	lea    rsi,[rip+0x42fb]        # 16f98 <_IO_stdin_used+0x1f98>
   12c9d:	48 8b 3d 3c 7f 00 00 	mov    rdi,QWORD PTR [rip+0x7f3c]        # 1abe0 <stderr@GLIBC_2.2.5>
   12ca4:	e8 97 04 ff ff       	call   3140 <fprintf@plt>
   12ca9:	bf 01 00 00 00       	mov    edi,0x1
   12cae:	e8 1d 05 ff ff       	call   31d0 <exit@plt>
   12cb3:	8b 12                	mov    edx,DWORD PTR [rdx]
   12cb5:	48 8d 35 10 43 00 00 	lea    rsi,[rip+0x4310]        # 16fcc <_IO_stdin_used+0x1fcc>
   12cbc:	48 8b 3d 1d 7f 00 00 	mov    rdi,QWORD PTR [rip+0x7f1d]        # 1abe0 <stderr@GLIBC_2.2.5>
   12cc3:	b8 00 00 00 00       	mov    eax,0x0
   12cc8:	e8 73 04 ff ff       	call   3140 <fprintf@plt>
   12ccd:	bf 01 00 00 00       	mov    edi,0x1
   12cd2:	e8 f9 04 ff ff       	call   31d0 <exit@plt>
   12cd7:	48 83 c3 01          	add    rbx,0x1
   12cdb:	e9 a3 fe ff ff       	jmp    12b83 <ParseMacroBody+0x1c9>

0000000000012ce0 <ParseMacro>:
   12ce0:	41 56                	push   r14
   12ce2:	41 55                	push   r13
   12ce4:	41 54                	push   r12
   12ce6:	55                   	push   rbp
   12ce7:	53                   	push   rbx
   12ce8:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
   12cef:	48 89 f3             	mov    rbx,rsi
   12cf2:	49 89 d4             	mov    r12,rdx
   12cf5:	48 89 cd             	mov    rbp,rcx
   12cf8:	c7 84 24 ac 00 00 00 	mov    DWORD PTR [rsp+0xac],0x1
   12cff:	01 00 00 00 
   12d03:	eb 50                	jmp    12d55 <ParseMacro+0x75>
   12d05:	48 83 c7 01          	add    rdi,0x1
   12d09:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   12d0c:	3c 20                	cmp    al,0x20
   12d0e:	74 f5                	je     12d05 <ParseMacro+0x25>
   12d10:	3c 09                	cmp    al,0x9
   12d12:	74 f1                	je     12d05 <ParseMacro+0x25>
   12d14:	48 8d b4 24 ac 00 00 	lea    rsi,[rsp+0xac]
   12d1b:	00 
   12d1c:	e8 c4 f4 ff ff       	call   121e5 <SkipComment>
   12d21:	49 89 c5             	mov    r13,rax
   12d24:	ba 05 00 00 00       	mov    edx,0x5
   12d29:	48 8d 35 96 42 00 00 	lea    rsi,[rip+0x4296]        # 16fc6 <_IO_stdin_used+0x1fc6>
   12d30:	48 89 c7             	mov    rdi,rax
   12d33:	e8 48 04 ff ff       	call   3180 <strncasecmp@plt>
   12d38:	85 c0                	test   eax,eax
   12d3a:	75 15                	jne    12d51 <ParseMacro+0x71>
   12d3c:	41 0f b6 55 05       	movzx  edx,BYTE PTR [r13+0x5]
   12d41:	80 fa 20             	cmp    dl,0x20
   12d44:	0f 94 c0             	sete   al
   12d47:	80 fa 09             	cmp    dl,0x9
   12d4a:	0f 94 c2             	sete   dl
   12d4d:	08 d0                	or     al,dl
   12d4f:	75 19                	jne    12d6a <ParseMacro+0x8a>
   12d51:	49 8d 7d 01          	lea    rdi,[r13+0x1]
   12d55:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
   12d58:	75 af                	jne    12d09 <ParseMacro+0x29>
   12d5a:	48 81 c4 b0 00 00 00 	add    rsp,0xb0
   12d61:	5b                   	pop    rbx
   12d62:	5d                   	pop    rbp
   12d63:	41 5c                	pop    r12
   12d65:	41 5d                	pop    r13
   12d67:	41 5e                	pop    r14
   12d69:	c3                   	ret
   12d6a:	48 89 e7             	mov    rdi,rsp
   12d6d:	b9 15 00 00 00       	mov    ecx,0x15
   12d72:	b8 00 00 00 00       	mov    eax,0x0
   12d77:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
   12d7a:	8b 84 24 ac 00 00 00 	mov    eax,DWORD PTR [rsp+0xac]
   12d81:	89 84 24 a0 00 00 00 	mov    DWORD PTR [rsp+0xa0],eax
   12d88:	49 8d 7d 05          	lea    rdi,[r13+0x5]
   12d8c:	eb 04                	jmp    12d92 <ParseMacro+0xb2>
   12d8e:	48 83 c7 01          	add    rdi,0x1
   12d92:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   12d95:	3c 20                	cmp    al,0x20
   12d97:	74 f5                	je     12d8e <ParseMacro+0xae>
   12d99:	3c 09                	cmp    al,0x9
   12d9b:	74 f1                	je     12d8e <ParseMacro+0xae>
   12d9d:	eb 0c                	jmp    12dab <ParseMacro+0xcb>
   12d9f:	48 83 c7 01          	add    rdi,0x1
   12da3:	83 84 24 ac 00 00 00 	add    DWORD PTR [rsp+0xac],0x1
   12daa:	01 
   12dab:	80 3f 0a             	cmp    BYTE PTR [rdi],0xa
   12dae:	74 ef                	je     12d9f <ParseMacro+0xbf>
   12db0:	eb 04                	jmp    12db6 <ParseMacro+0xd6>
   12db2:	48 83 c7 01          	add    rdi,0x1
   12db6:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   12db9:	3c 20                	cmp    al,0x20
   12dbb:	74 f5                	je     12db2 <ParseMacro+0xd2>
   12dbd:	3c 09                	cmp    al,0x9
   12dbf:	74 f1                	je     12db2 <ParseMacro+0xd2>
   12dc1:	4c 8d ac 24 ac 00 00 	lea    r13,[rsp+0xac]
   12dc8:	00 
   12dc9:	49 89 e6             	mov    r14,rsp
   12dcc:	4c 89 ea             	mov    rdx,r13
   12dcf:	4c 89 f6             	mov    rsi,r14
   12dd2:	e8 b0 f4 ff ff       	call   12287 <ParseMacroName>
   12dd7:	48 89 c7             	mov    rdi,rax
   12dda:	4c 89 ea             	mov    rdx,r13
   12ddd:	4c 89 f6             	mov    rsi,r14
   12de0:	e8 64 f5 ff ff       	call   12349 <ParseArgs>
   12de5:	48 89 c7             	mov    rdi,rax
   12de8:	4c 89 ea             	mov    rdx,r13
   12deb:	4c 89 f6             	mov    rsi,r14
   12dee:	e8 c7 fb ff ff       	call   129ba <ParseMacroBody>
   12df3:	49 89 c5             	mov    r13,rax
   12df6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   12df9:	41 b8 a8 00 00 00    	mov    r8d,0xa8
   12dff:	4c 89 f1             	mov    rcx,r14
   12e02:	48 89 ee             	mov    rsi,rbp
   12e05:	4c 89 e7             	mov    rdi,r12
   12e08:	e8 3c 17 00 00       	call   14549 <append>
   12e0d:	48 89 03             	mov    QWORD PTR [rbx],rax
   12e10:	e9 3c ff ff ff       	jmp    12d51 <ParseMacro+0x71>

0000000000012e15 <SubstituteArgs>:
   12e15:	41 57                	push   r15
   12e17:	41 56                	push   r14
   12e19:	41 55                	push   r13
   12e1b:	41 54                	push   r12
   12e1d:	55                   	push   rbp
   12e1e:	53                   	push   rbx
   12e1f:	48 83 ec 38          	sub    rsp,0x38
   12e23:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
   12e28:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
   12e2d:	48 89 d3             	mov    rbx,rdx
   12e30:	49 89 cd             	mov    r13,rcx
   12e33:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
   12e37:	41 bf 00 00 00 00    	mov    r15d,0x0
   12e3d:	41 be 00 00 00 00    	mov    r14d,0x0
   12e43:	bd 00 00 00 00       	mov    ebp,0x0
   12e48:	eb 5a                	jmp    12ea4 <SubstituteArgs+0x8f>
   12e4a:	44 89 f0             	mov    eax,r14d
   12e4d:	44 08 f8             	or     al,r15b
   12e50:	74 75                	je     12ec7 <SubstituteArgs+0xb2>
   12e52:	48 8d 43 01          	lea    rax,[rbx+0x1]
   12e56:	41 88 74 2d 00       	mov    BYTE PTR [r13+rbp*1+0x0],sil
   12e5b:	0f b6 53 01          	movzx  edx,BYTE PTR [rbx+0x1]
   12e5f:	84 d2                	test   dl,dl
   12e61:	74 19                	je     12e7c <SubstituteArgs+0x67>
   12e63:	48 83 c5 02          	add    rbp,0x2
   12e67:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
   12e6b:	48 39 fd             	cmp    rbp,rdi
   12e6e:	73 0c                	jae    12e7c <SubstituteArgs+0x67>
   12e70:	48 8d 43 02          	lea    rax,[rbx+0x2]
   12e74:	43 88 54 25 00       	mov    BYTE PTR [r13+r12*1+0x0],dl
   12e79:	49 89 ec             	mov    r12,rbp
   12e7c:	4c 89 e5             	mov    rbp,r12
   12e7f:	48 89 c3             	mov    rbx,rax
   12e82:	eb 20                	jmp    12ea4 <SubstituteArgs+0x8f>
   12e84:	45 84 ff             	test   r15b,r15b
   12e87:	75 44                	jne    12ecd <SubstituteArgs+0xb8>
   12e89:	41 83 f6 01          	xor    r14d,0x1
   12e8d:	44 89 f0             	mov    eax,r14d
   12e90:	44 08 f8             	or     al,r15b
   12e93:	74 49                	je     12ede <SubstituteArgs+0xc9>
   12e95:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   12e98:	41 88 44 2d 00       	mov    BYTE PTR [r13+rbp*1+0x0],al
   12e9d:	4c 89 e5             	mov    rbp,r12
   12ea0:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
   12ea4:	0f b6 33             	movzx  esi,BYTE PTR [rbx]
   12ea7:	40 84 f6             	test   sil,sil
   12eaa:	0f 84 62 01 00 00    	je     13012 <SubstituteArgs+0x1fd>
   12eb0:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   12eb4:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
   12eb8:	49 39 c4             	cmp    r12,rax
   12ebb:	0f 83 51 01 00 00    	jae    13012 <SubstituteArgs+0x1fd>
   12ec1:	40 80 fe 5c          	cmp    sil,0x5c
   12ec5:	74 83                	je     12e4a <SubstituteArgs+0x35>
   12ec7:	40 80 fe 22          	cmp    sil,0x22
   12ecb:	74 b7                	je     12e84 <SubstituteArgs+0x6f>
   12ecd:	40 80 fe 27          	cmp    sil,0x27
   12ed1:	75 ba                	jne    12e8d <SubstituteArgs+0x78>
   12ed3:	45 84 f6             	test   r14b,r14b
   12ed6:	75 b5                	jne    12e8d <SubstituteArgs+0x78>
   12ed8:	41 83 f7 01          	xor    r15d,0x1
   12edc:	eb af                	jmp    12e8d <SubstituteArgs+0x78>
   12ede:	40 0f be f6          	movsx  esi,sil
   12ee2:	48 8b 3d 47 72 00 00 	mov    rdi,QWORD PTR [rip+0x7247]        # 1a130 <LETEXT>
   12ee9:	e8 92 08 00 00       	call   13780 <isin>
   12eee:	85 c0                	test   eax,eax
   12ef0:	74 a3                	je     12e95 <SubstituteArgs+0x80>
   12ef2:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   12ef7:	eb 06                	jmp    12eff <SubstituteArgs+0xea>
   12ef9:	48 83 44 24 18 01    	add    QWORD PTR [rsp+0x18],0x1
   12eff:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
   12f04:	0f b6 30             	movzx  esi,BYTE PTR [rax]
   12f07:	40 84 f6             	test   sil,sil
   12f0a:	74 14                	je     12f20 <SubstituteArgs+0x10b>
   12f0c:	40 0f be f6          	movsx  esi,sil
   12f10:	48 8b 3d 19 72 00 00 	mov    rdi,QWORD PTR [rip+0x7219]        # 1a130 <LETEXT>
   12f17:	e8 64 08 00 00       	call   13780 <isin>
   12f1c:	85 c0                	test   eax,eax
   12f1e:	75 d9                	jne    12ef9 <SubstituteArgs+0xe4>
   12f20:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
   12f24:	29 d8                	sub    eax,ebx
   12f26:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
   12f2a:	41 bc 00 00 00 00    	mov    r12d,0x0
   12f30:	eb 04                	jmp    12f36 <SubstituteArgs+0x121>
   12f32:	41 83 c4 01          	add    r12d,0x1
   12f36:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
   12f3b:	44 39 a0 88 00 00 00 	cmp    DWORD PTR [rax+0x88],r12d
   12f42:	7e 41                	jle    12f85 <SubstituteArgs+0x170>
   12f44:	49 63 c4             	movsxd rax,r12d
   12f47:	48 c1 e0 03          	shl    rax,0x3
   12f4b:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
   12f50:	48 03 81 80 00 00 00 	add    rax,QWORD PTR [rcx+0x80]
   12f57:	48 8b 00             	mov    rax,QWORD PTR [rax]
   12f5a:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   12f5f:	48 89 c7             	mov    rdi,rax
   12f62:	e8 59 01 ff ff       	call   30c0 <strlen@plt>
   12f67:	39 44 24 14          	cmp    DWORD PTR [rsp+0x14],eax
   12f6b:	75 c5                	jne    12f32 <SubstituteArgs+0x11d>
   12f6d:	48 63 54 24 14       	movsxd rdx,DWORD PTR [rsp+0x14]
   12f72:	48 89 de             	mov    rsi,rbx
   12f75:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
   12f7a:	e8 01 01 ff ff       	call   3080 <strncmp@plt>
   12f7f:	85 c0                	test   eax,eax
   12f81:	75 af                	jne    12f32 <SubstituteArgs+0x11d>
   12f83:	eb 06                	jmp    12f8b <SubstituteArgs+0x176>
   12f85:	41 bc ff ff ff ff    	mov    r12d,0xffffffff
   12f8b:	41 83 fc ff          	cmp    r12d,0xffffffff
   12f8f:	74 73                	je     13004 <SubstituteArgs+0x1ef>
   12f91:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   12f96:	44 39 a0 88 00 00 00 	cmp    DWORD PTR [rax+0x88],r12d
   12f9d:	7e 6c                	jle    1300b <SubstituteArgs+0x1f6>
   12f9f:	4d 63 e4             	movsxd r12,r12d
   12fa2:	49 c1 e4 03          	shl    r12,0x3
   12fa6:	4c 03 a0 80 00 00 00 	add    r12,QWORD PTR [rax+0x80]
   12fad:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
   12fb1:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   12fb4:	84 c0                	test   al,al
   12fb6:	74 42                	je     12ffa <SubstituteArgs+0x1e5>
   12fb8:	48 8d 4d 01          	lea    rcx,[rbp+0x1]
   12fbc:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
   12fc0:	48 39 f9             	cmp    rcx,rdi
   12fc3:	73 35                	jae    12ffa <SubstituteArgs+0x1e5>
   12fc5:	48 83 c2 01          	add    rdx,0x1
   12fc9:	41 88 44 2d 00       	mov    BYTE PTR [r13+rbp*1+0x0],al
   12fce:	48 89 cd             	mov    rbp,rcx
   12fd1:	eb de                	jmp    12fb1 <SubstituteArgs+0x19c>
   12fd3:	48 63 c8             	movsxd rcx,eax
   12fd6:	0f b6 0c 0b          	movzx  ecx,BYTE PTR [rbx+rcx*1]
   12fda:	41 88 4c 2d 00       	mov    BYTE PTR [r13+rbp*1+0x0],cl
   12fdf:	83 c0 01             	add    eax,0x1
   12fe2:	48 89 d5             	mov    rbp,rdx
   12fe5:	8b 54 24 14          	mov    edx,DWORD PTR [rsp+0x14]
   12fe9:	39 d0                	cmp    eax,edx
   12feb:	7d 0d                	jge    12ffa <SubstituteArgs+0x1e5>
   12fed:	48 8d 55 01          	lea    rdx,[rbp+0x1]
   12ff1:	48 8b 0c 24          	mov    rcx,QWORD PTR [rsp]
   12ff5:	48 39 ca             	cmp    rdx,rcx
   12ff8:	72 d9                	jb     12fd3 <SubstituteArgs+0x1be>
   12ffa:	48 8b 5c 24 18       	mov    rbx,QWORD PTR [rsp+0x18]
   12fff:	e9 a0 fe ff ff       	jmp    12ea4 <SubstituteArgs+0x8f>
   13004:	b8 00 00 00 00       	mov    eax,0x0
   13009:	eb da                	jmp    12fe5 <SubstituteArgs+0x1d0>
   1300b:	b8 00 00 00 00       	mov    eax,0x0
   13010:	eb d3                	jmp    12fe5 <SubstituteArgs+0x1d0>
   13012:	41 c6 44 2d 00 00    	mov    BYTE PTR [r13+rbp*1+0x0],0x0
   13018:	4c 89 e8             	mov    rax,r13
   1301b:	48 83 c4 38          	add    rsp,0x38
   1301f:	5b                   	pop    rbx
   13020:	5d                   	pop    rbp
   13021:	41 5c                	pop    r12
   13023:	41 5d                	pop    r13
   13025:	41 5e                	pop    r14
   13027:	41 5f                	pop    r15
   13029:	c3                   	ret

000000000001302a <FindCallOfMacro>:
   1302a:	41 57                	push   r15
   1302c:	41 56                	push   r14
   1302e:	41 55                	push   r13
   13030:	41 54                	push   r12
   13032:	55                   	push   rbp
   13033:	53                   	push   rbx
   13034:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
   1303b:	49 89 ff             	mov    r15,rdi
   1303e:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
   13043:	89 54 24 14          	mov    DWORD PTR [rsp+0x14],edx
   13047:	49 89 ce             	mov    r14,rcx
   1304a:	4c 89 44 24 18       	mov    QWORD PTR [rsp+0x18],r8
   1304f:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   13054:	4c 8b a4 24 30 01 00 	mov    r12,QWORD PTR [rsp+0x130]
   1305b:	00 
   1305c:	c6 44 24 12 00       	mov    BYTE PTR [rsp+0x12],0x0
   13061:	c6 44 24 13 00       	mov    BYTE PTR [rsp+0x13],0x0
   13066:	eb 57                	jmp    130bf <FindCallOfMacro+0x95>
   13068:	40 0f be ff          	movsx  edi,dil
   1306c:	4c 89 e6             	mov    rsi,r12
   1306f:	e8 ac 00 ff ff       	call   3120 <fputc@plt>
   13074:	49 8d 47 01          	lea    rax,[r15+0x1]
   13078:	41 0f b6 7f 01       	movzx  edi,BYTE PTR [r15+0x1]
   1307d:	40 84 ff             	test   dil,dil
   13080:	75 05                	jne    13087 <FindCallOfMacro+0x5d>
   13082:	49 89 c7             	mov    r15,rax
   13085:	eb 38                	jmp    130bf <FindCallOfMacro+0x95>
   13087:	40 0f be ff          	movsx  edi,dil
   1308b:	4c 89 e6             	mov    rsi,r12
   1308e:	e8 8d 00 ff ff       	call   3120 <fputc@plt>
   13093:	49 8d 47 02          	lea    rax,[r15+0x2]
   13097:	eb e9                	jmp    13082 <FindCallOfMacro+0x58>
   13099:	80 7c 24 12 00       	cmp    BYTE PTR [rsp+0x12],0x0
   1309e:	75 43                	jne    130e3 <FindCallOfMacro+0xb9>
   130a0:	0f b6 44 24 12       	movzx  eax,BYTE PTR [rsp+0x12]
   130a5:	88 44 24 13          	mov    BYTE PTR [rsp+0x13],al
   130a9:	40 80 ff 0a          	cmp    dil,0xa
   130ad:	74 4c                	je     130fb <FindCallOfMacro+0xd1>
   130af:	41 0f be 3f          	movsx  edi,BYTE PTR [r15]
   130b3:	4c 89 e6             	mov    rsi,r12
   130b6:	e8 65 00 ff ff       	call   3120 <fputc@plt>
   130bb:	49 83 c7 01          	add    r15,0x1
   130bf:	41 0f b6 3f          	movzx  edi,BYTE PTR [r15]
   130c3:	40 84 ff             	test   dil,dil
   130c6:	0f 84 1f 03 00 00    	je     133eb <FindCallOfMacro+0x3c1>
   130cc:	0f b6 44 24 13       	movzx  eax,BYTE PTR [rsp+0x13]
   130d1:	0a 44 24 12          	or     al,BYTE PTR [rsp+0x12]
   130d5:	74 2f                	je     13106 <FindCallOfMacro+0xdc>
   130d7:	40 80 ff 5c          	cmp    dil,0x5c
   130db:	74 8b                	je     13068 <FindCallOfMacro+0x3e>
   130dd:	40 80 ff 22          	cmp    dil,0x22
   130e1:	74 b6                	je     13099 <FindCallOfMacro+0x6f>
   130e3:	40 80 ff 27          	cmp    dil,0x27
   130e7:	75 c0                	jne    130a9 <FindCallOfMacro+0x7f>
   130e9:	80 7c 24 13 00       	cmp    BYTE PTR [rsp+0x13],0x0
   130ee:	75 b9                	jne    130a9 <FindCallOfMacro+0x7f>
   130f0:	0f b6 44 24 13       	movzx  eax,BYTE PTR [rsp+0x13]
   130f5:	88 44 24 12          	mov    BYTE PTR [rsp+0x12],al
   130f9:	eb ae                	jmp    130a9 <FindCallOfMacro+0x7f>
   130fb:	41 8b 06             	mov    eax,DWORD PTR [r14]
   130fe:	83 c0 01             	add    eax,0x1
   13101:	41 89 06             	mov    DWORD PTR [r14],eax
   13104:	eb a9                	jmp    130af <FindCallOfMacro+0x85>
   13106:	4c 89 f6             	mov    rsi,r14
   13109:	4c 89 ff             	mov    rdi,r15
   1310c:	e8 d4 f0 ff ff       	call   121e5 <SkipComment>
   13111:	48 89 c3             	mov    rbx,rax
   13114:	eb 10                	jmp    13126 <FindCallOfMacro+0xfc>
   13116:	40 0f be ff          	movsx  edi,dil
   1311a:	4c 89 e6             	mov    rsi,r12
   1311d:	e8 fe ff fe ff       	call   3120 <fputc@plt>
   13122:	49 83 c7 01          	add    r15,0x1
   13126:	49 39 df             	cmp    r15,rbx
   13129:	73 16                	jae    13141 <FindCallOfMacro+0x117>
   1312b:	41 0f b6 3f          	movzx  edi,BYTE PTR [r15]
   1312f:	40 80 ff 20          	cmp    dil,0x20
   13133:	0f 94 c0             	sete   al
   13136:	40 80 ff 09          	cmp    dil,0x9
   1313a:	0f 94 c2             	sete   dl
   1313d:	08 d0                	or     al,dl
   1313f:	75 d5                	jne    13116 <FindCallOfMacro+0xec>
   13141:	0f b6 2b             	movzx  ebp,BYTE PTR [rbx]
   13144:	40 84 ed             	test   bpl,bpl
   13147:	0f 84 9e 02 00 00    	je     133eb <FindCallOfMacro+0x3c1>
   1314d:	40 80 fd 22          	cmp    bpl,0x22
   13151:	0f 94 c0             	sete   al
   13154:	40 80 fd 27          	cmp    bpl,0x27
   13158:	0f 94 c2             	sete   dl
   1315b:	08 d0                	or     al,dl
   1315d:	75 61                	jne    131c0 <FindCallOfMacro+0x196>
   1315f:	ba 05 00 00 00       	mov    edx,0x5
   13164:	48 8d 35 5b 3e 00 00 	lea    rsi,[rip+0x3e5b]        # 16fc6 <_IO_stdin_used+0x1fc6>
   1316b:	48 89 df             	mov    rdi,rbx
   1316e:	e8 0d 00 ff ff       	call   3180 <strncasecmp@plt>
   13173:	85 c0                	test   eax,eax
   13175:	75 14                	jne    1318b <FindCallOfMacro+0x161>
   13177:	0f b6 53 05          	movzx  edx,BYTE PTR [rbx+0x5]
   1317b:	80 fa 20             	cmp    dl,0x20
   1317e:	0f 94 c0             	sete   al
   13181:	80 fa 09             	cmp    dl,0x9
   13184:	0f 94 c2             	sete   dl
   13187:	08 d0                	or     al,dl
   13189:	75 5c                	jne    131e7 <FindCallOfMacro+0x1bd>
   1318b:	40 0f be f5          	movsx  esi,bpl
   1318f:	48 8b 3d 9a 6f 00 00 	mov    rdi,QWORD PTR [rip+0x6f9a]        # 1a130 <LETEXT>
   13196:	e8 e5 05 00 00       	call   13780 <isin>
   1319b:	85 c0                	test   eax,eax
   1319d:	0f 85 08 01 00 00    	jne    132ab <FindCallOfMacro+0x281>
   131a3:	80 3b 0a             	cmp    BYTE PTR [rbx],0xa
   131a6:	0f 84 aa 00 00 00    	je     13256 <FindCallOfMacro+0x22c>
   131ac:	0f be 3b             	movsx  edi,BYTE PTR [rbx]
   131af:	4c 89 e6             	mov    rsi,r12
   131b2:	e8 69 ff fe ff       	call   3120 <fputc@plt>
   131b7:	4c 8d 7b 01          	lea    r15,[rbx+0x1]
   131bb:	e9 ff fe ff ff       	jmp    130bf <FindCallOfMacro+0x95>
   131c0:	40 80 fd 22          	cmp    bpl,0x22
   131c4:	74 1a                	je     131e0 <FindCallOfMacro+0x1b6>
   131c6:	c6 44 24 12 01       	mov    BYTE PTR [rsp+0x12],0x1
   131cb:	40 0f be fd          	movsx  edi,bpl
   131cf:	4c 89 e6             	mov    rsi,r12
   131d2:	e8 49 ff fe ff       	call   3120 <fputc@plt>
   131d7:	4c 8d 7b 01          	lea    r15,[rbx+0x1]
   131db:	e9 df fe ff ff       	jmp    130bf <FindCallOfMacro+0x95>
   131e0:	c6 44 24 13 01       	mov    BYTE PTR [rsp+0x13],0x1
   131e5:	eb e4                	jmp    131cb <FindCallOfMacro+0x1a1>
   131e7:	48 8d 7b 05          	lea    rdi,[rbx+0x5]
   131eb:	eb 04                	jmp    131f1 <FindCallOfMacro+0x1c7>
   131ed:	48 83 c7 01          	add    rdi,0x1
   131f1:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   131f4:	3c 20                	cmp    al,0x20
   131f6:	74 f5                	je     131ed <FindCallOfMacro+0x1c3>
   131f8:	3c 09                	cmp    al,0x9
   131fa:	74 f1                	je     131ed <FindCallOfMacro+0x1c3>
   131fc:	eb 0d                	jmp    1320b <FindCallOfMacro+0x1e1>
   131fe:	48 83 c7 01          	add    rdi,0x1
   13202:	41 8b 06             	mov    eax,DWORD PTR [r14]
   13205:	83 c0 01             	add    eax,0x1
   13208:	41 89 06             	mov    DWORD PTR [r14],eax
   1320b:	80 3f 0a             	cmp    BYTE PTR [rdi],0xa
   1320e:	74 ee                	je     131fe <FindCallOfMacro+0x1d4>
   13210:	eb 04                	jmp    13216 <FindCallOfMacro+0x1ec>
   13212:	48 83 c7 01          	add    rdi,0x1
   13216:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   13219:	3c 20                	cmp    al,0x20
   1321b:	74 f5                	je     13212 <FindCallOfMacro+0x1e8>
   1321d:	3c 09                	cmp    al,0x9
   1321f:	74 f1                	je     13212 <FindCallOfMacro+0x1e8>
   13221:	4c 89 f2             	mov    rdx,r14
   13224:	be 00 00 00 00       	mov    esi,0x0
   13229:	e8 59 f0 ff ff       	call   12287 <ParseMacroName>
   1322e:	48 89 c7             	mov    rdi,rax
   13231:	4c 89 f2             	mov    rdx,r14
   13234:	be 00 00 00 00       	mov    esi,0x0
   13239:	e8 0b f1 ff ff       	call   12349 <ParseArgs>
   1323e:	48 89 c7             	mov    rdi,rax
   13241:	4c 89 f2             	mov    rdx,r14
   13244:	be 00 00 00 00       	mov    esi,0x0
   13249:	e8 6c f7 ff ff       	call   129ba <ParseMacroBody>
   1324e:	49 89 c7             	mov    r15,rax
   13251:	e9 69 fe ff ff       	jmp    130bf <FindCallOfMacro+0x95>
   13256:	41 8b 06             	mov    eax,DWORD PTR [r14]
   13259:	83 c0 01             	add    eax,0x1
   1325c:	41 89 06             	mov    DWORD PTR [r14],eax
   1325f:	e9 48 ff ff ff       	jmp    131ac <FindCallOfMacro+0x182>
   13264:	49 83 c5 01          	add    r13,0x1
   13268:	41 0f be 75 00       	movsx  esi,BYTE PTR [r13+0x0]
   1326d:	48 8b 3d bc 6e 00 00 	mov    rdi,QWORD PTR [rip+0x6ebc]        # 1a130 <LETEXT>
   13274:	e8 07 05 00 00       	call   13780 <isin>
   13279:	85 c0                	test   eax,eax
   1327b:	75 e7                	jne    13264 <FindCallOfMacro+0x23a>
   1327d:	89 c5                	mov    ebp,eax
   1327f:	4c 89 ea             	mov    rdx,r13
   13282:	48 29 da             	sub    rdx,rbx
   13285:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   1328a:	4c 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],r13
   1328f:	41 89 d5             	mov    r13d,edx
   13292:	4c 8b 7c 24 08       	mov    r15,QWORD PTR [rsp+0x8]
   13297:	4c 89 74 24 38       	mov    QWORD PTR [rsp+0x38],r14
   1329c:	44 8b 74 24 14       	mov    r14d,DWORD PTR [rsp+0x14]
   132a1:	4c 89 a4 24 30 01 00 	mov    QWORD PTR [rsp+0x130],r12
   132a8:	00 
   132a9:	eb 08                	jmp    132b3 <FindCallOfMacro+0x289>
   132ab:	49 89 dd             	mov    r13,rbx
   132ae:	eb b8                	jmp    13268 <FindCallOfMacro+0x23e>
   132b0:	83 c5 01             	add    ebp,0x1
   132b3:	44 39 f5             	cmp    ebp,r14d
   132b6:	7d 47                	jge    132ff <FindCallOfMacro+0x2d5>
   132b8:	48 63 c5             	movsxd rax,ebp
   132bb:	48 8d 14 80          	lea    rdx,[rax+rax*4]
   132bf:	48 8d 04 90          	lea    rax,[rax+rdx*4]
   132c3:	4d 8d 24 c7          	lea    r12,[r15+rax*8]
   132c7:	4c 89 e7             	mov    rdi,r12
   132ca:	e8 f1 fd fe ff       	call   30c0 <strlen@plt>
   132cf:	41 39 c5             	cmp    r13d,eax
   132d2:	75 dc                	jne    132b0 <FindCallOfMacro+0x286>
   132d4:	49 63 d5             	movsxd rdx,r13d
   132d7:	4c 89 e6             	mov    rsi,r12
   132da:	48 89 df             	mov    rdi,rbx
   132dd:	e8 9e fd fe ff       	call   3080 <strncmp@plt>
   132e2:	85 c0                	test   eax,eax
   132e4:	75 ca                	jne    132b0 <FindCallOfMacro+0x286>
   132e6:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
   132eb:	4c 8b 6c 24 30       	mov    r13,QWORD PTR [rsp+0x30]
   132f0:	4c 8b 74 24 38       	mov    r14,QWORD PTR [rsp+0x38]
   132f5:	4c 8b a4 24 30 01 00 	mov    r12,QWORD PTR [rsp+0x130]
   132fc:	00 
   132fd:	eb 1c                	jmp    1331b <FindCallOfMacro+0x2f1>
   132ff:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
   13304:	4c 8b 6c 24 30       	mov    r13,QWORD PTR [rsp+0x30]
   13309:	4c 8b 74 24 38       	mov    r14,QWORD PTR [rsp+0x38]
   1330e:	4c 8b a4 24 30 01 00 	mov    r12,QWORD PTR [rsp+0x130]
   13315:	00 
   13316:	bd ff ff ff ff       	mov    ebp,0xffffffff
   1331b:	83 fd ff             	cmp    ebp,0xffffffff
   1331e:	74 05                	je     13325 <FindCallOfMacro+0x2fb>
   13320:	4d 89 ef             	mov    r15,r13
   13323:	eb 1f                	jmp    13344 <FindCallOfMacro+0x31a>
   13325:	48 63 d2             	movsxd rdx,edx
   13328:	4c 89 e1             	mov    rcx,r12
   1332b:	be 01 00 00 00       	mov    esi,0x1
   13330:	48 89 df             	mov    rdi,rbx
   13333:	e8 a8 fe fe ff       	call   31e0 <fwrite@plt>
   13338:	4d 89 ef             	mov    r15,r13
   1333b:	e9 7f fd ff ff       	jmp    130bf <FindCallOfMacro+0x95>
   13340:	49 83 c7 01          	add    r15,0x1
   13344:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
   13348:	3c 20                	cmp    al,0x20
   1334a:	74 f4                	je     13340 <FindCallOfMacro+0x316>
   1334c:	3c 09                	cmp    al,0x9
   1334e:	74 f0                	je     13340 <FindCallOfMacro+0x316>
   13350:	41 80 7d 00 28       	cmp    BYTE PTR [r13+0x0],0x28
   13355:	75 52                	jne    133a9 <FindCallOfMacro+0x37f>
   13357:	48 8d 7c 24 40       	lea    rdi,[rsp+0x40]
   1335c:	b9 15 00 00 00       	mov    ecx,0x15
   13361:	b8 00 00 00 00       	mov    eax,0x0
   13366:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
   13369:	48 8d 5c 24 40       	lea    rbx,[rsp+0x40]
   1336e:	4c 89 f2             	mov    rdx,r14
   13371:	48 89 de             	mov    rsi,rbx
   13374:	4c 89 ef             	mov    rdi,r13
   13377:	e8 32 f2 ff ff       	call   125ae <ParseArgsOfCalledMacro>
   1337c:	49 89 c7             	mov    r15,rax
   1337f:	41 54                	push   r12
   13381:	ff 74 24 28          	push   QWORD PTR [rsp+0x28]
   13385:	4c 8b 4c 24 28       	mov    r9,QWORD PTR [rsp+0x28]
   1338a:	4d 89 f0             	mov    r8,r14
   1338d:	48 89 d9             	mov    rcx,rbx
   13390:	89 ea                	mov    edx,ebp
   13392:	8b 74 24 24          	mov    esi,DWORD PTR [rsp+0x24]
   13396:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
   1339b:	e8 5d 00 00 00       	call   133fd <ExpandMacroCall>
   133a0:	48 83 c4 10          	add    rsp,0x10
   133a4:	e9 16 fd ff ff       	jmp    130bf <FindCallOfMacro+0x95>
   133a9:	48 63 d2             	movsxd rdx,edx
   133ac:	4c 89 e1             	mov    rcx,r12
   133af:	be 01 00 00 00       	mov    esi,0x1
   133b4:	48 89 df             	mov    rdi,rbx
   133b7:	e8 24 fe fe ff       	call   31e0 <fwrite@plt>
   133bc:	eb 04                	jmp    133c2 <FindCallOfMacro+0x398>
   133be:	49 83 c5 01          	add    r13,0x1
   133c2:	4d 39 fd             	cmp    r13,r15
   133c5:	0f 83 f4 fc ff ff    	jae    130bf <FindCallOfMacro+0x95>
   133cb:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   133d0:	3c 20                	cmp    al,0x20
   133d2:	0f 94 c2             	sete   dl
   133d5:	3c 09                	cmp    al,0x9
   133d7:	0f 94 c1             	sete   cl
   133da:	08 ca                	or     dl,cl
   133dc:	74 e0                	je     133be <FindCallOfMacro+0x394>
   133de:	0f be f8             	movsx  edi,al
   133e1:	4c 89 e6             	mov    rsi,r12
   133e4:	e8 37 fd fe ff       	call   3120 <fputc@plt>
   133e9:	eb d3                	jmp    133be <FindCallOfMacro+0x394>
   133eb:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
   133f2:	5b                   	pop    rbx
   133f3:	5d                   	pop    rbp
   133f4:	41 5c                	pop    r12
   133f6:	41 5d                	pop    r13
   133f8:	41 5e                	pop    r14
   133fa:	41 5f                	pop    r15
   133fc:	c3                   	ret

00000000000133fd <ExpandMacroCall>:
   133fd:	41 57                	push   r15
   133ff:	41 56                	push   r14
   13401:	41 55                	push   r13
   13403:	41 54                	push   r12
   13405:	55                   	push   rbp
   13406:	53                   	push   rbx
   13407:	48 81 ec 28 08 00 00 	sub    rsp,0x828
   1340e:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
   13413:	89 74 24 14          	mov    DWORD PTR [rsp+0x14],esi
   13417:	89 d6                	mov    esi,edx
   13419:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
   1341e:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
   13422:	4d 89 cc             	mov    r12,r9
   13425:	48 8b ac 24 60 08 00 	mov    rbp,QWORD PTR [rsp+0x860]
   1342c:	00 
   1342d:	4c 8b bc 24 68 08 00 	mov    r15,QWORD PTR [rsp+0x868]
   13434:	00 
   13435:	48 63 c2             	movsxd rax,edx
   13438:	48 8d 14 80          	lea    rdx,[rax+rax*4]
   1343c:	48 8d 04 90          	lea    rax,[rax+rdx*4]
   13440:	4c 8d 2c c7          	lea    r13,[rdi+rax*8]
   13444:	44 8b 89 88 00 00 00 	mov    r9d,DWORD PTR [rcx+0x88]
   1344b:	45 8b 85 88 00 00 00 	mov    r8d,DWORD PTR [r13+0x88]
   13452:	45 39 c1             	cmp    r9d,r8d
   13455:	75 1a                	jne    13471 <ExpandMacroCall+0x74>
   13457:	b8 00 00 00 00       	mov    eax,0x0
   1345c:	8b 55 00             	mov    edx,DWORD PTR [rbp+0x0]
   1345f:	39 c2                	cmp    edx,eax
   13461:	7e 64                	jle    134c7 <ExpandMacroCall+0xca>
   13463:	48 63 d0             	movsxd rdx,eax
   13466:	41 39 34 94          	cmp    DWORD PTR [r12+rdx*4],esi
   1346a:	74 30                	je     1349c <ExpandMacroCall+0x9f>
   1346c:	83 c0 01             	add    eax,0x1
   1346f:	eb eb                	jmp    1345c <ExpandMacroCall+0x5f>
   13471:	4c 89 e9             	mov    rcx,r13
   13474:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
   13478:	8b 10                	mov    edx,DWORD PTR [rax]
   1347a:	48 8d 35 67 3b 00 00 	lea    rsi,[rip+0x3b67]        # 16fe8 <_IO_stdin_used+0x1fe8>
   13481:	48 8b 3d 58 77 00 00 	mov    rdi,QWORD PTR [rip+0x7758]        # 1abe0 <stderr@GLIBC_2.2.5>
   13488:	b8 00 00 00 00       	mov    eax,0x0
   1348d:	e8 ae fc fe ff       	call   3140 <fprintf@plt>
   13492:	bf 01 00 00 00       	mov    edi,0x1
   13497:	e8 34 fd fe ff       	call   31d0 <exit@plt>
   1349c:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
   134a0:	8b 10                	mov    edx,DWORD PTR [rax]
   134a2:	4c 89 e9             	mov    rcx,r13
   134a5:	48 8d 35 74 3b 00 00 	lea    rsi,[rip+0x3b74]        # 17020 <_IO_stdin_used+0x2020>
   134ac:	48 8b 3d 2d 77 00 00 	mov    rdi,QWORD PTR [rip+0x772d]        # 1abe0 <stderr@GLIBC_2.2.5>
   134b3:	b8 00 00 00 00       	mov    eax,0x0
   134b8:	e8 83 fc fe ff       	call   3140 <fprintf@plt>
   134bd:	bf 01 00 00 00       	mov    edi,0x1
   134c2:	e8 09 fd fe ff       	call   31d0 <exit@plt>
   134c7:	83 fa 3f             	cmp    edx,0x3f
   134ca:	7f 17                	jg     134e3 <ExpandMacroCall+0xe6>
   134cc:	8d 42 01             	lea    eax,[rdx+0x1]
   134cf:	89 45 00             	mov    DWORD PTR [rbp+0x0],eax
   134d2:	48 63 d2             	movsxd rdx,edx
   134d5:	41 89 34 94          	mov    DWORD PTR [r12+rdx*4],esi
   134d9:	bb 00 00 00 00       	mov    ebx,0x0
   134de:	e9 8f 00 00 00       	jmp    13572 <ExpandMacroCall+0x175>
   134e3:	b9 40 00 00 00       	mov    ecx,0x40
   134e8:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
   134ec:	8b 10                	mov    edx,DWORD PTR [rax]
   134ee:	48 8d 35 5b 3b 00 00 	lea    rsi,[rip+0x3b5b]        # 17050 <_IO_stdin_used+0x2050>
   134f5:	48 8b 3d e4 76 00 00 	mov    rdi,QWORD PTR [rip+0x76e4]        # 1abe0 <stderr@GLIBC_2.2.5>
   134fc:	b8 00 00 00 00       	mov    eax,0x0
   13501:	e8 3a fc fe ff       	call   3140 <fprintf@plt>
   13506:	bf 01 00 00 00       	mov    edi,0x1
   1350b:	e8 c0 fc fe ff       	call   31d0 <exit@plt>
   13510:	48 63 c3             	movsxd rax,ebx
   13513:	48 c1 e0 03          	shl    rax,0x3
   13517:	49 03 85 90 00 00 00 	add    rax,QWORD PTR [r13+0x90]
   1351e:	4c 8d 74 24 20       	lea    r14,[rsp+0x20]
   13523:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   13526:	41 b8 00 08 00 00    	mov    r8d,0x800
   1352c:	4c 89 f1             	mov    rcx,r14
   1352f:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
   13534:	4c 89 ef             	mov    rdi,r13
   13537:	e8 d9 f8 ff ff       	call   12e15 <SubstituteArgs>
   1353c:	48 83 ec 08          	sub    rsp,0x8
   13540:	41 57                	push   r15
   13542:	49 89 e9             	mov    r9,rbp
   13545:	4d 89 e0             	mov    r8,r12
   13548:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
   1354d:	8b 54 24 24          	mov    edx,DWORD PTR [rsp+0x24]
   13551:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
   13556:	4c 89 f7             	mov    rdi,r14
   13559:	e8 cc fa ff ff       	call   1302a <FindCallOfMacro>
   1355e:	4c 89 fe             	mov    rsi,r15
   13561:	bf 0a 00 00 00       	mov    edi,0xa
   13566:	e8 b5 fb fe ff       	call   3120 <fputc@plt>
   1356b:	83 c3 01             	add    ebx,0x1
   1356e:	48 83 c4 10          	add    rsp,0x10
   13572:	41 39 9d 98 00 00 00 	cmp    DWORD PTR [r13+0x98],ebx
   13579:	7f 95                	jg     13510 <ExpandMacroCall+0x113>
   1357b:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
   1357e:	83 e8 01             	sub    eax,0x1
   13581:	89 45 00             	mov    DWORD PTR [rbp+0x0],eax
   13584:	48 81 c4 28 08 00 00 	add    rsp,0x828
   1358b:	5b                   	pop    rbx
   1358c:	5d                   	pop    rbp
   1358d:	41 5c                	pop    r12
   1358f:	41 5d                	pop    r13
   13591:	41 5e                	pop    r14
   13593:	41 5f                	pop    r15
   13595:	c3                   	ret

0000000000013596 <Preprocess>:
   13596:	41 56                	push   r14
   13598:	41 55                	push   r13
   1359a:	41 54                	push   r12
   1359c:	55                   	push   rbp
   1359d:	53                   	push   rbx
   1359e:	48 81 ec 30 01 00 00 	sub    rsp,0x130
   135a5:	49 89 fe             	mov    r14,rdi
   135a8:	48 8d 35 f1 24 00 00 	lea    rsi,[rip+0x24f1]        # 15aa0 <_IO_stdin_used+0xaa0>
   135af:	e8 0c fc fe ff       	call   31c0 <fopen@plt>
   135b4:	48 85 c0             	test   rax,rax
   135b7:	0f 84 52 01 00 00    	je     1370f <Preprocess+0x179>
   135bd:	48 89 c3             	mov    rbx,rax
   135c0:	ba 02 00 00 00       	mov    edx,0x2
   135c5:	be 00 00 00 00       	mov    esi,0x0
   135ca:	48 89 c7             	mov    rdi,rax
   135cd:	e8 be fb fe ff       	call   3190 <fseek@plt>
   135d2:	85 c0                	test   eax,eax
   135d4:	0f 85 5c 01 00 00    	jne    13736 <Preprocess+0x1a0>
   135da:	48 89 df             	mov    rdi,rbx
   135dd:	e8 6e fb fe ff       	call   3150 <ftell@plt>
   135e2:	48 89 c5             	mov    rbp,rax
   135e5:	48 89 df             	mov    rdi,rbx
   135e8:	e8 f3 fa fe ff       	call   30e0 <rewind@plt>
   135ed:	8d 7d 01             	lea    edi,[rbp+0x1]
   135f0:	48 63 ff             	movsxd rdi,edi
   135f3:	e8 78 fb fe ff       	call   3170 <malloc@plt>
   135f8:	49 89 c5             	mov    r13,rax
   135fb:	48 63 ed             	movsxd rbp,ebp
   135fe:	48 89 d9             	mov    rcx,rbx
   13601:	48 89 ea             	mov    rdx,rbp
   13604:	be 01 00 00 00       	mov    esi,0x1
   13609:	48 89 c7             	mov    rdi,rax
   1360c:	e8 8f fa fe ff       	call   30a0 <fread@plt>
   13611:	41 c6 44 2d 00 00    	mov    BYTE PTR [r13+rbp*1+0x0],0x0
   13617:	48 c7 84 24 28 01 00 	mov    QWORD PTR [rsp+0x128],0x0
   1361e:	00 00 00 00 00 
   13623:	c7 84 24 24 01 00 00 	mov    DWORD PTR [rsp+0x124],0x0
   1362a:	00 00 00 00 
   1362e:	c7 84 24 20 01 00 00 	mov    DWORD PTR [rsp+0x120],0x0
   13635:	00 00 00 00 
   13639:	48 8d 8c 24 20 01 00 	lea    rcx,[rsp+0x120]
   13640:	00 
   13641:	48 8d 94 24 24 01 00 	lea    rdx,[rsp+0x124]
   13648:	00 
   13649:	48 8d b4 24 28 01 00 	lea    rsi,[rsp+0x128]
   13650:	00 
   13651:	4c 89 ef             	mov    rdi,r13
   13654:	e8 87 f6 ff ff       	call   12ce0 <ParseMacro>
   13659:	4c 89 f7             	mov    rdi,r14
   1365c:	e8 5f fa fe ff       	call   30c0 <strlen@plt>
   13661:	49 89 c4             	mov    r12,rax
   13664:	48 8d 78 03          	lea    rdi,[rax+0x3]
   13668:	e8 03 fb fe ff       	call   3170 <malloc@plt>
   1366d:	48 89 c5             	mov    rbp,rax
   13670:	4c 89 e2             	mov    rdx,r12
   13673:	4c 89 f6             	mov    rsi,r14
   13676:	48 89 c7             	mov    rdi,rax
   13679:	e8 e2 fa fe ff       	call   3160 <memcpy@plt>
   1367e:	42 c6 44 25 00 2e    	mov    BYTE PTR [rbp+r12*1+0x0],0x2e
   13684:	42 c6 44 25 01 69    	mov    BYTE PTR [rbp+r12*1+0x1],0x69
   1368a:	42 c6 44 25 02 00    	mov    BYTE PTR [rbp+r12*1+0x2],0x0
   13690:	48 8d 35 24 3b 00 00 	lea    rsi,[rip+0x3b24]        # 171bb <_IO_stdin_used+0x21bb>
   13697:	48 89 ef             	mov    rdi,rbp
   1369a:	e8 21 fb fe ff       	call   31c0 <fopen@plt>
   1369f:	49 89 c4             	mov    r12,rax
   136a2:	48 85 c0             	test   rax,rax
   136a5:	0f 84 b0 00 00 00    	je     1375b <Preprocess+0x1c5>
   136ab:	c7 84 24 1c 01 00 00 	mov    DWORD PTR [rsp+0x11c],0x1
   136b2:	01 00 00 00 
   136b6:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
   136bd:	00 
   136be:	48 8d 8c 24 1c 01 00 	lea    rcx,[rsp+0x11c]
   136c5:	00 
   136c6:	48 83 ec 08          	sub    rsp,0x8
   136ca:	50                   	push   rax
   136cb:	4c 8d 4c 24 1c       	lea    r9,[rsp+0x1c]
   136d0:	4c 8d 44 24 20       	lea    r8,[rsp+0x20]
   136d5:	8b 94 24 34 01 00 00 	mov    edx,DWORD PTR [rsp+0x134]
   136dc:	48 8b b4 24 38 01 00 	mov    rsi,QWORD PTR [rsp+0x138]
   136e3:	00 
   136e4:	4c 89 ef             	mov    rdi,r13
   136e7:	e8 3e f9 ff ff       	call   1302a <FindCallOfMacro>
   136ec:	4c 89 e7             	mov    rdi,r12
   136ef:	e8 bc f9 fe ff       	call   30b0 <fclose@plt>
   136f4:	48 89 df             	mov    rdi,rbx
   136f7:	e8 b4 f9 fe ff       	call   30b0 <fclose@plt>
   136fc:	48 89 e8             	mov    rax,rbp
   136ff:	48 81 c4 40 01 00 00 	add    rsp,0x140
   13706:	5b                   	pop    rbx
   13707:	5d                   	pop    rbp
   13708:	41 5c                	pop    r12
   1370a:	41 5d                	pop    r13
   1370c:	41 5e                	pop    r14
   1370e:	c3                   	ret
   1370f:	48 8b 0d ca 74 00 00 	mov    rcx,QWORD PTR [rip+0x74ca]        # 1abe0 <stderr@GLIBC_2.2.5>
   13716:	ba 2d 00 00 00       	mov    edx,0x2d
   1371b:	be 01 00 00 00       	mov    esi,0x1
   13720:	48 8d 3d 01 29 00 00 	lea    rdi,[rip+0x2901]        # 16028 <_IO_stdin_used+0x1028>
   13727:	e8 b4 fa fe ff       	call   31e0 <fwrite@plt>
   1372c:	bf 01 00 00 00       	mov    edi,0x1
   13731:	e8 9a fa fe ff       	call   31d0 <exit@plt>
   13736:	4c 89 f2             	mov    rdx,r14
   13739:	48 8d 35 57 39 00 00 	lea    rsi,[rip+0x3957]        # 17097 <_IO_stdin_used+0x2097>
   13740:	48 8b 3d 99 74 00 00 	mov    rdi,QWORD PTR [rip+0x7499]        # 1abe0 <stderr@GLIBC_2.2.5>
   13747:	b8 00 00 00 00       	mov    eax,0x0
   1374c:	e8 ef f9 fe ff       	call   3140 <fprintf@plt>
   13751:	bf 01 00 00 00       	mov    edi,0x1
   13756:	e8 75 fa fe ff       	call   31d0 <exit@plt>
   1375b:	48 89 ea             	mov    rdx,rbp
   1375e:	48 8d 35 53 39 00 00 	lea    rsi,[rip+0x3953]        # 170b8 <_IO_stdin_used+0x20b8>
   13765:	48 8b 3d 74 74 00 00 	mov    rdi,QWORD PTR [rip+0x7474]        # 1abe0 <stderr@GLIBC_2.2.5>
   1376c:	b8 00 00 00 00       	mov    eax,0x0
   13771:	e8 ca f9 fe ff       	call   3140 <fprintf@plt>
   13776:	bf 01 00 00 00       	mov    edi,0x1
   1377b:	e8 50 fa fe ff       	call   31d0 <exit@plt>

0000000000013780 <isin>:
   13780:	ba 00 00 00 00       	mov    edx,0x0
   13785:	eb 03                	jmp    1378a <isin+0xa>
   13787:	83 c2 01             	add    edx,0x1
   1378a:	48 63 c2             	movsxd rax,edx
   1378d:	0f b6 04 07          	movzx  eax,BYTE PTR [rdi+rax*1]
   13791:	84 c0                	test   al,al
   13793:	74 0b                	je     137a0 <isin+0x20>
   13795:	40 38 f0             	cmp    al,sil
   13798:	75 ed                	jne    13787 <isin+0x7>
   1379a:	b8 01 00 00 00       	mov    eax,0x1
   1379f:	c3                   	ret
   137a0:	b8 00 00 00 00       	mov    eax,0x0
   137a5:	c3                   	ret

00000000000137a6 <is2arrin>:
   137a6:	41 54                	push   r12
   137a8:	55                   	push   rbp
   137a9:	53                   	push   rbx
   137aa:	48 89 fd             	mov    rbp,rdi
   137ad:	49 89 f4             	mov    r12,rsi
   137b0:	bb 00 00 00 00       	mov    ebx,0x0
   137b5:	eb 03                	jmp    137ba <is2arrin+0x14>
   137b7:	83 c3 01             	add    ebx,0x1
   137ba:	48 63 c3             	movsxd rax,ebx
   137bd:	48 8b 7c c5 00       	mov    rdi,QWORD PTR [rbp+rax*8+0x0]
   137c2:	48 85 ff             	test   rdi,rdi
   137c5:	74 13                	je     137da <is2arrin+0x34>
   137c7:	4c 89 e6             	mov    rsi,r12
   137ca:	e8 81 f8 fe ff       	call   3050 <strcasecmp@plt>
   137cf:	85 c0                	test   eax,eax
   137d1:	75 e4                	jne    137b7 <is2arrin+0x11>
   137d3:	b8 01 00 00 00       	mov    eax,0x1
   137d8:	eb 05                	jmp    137df <is2arrin+0x39>
   137da:	b8 00 00 00 00       	mov    eax,0x0
   137df:	5b                   	pop    rbx
   137e0:	5d                   	pop    rbp
   137e1:	41 5c                	pop    r12
   137e3:	c3                   	ret

00000000000137e4 <expr_is_const>:
   137e4:	ba 00 00 00 00       	mov    edx,0x0
   137e9:	b9 00 00 00 00       	mov    ecx,0x0
   137ee:	be 00 00 00 00       	mov    esi,0x0
   137f3:	eb 08                	jmp    137fd <expr_is_const+0x19>
   137f5:	b9 01 00 00 00       	mov    ecx,0x1
   137fa:	83 c2 01             	add    edx,0x1
   137fd:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   13800:	39 d0                	cmp    eax,edx
   13802:	7e 1d                	jle    13821 <expr_is_const+0x3d>
   13804:	48 63 c2             	movsxd rax,edx
   13807:	48 c1 e0 04          	shl    rax,0x4
   1380b:	48 03 47 08          	add    rax,QWORD PTR [rdi+0x8]
   1380f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   13812:	3c 0e                	cmp    al,0xe
   13814:	74 df                	je     137f5 <expr_is_const+0x11>
   13816:	3c 28                	cmp    al,0x28
   13818:	75 e0                	jne    137fa <expr_is_const+0x16>
   1381a:	be 01 00 00 00       	mov    esi,0x1
   1381f:	eb d9                	jmp    137fa <expr_is_const+0x16>
   13821:	89 f2                	mov    edx,esi
   13823:	85 c9                	test   ecx,ecx
   13825:	0f 94 c0             	sete   al
   13828:	40 08 f0             	or     al,sil
   1382b:	74 17                	je     13844 <expr_is_const+0x60>
   1382d:	85 f6                	test   esi,esi
   1382f:	0f 94 c0             	sete   al
   13832:	08 c8                	or     al,cl
   13834:	74 14                	je     1384a <expr_is_const+0x66>
   13836:	09 ce                	or     esi,ecx
   13838:	74 16                	je     13850 <expr_is_const+0x6c>
   1383a:	84 ca                	test   dl,cl
   1383c:	74 18                	je     13856 <expr_is_const+0x72>
   1383e:	b8 00 00 00 00       	mov    eax,0x0
   13843:	c3                   	ret
   13844:	b8 00 00 00 00       	mov    eax,0x0
   13849:	c3                   	ret
   1384a:	b8 02 00 00 00       	mov    eax,0x2
   1384f:	c3                   	ret
   13850:	b8 01 00 00 00       	mov    eax,0x1
   13855:	c3                   	ret
   13856:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1385b:	c3                   	ret

000000000001385c <expr_label_count>:
   1385c:	ba 00 00 00 00       	mov    edx,0x0
   13861:	b9 00 00 00 00       	mov    ecx,0x0
   13866:	eb 03                	jmp    1386b <expr_label_count+0xf>
   13868:	83 c2 01             	add    edx,0x1
   1386b:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   1386e:	39 d0                	cmp    eax,edx
   13870:	7e 15                	jle    13887 <expr_label_count+0x2b>
   13872:	48 63 c2             	movsxd rax,edx
   13875:	48 c1 e0 04          	shl    rax,0x4
   13879:	48 03 47 08          	add    rax,QWORD PTR [rdi+0x8]
   1387d:	80 38 0e             	cmp    BYTE PTR [rax],0xe
   13880:	75 e6                	jne    13868 <expr_label_count+0xc>
   13882:	83 c1 01             	add    ecx,0x1
   13885:	eb e1                	jmp    13868 <expr_label_count+0xc>
   13887:	89 c8                	mov    eax,ecx
   13889:	c3                   	ret

000000000001388a <resolve_imm>:
   1388a:	55                   	push   rbp
   1388b:	53                   	push   rbx
   1388c:	48 83 ec 28          	sub    rsp,0x28
   13890:	48 89 fd             	mov    rbp,rdi
   13893:	89 d3                	mov    ebx,edx
   13895:	0f b7 57 0a          	movzx  edx,WORD PTR [rdi+0xa]
   13899:	48 8b bf 98 01 00 00 	mov    rdi,QWORD PTR [rdi+0x198]
   138a0:	48 63 f6             	movsxd rsi,esi
   138a3:	48 8d 04 76          	lea    rax,[rsi+rsi*2]
   138a7:	48 c1 e0 05          	shl    rax,0x5
   138ab:	48 8d 44 05 10       	lea    rax,[rbp+rax*1+0x10]
   138b0:	f3 0f 6f 40 08       	movdqu xmm0,XMMWORD PTR [rax+0x8]
   138b5:	0f 11 04 24          	movups XMMWORD PTR [rsp],xmm0
   138b9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   138bd:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
   138c2:	89 d6                	mov    esi,edx
   138c4:	e8 f3 c4 ff ff       	call   fdbc <resolve_expr>
   138c9:	48 83 c4 20          	add    rsp,0x20
   138cd:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
   138d1:	74 28                	je     138fb <resolve_imm+0x71>
   138d3:	8b 95 a8 01 00 00    	mov    edx,DWORD PTR [rbp+0x1a8]
   138d9:	29 da                	sub    edx,ebx
   138db:	83 fb 04             	cmp    ebx,0x4
   138de:	74 49                	je     13929 <resolve_imm+0x9f>
   138e0:	7f 20                	jg     13902 <resolve_imm+0x78>
   138e2:	83 fb 01             	cmp    ebx,0x1
   138e5:	74 2f                	je     13916 <resolve_imm+0x8c>
   138e7:	83 fb 02             	cmp    ebx,0x2
   138ea:	75 36                	jne    13922 <resolve_imm+0x98>
   138ec:	48 63 d2             	movsxd rdx,edx
   138ef:	48 03 95 a0 01 00 00 	add    rdx,QWORD PTR [rbp+0x1a0]
   138f6:	66 89 02             	mov    WORD PTR [rdx],ax
   138f9:	eb 27                	jmp    13922 <resolve_imm+0x98>
   138fb:	b8 00 00 00 00       	mov    eax,0x0
   13900:	eb d1                	jmp    138d3 <resolve_imm+0x49>
   13902:	83 fb 08             	cmp    ebx,0x8
   13905:	75 1b                	jne    13922 <resolve_imm+0x98>
   13907:	48 63 d2             	movsxd rdx,edx
   1390a:	48 03 95 a0 01 00 00 	add    rdx,QWORD PTR [rbp+0x1a0]
   13911:	48 89 02             	mov    QWORD PTR [rdx],rax
   13914:	eb 0c                	jmp    13922 <resolve_imm+0x98>
   13916:	48 63 d2             	movsxd rdx,edx
   13919:	48 03 95 a0 01 00 00 	add    rdx,QWORD PTR [rbp+0x1a0]
   13920:	88 02                	mov    BYTE PTR [rdx],al
   13922:	48 83 c4 08          	add    rsp,0x8
   13926:	5b                   	pop    rbx
   13927:	5d                   	pop    rbp
   13928:	c3                   	ret
   13929:	48 63 d2             	movsxd rdx,edx
   1392c:	48 03 95 a0 01 00 00 	add    rdx,QWORD PTR [rbp+0x1a0]
   13933:	89 02                	mov    DWORD PTR [rdx],eax
   13935:	eb eb                	jmp    13922 <resolve_imm+0x98>

0000000000013937 <get_signed_imm_size_>:
   13937:	48 81 ff ff 00 00 00 	cmp    rdi,0xff
   1393e:	76 19                	jbe    13959 <get_signed_imm_size_+0x22>
   13940:	48 81 ff ff ff 00 00 	cmp    rdi,0xffff
   13947:	76 16                	jbe    1395f <get_signed_imm_size_+0x28>
   13949:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1394e:	48 39 f8             	cmp    rax,rdi
   13951:	73 12                	jae    13965 <get_signed_imm_size_+0x2e>
   13953:	b8 08 00 00 00       	mov    eax,0x8
   13958:	c3                   	ret
   13959:	b8 01 00 00 00       	mov    eax,0x1
   1395e:	c3                   	ret
   1395f:	b8 02 00 00 00       	mov    eax,0x2
   13964:	c3                   	ret
   13965:	b8 04 00 00 00       	mov    eax,0x4
   1396a:	c3                   	ret

000000000001396b <get_unsigned_imm_size_>:
   1396b:	48 81 ff ff 00 00 00 	cmp    rdi,0xff
   13972:	76 19                	jbe    1398d <get_unsigned_imm_size_+0x22>
   13974:	48 81 ff ff ff 00 00 	cmp    rdi,0xffff
   1397b:	76 16                	jbe    13993 <get_unsigned_imm_size_+0x28>
   1397d:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13982:	48 39 f8             	cmp    rax,rdi
   13985:	73 12                	jae    13999 <get_unsigned_imm_size_+0x2e>
   13987:	b8 08 00 00 00       	mov    eax,0x8
   1398c:	c3                   	ret
   1398d:	b8 01 00 00 00       	mov    eax,0x1
   13992:	c3                   	ret
   13993:	b8 02 00 00 00       	mov    eax,0x2
   13998:	c3                   	ret
   13999:	b8 04 00 00 00       	mov    eax,0x4
   1399e:	c3                   	ret

000000000001399f <get_lab_indx>:
   1399f:	55                   	push   rbp
   139a0:	53                   	push   rbx
   139a1:	48 83 ec 08          	sub    rsp,0x8
   139a5:	48 89 fd             	mov    rbp,rdi
   139a8:	bb 00 00 00 00       	mov    ebx,0x0
   139ad:	eb 03                	jmp    139b2 <get_lab_indx+0x13>
   139af:	83 c3 01             	add    ebx,0x1
   139b2:	39 1d 4c 76 00 00    	cmp    DWORD PTR [rip+0x764c],ebx        # 1b004 <ast_len>
   139b8:	7e 28                	jle    139e2 <get_lab_indx+0x43>
   139ba:	48 63 f3             	movsxd rsi,ebx
   139bd:	48 69 f6 b8 01 00 00 	imul   rsi,rsi,0x1b8
   139c4:	48 03 35 3d 76 00 00 	add    rsi,QWORD PTR [rip+0x763d]        # 1b008 <ast>
   139cb:	80 3e 08             	cmp    BYTE PTR [rsi],0x8
   139ce:	75 df                	jne    139af <get_lab_indx+0x10>
   139d0:	48 83 c6 10          	add    rsi,0x10
   139d4:	48 89 ef             	mov    rdi,rbp
   139d7:	e8 64 0e 00 00       	call   14840 <astrcmp>
   139dc:	85 c0                	test   eax,eax
   139de:	75 cf                	jne    139af <get_lab_indx+0x10>
   139e0:	eb 05                	jmp    139e7 <get_lab_indx+0x48>
   139e2:	bb ff ff ff ff       	mov    ebx,0xffffffff
   139e7:	89 d8                	mov    eax,ebx
   139e9:	48 83 c4 08          	add    rsp,0x8
   139ed:	5b                   	pop    rbx
   139ee:	5d                   	pop    rbp
   139ef:	c3                   	ret

00000000000139f0 <get_label_from_expr>:
   139f0:	ba 00 00 00 00       	mov    edx,0x0
   139f5:	eb 03                	jmp    139fa <get_label_from_expr+0xa>
   139f7:	83 c2 01             	add    edx,0x1
   139fa:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
   139ff:	39 d0                	cmp    eax,edx
   13a01:	7e 16                	jle    13a19 <get_label_from_expr+0x29>
   13a03:	48 63 c2             	movsxd rax,edx
   13a06:	48 c1 e0 04          	shl    rax,0x4
   13a0a:	48 03 44 24 10       	add    rax,QWORD PTR [rsp+0x10]
   13a0f:	80 38 0e             	cmp    BYTE PTR [rax],0xe
   13a12:	75 e3                	jne    139f7 <get_label_from_expr+0x7>
   13a14:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   13a18:	c3                   	ret
   13a19:	b8 00 00 00 00       	mov    eax,0x0
   13a1e:	c3                   	ret

0000000000013a1f <externed_label>:
   13a1f:	41 55                	push   r13
   13a21:	41 54                	push   r12
   13a23:	55                   	push   rbp
   13a24:	53                   	push   rbx
   13a25:	48 83 ec 08          	sub    rsp,0x8
   13a29:	49 89 fd             	mov    r13,rdi
   13a2c:	41 bc 00 00 00 00    	mov    r12d,0x0
   13a32:	eb 40                	jmp    13a74 <externed_label+0x55>
   13a34:	83 c3 01             	add    ebx,0x1
   13a37:	48 89 ea             	mov    rdx,rbp
   13a3a:	48 03 15 c7 75 00 00 	add    rdx,QWORD PTR [rip+0x75c7]        # 1b008 <ast>
   13a41:	39 5a 18             	cmp    DWORD PTR [rdx+0x18],ebx
   13a44:	7e 2a                	jle    13a70 <externed_label+0x51>
   13a46:	48 63 c3             	movsxd rax,ebx
   13a49:	48 c1 e0 03          	shl    rax,0x3
   13a4d:	48 03 42 10          	add    rax,QWORD PTR [rdx+0x10]
   13a51:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   13a54:	4c 89 ee             	mov    rsi,r13
   13a57:	e8 e4 0d 00 00       	call   14840 <astrcmp>
   13a5c:	85 c0                	test   eax,eax
   13a5e:	75 d4                	jne    13a34 <externed_label+0x15>
   13a60:	b8 01 00 00 00       	mov    eax,0x1
   13a65:	48 83 c4 08          	add    rsp,0x8
   13a69:	5b                   	pop    rbx
   13a6a:	5d                   	pop    rbp
   13a6b:	41 5c                	pop    r12
   13a6d:	41 5d                	pop    r13
   13a6f:	c3                   	ret
   13a70:	41 83 c4 01          	add    r12d,0x1
   13a74:	44 39 25 89 75 00 00 	cmp    DWORD PTR [rip+0x7589],r12d        # 1b004 <ast_len>
   13a7b:	7e 20                	jle    13a9d <externed_label+0x7e>
   13a7d:	49 63 ec             	movsxd rbp,r12d
   13a80:	48 69 ed b8 01 00 00 	imul   rbp,rbp,0x1b8
   13a87:	48 89 e8             	mov    rax,rbp
   13a8a:	48 03 05 77 75 00 00 	add    rax,QWORD PTR [rip+0x7577]        # 1b008 <ast>
   13a91:	80 38 0f             	cmp    BYTE PTR [rax],0xf
   13a94:	75 da                	jne    13a70 <externed_label+0x51>
   13a96:	bb 00 00 00 00       	mov    ebx,0x0
   13a9b:	eb 9a                	jmp    13a37 <externed_label+0x18>
   13a9d:	b8 00 00 00 00       	mov    eax,0x0
   13aa2:	eb c1                	jmp    13a65 <externed_label+0x46>

0000000000013aa4 <find_lab_addr>:
   13aa4:	41 54                	push   r12
   13aa6:	55                   	push   rbp
   13aa7:	53                   	push   rbx
   13aa8:	49 89 fc             	mov    r12,rdi
   13aab:	bb 00 00 00 00       	mov    ebx,0x0
   13ab0:	eb 03                	jmp    13ab5 <find_lab_addr+0x11>
   13ab2:	83 c3 01             	add    ebx,0x1
   13ab5:	39 1d 49 75 00 00    	cmp    DWORD PTR [rip+0x7549],ebx        # 1b004 <ast_len>
   13abb:	7e 39                	jle    13af6 <find_lab_addr+0x52>
   13abd:	48 63 eb             	movsxd rbp,ebx
   13ac0:	48 69 ed b8 01 00 00 	imul   rbp,rbp,0x1b8
   13ac7:	48 89 ef             	mov    rdi,rbp
   13aca:	48 03 3d 37 75 00 00 	add    rdi,QWORD PTR [rip+0x7537]        # 1b008 <ast>
   13ad1:	80 3f 08             	cmp    BYTE PTR [rdi],0x8
   13ad4:	75 dc                	jne    13ab2 <find_lab_addr+0xe>
   13ad6:	48 83 c7 10          	add    rdi,0x10
   13ada:	4c 89 e6             	mov    rsi,r12
   13add:	e8 5e 0d 00 00       	call   14840 <astrcmp>
   13ae2:	85 c0                	test   eax,eax
   13ae4:	75 cc                	jne    13ab2 <find_lab_addr+0xe>
   13ae6:	48 03 2d 1b 75 00 00 	add    rbp,QWORD PTR [rip+0x751b]        # 1b008 <ast>
   13aed:	48 8b 85 98 00 00 00 	mov    rax,QWORD PTR [rbp+0x98]
   13af4:	eb 13                	jmp    13b09 <find_lab_addr+0x65>
   13af6:	4c 89 e7             	mov    rdi,r12
   13af9:	e8 21 ff ff ff       	call   13a1f <externed_label>
   13afe:	84 c0                	test   al,al
   13b00:	74 0c                	je     13b0e <find_lab_addr+0x6a>
   13b02:	48 c7 c0 fe ff ff ff 	mov    rax,0xfffffffffffffffe
   13b09:	5b                   	pop    rbx
   13b0a:	5d                   	pop    rbp
   13b0b:	41 5c                	pop    r12
   13b0d:	c3                   	ret
   13b0e:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
   13b15:	eb f2                	jmp    13b09 <find_lab_addr+0x65>

0000000000013b17 <find_sec_addr>:
   13b17:	41 54                	push   r12
   13b19:	55                   	push   rbp
   13b1a:	53                   	push   rbx
   13b1b:	49 89 fc             	mov    r12,rdi
   13b1e:	bb 00 00 00 00       	mov    ebx,0x0
   13b23:	eb 03                	jmp    13b28 <find_sec_addr+0x11>
   13b25:	83 c3 01             	add    ebx,0x1
   13b28:	39 1d d6 74 00 00    	cmp    DWORD PTR [rip+0x74d6],ebx        # 1b004 <ast_len>
   13b2e:	7e 36                	jle    13b66 <find_sec_addr+0x4f>
   13b30:	48 63 eb             	movsxd rbp,ebx
   13b33:	48 69 ed b8 01 00 00 	imul   rbp,rbp,0x1b8
   13b3a:	48 89 ef             	mov    rdi,rbp
   13b3d:	48 03 3d c4 74 00 00 	add    rdi,QWORD PTR [rip+0x74c4]        # 1b008 <ast>
   13b44:	80 3f 0b             	cmp    BYTE PTR [rdi],0xb
   13b47:	75 dc                	jne    13b25 <find_sec_addr+0xe>
   13b49:	48 83 c7 10          	add    rdi,0x10
   13b4d:	4c 89 e6             	mov    rsi,r12
   13b50:	e8 eb 0c 00 00       	call   14840 <astrcmp>
   13b55:	85 c0                	test   eax,eax
   13b57:	75 cc                	jne    13b25 <find_sec_addr+0xe>
   13b59:	48 03 2d a8 74 00 00 	add    rbp,QWORD PTR [rip+0x74a8]        # 1b008 <ast>
   13b60:	48 8b 45 58          	mov    rax,QWORD PTR [rbp+0x58]
   13b64:	eb 05                	jmp    13b6b <find_sec_addr+0x54>
   13b66:	b8 00 00 00 00       	mov    eax,0x0
   13b6b:	5b                   	pop    rbx
   13b6c:	5d                   	pop    rbp
   13b6d:	41 5c                	pop    r12
   13b6f:	c3                   	ret

0000000000013b70 <find_reg64_index>:
   13b70:	48 85 ff             	test   rdi,rdi
   13b73:	74 7f                	je     13bf4 <find_reg64_index+0x84>
   13b75:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
   13b79:	0f b6 57 02          	movzx  edx,BYTE PTR [rdi+0x2]
   13b7d:	8d 48 bf             	lea    ecx,[rax-0x41]
   13b80:	80 f9 19             	cmp    cl,0x19
   13b83:	77 03                	ja     13b88 <find_reg64_index+0x18>
   13b85:	83 c0 20             	add    eax,0x20
   13b88:	8d 4a bf             	lea    ecx,[rdx-0x41]
   13b8b:	80 f9 19             	cmp    cl,0x19
   13b8e:	77 03                	ja     13b93 <find_reg64_index+0x23>
   13b90:	83 c2 20             	add    edx,0x20
   13b93:	3c 31                	cmp    al,0x31
   13b95:	74 55                	je     13bec <find_reg64_index+0x7c>
   13b97:	8d 48 c8             	lea    ecx,[rax-0x38]
   13b9a:	80 f9 01             	cmp    cl,0x1
   13b9d:	76 51                	jbe    13bf0 <find_reg64_index+0x80>
   13b9f:	3c 61                	cmp    al,0x61
   13ba1:	74 57                	je     13bfa <find_reg64_index+0x8a>
   13ba3:	3c 63                	cmp    al,0x63
   13ba5:	74 59                	je     13c00 <find_reg64_index+0x90>
   13ba7:	3c 64                	cmp    al,0x64
   13ba9:	40 0f 94 c6          	sete   sil
   13bad:	80 fa 78             	cmp    dl,0x78
   13bb0:	0f 94 c1             	sete   cl
   13bb3:	40 84 ce             	test   sil,cl
   13bb6:	75 4e                	jne    13c06 <find_reg64_index+0x96>
   13bb8:	3c 62                	cmp    al,0x62
   13bba:	40 0f 94 c7          	sete   dil
   13bbe:	40 84 f9             	test   cl,dil
   13bc1:	75 49                	jne    13c0c <find_reg64_index+0x9c>
   13bc3:	3c 73                	cmp    al,0x73
   13bc5:	0f 94 c1             	sete   cl
   13bc8:	80 fa 70             	cmp    dl,0x70
   13bcb:	0f 94 c0             	sete   al
   13bce:	84 c1                	test   cl,al
   13bd0:	75 40                	jne    13c12 <find_reg64_index+0xa2>
   13bd2:	40 84 c7             	test   dil,al
   13bd5:	75 41                	jne    13c18 <find_reg64_index+0xa8>
   13bd7:	80 fa 69             	cmp    dl,0x69
   13bda:	0f 94 c0             	sete   al
   13bdd:	84 c1                	test   cl,al
   13bdf:	75 3d                	jne    13c1e <find_reg64_index+0xae>
   13be1:	40 84 c6             	test   sil,al
   13be4:	75 3e                	jne    13c24 <find_reg64_index+0xb4>
   13be6:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13beb:	c3                   	ret
   13bec:	8d 42 da             	lea    eax,[rdx-0x26]
   13bef:	c3                   	ret
   13bf0:	83 e8 30             	sub    eax,0x30
   13bf3:	c3                   	ret
   13bf4:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13bf9:	c3                   	ret
   13bfa:	b8 00 00 00 00       	mov    eax,0x0
   13bff:	c3                   	ret
   13c00:	b8 01 00 00 00       	mov    eax,0x1
   13c05:	c3                   	ret
   13c06:	b8 02 00 00 00       	mov    eax,0x2
   13c0b:	c3                   	ret
   13c0c:	b8 03 00 00 00       	mov    eax,0x3
   13c11:	c3                   	ret
   13c12:	b8 04 00 00 00       	mov    eax,0x4
   13c17:	c3                   	ret
   13c18:	b8 05 00 00 00       	mov    eax,0x5
   13c1d:	c3                   	ret
   13c1e:	b8 06 00 00 00       	mov    eax,0x6
   13c23:	c3                   	ret
   13c24:	b8 07 00 00 00       	mov    eax,0x7
   13c29:	c3                   	ret

0000000000013c2a <find_reg32_index>:
   13c2a:	48 85 ff             	test   rdi,rdi
   13c2d:	74 7f                	je     13cae <find_reg32_index+0x84>
   13c2f:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
   13c33:	0f b6 57 02          	movzx  edx,BYTE PTR [rdi+0x2]
   13c37:	8d 48 bf             	lea    ecx,[rax-0x41]
   13c3a:	80 f9 19             	cmp    cl,0x19
   13c3d:	77 03                	ja     13c42 <find_reg32_index+0x18>
   13c3f:	83 c0 20             	add    eax,0x20
   13c42:	8d 4a bf             	lea    ecx,[rdx-0x41]
   13c45:	80 f9 19             	cmp    cl,0x19
   13c48:	77 03                	ja     13c4d <find_reg32_index+0x23>
   13c4a:	83 c2 20             	add    edx,0x20
   13c4d:	3c 31                	cmp    al,0x31
   13c4f:	74 55                	je     13ca6 <find_reg32_index+0x7c>
   13c51:	8d 48 c8             	lea    ecx,[rax-0x38]
   13c54:	80 f9 01             	cmp    cl,0x1
   13c57:	76 51                	jbe    13caa <find_reg32_index+0x80>
   13c59:	3c 61                	cmp    al,0x61
   13c5b:	74 57                	je     13cb4 <find_reg32_index+0x8a>
   13c5d:	3c 63                	cmp    al,0x63
   13c5f:	74 59                	je     13cba <find_reg32_index+0x90>
   13c61:	3c 64                	cmp    al,0x64
   13c63:	40 0f 94 c6          	sete   sil
   13c67:	80 fa 78             	cmp    dl,0x78
   13c6a:	0f 94 c1             	sete   cl
   13c6d:	40 84 ce             	test   sil,cl
   13c70:	75 4e                	jne    13cc0 <find_reg32_index+0x96>
   13c72:	3c 62                	cmp    al,0x62
   13c74:	40 0f 94 c7          	sete   dil
   13c78:	40 84 f9             	test   cl,dil
   13c7b:	75 49                	jne    13cc6 <find_reg32_index+0x9c>
   13c7d:	3c 73                	cmp    al,0x73
   13c7f:	0f 94 c1             	sete   cl
   13c82:	80 fa 70             	cmp    dl,0x70
   13c85:	0f 94 c0             	sete   al
   13c88:	84 c1                	test   cl,al
   13c8a:	75 40                	jne    13ccc <find_reg32_index+0xa2>
   13c8c:	40 84 c7             	test   dil,al
   13c8f:	75 41                	jne    13cd2 <find_reg32_index+0xa8>
   13c91:	80 fa 69             	cmp    dl,0x69
   13c94:	0f 94 c0             	sete   al
   13c97:	84 c1                	test   cl,al
   13c99:	75 3d                	jne    13cd8 <find_reg32_index+0xae>
   13c9b:	40 84 c6             	test   sil,al
   13c9e:	75 3e                	jne    13cde <find_reg32_index+0xb4>
   13ca0:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13ca5:	c3                   	ret
   13ca6:	8d 42 da             	lea    eax,[rdx-0x26]
   13ca9:	c3                   	ret
   13caa:	83 e8 30             	sub    eax,0x30
   13cad:	c3                   	ret
   13cae:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13cb3:	c3                   	ret
   13cb4:	b8 00 00 00 00       	mov    eax,0x0
   13cb9:	c3                   	ret
   13cba:	b8 01 00 00 00       	mov    eax,0x1
   13cbf:	c3                   	ret
   13cc0:	b8 02 00 00 00       	mov    eax,0x2
   13cc5:	c3                   	ret
   13cc6:	b8 03 00 00 00       	mov    eax,0x3
   13ccb:	c3                   	ret
   13ccc:	b8 04 00 00 00       	mov    eax,0x4
   13cd1:	c3                   	ret
   13cd2:	b8 05 00 00 00       	mov    eax,0x5
   13cd7:	c3                   	ret
   13cd8:	b8 06 00 00 00       	mov    eax,0x6
   13cdd:	c3                   	ret
   13cde:	b8 07 00 00 00       	mov    eax,0x7
   13ce3:	c3                   	ret

0000000000013ce4 <find_reg16_index>:
   13ce4:	48 85 ff             	test   rdi,rdi
   13ce7:	0f 84 92 00 00 00    	je     13d7f <find_reg16_index+0x9b>
   13ced:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
   13cf0:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
   13cf4:	0f b6 4f 02          	movzx  ecx,BYTE PTR [rdi+0x2]
   13cf8:	8d 72 bf             	lea    esi,[rdx-0x41]
   13cfb:	40 80 fe 19          	cmp    sil,0x19
   13cff:	77 03                	ja     13d04 <find_reg16_index+0x20>
   13d01:	83 c2 20             	add    edx,0x20
   13d04:	8d 70 bf             	lea    esi,[rax-0x41]
   13d07:	40 80 fe 19          	cmp    sil,0x19
   13d0b:	77 03                	ja     13d10 <find_reg16_index+0x2c>
   13d0d:	83 c0 20             	add    eax,0x20
   13d10:	8d 71 bf             	lea    esi,[rcx-0x41]
   13d13:	40 80 fe 19          	cmp    sil,0x19
   13d17:	77 03                	ja     13d1c <find_reg16_index+0x38>
   13d19:	83 c1 20             	add    ecx,0x20
   13d1c:	3c 31                	cmp    al,0x31
   13d1e:	74 57                	je     13d77 <find_reg16_index+0x93>
   13d20:	8d 48 c8             	lea    ecx,[rax-0x38]
   13d23:	80 f9 01             	cmp    cl,0x1
   13d26:	76 53                	jbe    13d7b <find_reg16_index+0x97>
   13d28:	80 fa 61             	cmp    dl,0x61
   13d2b:	74 58                	je     13d85 <find_reg16_index+0xa1>
   13d2d:	80 fa 63             	cmp    dl,0x63
   13d30:	74 59                	je     13d8b <find_reg16_index+0xa7>
   13d32:	80 fa 64             	cmp    dl,0x64
   13d35:	40 0f 94 c6          	sete   sil
   13d39:	3c 78                	cmp    al,0x78
   13d3b:	0f 94 c1             	sete   cl
   13d3e:	40 84 ce             	test   sil,cl
   13d41:	75 4e                	jne    13d91 <find_reg16_index+0xad>
   13d43:	80 fa 62             	cmp    dl,0x62
   13d46:	40 0f 94 c7          	sete   dil
   13d4a:	40 84 f9             	test   cl,dil
   13d4d:	75 48                	jne    13d97 <find_reg16_index+0xb3>
   13d4f:	80 fa 73             	cmp    dl,0x73
   13d52:	0f 94 c1             	sete   cl
   13d55:	3c 70                	cmp    al,0x70
   13d57:	0f 94 c2             	sete   dl
   13d5a:	84 d1                	test   cl,dl
   13d5c:	75 3f                	jne    13d9d <find_reg16_index+0xb9>
   13d5e:	40 84 d7             	test   dil,dl
   13d61:	75 40                	jne    13da3 <find_reg16_index+0xbf>
   13d63:	3c 69                	cmp    al,0x69
   13d65:	0f 94 c0             	sete   al
   13d68:	84 c1                	test   cl,al
   13d6a:	75 3d                	jne    13da9 <find_reg16_index+0xc5>
   13d6c:	40 84 c6             	test   sil,al
   13d6f:	75 3e                	jne    13daf <find_reg16_index+0xcb>
   13d71:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13d76:	c3                   	ret
   13d77:	8d 41 da             	lea    eax,[rcx-0x26]
   13d7a:	c3                   	ret
   13d7b:	83 e8 30             	sub    eax,0x30
   13d7e:	c3                   	ret
   13d7f:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13d84:	c3                   	ret
   13d85:	b8 00 00 00 00       	mov    eax,0x0
   13d8a:	c3                   	ret
   13d8b:	b8 01 00 00 00       	mov    eax,0x1
   13d90:	c3                   	ret
   13d91:	b8 02 00 00 00       	mov    eax,0x2
   13d96:	c3                   	ret
   13d97:	b8 03 00 00 00       	mov    eax,0x3
   13d9c:	c3                   	ret
   13d9d:	b8 04 00 00 00       	mov    eax,0x4
   13da2:	c3                   	ret
   13da3:	b8 05 00 00 00       	mov    eax,0x5
   13da8:	c3                   	ret
   13da9:	b8 06 00 00 00       	mov    eax,0x6
   13dae:	c3                   	ret
   13daf:	b8 07 00 00 00       	mov    eax,0x7
   13db4:	c3                   	ret

0000000000013db5 <find_reg8_index>:
   13db5:	48 85 ff             	test   rdi,rdi
   13db8:	0f 84 92 00 00 00    	je     13e50 <find_reg8_index+0x9b>
   13dbe:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
   13dc1:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
   13dc5:	0f b6 4f 02          	movzx  ecx,BYTE PTR [rdi+0x2]
   13dc9:	8d 72 bf             	lea    esi,[rdx-0x41]
   13dcc:	40 80 fe 19          	cmp    sil,0x19
   13dd0:	77 03                	ja     13dd5 <find_reg8_index+0x20>
   13dd2:	83 c2 20             	add    edx,0x20
   13dd5:	8d 70 bf             	lea    esi,[rax-0x41]
   13dd8:	40 80 fe 19          	cmp    sil,0x19
   13ddc:	77 03                	ja     13de1 <find_reg8_index+0x2c>
   13dde:	83 c0 20             	add    eax,0x20
   13de1:	8d 71 bf             	lea    esi,[rcx-0x41]
   13de4:	40 80 fe 19          	cmp    sil,0x19
   13de8:	77 03                	ja     13ded <find_reg8_index+0x38>
   13dea:	83 c1 20             	add    ecx,0x20
   13ded:	3c 31                	cmp    al,0x31
   13def:	74 57                	je     13e48 <find_reg8_index+0x93>
   13df1:	8d 48 c8             	lea    ecx,[rax-0x38]
   13df4:	80 f9 01             	cmp    cl,0x1
   13df7:	76 53                	jbe    13e4c <find_reg8_index+0x97>
   13df9:	80 fa 61             	cmp    dl,0x61
   13dfc:	74 58                	je     13e56 <find_reg8_index+0xa1>
   13dfe:	80 fa 63             	cmp    dl,0x63
   13e01:	74 59                	je     13e5c <find_reg8_index+0xa7>
   13e03:	80 fa 64             	cmp    dl,0x64
   13e06:	40 0f 94 c6          	sete   sil
   13e0a:	3c 6c                	cmp    al,0x6c
   13e0c:	0f 94 c1             	sete   cl
   13e0f:	40 84 ce             	test   sil,cl
   13e12:	75 4e                	jne    13e62 <find_reg8_index+0xad>
   13e14:	80 fa 62             	cmp    dl,0x62
   13e17:	40 0f 94 c7          	sete   dil
   13e1b:	40 84 f9             	test   cl,dil
   13e1e:	75 48                	jne    13e68 <find_reg8_index+0xb3>
   13e20:	80 fa 73             	cmp    dl,0x73
   13e23:	0f 94 c1             	sete   cl
   13e26:	3c 70                	cmp    al,0x70
   13e28:	0f 94 c2             	sete   dl
   13e2b:	84 d1                	test   cl,dl
   13e2d:	75 3f                	jne    13e6e <find_reg8_index+0xb9>
   13e2f:	40 84 d7             	test   dil,dl
   13e32:	75 40                	jne    13e74 <find_reg8_index+0xbf>
   13e34:	3c 69                	cmp    al,0x69
   13e36:	0f 94 c0             	sete   al
   13e39:	84 c1                	test   cl,al
   13e3b:	75 3d                	jne    13e7a <find_reg8_index+0xc5>
   13e3d:	40 84 c6             	test   sil,al
   13e40:	75 3e                	jne    13e80 <find_reg8_index+0xcb>
   13e42:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13e47:	c3                   	ret
   13e48:	8d 41 da             	lea    eax,[rcx-0x26]
   13e4b:	c3                   	ret
   13e4c:	83 e8 30             	sub    eax,0x30
   13e4f:	c3                   	ret
   13e50:	b8 ff ff ff ff       	mov    eax,0xffffffff
   13e55:	c3                   	ret
   13e56:	b8 00 00 00 00       	mov    eax,0x0
   13e5b:	c3                   	ret
   13e5c:	b8 01 00 00 00       	mov    eax,0x1
   13e61:	c3                   	ret
   13e62:	b8 02 00 00 00       	mov    eax,0x2
   13e67:	c3                   	ret
   13e68:	b8 03 00 00 00       	mov    eax,0x3
   13e6d:	c3                   	ret
   13e6e:	b8 04 00 00 00       	mov    eax,0x4
   13e73:	c3                   	ret
   13e74:	b8 05 00 00 00       	mov    eax,0x5
   13e79:	c3                   	ret
   13e7a:	b8 06 00 00 00       	mov    eax,0x6
   13e7f:	c3                   	ret
   13e80:	b8 07 00 00 00       	mov    eax,0x7
   13e85:	c3                   	ret

0000000000013e86 <parse_expr>:
   13e86:	53                   	push   rbx
   13e87:	b8 00 00 00 00       	mov    eax,0x0
   13e8c:	e8 27 04 00 00       	call   142b8 <parse_term>
   13e91:	48 89 c3             	mov    rbx,rax
   13e94:	eb 0b                	jmp    13ea1 <parse_expr+0x1b>
   13e96:	48 83 c0 01          	add    rax,0x1
   13e9a:	48 89 05 6f 71 00 00 	mov    QWORD PTR [rip+0x716f],rax        # 1b010 <p>
   13ea1:	48 8b 05 68 71 00 00 	mov    rax,QWORD PTR [rip+0x7168]        # 1b010 <p>
   13ea8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13eab:	80 fa 20             	cmp    dl,0x20
   13eae:	74 e6                	je     13e96 <parse_expr+0x10>
   13eb0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13eb3:	80 fa 2b             	cmp    dl,0x2b
   13eb6:	74 74                	je     13f2c <parse_expr+0xa6>
   13eb8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13ebb:	80 fa 2d             	cmp    dl,0x2d
   13ebe:	0f 84 85 00 00 00    	je     13f49 <parse_expr+0xc3>
   13ec4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13ec7:	80 fa 5e             	cmp    dl,0x5e
   13eca:	0f 84 96 00 00 00    	je     13f66 <parse_expr+0xe0>
   13ed0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13ed3:	80 fa 7c             	cmp    dl,0x7c
   13ed6:	0f 84 a7 00 00 00    	je     13f83 <parse_expr+0xfd>
   13edc:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13edf:	80 fa 26             	cmp    dl,0x26
   13ee2:	0f 84 b8 00 00 00    	je     13fa0 <parse_expr+0x11a>
   13ee8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13eeb:	80 fa 3e             	cmp    dl,0x3e
   13eee:	0f 84 c9 00 00 00    	je     13fbd <parse_expr+0x137>
   13ef4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   13ef7:	80 fa 3c             	cmp    dl,0x3c
   13efa:	0f 85 e9 00 00 00    	jne    13fe9 <parse_expr+0x163>
   13f00:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   13f04:	80 fa 3c             	cmp    dl,0x3c
   13f07:	0f 85 dc 00 00 00    	jne    13fe9 <parse_expr+0x163>
   13f0d:	48 83 c0 02          	add    rax,0x2
   13f11:	48 89 05 f8 70 00 00 	mov    QWORD PTR [rip+0x70f8],rax        # 1b010 <p>
   13f18:	b8 00 00 00 00       	mov    eax,0x0
   13f1d:	e8 96 03 00 00       	call   142b8 <parse_term>
   13f22:	89 c1                	mov    ecx,eax
   13f24:	48 d3 e3             	shl    rbx,cl
   13f27:	e9 75 ff ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13f2c:	48 83 c0 01          	add    rax,0x1
   13f30:	48 89 05 d9 70 00 00 	mov    QWORD PTR [rip+0x70d9],rax        # 1b010 <p>
   13f37:	b8 00 00 00 00       	mov    eax,0x0
   13f3c:	e8 77 03 00 00       	call   142b8 <parse_term>
   13f41:	48 01 c3             	add    rbx,rax
   13f44:	e9 58 ff ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13f49:	48 83 c0 01          	add    rax,0x1
   13f4d:	48 89 05 bc 70 00 00 	mov    QWORD PTR [rip+0x70bc],rax        # 1b010 <p>
   13f54:	b8 00 00 00 00       	mov    eax,0x0
   13f59:	e8 5a 03 00 00       	call   142b8 <parse_term>
   13f5e:	48 29 c3             	sub    rbx,rax
   13f61:	e9 3b ff ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13f66:	48 83 c0 01          	add    rax,0x1
   13f6a:	48 89 05 9f 70 00 00 	mov    QWORD PTR [rip+0x709f],rax        # 1b010 <p>
   13f71:	b8 00 00 00 00       	mov    eax,0x0
   13f76:	e8 3d 03 00 00       	call   142b8 <parse_term>
   13f7b:	48 31 c3             	xor    rbx,rax
   13f7e:	e9 1e ff ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13f83:	48 83 c0 01          	add    rax,0x1
   13f87:	48 89 05 82 70 00 00 	mov    QWORD PTR [rip+0x7082],rax        # 1b010 <p>
   13f8e:	b8 00 00 00 00       	mov    eax,0x0
   13f93:	e8 20 03 00 00       	call   142b8 <parse_term>
   13f98:	48 09 c3             	or     rbx,rax
   13f9b:	e9 01 ff ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13fa0:	48 83 c0 01          	add    rax,0x1
   13fa4:	48 89 05 65 70 00 00 	mov    QWORD PTR [rip+0x7065],rax        # 1b010 <p>
   13fab:	b8 00 00 00 00       	mov    eax,0x0
   13fb0:	e8 03 03 00 00       	call   142b8 <parse_term>
   13fb5:	48 21 c3             	and    rbx,rax
   13fb8:	e9 e4 fe ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13fbd:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   13fc1:	80 fa 3e             	cmp    dl,0x3e
   13fc4:	0f 85 2a ff ff ff    	jne    13ef4 <parse_expr+0x6e>
   13fca:	48 83 c0 02          	add    rax,0x2
   13fce:	48 89 05 3b 70 00 00 	mov    QWORD PTR [rip+0x703b],rax        # 1b010 <p>
   13fd5:	b8 00 00 00 00       	mov    eax,0x0
   13fda:	e8 d9 02 00 00       	call   142b8 <parse_term>
   13fdf:	89 c1                	mov    ecx,eax
   13fe1:	48 d3 fb             	sar    rbx,cl
   13fe4:	e9 b8 fe ff ff       	jmp    13ea1 <parse_expr+0x1b>
   13fe9:	48 89 d8             	mov    rax,rbx
   13fec:	5b                   	pop    rbx
   13fed:	c3                   	ret

0000000000013fee <parse_number>:
   13fee:	48 83 ec 08          	sub    rsp,0x8
   13ff2:	eb 0b                	jmp    13fff <parse_number+0x11>
   13ff4:	48 83 c0 01          	add    rax,0x1
   13ff8:	48 89 05 11 70 00 00 	mov    QWORD PTR [rip+0x7011],rax        # 1b010 <p>
   13fff:	48 8b 05 0a 70 00 00 	mov    rax,QWORD PTR [rip+0x700a]        # 1b010 <p>
   14006:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   14009:	80 fa 20             	cmp    dl,0x20
   1400c:	74 e6                	je     13ff4 <parse_number+0x6>
   1400e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   14011:	80 fa 2d             	cmp    dl,0x2d
   14014:	74 4d                	je     14063 <parse_number+0x75>
   14016:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   14019:	80 fa 28             	cmp    dl,0x28
   1401c:	74 62                	je     14080 <parse_number+0x92>
   1401e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   14021:	80 fa 30             	cmp    dl,0x30
   14024:	0f 84 8e 00 00 00    	je     140b8 <parse_number+0xca>
   1402a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1402d:	80 fa 30             	cmp    dl,0x30
   14030:	0f 84 66 01 00 00    	je     1419c <parse_number+0x1ae>
   14036:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   14039:	80 fa 30             	cmp    dl,0x30
   1403c:	0f 84 b9 01 00 00    	je     141fb <parse_number+0x20d>
   14042:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   14045:	80 fa 2f             	cmp    dl,0x2f
   14048:	0f 8e 43 02 00 00    	jle    14291 <parse_number+0x2a3>
   1404e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   14051:	3c 39                	cmp    al,0x39
   14053:	0f 8f 38 02 00 00    	jg     14291 <parse_number+0x2a3>
   14059:	b8 00 00 00 00       	mov    eax,0x0
   1405e:	e9 12 02 00 00       	jmp    14275 <parse_number+0x287>
   14063:	48 83 c0 01          	add    rax,0x1
   14067:	48 89 05 a2 6f 00 00 	mov    QWORD PTR [rip+0x6fa2],rax        # 1b010 <p>
   1406e:	b8 00 00 00 00       	mov    eax,0x0
   14073:	e8 76 ff ff ff       	call   13fee <parse_number>
   14078:	48 f7 d8             	neg    rax
   1407b:	e9 0c 02 00 00       	jmp    1428c <parse_number+0x29e>
   14080:	48 83 c0 01          	add    rax,0x1
   14084:	48 89 05 85 6f 00 00 	mov    QWORD PTR [rip+0x6f85],rax        # 1b010 <p>
   1408b:	b8 00 00 00 00       	mov    eax,0x0
   14090:	e8 f1 fd ff ff       	call   13e86 <parse_expr>
   14095:	48 8b 15 74 6f 00 00 	mov    rdx,QWORD PTR [rip+0x6f74]        # 1b010 <p>
   1409c:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1409f:	80 f9 29             	cmp    cl,0x29
   140a2:	0f 85 e4 01 00 00    	jne    1428c <parse_number+0x29e>
   140a8:	48 83 c2 01          	add    rdx,0x1
   140ac:	48 89 15 5d 6f 00 00 	mov    QWORD PTR [rip+0x6f5d],rdx        # 1b010 <p>
   140b3:	e9 d4 01 00 00       	jmp    1428c <parse_number+0x29e>
   140b8:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   140bc:	80 fa 78             	cmp    dl,0x78
   140bf:	74 0d                	je     140ce <parse_number+0xe0>
   140c1:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   140c5:	80 fa 58             	cmp    dl,0x58
   140c8:	0f 85 5c ff ff ff    	jne    1402a <parse_number+0x3c>
   140ce:	48 83 c0 02          	add    rax,0x2
   140d2:	48 89 05 37 6f 00 00 	mov    QWORD PTR [rip+0x6f37],rax        # 1b010 <p>
   140d9:	b8 00 00 00 00       	mov    eax,0x0
   140de:	e9 90 00 00 00       	jmp    14173 <parse_number+0x185>
   140e3:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   140e6:	80 f9 60             	cmp    cl,0x60
   140e9:	7e 1d                	jle    14108 <parse_number+0x11a>
   140eb:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   140ee:	80 f9 66             	cmp    cl,0x66
   140f1:	7f 15                	jg     14108 <parse_number+0x11a>
   140f3:	48 c1 e0 04          	shl    rax,0x4
   140f7:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   140fa:	0f be c9             	movsx  ecx,cl
   140fd:	83 e9 57             	sub    ecx,0x57
   14100:	48 63 c9             	movsxd rcx,ecx
   14103:	48 01 c8             	add    rax,rcx
   14106:	eb 60                	jmp    14168 <parse_number+0x17a>
   14108:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1410b:	80 f9 40             	cmp    cl,0x40
   1410e:	7e 58                	jle    14168 <parse_number+0x17a>
   14110:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14113:	80 f9 46             	cmp    cl,0x46
   14116:	7f 50                	jg     14168 <parse_number+0x17a>
   14118:	48 c1 e0 04          	shl    rax,0x4
   1411c:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1411f:	0f be c9             	movsx  ecx,cl
   14122:	83 e9 37             	sub    ecx,0x37
   14125:	48 63 c9             	movsxd rcx,ecx
   14128:	48 01 c8             	add    rax,rcx
   1412b:	eb 3b                	jmp    14168 <parse_number+0x17a>
   1412d:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14130:	80 f9 40             	cmp    cl,0x40
   14133:	0f 8e 53 01 00 00    	jle    1428c <parse_number+0x29e>
   14139:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1413c:	80 f9 46             	cmp    cl,0x46
   1413f:	0f 8f 47 01 00 00    	jg     1428c <parse_number+0x29e>
   14145:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14148:	80 f9 2f             	cmp    cl,0x2f
   1414b:	7e 96                	jle    140e3 <parse_number+0xf5>
   1414d:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14150:	80 f9 39             	cmp    cl,0x39
   14153:	7f 8e                	jg     140e3 <parse_number+0xf5>
   14155:	48 c1 e0 04          	shl    rax,0x4
   14159:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1415c:	0f be c9             	movsx  ecx,cl
   1415f:	83 e9 30             	sub    ecx,0x30
   14162:	48 63 c9             	movsxd rcx,ecx
   14165:	48 01 c8             	add    rax,rcx
   14168:	48 83 c2 01          	add    rdx,0x1
   1416c:	48 89 15 9d 6e 00 00 	mov    QWORD PTR [rip+0x6e9d],rdx        # 1b010 <p>
   14173:	48 8b 15 96 6e 00 00 	mov    rdx,QWORD PTR [rip+0x6e96]        # 1b010 <p>
   1417a:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1417d:	80 f9 2f             	cmp    cl,0x2f
   14180:	7e 08                	jle    1418a <parse_number+0x19c>
   14182:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14185:	80 f9 39             	cmp    cl,0x39
   14188:	7e bb                	jle    14145 <parse_number+0x157>
   1418a:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1418d:	80 f9 60             	cmp    cl,0x60
   14190:	7e 9b                	jle    1412d <parse_number+0x13f>
   14192:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14195:	80 f9 66             	cmp    cl,0x66
   14198:	7e ab                	jle    14145 <parse_number+0x157>
   1419a:	eb 91                	jmp    1412d <parse_number+0x13f>
   1419c:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   141a0:	80 fa 62             	cmp    dl,0x62
   141a3:	74 0d                	je     141b2 <parse_number+0x1c4>
   141a5:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   141a9:	80 fa 42             	cmp    dl,0x42
   141ac:	0f 85 84 fe ff ff    	jne    14036 <parse_number+0x48>
   141b2:	48 83 c0 02          	add    rax,0x2
   141b6:	48 89 05 53 6e 00 00 	mov    QWORD PTR [rip+0x6e53],rax        # 1b010 <p>
   141bd:	b8 00 00 00 00       	mov    eax,0x0
   141c2:	eb 1b                	jmp    141df <parse_number+0x1f1>
   141c4:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
   141c7:	0f be d2             	movsx  edx,dl
   141ca:	83 ea 30             	sub    edx,0x30
   141cd:	48 63 d2             	movsxd rdx,edx
   141d0:	48 8d 04 42          	lea    rax,[rdx+rax*2]
   141d4:	48 83 c1 01          	add    rcx,0x1
   141d8:	48 89 0d 31 6e 00 00 	mov    QWORD PTR [rip+0x6e31],rcx        # 1b010 <p>
   141df:	48 8b 0d 2a 6e 00 00 	mov    rcx,QWORD PTR [rip+0x6e2a]        # 1b010 <p>
   141e6:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
   141e9:	80 fa 30             	cmp    dl,0x30
   141ec:	74 d6                	je     141c4 <parse_number+0x1d6>
   141ee:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
   141f1:	80 fa 31             	cmp    dl,0x31
   141f4:	74 ce                	je     141c4 <parse_number+0x1d6>
   141f6:	e9 91 00 00 00       	jmp    1428c <parse_number+0x29e>
   141fb:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   141ff:	80 fa 6f             	cmp    dl,0x6f
   14202:	74 0d                	je     14211 <parse_number+0x223>
   14204:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   14208:	80 fa 4f             	cmp    dl,0x4f
   1420b:	0f 85 31 fe ff ff    	jne    14042 <parse_number+0x54>
   14211:	48 83 c0 02          	add    rax,0x2
   14215:	48 89 05 f4 6d 00 00 	mov    QWORD PTR [rip+0x6df4],rax        # 1b010 <p>
   1421c:	b8 00 00 00 00       	mov    eax,0x0
   14221:	eb 1b                	jmp    1423e <parse_number+0x250>
   14223:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
   14226:	0f be d2             	movsx  edx,dl
   14229:	83 ea 30             	sub    edx,0x30
   1422c:	48 63 d2             	movsxd rdx,edx
   1422f:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   14233:	48 83 c1 01          	add    rcx,0x1
   14237:	48 89 0d d2 6d 00 00 	mov    QWORD PTR [rip+0x6dd2],rcx        # 1b010 <p>
   1423e:	48 8b 0d cb 6d 00 00 	mov    rcx,QWORD PTR [rip+0x6dcb]        # 1b010 <p>
   14245:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
   14248:	80 fa 2f             	cmp    dl,0x2f
   1424b:	7e 3f                	jle    1428c <parse_number+0x29e>
   1424d:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
   14250:	80 fa 37             	cmp    dl,0x37
   14253:	7e ce                	jle    14223 <parse_number+0x235>
   14255:	eb 35                	jmp    1428c <parse_number+0x29e>
   14257:	48 8d 0c 80          	lea    rcx,[rax+rax*4]
   1425b:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   1425e:	0f be c0             	movsx  eax,al
   14261:	83 e8 30             	sub    eax,0x30
   14264:	48 98                	cdqe
   14266:	48 8d 04 48          	lea    rax,[rax+rcx*2]
   1426a:	48 83 c2 01          	add    rdx,0x1
   1426e:	48 89 15 9b 6d 00 00 	mov    QWORD PTR [rip+0x6d9b],rdx        # 1b010 <p>
   14275:	48 8b 15 94 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6d94]        # 1b010 <p>
   1427c:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   1427f:	80 f9 2f             	cmp    cl,0x2f
   14282:	7e 08                	jle    1428c <parse_number+0x29e>
   14284:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
   14287:	80 f9 39             	cmp    cl,0x39
   1428a:	7e cb                	jle    14257 <parse_number+0x269>
   1428c:	48 83 c4 08          	add    rsp,0x8
   14290:	c3                   	ret
   14291:	48 8b 0d 48 69 00 00 	mov    rcx,QWORD PTR [rip+0x6948]        # 1abe0 <stderr@GLIBC_2.2.5>
   14298:	ba 15 00 00 00       	mov    edx,0x15
   1429d:	be 01 00 00 00       	mov    esi,0x1
   142a2:	48 8d 3d 69 2f 00 00 	lea    rdi,[rip+0x2f69]        # 17212 <_IO_stdin_used+0x2212>
   142a9:	e8 32 ef fe ff       	call   31e0 <fwrite@plt>
   142ae:	bf 01 00 00 00       	mov    edi,0x1
   142b3:	e8 18 ef fe ff       	call   31d0 <exit@plt>

00000000000142b8 <parse_term>:
   142b8:	53                   	push   rbx
   142b9:	b8 00 00 00 00       	mov    eax,0x0
   142be:	e8 2b fd ff ff       	call   13fee <parse_number>
   142c3:	48 89 c3             	mov    rbx,rax
   142c6:	eb 0b                	jmp    142d3 <parse_term+0x1b>
   142c8:	48 83 c2 01          	add    rdx,0x1
   142cc:	48 89 15 3d 6d 00 00 	mov    QWORD PTR [rip+0x6d3d],rdx        # 1b010 <p>
   142d3:	48 8b 15 36 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6d36]        # 1b010 <p>
   142da:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   142dd:	3c 20                	cmp    al,0x20
   142df:	74 e7                	je     142c8 <parse_term+0x10>
   142e1:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   142e4:	3c 2a                	cmp    al,0x2a
   142e6:	74 31                	je     14319 <parse_term+0x61>
   142e8:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   142eb:	3c 2f                	cmp    al,0x2f
   142ed:	75 6c                	jne    1435b <parse_term+0xa3>
   142ef:	48 83 c2 01          	add    rdx,0x1
   142f3:	48 89 15 16 6d 00 00 	mov    QWORD PTR [rip+0x6d16],rdx        # 1b010 <p>
   142fa:	b8 00 00 00 00       	mov    eax,0x0
   142ff:	e8 ea fc ff ff       	call   13fee <parse_number>
   14304:	48 89 c1             	mov    rcx,rax
   14307:	48 85 c0             	test   rax,rax
   1430a:	74 28                	je     14334 <parse_term+0x7c>
   1430c:	48 89 d8             	mov    rax,rbx
   1430f:	48 99                	cqo
   14311:	48 f7 f9             	idiv   rcx
   14314:	48 89 c3             	mov    rbx,rax
   14317:	eb ba                	jmp    142d3 <parse_term+0x1b>
   14319:	48 83 c2 01          	add    rdx,0x1
   1431d:	48 89 15 ec 6c 00 00 	mov    QWORD PTR [rip+0x6cec],rdx        # 1b010 <p>
   14324:	b8 00 00 00 00       	mov    eax,0x0
   14329:	e8 c0 fc ff ff       	call   13fee <parse_number>
   1432e:	48 0f af d8          	imul   rbx,rax
   14332:	eb 9f                	jmp    142d3 <parse_term+0x1b>
   14334:	48 8b 0d a5 68 00 00 	mov    rcx,QWORD PTR [rip+0x68a5]        # 1abe0 <stderr@GLIBC_2.2.5>
   1433b:	ba 19 00 00 00       	mov    edx,0x19
   14340:	be 01 00 00 00       	mov    esi,0x1
   14345:	48 8d 3d dc 2e 00 00 	lea    rdi,[rip+0x2edc]        # 17228 <_IO_stdin_used+0x2228>
   1434c:	e8 8f ee fe ff       	call   31e0 <fwrite@plt>
   14351:	bf 01 00 00 00       	mov    edi,0x1
   14356:	e8 75 ee fe ff       	call   31d0 <exit@plt>
   1435b:	48 89 d8             	mov    rax,rbx
   1435e:	5b                   	pop    rbx
   1435f:	c3                   	ret

0000000000014360 <eval_expr>:
   14360:	48 83 ec 08          	sub    rsp,0x8
   14364:	48 89 3d a5 6c 00 00 	mov    QWORD PTR [rip+0x6ca5],rdi        # 1b010 <p>
   1436b:	b8 00 00 00 00       	mov    eax,0x0
   14370:	e8 11 fb ff ff       	call   13e86 <parse_expr>
   14375:	48 83 c4 08          	add    rsp,0x8
   14379:	c3                   	ret

000000000001437a <eval_const_expr>:
   1437a:	41 54                	push   r12
   1437c:	55                   	push   rbp
   1437d:	53                   	push   rbx
   1437e:	48 81 ec 00 01 00 00 	sub    rsp,0x100
   14385:	49 89 fc             	mov    r12,rdi
   14388:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
   1438f:	00 
   14390:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
   14397:	00 00 
   14399:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
   143a0:	00 00 
   143a2:	48 c7 44 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
   143a9:	00 00 
   143ab:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   143b2:	00 00 
   143b4:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
   143bb:	00 00 
   143bd:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
   143c4:	00 00 
   143c6:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   143cd:	00 00 
   143cf:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   143d6:	00 00 
   143d8:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   143df:	00 00 
   143e1:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   143e8:	00 00 
   143ea:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
   143f1:	00 00 
   143f3:	48 c7 44 24 60 00 00 	mov    QWORD PTR [rsp+0x60],0x0
   143fa:	00 00 
   143fc:	48 c7 44 24 68 00 00 	mov    QWORD PTR [rsp+0x68],0x0
   14403:	00 00 
   14405:	48 c7 44 24 70 00 00 	mov    QWORD PTR [rsp+0x70],0x0
   1440c:	00 00 
   1440e:	48 c7 44 24 78 00 00 	mov    QWORD PTR [rsp+0x78],0x0
   14415:	00 00 
   14417:	48 c7 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],0x0
   1441e:	00 00 00 00 00 
   14423:	48 c7 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],0x0
   1442a:	00 00 00 00 00 
   1442f:	48 c7 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   14436:	00 00 00 00 00 
   1443b:	48 c7 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],0x0
   14442:	00 00 00 00 00 
   14447:	48 c7 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],0x0
   1444e:	00 00 00 00 00 
   14453:	48 c7 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],0x0
   1445a:	00 00 00 00 00 
   1445f:	48 c7 84 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],0x0
   14466:	00 00 00 00 00 
   1446b:	48 c7 84 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],0x0
   14472:	00 00 00 00 00 
   14477:	48 c7 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],0x0
   1447e:	00 00 00 00 00 
   14483:	48 c7 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],0x0
   1448a:	00 00 00 00 00 
   1448f:	48 c7 84 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],0x0
   14496:	00 00 00 00 00 
   1449b:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x0
   144a2:	00 00 00 00 00 
   144a7:	48 c7 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
   144ae:	00 00 00 00 00 
   144b3:	48 c7 84 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
   144ba:	00 00 00 00 00 
   144bf:	48 c7 84 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
   144c6:	00 00 00 00 00 
   144cb:	48 c7 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
   144d2:	00 00 00 00 00 
   144d7:	bb 00 00 00 00       	mov    ebx,0x0
   144dc:	bd 00 00 00 00       	mov    ebp,0x0
   144e1:	eb 37                	jmp    1451a <eval_const_expr+0x1a0>
   144e3:	48 63 c3             	movsxd rax,ebx
   144e6:	48 c1 e0 04          	shl    rax,0x4
   144ea:	49 03 44 24 08       	add    rax,QWORD PTR [r12+0x8]
   144ef:	be 00 01 00 00       	mov    esi,0x100
   144f4:	29 ee                	sub    esi,ebp
   144f6:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   144fa:	48 63 f6             	movsxd rsi,esi
   144fd:	48 63 c5             	movsxd rax,ebp
   14500:	48 8d 3c 04          	lea    rdi,[rsp+rax*1]
   14504:	48 8d 15 33 19 00 00 	lea    rdx,[rip+0x1933]        # 15e3e <_IO_stdin_used+0xe3e>
   1450b:	b8 00 00 00 00       	mov    eax,0x0
   14510:	e8 db eb fe ff       	call   30f0 <snprintf@plt>
   14515:	01 c5                	add    ebp,eax
   14517:	83 c3 01             	add    ebx,0x1
   1451a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   1451f:	39 d8                	cmp    eax,ebx
   14521:	7f c0                	jg     144e3 <eval_const_expr+0x169>
   14523:	48 89 e7             	mov    rdi,rsp
   14526:	e8 35 fe ff ff       	call   14360 <eval_expr>
   1452b:	48 81 c4 00 01 00 00 	add    rsp,0x100
   14532:	5b                   	pop    rbx
   14533:	5d                   	pop    rbp
   14534:	41 5c                	pop    r12
   14536:	c3                   	ret

0000000000014537 <find_xmm_index>:
   14537:	48 83 ec 08          	sub    rsp,0x8
   1453b:	48 83 c7 03          	add    rdi,0x3
   1453f:	e8 1c fe ff ff       	call   14360 <eval_expr>
   14544:	48 83 c4 08          	add    rsp,0x8
   14548:	c3                   	ret

0000000000014549 <append>:
   14549:	41 56                	push   r14
   1454b:	41 55                	push   r13
   1454d:	41 54                	push   r12
   1454f:	55                   	push   rbp
   14550:	53                   	push   rbx
   14551:	48 89 fb             	mov    rbx,rdi
   14554:	49 89 f6             	mov    r14,rsi
   14557:	48 89 d5             	mov    rbp,rdx
   1455a:	49 89 cd             	mov    r13,rcx
   1455d:	4d 89 c4             	mov    r12,r8
   14560:	83 3e 00             	cmp    DWORD PTR [rsi],0x0
   14563:	74 2f                	je     14594 <append+0x4b>
   14565:	41 8b 06             	mov    eax,DWORD PTR [r14]
   14568:	39 03                	cmp    DWORD PTR [rbx],eax
   1456a:	74 40                	je     145ac <append+0x63>
   1456c:	48 63 3b             	movsxd rdi,DWORD PTR [rbx]
   1456f:	49 0f af fc          	imul   rdi,r12
   14573:	48 01 ef             	add    rdi,rbp
   14576:	4c 89 e2             	mov    rdx,r12
   14579:	4c 89 ee             	mov    rsi,r13
   1457c:	e8 df eb fe ff       	call   3160 <memcpy@plt>
   14581:	8b 03                	mov    eax,DWORD PTR [rbx]
   14583:	83 c0 01             	add    eax,0x1
   14586:	89 03                	mov    DWORD PTR [rbx],eax
   14588:	48 89 e8             	mov    rax,rbp
   1458b:	5b                   	pop    rbx
   1458c:	5d                   	pop    rbp
   1458d:	41 5c                	pop    r12
   1458f:	41 5d                	pop    r13
   14591:	41 5e                	pop    r14
   14593:	c3                   	ret
   14594:	c7 06 04 00 00 00    	mov    DWORD PTR [rsi],0x4
   1459a:	4a 8d 3c 85 00 00 00 	lea    rdi,[r8*4+0x0]
   145a1:	00 
   145a2:	e8 c9 eb fe ff       	call   3170 <malloc@plt>
   145a7:	48 89 c5             	mov    rbp,rax
   145aa:	eb b9                	jmp    14565 <append+0x1c>
   145ac:	01 c0                	add    eax,eax
   145ae:	41 89 06             	mov    DWORD PTR [r14],eax
   145b1:	48 63 f0             	movsxd rsi,eax
   145b4:	49 0f af f4          	imul   rsi,r12
   145b8:	48 89 ef             	mov    rdi,rbp
   145bb:	e8 e0 eb fe ff       	call   31a0 <realloc@plt>
   145c0:	48 89 c5             	mov    rbp,rax
   145c3:	eb a7                	jmp    1456c <append+0x23>

00000000000145c5 <TwoDappend>:
   145c5:	41 57                	push   r15
   145c7:	41 56                	push   r14
   145c9:	41 55                	push   r13
   145cb:	41 54                	push   r12
   145cd:	55                   	push   rbp
   145ce:	53                   	push   rbx
   145cf:	48 83 ec 08          	sub    rsp,0x8
   145d3:	48 89 fb             	mov    rbx,rdi
   145d6:	49 89 f4             	mov    r12,rsi
   145d9:	48 89 d5             	mov    rbp,rdx
   145dc:	49 89 cd             	mov    r13,rcx
   145df:	83 3e 00             	cmp    DWORD PTR [rsi],0x0
   145e2:	74 34                	je     14618 <TwoDappend+0x53>
   145e4:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   145e8:	39 03                	cmp    DWORD PTR [rbx],eax
   145ea:	7d 47                	jge    14633 <TwoDappend+0x6e>
   145ec:	4c 89 ef             	mov    rdi,r13
   145ef:	e8 fc eb fe ff       	call   31f0 <strdup@plt>
   145f4:	48 89 c2             	mov    rdx,rax
   145f7:	48 63 03             	movsxd rax,DWORD PTR [rbx]
   145fa:	48 89 54 c5 00       	mov    QWORD PTR [rbp+rax*8+0x0],rdx
   145ff:	8b 03                	mov    eax,DWORD PTR [rbx]
   14601:	83 c0 01             	add    eax,0x1
   14604:	89 03                	mov    DWORD PTR [rbx],eax
   14606:	48 89 e8             	mov    rax,rbp
   14609:	48 83 c4 08          	add    rsp,0x8
   1460d:	5b                   	pop    rbx
   1460e:	5d                   	pop    rbp
   1460f:	41 5c                	pop    r12
   14611:	41 5d                	pop    r13
   14613:	41 5e                	pop    r14
   14615:	41 5f                	pop    r15
   14617:	c3                   	ret
   14618:	c7 06 04 00 00 00    	mov    DWORD PTR [rsi],0x4
   1461e:	bf 20 00 00 00       	mov    edi,0x20
   14623:	e8 48 eb fe ff       	call   3170 <malloc@plt>
   14628:	48 89 c5             	mov    rbp,rax
   1462b:	c7 03 00 00 00 00    	mov    DWORD PTR [rbx],0x0
   14631:	eb b1                	jmp    145e4 <TwoDappend+0x1f>
   14633:	44 8d 34 00          	lea    r14d,[rax+rax*1]
   14637:	49 63 fe             	movsxd rdi,r14d
   1463a:	48 c1 e7 03          	shl    rdi,0x3
   1463e:	e8 2d eb fe ff       	call   3170 <malloc@plt>
   14643:	49 89 c7             	mov    r15,rax
   14646:	48 63 13             	movsxd rdx,DWORD PTR [rbx]
   14649:	48 c1 e2 03          	shl    rdx,0x3
   1464d:	48 89 ee             	mov    rsi,rbp
   14650:	48 89 c7             	mov    rdi,rax
   14653:	e8 08 eb fe ff       	call   3160 <memcpy@plt>
   14658:	48 89 ef             	mov    rdi,rbp
   1465b:	e8 d0 e9 fe ff       	call   3030 <free@plt>
   14660:	45 89 34 24          	mov    DWORD PTR [r12],r14d
   14664:	4c 89 fd             	mov    rbp,r15
   14667:	eb 83                	jmp    145ec <TwoDappend+0x27>

0000000000014669 <free_expr>:
   14669:	55                   	push   rbp
   1466a:	53                   	push   rbx
   1466b:	48 83 ec 08          	sub    rsp,0x8
   1466f:	48 89 fd             	mov    rbp,rdi
   14672:	bb 00 00 00 00       	mov    ebx,0x0
   14677:	eb 17                	jmp    14690 <free_expr+0x27>
   14679:	48 63 c3             	movsxd rax,ebx
   1467c:	48 c1 e0 04          	shl    rax,0x4
   14680:	48 03 45 08          	add    rax,QWORD PTR [rbp+0x8]
   14684:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
   14688:	e8 a3 e9 fe ff       	call   3030 <free@plt>
   1468d:	83 c3 01             	add    ebx,0x1
   14690:	0f b6 45 00          	movzx  eax,BYTE PTR [rbp+0x0]
   14694:	39 d8                	cmp    eax,ebx
   14696:	7f e1                	jg     14679 <free_expr+0x10>
   14698:	48 8b 7d 08          	mov    rdi,QWORD PTR [rbp+0x8]
   1469c:	e8 8f e9 fe ff       	call   3030 <free@plt>
   146a1:	48 c7 45 08 00 00 00 	mov    QWORD PTR [rbp+0x8],0x0
   146a8:	00 
   146a9:	c6 45 00 00          	mov    BYTE PTR [rbp+0x0],0x0
   146ad:	c7 45 10 00 00 00 00 	mov    DWORD PTR [rbp+0x10],0x0
   146b4:	c7 45 14 00 00 00 00 	mov    DWORD PTR [rbp+0x14],0x0
   146bb:	48 83 c4 08          	add    rsp,0x8
   146bf:	5b                   	pop    rbx
   146c0:	5d                   	pop    rbp
   146c1:	c3                   	ret

00000000000146c2 <TwoDfree>:
   146c2:	48 85 ff             	test   rdi,rdi
   146c5:	74 3a                	je     14701 <TwoDfree+0x3f>
   146c7:	41 54                	push   r12
   146c9:	55                   	push   rbp
   146ca:	53                   	push   rbx
   146cb:	48 89 fd             	mov    rbp,rdi
   146ce:	41 89 f4             	mov    r12d,esi
   146d1:	bb 00 00 00 00       	mov    ebx,0x0
   146d6:	eb 03                	jmp    146db <TwoDfree+0x19>
   146d8:	83 c3 01             	add    ebx,0x1
   146db:	44 39 e3             	cmp    ebx,r12d
   146de:	7d 14                	jge    146f4 <TwoDfree+0x32>
   146e0:	48 63 c3             	movsxd rax,ebx
   146e3:	48 8b 7c c5 00       	mov    rdi,QWORD PTR [rbp+rax*8+0x0]
   146e8:	48 85 ff             	test   rdi,rdi
   146eb:	74 eb                	je     146d8 <TwoDfree+0x16>
   146ed:	e8 3e e9 fe ff       	call   3030 <free@plt>
   146f2:	eb e4                	jmp    146d8 <TwoDfree+0x16>
   146f4:	48 89 ef             	mov    rdi,rbp
   146f7:	e8 34 e9 fe ff       	call   3030 <free@plt>
   146fc:	5b                   	pop    rbx
   146fd:	5d                   	pop    rbp
   146fe:	41 5c                	pop    r12
   14700:	c3                   	ret
   14701:	c3                   	ret

0000000000014702 <free_ast>:
   14702:	48 85 ff             	test   rdi,rdi
   14705:	0f 84 09 01 00 00    	je     14814 <free_ast+0x112>
   1470b:	41 56                	push   r14
   1470d:	41 55                	push   r13
   1470f:	41 54                	push   r12
   14711:	55                   	push   rbp
   14712:	53                   	push   rbx
   14713:	49 89 fd             	mov    r13,rdi
   14716:	41 89 f6             	mov    r14d,esi
   14719:	41 bc 00 00 00 00    	mov    r12d,0x0
   1471f:	eb 4b                	jmp    1476c <free_ast+0x6a>
   14721:	83 c5 01             	add    ebp,0x1
   14724:	39 ab 90 01 00 00    	cmp    DWORD PTR [rbx+0x190],ebp
   1472a:	7e 3c                	jle    14768 <free_ast+0x66>
   1472c:	48 63 c5             	movsxd rax,ebp
   1472f:	48 8d 04 40          	lea    rax,[rax+rax*2]
   14733:	48 c1 e0 05          	shl    rax,0x5
   14737:	80 7c 03 10 10       	cmp    BYTE PTR [rbx+rax*1+0x10],0x10
   1473c:	75 e3                	jne    14721 <free_ast+0x1f>
   1473e:	48 63 c5             	movsxd rax,ebp
   14741:	48 8d 04 40          	lea    rax,[rax+rax*2]
   14745:	48 c1 e0 05          	shl    rax,0x5
   14749:	48 8d 7c 03 18       	lea    rdi,[rbx+rax*1+0x18]
   1474e:	e8 16 ff ff ff       	call   14669 <free_expr>
   14753:	eb cc                	jmp    14721 <free_ast+0x1f>
   14755:	bd 00 00 00 00       	mov    ebp,0x0
   1475a:	eb c8                	jmp    14724 <free_ast+0x22>
   1475c:	8b 73 18             	mov    esi,DWORD PTR [rbx+0x18]
   1475f:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
   14763:	e8 5a ff ff ff       	call   146c2 <TwoDfree>
   14768:	41 83 c4 01          	add    r12d,0x1
   1476c:	45 39 f4             	cmp    r12d,r14d
   1476f:	0f 8d 8e 00 00 00    	jge    14803 <free_ast+0x101>
   14775:	49 63 dc             	movsxd rbx,r12d
   14778:	48 69 db b8 01 00 00 	imul   rbx,rbx,0x1b8
   1477f:	4c 01 eb             	add    rbx,r13
   14782:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   14785:	3c 0f                	cmp    al,0xf
   14787:	77 df                	ja     14768 <free_ast+0x66>
   14789:	0f b6 c0             	movzx  eax,al
   1478c:	48 8d 15 b1 2a 00 00 	lea    rdx,[rip+0x2ab1]        # 17244 <_IO_stdin_used+0x2244>
   14793:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   14797:	48 01 d0             	add    rax,rdx
   1479a:	ff e0                	jmp    rax
   1479c:	8b 73 18             	mov    esi,DWORD PTR [rbx+0x18]
   1479f:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
   147a3:	e8 1a ff ff ff       	call   146c2 <TwoDfree>
   147a8:	eb be                	jmp    14768 <free_ast+0x66>
   147aa:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
   147ae:	e8 7d e8 fe ff       	call   3030 <free@plt>
   147b3:	eb b3                	jmp    14768 <free_ast+0x66>
   147b5:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
   147b9:	e8 72 e8 fe ff       	call   3030 <free@plt>
   147be:	eb a8                	jmp    14768 <free_ast+0x66>
   147c0:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
   147c4:	e8 67 e8 fe ff       	call   3030 <free@plt>
   147c9:	eb 9d                	jmp    14768 <free_ast+0x66>
   147cb:	83 c5 01             	add    ebp,0x1
   147ce:	39 6b 18             	cmp    DWORD PTR [rbx+0x18],ebp
   147d1:	7e 22                	jle    147f5 <free_ast+0xf3>
   147d3:	48 63 fd             	movsxd rdi,ebp
   147d6:	48 c1 e7 05          	shl    rdi,0x5
   147da:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
   147de:	83 3f 01             	cmp    DWORD PTR [rdi],0x1
   147e1:	75 e8                	jne    147cb <free_ast+0xc9>
   147e3:	48 83 c7 08          	add    rdi,0x8
   147e7:	e8 7d fe ff ff       	call   14669 <free_expr>
   147ec:	eb dd                	jmp    147cb <free_ast+0xc9>
   147ee:	bd 00 00 00 00       	mov    ebp,0x0
   147f3:	eb d9                	jmp    147ce <free_ast+0xcc>
   147f5:	48 8b 7b 10          	mov    rdi,QWORD PTR [rbx+0x10]
   147f9:	e8 32 e8 fe ff       	call   3030 <free@plt>
   147fe:	e9 65 ff ff ff       	jmp    14768 <free_ast+0x66>
   14803:	4c 89 ef             	mov    rdi,r13
   14806:	e8 25 e8 fe ff       	call   3030 <free@plt>
   1480b:	5b                   	pop    rbx
   1480c:	5d                   	pop    rbp
   1480d:	41 5c                	pop    r12
   1480f:	41 5d                	pop    r13
   14811:	41 5e                	pop    r14
   14813:	c3                   	ret
   14814:	c3                   	ret

0000000000014815 <is_expr_token>:
   14815:	40 80 ff 28          	cmp    dil,0x28
   14819:	77 1f                	ja     1483a <is_expr_token+0x25>
   1481b:	48 b8 fa 7f 00 40 00 	movabs rax,0x10040007ffa
   14822:	01 00 00 
   14825:	89 f9                	mov    ecx,edi
   14827:	48 d3 e8             	shr    rax,cl
   1482a:	a8 01                	test   al,0x1
   1482c:	75 06                	jne    14834 <is_expr_token+0x1f>
   1482e:	b8 00 00 00 00       	mov    eax,0x0
   14833:	c3                   	ret
   14834:	b8 01 00 00 00       	mov    eax,0x1
   14839:	c3                   	ret
   1483a:	b8 00 00 00 00       	mov    eax,0x0
   1483f:	c3                   	ret

0000000000014840 <astrcmp>:
   14840:	48 85 ff             	test   rdi,rdi
   14843:	0f 84 e0 00 00 00    	je     14929 <astrcmp.null_pointer>
   14849:	48 85 f6             	test   rsi,rsi
   1484c:	0f 84 d7 00 00 00    	je     14929 <astrcmp.null_pointer>
   14852:	48 39 f7             	cmp    rdi,rsi
   14855:	0f 84 d1 00 00 00    	je     1492c <astrcmp.equal>
   1485b:	48 89 f8             	mov    rax,rdi
   1485e:	48 09 f0             	or     rax,rsi
   14861:	48 25 0f 00 00 00    	and    rax,0xf
   14867:	0f 84 39 00 00 00    	je     148a6 <astrcmp.aligned_fast>

000000000001486d <astrcmp.scalar_loop>:
   1486d:	8a 07                	mov    al,BYTE PTR [rdi]
   1486f:	8a 16                	mov    dl,BYTE PTR [rsi]
   14871:	84 c0                	test   al,al
   14873:	0f 84 13 00 00 00    	je     1488c <astrcmp.scalar_end>
   14879:	38 d0                	cmp    al,dl
   1487b:	0f 85 1c 00 00 00    	jne    1489d <astrcmp.scalar_different>
   14881:	48 ff c7             	inc    rdi
   14884:	48 ff c6             	inc    rsi
   14887:	e9 e1 ff ff ff       	jmp    1486d <astrcmp.scalar_loop>

000000000001488c <astrcmp.scalar_end>:
   1488c:	84 d2                	test   dl,dl
   1488e:	0f 84 98 00 00 00    	je     1492c <astrcmp.equal>
   14894:	0f b6 c0             	movzx  eax,al
   14897:	0f b6 d2             	movzx  edx,dl
   1489a:	29 d0                	sub    eax,edx
   1489c:	c3                   	ret

000000000001489d <astrcmp.scalar_different>:
   1489d:	0f b6 c0             	movzx  eax,al
   148a0:	0f b6 d2             	movzx  edx,dl
   148a3:	29 d0                	sub    eax,edx
   148a5:	c3                   	ret

00000000000148a6 <astrcmp.aligned_fast>:
   148a6:	31 c9                	xor    ecx,ecx

00000000000148a8 <astrcmp.loop>:
   148a8:	48 89 f8             	mov    rax,rdi
   148ab:	48 01 c8             	add    rax,rcx
   148ae:	48 25 ff 0f 00 00    	and    rax,0xfff
   148b4:	48 3d f0 0f 00 00    	cmp    rax,0xff0
   148ba:	0f 87 5e 00 00 00    	ja     1491e <astrcmp.switch_to_scalar>
   148c0:	48 89 f0             	mov    rax,rsi
   148c3:	48 01 c8             	add    rax,rcx
   148c6:	48 25 ff 0f 00 00    	and    rax,0xfff
   148cc:	48 3d f0 0f 00 00    	cmp    rax,0xff0
   148d2:	0f 87 46 00 00 00    	ja     1491e <astrcmp.switch_to_scalar>
   148d8:	66 0f 6f 04 0f       	movdqa xmm0,XMMWORD PTR [rdi+rcx*1]
   148dd:	66 0f 6f 0c 0e       	movdqa xmm1,XMMWORD PTR [rsi+rcx*1]
   148e2:	66 0f 6f d0          	movdqa xmm2,xmm0
   148e6:	66 0f 74 c1          	pcmpeqb xmm0,xmm1
   148ea:	66 0f ef db          	pxor   xmm3,xmm3
   148ee:	66 0f 74 d3          	pcmpeqb xmm2,xmm3
   148f2:	66 0f eb c2          	por    xmm0,xmm2
   148f6:	66 0f d7 c0          	pmovmskb eax,xmm0
   148fa:	3d ff ff 00 00       	cmp    eax,0xffff
   148ff:	0f 84 10 00 00 00    	je     14915 <astrcmp.all_equal>
   14905:	f7 d0                	not    eax
   14907:	0f bc c8             	bsf    ecx,eax
   1490a:	0f b6 04 0f          	movzx  eax,BYTE PTR [rdi+rcx*1]
   1490e:	0f b6 14 0e          	movzx  edx,BYTE PTR [rsi+rcx*1]
   14912:	29 d0                	sub    eax,edx
   14914:	c3                   	ret

0000000000014915 <astrcmp.all_equal>:
   14915:	48 83 c1 10          	add    rcx,0x10
   14919:	e9 8a ff ff ff       	jmp    148a8 <astrcmp.loop>

000000000001491e <astrcmp.switch_to_scalar>:
   1491e:	48 01 cf             	add    rdi,rcx
   14921:	48 01 ce             	add    rsi,rcx
   14924:	e9 44 ff ff ff       	jmp    1486d <astrcmp.scalar_loop>

0000000000014929 <astrcmp.null_pointer>:
   14929:	31 c0                	xor    eax,eax
   1492b:	c3                   	ret

000000000001492c <astrcmp.equal>:
   1492c:	31 c0                	xor    eax,eax
   1492e:	c3                   	ret

Disassembly of section .fini:

0000000000014930 <_fini>:
   14930:	48 83 ec 08          	sub    rsp,0x8
   14934:	48 83 c4 08          	add    rsp,0x8
   14938:	c3                   	ret
