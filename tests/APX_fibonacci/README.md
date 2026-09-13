# 64-bit Fibonacci (APX version) in AmmAsm

build:
```bash
./aasm tests/APX_fibonacci/apx_atoi.asm -c a.o && ./aasm tests/APX_fibonacci/apx_itoa.asm -c b.o && ./aasm tests/APX_fibonacci/apx_flush.asm -c c.o && ./aasm tests/APX_fibonacci/apx_fib64.asm -c d.o
ld a.o b.o c.o d.o -o fib
```

run:
```bash
./sde64 -future -- ./fib # host CPU does not support APX
```

Source of SDE: https://www.intel.com/content/www/us/en/developer/articles/tool/software-development-emulator.html