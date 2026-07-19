# 64-bit Fibonacci in AmmAsm

build:
```bash
./aasm tests/fibonacci/atoi.asm -c a.o && ./aasm tests/fibonacci/itoa.asm -c b.o && ./aasm tests/fibonacci/flush.asm -c c.o && ./aasm tests/fibonacci/fib64.asm -c d.o
ld a.o b.o c.o d.o -o fib
```

run:
```bash
./fib
```