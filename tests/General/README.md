# Test the AVX-512 insctructions With neither nasm or fasm supports

try it yourself:

```bash
./aasm tests/General/AVX-512.asm -c a.o
ld a.o -o a.out
```

```bash
objdump -d a.out
```