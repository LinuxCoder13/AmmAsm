#!/bin/bash

# CPU: 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz
# OS:  Debian 12
# Arch: x86_64
# NASM: 3.02
# AmmAsm: 3.0.0

# AmmAsm vs NASM — Peak Memory / RSS benchmark
#
# Measures the maximum resident set size (Peak RSS) of each assembler.
# This is the maximum amount of physical memory resident in RAM during
# the process lifetime.
#
# Unlike the Valgrind Memcheck benchmark, this does NOT measure cumulative
# heap allocation and does NOT perform memory-error checking.


set -u

AASM_BIN="./aasm"
NASM_BIN="nasm" # NASM 3.02

TMP_DIR="/tmp/aasm_peak_memory"
mkdir -p "$TMP_DIR"

SIZES=(1000 5000 10000 15000 20000 30000 40000 1000000)

printf "\n"
printf "╔══════════════════════════════════════════════════════════════════════════╗\n"
printf "║                    AmmAsm vs NASM — Peak Memory                       ║\n"
printf "╠══════════════╦══════════════════════════════╦══════════════════════════╣\n"
printf "║ Instructions ║ NASM                       ║ AmmAsm                   ║\n"
printf "╠══════════════╬══════════════════════════════╬══════════════════════════╣\n"

for N in "${SIZES[@]}"; do

    INPUT="$TMP_DIR/test_${N}.asm"

    NASM_LOG="$TMP_DIR/nasm_${N}.log"
    AASM_LOG="$TMP_DIR/aasm_${N}.log"

    NASM_OBJ="$TMP_DIR/nasm_${N}.o"
    AASM_OBJ="$TMP_DIR/aasm_${N}.o"

    # Generate test input.
    {
        echo "section .text"
        echo "global _start"
        echo "_start:"

        for ((i=0; i<N; i++)); do
            case $((i % 10)) in
                0) echo "mov rax, rbx" ;;
                1) echo "add rax, rcx" ;;
                2) echo "sub rdx, rax" ;;
                3) echo "xor r8, r9" ;;
                4) echo "and r10, r11" ;;
                5) echo "or r12, r13" ;;
                6) echo "shl rax, 1" ;;
                7) echo "cmp rax, rbx" ;;
                8) echo "movdqa xmm0, xmm1" ;;
                9) echo "vaddps ymm0, ymm1, ymm2" ;;
            esac
        done

        echo "ret"
    } > "$INPUT"

    # ---------------- NASM ----------------

    /usr/bin/time \
        -v \
        "$NASM_BIN" \
        -felf64 "$INPUT" \
        -o "$NASM_OBJ" \
        >/dev/null 2>"$NASM_LOG"

    NASM_STATUS=$?

    # ---------------- AmmAsm ----------------

    /usr/bin/time \
        -v \
        "$AASM_BIN" \
        "$INPUT" \
        -c "$AASM_OBJ" \
        >/dev/null 2>"$AASM_LOG"

    AASM_STATUS=$?

    # -------- Extract Peak RSS --------

    NASM_MEMORY=$(sed -n \
        's/.*Maximum resident set size (kbytes):[[:space:]]*\([0-9][0-9]*\).*/\1/p' \
        "$NASM_LOG" | head -1)

    AASM_MEMORY=$(sed -n \
        's/.*Maximum resident set size (kbytes):[[:space:]]*\([0-9][0-9]*\).*/\1/p' \
        "$AASM_LOG" | head -1)

    [[ -z "$NASM_MEMORY" ]] && NASM_MEMORY="?"
    [[ -z "$AASM_MEMORY" ]] && AASM_MEMORY="?"

    printf "║ %-12s ║ %-26s ║ %-24s ║\n" \
        "$N" \
        "$NASM_MEMORY KB" \
        "$AASM_MEMORY KB"

done

printf "╚══════════════╩══════════════════════════════╩══════════════════════════╝\n"
printf "\n"
printf "Measurement: Peak RSS (Maximum resident set size)\n"
printf "Tool: /usr/bin/time -v\n"
printf "\n"
