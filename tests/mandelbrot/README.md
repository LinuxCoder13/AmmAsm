# Mandelbrot fractal by using AVX/SSE2

build:
```sh
./aasm tests/mandelbroat/mandelbroat.asm -c a.o
ld a.o -o a.out
```
run:
```sh
./a.out # Make sure that your CPU supports AVX, else you will get SIGILL, however AmmAsm will let you know by checking CPUID
```