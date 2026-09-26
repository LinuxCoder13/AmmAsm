#!/bin/bash

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TESTS="$ROOT/tests"
AASM="$ROOT/aasm"

cd "$TESTS" || exit 1


# age_confirm
printf "%-45s" 'Building | Running "age_confirm"...'

if "$AASM" age_confirm/age_confirm.asm -o age >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if ./age <<< 19 >/dev/null 2>&1; then
    echo "[OK]"
else
    echo "[FAIL]"
    exit 1
fi

rm -f age


# APX_fibonacci
printf "%-45s" 'Building | Running "APX_fibonacci"...'

if "$AASM" APX_fibonacci/apx_atoi.asm -c a.o >/dev/null 2>&1 &&
   "$AASM" APX_fibonacci/apx_itoa.asm -c b.o >/dev/null 2>&1 &&
   "$AASM" APX_fibonacci/apx_flush.asm -c c.o >/dev/null 2>&1 &&
   "$AASM" APX_fibonacci/apx_fib64.asm -c d.o >/dev/null 2>&1 &&
   ld a.o b.o c.o d.o -o fib >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if [ ! -x "$HOME/intel/sde/sde64" ]; then
    echo "[SKIP] SDE64 not found"
elif "$HOME/intel/sde/sde64" -future -- ./fib <<< 90 >/dev/null 2>&1; then
    echo "[OK]"
else
    status=$?
    echo "[FAIL]"
    exit "$status"
fi

rm -f a.o b.o c.o d.o fib


# astrcmp
printf "%-45s" 'Building | Running "astrcmp"...'

if "$AASM" astrcmp/strcmp.asm -c strcmp.o >/dev/null 2>&1 &&
   gcc astrcmp/test.c strcmp.o -o strcmp_test >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if ./strcmp_test >/dev/null 2>&1; then
    echo "[OK]"
else
    echo "[FAIL]"
    exit 1
fi

rm -f strcmp.o strcmp_test


# BrainFuck
printf "%-45s" 'Building | Running "brainfuck"...'

if "$AASM" brainfuck/bf.asm -c bf.o >/dev/null 2>&1 &&
   ld bf.o -o bf >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if ./bf brainfuck/hello.bf >/dev/null 2>&1; then
    echo "[OK]"
else
    echo "[FAIL]"
    exit 1
fi

rm -f bf.o bf


# Clock
printf "%-45s" 'Building | Running "clock"...'

if "$AASM" clock/clock.asm -c clock1.o >/dev/null 2>&1 &&
   gcc -no-pie -nostartfiles clock1.o -lc -o clock1 >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

timeout 1s ./clock1 >/dev/null 2>&1
if [ $? -eq 124 ]; then
    echo "[OK]"
else    
    echo "[FAIL]"
fi


rm -f clock1.o clock1


# Fibonacci
printf "%-45s" 'Building | Running "fibonacci"...'

if "$AASM" fibonacci/atoi.asm -c a.o >/dev/null 2>&1 &&
   "$AASM" fibonacci/itoa.asm -c b.o >/dev/null 2>&1 &&
   "$AASM" fibonacci/flush.asm -c c.o >/dev/null 2>&1 &&
   "$AASM" fibonacci/fib64.asm -c d.o >/dev/null 2>&1 &&
   ld a.o b.o c.o d.o -o fib >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if ./fib <<< 90 >/dev/null 2>&1; then
    echo "[OK]"
else
    echo "[FAIL]"
    exit 1
fi

rm -f a.o b.o c.o d.o fib


# hello_world
printf "%-45s" 'Building | Running "hello_world"...'

if "$AASM" hello_world/hw.asm -c hw.o >/dev/null 2>&1 &&
   gcc -no-pie -nostartfiles hw.o -lc -o hw >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if ./hw >/dev/null 2>&1; then
    echo "[OK]"
else
    echo "[FAIL]"
    exit 1
fi

rm -f hw.o hw

# star piramid

printf "%-45s" 'Building | Running "starpiramid"...'

if "$AASM" starpiramid/starpiramid.asm -o star >/dev/null 2>&1; then
    echo -n "[OK] "
else
    echo -n "[FAIL]"
    exit 1
fi

if ./star >/dev/null 2>&1; then
    echo "[OK]"
else
    echo "[FAIL]"
    exit 1
fi

rm -f star
