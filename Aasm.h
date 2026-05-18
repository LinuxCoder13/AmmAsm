#pragma ones
 
#include <stdint.h>
#include <stdio.h>
 
/* == forward declarations == */
typedef enum {
    T_INS,
    T_INT,
    T_PLUS,
    T_MINUS,
    T_DIV,
    T_MULL,
    T_LSHIFT,
    T_RSHIFT,
    T_XOR,
    T_AND,
    T_OR,
    T_RPRANT,
    T_LPRANT,
    T_LAB,
    T_REG8,
    T_REG16,
    T_REG32,
    T_REG64,
    T_ADDR_EXPR,
    T_LABEL_EXPR,
    T_STR,
    T_SOF,
    T_EOL,
    T_EOF,
    T_SEC,
    T_U8,
    T_U8PTR,
    T_U16,
    T_U16PTR,
    T_U32,
    T_U32PTR,
    T_U64,
    T_U64PTR,
    T_CHAR,
    T_COMMA,
    T_RESB,
    T_RESQ,
    T_RESD,
    T_RESL,
    T_PC
} TokenType;


typedef enum {
    AST_INT,
    AST_INS,    
    AST_U8,
    AST_U16,
    AST_U32,
    AST_U64,
    AST_RESB,
    AST_RESQ,
    AST_RESD,
    AST_RESL,
    AST_EXPR, 
    AST_LABEL,
    AST_COMMA,
    AST_ADDR_EXPR,
    AST_CHAR,
    AST_PC,
    AST_UNKNOWN
} ASTType;

typedef enum {
    O_NONE = 2,
    O_REG8,
    O_REG16,
    O_REG32,
    O_REG64,
    O_EXPR, // imm, lab, pc, char
    O_CHAR, 
    O_IMM,
    O_MEM
} OperandType;

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

} AddrExpr;

typedef struct {
    TokenType type;
    uint8_t* value;
} ExprToken;

typedef struct {
    int count;
    ExprToken tokens[25]; 
} Expr;


typedef struct{
    OperandType type;

    union {
        uint8_t reg[8];
        Expr expr; // imm, label, $, char, ect.
        AddrExpr addr;
        uint64_t imm;
        uint8_t c;
    };

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

// oh, lord
typedef struct AST {
    ASTType type;
    char cmd[12];  // mostly useing for ins

    union {     
        struct { Operand  operands[2]; int oper_count; uint64_t pc;} ins; 
        struct { uint8_t  data[64]; int size; } u8;
        struct { uint16_t data[64]; int size; } u16;
        struct { uint32_t data[64]; int size; } u32;
        struct { U64Entry entries[32]; int size; uint64_t pc; } u64;
        struct { uint64_t size; } resb;
        struct { uint64_t size; } resq;
        struct { uint64_t size; } resd;
        struct { uint64_t size; } resl;
        struct { uint8_t c;     } chr;
        struct { uint8_t name[64]; uint64_t adress; uint64_t vadress;} label; // only can be in .text section
        struct { uint64_t vaddr;} pc; // $
    };

    uint8_t machine_code[16];
    uint8_t machine_code_size;
        
} AST;

typedef struct {
    int   type;       
    int   line;       // for errors
    char* value;      
} Token;

typedef struct {   
    const char* filename;  
    char        buf[256]; 
    Token*      toks;
    char labelscope[256]; 
} Lexer;

/* == utility == */
int    isin(const char *str, char c);
int    is2arrin(const char *str[], char *str2);
uint64_t find_lab_addr(const uint8_t* name);
 
/* == expression evaluator == */
long   parse_number(void);
long   parse_term(void);
long   parse_expr(void);
long   eval_expr(const uint8_t *str);
 
/* == string / char helpers == */
char  *read_string(char *buff, char *dest, int line);
 
/* == token management == */
void   add_token(int type, char *value, int line);
void   del_all_toks(void);
void   DEBUG_PRINT_TOKENS(void);
 
/* == register helpers == */
uint8_t find_reg64_index(const char *reg);
uint8_t find_reg32_index(const char *reg);
uint8_t find_reg16_index(const char *reg);
uint8_t find_reg8_index(const char *reg);
 
/* == address-expression parser == */
AddrExpr parse_addr_expr(const uint8_t *expr);
 
/* == instruction encoders == */
uint8_t encode_mov_reg_imm(uint8_t *mash_code, uint8_t reg_idx, uint64_t imm, uint8_t sz);
uint8_t encode_mov_reg_reg(uint8_t *mash_code, uint8_t dest_idx, uint8_t src_idx, uint8_t sz);
uint8_t encode_inst_rm_rm(uint8_t *mash_code, uint8_t reg_idx, AddrExpr *expr, uint8_t sz, uint8_t opcode);
uint8_t encode_add_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz);
uint8_t encode_add_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);

/* == lexer == */
int    LEXER(FILE *fl);
 
/* == parser == */
AST   *PARSE(void);
 
/* == label resolver / linker == */
uint64_t collect_labels(void);
void     resolve_labels(void);
 
/* == expression resolver == */
uint64_t resolve_expr(Expr expr, uint64_t pc);

/* == code-gen passes == */
void parseInst(AST *node);
void parse_size_directives(AST *node);
 
/* == ELF writer == */
void ELFgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size);
 
/* == top-level pipeline == */
void compiler(uint8_t *text, int *textsize, uint64_t *e_entry);
void handl_pipeline(int argc, char **argv);
 
/* == debug == */
void DEBUG_PRINT_AST(void);
 

 
