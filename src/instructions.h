#pragma once

#ifndef NULL
#define NULL ((void*)0)
#endif

extern const char *CMDS[];
extern const char *JCC[];
extern const char *HUMAN_AST[];
extern const char *HUMAN_AST2[]; 
extern const char *Sign_extensions[];

// sign-extended immediate instructions
extern const char* short_imm_instructions[];

extern const char* zero_operand_instructions[];

extern const char* AVX512[];
extern const char* AVX512_that_not_suppots_broatcast[];



extern const int CMDS_COUNT;
extern const int JCC_COUNT;
extern const int HUMAN_AST_COUNT;
extern const int HUMAN_AST2_COUNT; 
extern const int Sign_extensions_COUNT;

// sign-extended immediate instructions
extern const int short_imm_instructions_COUNT;

extern const int zero_operand_instructions_COUNT;

extern const int AVX512_COUNT;
extern const int AVX512_that_not_suppots_broatcast_COUNT;