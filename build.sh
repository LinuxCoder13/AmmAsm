#!/usr/bin/env bash
set -e
gcc -std=gnu99 -O2 -Oz \
    -ffunction-sections \
    -fdata-sections \
    -fomit-frame-pointer \
    -fno-ident \
    src/*.c bootstrap/*.o -o aasm