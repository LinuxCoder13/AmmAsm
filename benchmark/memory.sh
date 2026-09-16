#!/bin/bash

# CPU: 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz
# OS:  Debian 12
# Arch: x86_64
# NASM: 3.02
# AmmAsm: 3.0.0

# AmmAsm vs NASM — Valgrind Memcheck benchmark

# IMPORTANT:
# Build AmmAsm without -march=native before running this benchmark.
#
# Valgrind 3.19 provides a restricted CPU feature set to the instrumented
# program and does not fully support all host EVEX instructions.
#
# A native build may contain host-specific instructions that Valgrind
# cannot translate, causing SIGILL. This does NOT indicate an AmmAsm bug.
# Restore the normal/native build after the benchmark.

set -u

AASM_BIN="./aasm"
NASM_BIN="nasm" # NASM 3.02

TMP_DIR="/tmp/aasm_memcheck"
mkdir -p "$TMP_DIR"

SIZES=(1000 5000 10000 15000 20000 30000 40000)

# AmmAsm intentionally uses large stack allocations.
MAX_STACKFRAME=4194304

printf "\n"
printf "╔══════════════════════════════════════════════════════════════════════════╗\n"
printf "║                  AmmAsm vs NASM — Memory / Memcheck                    ║\n"
printf "╠══════════════╦══════════════════════════════╦══════════════════════════╣\n"
printf "║ Instructions ║ NASM                         ║ AmmAsm                   ║\n"
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

    valgrind \
        --tool=memcheck \
        --leak-check=full \
        --show-leak-kinds=all \
        --errors-for-leak-kinds=definite,indirect \
        --max-stackframe="$MAX_STACKFRAME" \
        --error-exitcode=42 \
        --log-file="$NASM_LOG" \
        "$NASM_BIN" \
        -felf64 "$INPUT" \
        -o "$NASM_OBJ" \
        >/dev/null 2>&1

    NASM_STATUS=$?

    # ---------------- AmmAsm ----------------

    valgrind \
        --tool=memcheck \
        --leak-check=full \
        --show-leak-kinds=all \
        --errors-for-leak-kinds=definite,indirect \
        --max-stackframe="$MAX_STACKFRAME" \
        --error-exitcode=42 \
        --log-file="$AASM_LOG" \
        "$AASM_BIN" \
        "$INPUT" \
        -c "$AASM_OBJ" \
        >/dev/null 2>&1

    AASM_STATUS=$?

    # -------- Extract errors --------

    NASM_ERRORS=$(sed -n 's/.*ERROR SUMMARY: \([0-9][0-9]*\) errors.*/\1/p' "$NASM_LOG" | head -1)
    AASM_ERRORS=$(sed -n 's/.*ERROR SUMMARY: \([0-9][0-9]*\) errors.*/\1/p' "$AASM_LOG" | head -1)

    # -------- Extract total allocated heap memory --------
    #
    # Example:
    # total heap usage: 121 allocs, 121 frees, 36,705 bytes allocated
    #
    # Extracts: 36,705

    NASM_MEMORY=$(sed -n 's/.*total heap usage:.*,[[:space:]]\([0-9][0-9,]*\)[[:space:]]bytes allocated.*/\1/p' "$NASM_LOG" | head -1)
    AASM_MEMORY=$(sed -n 's/.*total heap usage:.*,[[:space:]]\([0-9][0-9,]*\)[[:space:]]bytes allocated.*/\1/p' "$AASM_LOG" | head -1)

    [[ -z "$NASM_ERRORS" ]] && NASM_ERRORS="?"
    [[ -z "$AASM_ERRORS" ]] && AASM_ERRORS="?"

    [[ -z "$NASM_MEMORY" ]] && NASM_MEMORY="?"

    [[ -z "$AASM_MEMORY" ]] && AASM_MEMORY="?"

    printf "║ %-12s ║ %-26s ║ %-24s ║\n" \
        "$N" \
        "$NASM_MEMORY bytes, $NASM_ERRORS errors" \
        "$AASM_MEMORY bytes, $AASM_ERRORS errors"

done

printf "╚══════════════╩══════════════════════════════╩══════════════════════════╝\n"
printf "\n"
printf "Valgrind: %s\n" "$(valgrind --version)"
printf "Max stack frame: %'d bytes\n" "$MAX_STACKFRAME"
printf "\n"