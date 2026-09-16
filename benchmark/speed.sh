#!/bin/bash

# CPU: 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz
# OS:  Debian 12
# Arch: x86_64
# NASM: 3.02
# AmmAsm: 3.0.0

set -u

SIZES=(10000 50000 100000 150000)

NASM_BIN="nasm" # WARN: assuming that it is NASM 3.02!
AASM_BIN="./aasm"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

printf '\n'
printf '%s\n' '══════════════════════════════════════════════════════════════════════════'
printf '                         AmmAsm vs NASM\n'
printf '%s\n' '══════════════════════════════════════════════════════════════════════════'
printf '\n'

# ─────────────────────────────────────────────────────────────────────────────
# Generate equivalent workloads with syntax appropriate for each assembler.
# ─────────────────────────────────────────────────────────────────────────────

for n in "${SIZES[@]}"; do

    # NASM syntax
    {
        cat <<'EOF'
section .text
global _start

_start:
EOF

        yes 'mov rax, rbx
add rax, 123456
sub rbx, rax
imul rax, rbx
and rax, 0xffff
or rbx, rax
xor rcx, rcx
lea rax, [rbx + rcx*8 + 64]
cmp rax, rbx
cmovg rax, rbx
movdqa xmm0, xmm1
vaddps ymm0, ymm1, ymm2
vaddps zmm20{k1}{z}, zmm10, zmm11' | head -n "$n"

    } > "$TMP_DIR/bench_${n}_nasm.asm"

    # AmmAsm syntax
    {
        cat <<'EOF'
section text
global _start

_start:
EOF

        yes 'mov rax, rbx
add rax, 123456
sub rbx, rax
imul rax, rbx
and rax, 0xffff
or rbx, rax
xor rcx, rcx
lea rax, [b=rbx, i=rcx, s=8, d=64]
cmp rax, rbx
cmovg rax, rbx
movdqa xmm0, xmm1
vaddps ymm0, ymm1, ymm2
vaddps zmm20{k1}{z}, zmm10, zmm11' | head -n "$n"

    } > "$TMP_DIR/bench_${n}_aasm.asm"
done

# ─────────────────────────────────────────────────────────────────────────────
# Header
# ─────────────────────────────────────────────────────────────────────────────

printf '%-12s │ %-15s │ %-15s │ %-10s\n' \
    'Instructions' 'NASM' 'AmmAsm' 'Amm/NASM'

printf '%s\n' \
    '─────────────┼─────────────────┼─────────────────┼───────────'

# ─────────────────────────────────────────────────────────────────────────────
# Benchmark
# ─────────────────────────────────────────────────────────────────────────────

for n in "${SIZES[@]}"; do

    nasm_file="$TMP_DIR/bench_${n}_nasm.asm"
    aasm_file="$TMP_DIR/bench_${n}_aasm.asm"

    # NASM
    start=$(date +%s%N)

    if "$NASM_BIN" -f elf64 "$nasm_file" \
        -o "$TMP_DIR/nasm.o" >/dev/null 2>&1; then

        end=$(date +%s%N)
        nasm_ns=$((end - start))

    else
        printf '%-12s │ %-15s │ %-15s │ %-10s\n' \
            "$n" 'ERROR' '-' '-'
        continue
    fi

    # AmmAsm
    start=$(date +%s%N)

    if "$AASM_BIN" "$aasm_file" -c "$TMP_DIR/aasm.o" --no-preprocess \
        >/dev/null 2>&1; then

        end=$(date +%s%N)
        aasm_ns=$((end - start))

    else
        nasm_s=$(awk "BEGIN {printf \"%.3f\", $nasm_ns / 1000000000}")

        printf '%-12s │ %-15s │ %-15s │ %-10s\n' \
            "$n" "${nasm_s}s" 'ERROR' '-'
        continue
    fi

    # Convert nanoseconds to seconds
    nasm_s=$(awk "BEGIN {printf \"%.3f\", $nasm_ns / 1000000000}")
    aasm_s=$(awk "BEGIN {printf \"%.3f\", $aasm_ns / 1000000000}")

    # AmmAsm / NASM
    ratio=$(awk "BEGIN {printf \"%.2fx\", $aasm_ns / $nasm_ns}")

    printf '%-12s │ %-15s │ %-15s │ %-10s\n' \
        "$n" "${nasm_s}s" "${aasm_s}s" "$ratio"
done

printf '%s\n' \
    '─────────────┴─────────────────┴─────────────────┴───────────'

printf '\n'
printf 'Ratio: AmmAsm / NASM\n'
printf '< 1.00x = AmmAsm faster    > 1.00x = NASM faster\n'
printf '\n'