# Hello World via printf from libc

build:
```bash
./aasm tests/hello_world/hw.asm -c a.o
gcc -no-pie -nostartfiles a.o -lc -o hw # for including libc
```

run:
```bash
./hw
```