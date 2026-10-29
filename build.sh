#!/usr/bin/env bash

# Usage:
#   ./build.sh                            # host gcc, dynamic (default)
#   CC=x86_64-linux-musl-gcc ./build.sh   # static musl via cross toolchain
#   STATIC=1 ./build.sh                   # force static build
#
# Note: use "-march=native" ONLY when you are sure the compiled program will run on the same CPU as the host
#        and turn off when you will test "benchmark/memory.sh"!

set -euo pipefail

CC="${CC:-gcc}"
ARCH="${ARCH:-x86-64}"

if [[ "${1:-}" == "help" ]]; then
    tail -n +3 "$0" | head -n 7
    exit 0
fi

if [[ -z "${STATIC:-}" ]]; then
    case "$CC" in
        *musl*) STATIC=1 ;;
        *)      STATIC=0 ;;
    esac
fi

extra_flags=()
if [[ "$STATIC" == "1" ]]; then
    extra_flags+=(-static)
fi

$CC -std=gnu99 -O3 \
    "${extra_flags[@]}" \
    -ffunction-sections \
    -fdata-sections \
    -fomit-frame-pointer \
    -fno-ident \
    "-march=${ARCH}" \
    src/*.c -o aasm \
    -Wl,--gc-sections
