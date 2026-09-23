#!/bin/bash

# CPU: 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz
# OS:  Debian 12
# Arch: x86_64
# NASM: 3.02
# AmmAsm: 3.0.0

set -u

SIZES=(10000 50000 100000 150000 200000 250000 500000 1000000)

NASM_BIN="nasm" # nasm 3.02
FASM_BIN="fasm" # fasm 1.73.35
AASM_BIN="./aasm" # aasm 3.0.0

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

printf '\n'
printf '%s\n' '════════════════════════════════════════════════════════════════════════════════════'
printf '                         AmmAsm vs NASM vs FASM\n'
printf '%s\n' '════════════════════════════════════════════════════════════════════════════════════'
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


    # FASM syntax
    {
        cat <<'EOF'
format ELF64

public _start

section '.text' executable

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

    } > "$TMP_DIR/bench_${n}_fasm.asm"
done

# ─────────────────────────────────────────────────────────────────────────────
# Header
# ─────────────────────────────────────────────────────────────────────────────

printf '%-12s │ %-12s │ %-12s │ %-12s │ %-10s │ %-10s\n' \
    'Instructions' 'NASM' 'AmmAsm' 'FASM' 'A/N' 'F/A'

printf '%s\n' \
    '─────────────┼──────────────┼──────────────┼──────────────┼────────────┼───────────'

# ─────────────────────────────────────────────────────────────────────────────
# Benchmark
# ─────────────────────────────────────────────────────────────────────────────

for n in "${SIZES[@]}"; do

    nasm_file="$TMP_DIR/bench_${n}_nasm.asm"
    aasm_file="$TMP_DIR/bench_${n}_aasm.asm"
    fasm_file="$TMP_DIR/bench_${n}_fasm.asm"

    # ─────────────────────────────────────────────────────────────────────────
    # NASM
    # ─────────────────────────────────────────────────────────────────────────

    start=$(date +%s%N)

    if "$NASM_BIN" -f elf64 "$nasm_file" \
        -o "$TMP_DIR/nasm.o" >/dev/null 2>&1; then

        end=$(date +%s%N)
        nasm_ns=$((end - start))

    else
        printf '%-12s │ %-12s │ %-12s │ %-12s │ %-10s │ %-10s\n' \
            "$n" 'ERROR' '-' '-' '-' '-'
        continue
    fi

    # ─────────────────────────────────────────────────────────────────────────
    # AmmAsm
    # ─────────────────────────────────────────────────────────────────────────

    start=$(date +%s%N)

    if "$AASM_BIN" "$aasm_file" -c "$TMP_DIR/aasm.o" \
        >/dev/null 2>&1; then

        end=$(date +%s%N)
        aasm_ns=$((end - start))

    else
        nasm_s=$(awk "BEGIN {printf \"%.3f\", $nasm_ns / 1000000000}")

        printf '%-12s │ %-12s │ %-12s │ %-12s │ %-10s │ %-10s\n' \
            "$n" "${nasm_s}s" 'ERROR' '-' '-' '-'
        continue
    fi

    # ─────────────────────────────────────────────────────────────────────────
    # FASM
    # ─────────────────────────────────────────────────────────────────────────

    start=$(date +%s%N)

    if "$FASM_BIN" "$fasm_file" "$TMP_DIR/fasm.o" \
        >/dev/null 2>&1; then

        end=$(date +%s%N)
        fasm_ns=$((end - start))

    else
        nasm_s=$(awk "BEGIN {printf \"%.3f\", $nasm_ns / 1000000000}")
        aasm_s=$(awk "BEGIN {printf \"%.3f\", $aasm_ns / 1000000000}")

        printf '%-12s │ %-12s │ %-12s │ %-12s │ %-10s │ %-10s\n' \
            "$n" "${nasm_s}s" "${aasm_s}s" 'ERROR' \
            "$(awk "BEGIN {printf \"%.2fx\", $aasm_ns / $nasm_ns}")" '-'
        continue
    fi

    # ─────────────────────────────────────────────────────────────────────────
    # Convert nanoseconds to seconds
    # ─────────────────────────────────────────────────────────────────────────

    nasm_s=$(awk "BEGIN {printf \"%.3f\", $nasm_ns / 1000000000}")
    aasm_s=$(awk "BEGIN {printf \"%.3f\", $aasm_ns / 1000000000}")
    fasm_s=$(awk "BEGIN {printf \"%.3f\", $fasm_ns / 1000000000}")

    # Ratios
    aasm_nasm=$(awk "BEGIN {printf \"%.2fx\", $aasm_ns / $nasm_ns}")
    fasm_aasm=$(awk "BEGIN {printf \"%.2fx\", $fasm_ns / $aasm_ns}")

    printf '%-12s │ %-12s │ %-12s │ %-12s │ %-10s │ %-10s\n' \
        "$n" "${nasm_s}s" "${aasm_s}s" "${fasm_s}s" \
        "$aasm_nasm" "$fasm_aasm"
done

printf '%s\n' \
    '─────────────┴──────────────┴──────────────┴──────────────┴────────────┴───────────'

printf '\n'
printf 'A/N = AmmAsm / NASM\n'
printf 'F/A = FASM / AmmAsm\n'
printf '< 1.00x = left-hand assembler is faster\n'
printf '> 1.00x = right-hand assembler is faster\n'
printf '\n'