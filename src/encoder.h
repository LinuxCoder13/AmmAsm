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
extern uint8_t encode_two_byte_opcode_reg(uint8_t *mash_code, uint8_t opcode, uint8_t dest, uint8_t src, uint8_t destsz, uint8_t prefix);
extern uint8_t encode_inst_reg_rm2(uint8_t *machine_code, uint8_t opcode2, uint8_t reg, AddrExpr *expr, uint8_t dst_sz, uint8_t prefix);
extern uint8_t encode_xmm_or_r64__xmm_or_r64(uint8_t* mash_code, uint8_t dest, uint8_t src, uint8_t is_dest_isGPR);
extern uint8_t encode_avx_xmm_xmm_xmm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t L, uint8_t pp, uint8_t mmmmm);
extern uint8_t encode_avx_ymm_ymm_ymm(uint8_t* mash_code, uint8_t opcode, uint8_t dest, uint8_t src1, uint8_t src2, uint8_t L, uint8_t pp, uint8_t mmmmm);