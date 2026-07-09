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