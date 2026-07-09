#pragma once

#include <string.h>
#include <stdint.h> 
#include <stdlib.h> 
#include <stdio.h>
#include "parse.h"
#include "enum.h"
#include "struct.h"
#include "linker.h"

extern volatile const char *p;

extern long parse_number();
extern long parse_term();
extern long parse_expr();
extern long eval_expr(const uint8_t *str);
extern int isin(const char *str, char c);
extern int is2arrin(const char *str[], char *str2);
extern int expr_is_const(Expr *e);
extern uint64_t eval_const_expr(Expr *e);
extern int expr_label_count(Expr *e);
extern void resolve_imm(AST* node, int expr_idx, int imm_size);
extern int get_signed_imm_size_(int64_t imm);
extern int get_unsigned_imm_size_(uint64_t imm);
extern int get_lab_indx(const uint8_t* lab);
extern const char* get_label_from_expr(Expr expr);
extern uint64_t find_lab_addr(const uint8_t* name);
extern uint8_t externed_label(const uint8_t* name);
extern uint64_t find_sec_addr(const uint8_t* name);
extern uint8_t find_reg64_index(const char *r); 
extern uint8_t find_reg32_index(const char *r);
extern uint8_t find_reg16_index(const char *r) ;
extern uint8_t find_reg8_index(const char *r); 
extern void* append(int *len, int *cap, void* oldarr, const void* value, size_t sz);
extern uint8_t** TwoDappend(int *len, int *cap, uint8_t **arr, const uint8_t* value);
extern void free_expr(Expr *expr);
extern void free_ast(AST *ast, int ast_len);
extern void TwoDfree(uint8_t **arr, int count);

extern int astrcmp(const char* s1, const char* s2);  // !!!!_/-|self-hosted function|-\_!!!!