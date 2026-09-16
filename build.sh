#!/usr/bin/env bash
set -e
gcc -std=gnu99 -Oz \
    -ffunction-sections \
    -fdata-sections \
    -fomit-frame-pointer \
    -fno-ident \
    -march=native \
    src/*.c -o aasm

# Remove "-march=native" when you will test "benchmark/memory.sh"! 
# Else you might get SIGILL