#pragma once
#include "enum.h"
#include <stdint.h>

typedef struct {
    // must have
    uint8_t base;
    uint8_t index;
    uint8_t scale;
    int32_t disp;

    uint8_t have_base;
    uint8_t have_index;
    uint8_t have_disp;

    uint8_t is_rip_rel;
    uint8_t label[64];
    int64_t addend;

} AddrExpr;

typedef struct {
    TokenType type;
    uint8_t* value;
} ExprToken;

typedef struct {
    uint8_t count;
    ExprToken *tokens;
    int tok_len, tok_cap; 
} Expr;


typedef struct {
    OperandType type;

    union {
        uint8_t reg[8];
        Expr expr; // imm, label, $, char, ect.
        AddrExpr addr;
        uint64_t imm;
        uint8_t c;
    };

    // 1, 2, 4, 8. 0 - not defined
    uint8_t imm_sz; // `inst [addr], db/w/d/q imm` 

} Operand;

typedef enum {
    U64_INT,
    U64_EXPR
} U64EntryType;

typedef struct {
    U64EntryType type;
    union {
        uint64_t imm;
        Expr expr;
    };
} U64Entry;

typedef struct AST {
    ASTType type;
    char cmd[8];  // mostly useing for ins
    uint16_t line;

    // sizeof(AST) == 608
    union {     
        struct { Operand  operands[4]; int oper_count; uint64_t pc;} ins; // biggest?
        struct { uint8_t  *data; int data_len; int data_cap; } u8;
        struct { uint16_t *data; int data_len; int data_cap; } u16;
        struct { uint32_t *data; int data_len; int data_cap; } u32;
        struct { U64Entry *entries; int entries_len; int entries_cap; uint64_t pc; } u64; 
        struct { uint64_t size; } resb;
        struct { uint64_t size; } resq;
        struct { uint64_t size; } resd;
        struct { uint64_t size; } resl;
        struct { uint8_t secname[64]; uint64_t adress; uint64_t vadress;} section;
        struct { uint8_t name[64]; uint64_t adress; uint64_t vadress; int is_global; } label; 
        struct { uint8_t **labels; int labels_len; int labels_cap;} global;
        struct { uint8_t **labels; int labels_len; int labels_cap;} externs;
    };

    uint8_t machine_code[256]; // Sorry
    uint8_t machine_code_size;
        
} AST;

typedef struct {
    char* value;      
    int   line;       // for errors
    int type;       
} Token;

typedef struct {   
    const char* filename;  
    char        buf[1024]; 
    Token*      toks;
    char labelscope[64]; 
} Lexer;