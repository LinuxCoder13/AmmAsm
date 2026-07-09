#!/usr/bin/env bash
set -e
gcc -std=gnu99 -Os -O2 \
    -ffunction-sections \
    -fdata-sections \
    -Wl,--gc-sections \
    -fomit-frame-pointer \
    -fno-ident \
    src/*.c bootstrap/*.o -o aasm