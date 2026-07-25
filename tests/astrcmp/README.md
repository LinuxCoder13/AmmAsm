# strcmp (SSE2) that is linked with Aasm.c code, in order to demonstrate that AmmAsm is able to be compatible with GCC, LD, ect.


build:

```bash
./aasm tests/astrcmp/strcmp.asm -c strcmp.o
gcc tests/astrcmp/testc.c strcmp.o -o main.o
```

run:
```bash
./main.o
```