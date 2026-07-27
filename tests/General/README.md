# Test the CMOVcc, SETcc, SSE insctructions for AmmAsm (x86-64)

try it yourself:

```bash
./aasm tests/General/SSE_CMOVCC_SETCC.asm -c a.o
ld a.o -o a.out
```

```bash
objdump -d a.out
```