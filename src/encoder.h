#pragma once

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "enum.h"
#include "struct.h"
#include "stdio.h"
#include "registers.h"
#include "utality.h"


#define REX_BASE  0x40
#define REX_W     0b00001000
#define REX_R     0b00000100
#define REX_X     0b00000010
#define REX_B     0b00000001

typedef enum  {
    VEX_PP_NONE = 0,
    VEX_PP_66   = 1,
    VEX_PP_F3   = 2,
    VEX_PP_F2   = 3,
} VEX_PP;

typedef enum  {
    VEX_MAP_0F   = 1,
    VEX_MAP_0F38 = 2,
    VEX_MAP_0F3A = 3,
} VEX_MAP;

typedef enum {
    VEX_XMM = 0,
    VEX_YMM = 1
} VEX_VECTOR_SZ;

// yeeeee, here we are
#define VEX_R(rex_r) ((((rex_r) ^ 1) & 1) << 7)
#define VEX_X(rex_x) ((((rex_x) ^ 1) & 1) << 6)
#define VEX_B(rex_b) ((((rex_b) ^ 1) & 1) << 5)

#define VEX_MMMMM(map) (((map) & 0b11111))

#define VEX_VVVV(reg) ((((reg) ^ 0xF) & 0xF) << 3)
#define VEX_L(mode) ((mode & 1) << 2)
#define VEX_PP(prefix) (prefix & 0b11)

enum {
    EVEX_MAP_0F    = 1,
    EVEX_MAP_0F38  = 2,
    EVEX_MAP_0F3A  = 3,
    EVEX_MAP_UNNAMED5 = 5, // I did't find its name in intel manual
    EVEX_MAP_UNNAMED6 = 6, // I did't find its name in intel manual
};

enum {
    EVEX_PP_NONE = 0, // no prefix
    EVEX_PP_66   = 1, // 66
    EVEX_PP_F3   = 2, // F3
    EVEX_PP_F2   = 3, // F2
};

enum {
    EVEX_K0 = 0,
    EVEX_K1,
    EVEX_K2,
    EVEX_K3,
    EVEX_K4,
    EVEX_K5,
    EVEX_K6,
    EVEX_K7,
};

enum {
    TUPLE_FULL = 0,   // Full Vector (N = 16/32/64 for XMM/YMM/ZMM)
    TUPLE_HALF = 1,   // Half Vector (N = 8/16/32)
    TUPLE_T1   = 2    // Tuple1 Scalar (N = 1)
};

enum {
    EVEX_W0 = 0,
    EVEX_W1 = 1,
};

enum {
    EVEX_Z0 = 0,
    EVEX_Z1 = 1,
};

enum {
    EVEX_B0 = 0,
    EVEX_B1 = 1,
};

enum {
    EVEX_XMM = 0, 
    EVEX_YMM = 1, 
    EVEX_ZMM = 2, 
};

// P0
#define EVEX_R(rex_r) ((((rex_r) ^ 1) & 1) << 7)
#define EVEX_X(rex_x) ((((rex_x) ^ 1) & 1) << 6)
#define EVEX_B(rex_b) ((((rex_b) ^ 1) & 1) << 5)
#define EVEX_ER(rex_er)((((rex_er) ^ 1) & 1) << 4)
// #define EVEX_ZERO ((0 & 1) << 3)
#define EVEX_MMM(map) (((map) & 0b111))
 
// P1
#define EVEX_W(W) ((W & 1) << 7)
#define EVEX_VVVV(reg) ((((reg) ^ 0xF) & 0xF) << 3)
#define EVEX_INITP1_ONE ((1 & 1) << 2)
#define EVEX_PP(prefix) ((prefix) & 0b11)

// P2
#define EVEX_Z(Z) (((Z) & 1) << 7)
#define EVEX_LL(ll) (((ll) & 0b11) << 5)
#define EVEX_BRODCAST(BR) (((BR) & 1) << 4)
#define EVEX_EV(EV) (((EV) & 1) << 3)
#define EVEX_A(AAA) (((AAA) & 0b111) << 0) // K0 - K7


#define emit_modrm(mod, reg, rm) (((mod & 7) << 6) | ((reg & 7) << 3) | (rm & 7))
#define emit_sib(scale, idx, base) (((scale & 3) << 6) | ((idx & 7) << 3) | (base & 7))

/* == address-expression parser == */
AddrExpr parse_addr_expr(const uint8_t *expr, int line);
 
/* == instruction encoders == */ 
extern uint8_t encode_mov_reg_imm(uint8_t *mash_code, uint8_t reg_idx, uint64_t imm, uint8_t sz);
extern uint8_t encode_mov_reg_reg(uint8_t *mash_code, uint8_t dest_idx, uint8_t src_idx, uint8_t sz);
extern uint8_t encode_inst_rm_rm(uint8_t *mash_code, uint8_t reg_idx, AddrExpr *expr, uint8_t sz, uint8_t opcode, uint8_t imm_sz, uint64_t imm);
extern uint8_t encode_add_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_add_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_sub_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_sub_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_imul_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz);
extern uint8_t encode_imul_reg_reg(uint8_t *mash_code, uint8_t src, uint8_t dest, uint8_t sz);
extern uint8_t encode_imul_reg_reg_imm(uint8_t *mash_code, uint8_t dest, uint8_t src, uint64_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_cmp_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_cmp_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_push_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz);
extern uint8_t encode_pop_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz);
extern uint8_t encode_div_or_idiv_reg(uint8_t* mash_code, uint8_t reg ,uint8_t src, uint8_t sz);
extern uint8_t encode_xor_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_xor_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_adc_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_adc_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_or_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_or_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_and_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_and_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_sbb_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
extern uint8_t encode_sbb_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
extern uint8_t encode_group2_reg_imm(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t imm, uint8_t sz);
extern uint8_t encode_group2_reg_cl(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t sz);
extern uint8_t encode_group3_reg(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t sz);
extern uint8_t encode_test_reg_reg(uint8_t *mash_code, uint8_t dest_idx, uint8_t src_idx, uint8_t sz);
extern uint8_t encode_test_reg_imm(uint8_t *mash_code, uint8_t reg_idx, uint64_t imm, uint8_t sz);
extern uint8_t encode_xchg_reg_reg(uint8_t *mash_code, uint8_t dest_idx, uint8_t src_idx, uint8_t sz);
extern uint8_t encode_group4_reg(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t sz);
extern uint8_t encode_group5_reg(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t sz);
extern uint8_t encode_group12_xmm_imm(uint8_t* mash_code, uint8_t dest, uint8_t imm, uint8_t digit_group);
extern uint8_t encode_group13_xmm_imm(uint8_t* mash_code, uint8_t dest, uint8_t imm, uint8_t digit_group);
extern uint8_t encode_group14_xmm_imm(uint8_t* mash_code, uint8_t dest, uint8_t imm, uint8_t digit_group);
extern uint8_t encode_two_byte_opcode_reg(uint8_t *mash_code, uint8_t opcode, uint8_t dest, uint8_t src, uint8_t destsz, uint8_t prefix);
extern uint8_t encode_inst_reg_rm2(uint8_t *machine_code, uint8_t opcode2, uint8_t reg, AddrExpr *expr, uint8_t dst_sz, uint8_t prefix);
extern uint8_t encode_xmm_or_r64__xmm_or_r64(uint8_t* mash_code, uint8_t dest, uint8_t src, uint8_t is_dest_isGPR);
extern uint8_t encode_avx_xmm_xmm_xmm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t L, uint8_t pp, uint8_t mmmmm);
extern uint8_t encode_avx_ymm_ymm_ymm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t L, uint8_t pp, uint8_t mmmmm);
extern uint8_t encode_avx_xmm_xmm_mem(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, AddrExpr *expr, uint8_t L, uint8_t pp, uint8_t mmmmm);
extern uint8_t encode_avx_ymm_ymm_mem(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, AddrExpr *expr, uint8_t L, uint8_t pp, uint8_t mmmmm);
extern uint8_t encode_avx512_xmm_xmm_xmm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t mmm, uint8_t LL, uint8_t PP, uint8_t W, uint8_t aaa, uint8_t z);
extern uint8_t encode_avx512_ymm_ymm_ymm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t mmm, uint8_t LL, uint8_t PP, uint8_t W, uint8_t aaa, uint8_t z);
extern uint8_t encode_avx512_zmm_zmm_zmm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t mmm, uint8_t LL, uint8_t PP, uint8_t W, uint8_t aaa, uint8_t z);
extern uint8_t encode_avx512_xmm_xmm_rm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, AddrExpr *src2, uint8_t mmm, uint8_t LL, uint8_t PP, uint8_t W, uint8_t aaa, uint8_t z, uint8_t TypleType, uint8_t B);
extern uint8_t encode_avx512_ymm_ymm_rm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, AddrExpr *src2, uint8_t mmm, uint8_t LL, uint8_t PP, uint8_t W, uint8_t aaa, uint8_t z, uint8_t TypleType, uint8_t B);
extern uint8_t encode_avx512_zmm_zmm_rm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, AddrExpr *src2, uint8_t mmm, uint8_t LL, uint8_t PP, uint8_t W, uint8_t aaa, uint8_t z, uint8_t TypleType, uint8_t B);
