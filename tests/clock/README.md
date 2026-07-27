Ascii Clock by ET_REL via localtime() from libc

How it works:
- \# -> point of hour
- \* -> point of minute
- . -> point of second


build:
```bash
./aasm tests/clock/clock.asm -c a.o
gcc -no-pie -nostartfiles a.o -lc -o clock # for including libc
```

run:
```bash
./clock
```