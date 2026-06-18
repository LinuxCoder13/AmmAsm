#pragma once
 
#include <stdint.h>
#include <stdio.h>
 
/* == forward declarations == */
typedef enum __attribute__((packed)){
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
    T_SEGR,
    T_ADDR_EXPR,
    T_STR,
    T_SOF,
    T_EOL,
    T_EOF,
    T_SEC,
    T_U8,
    T_U16,
    T_U32,
    T_U64,
    T_CHAR,
    T_COMMA,
    T_RESB,
    T_RESQ,
    T_RESD,
    T_RESL,
    T_PC,
    T_GLOBAL
} TokenType;


typedef enum __attribute__((packed)){
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
    AST_SECTION,
    AST_CHAR,
    AST_PC,
    AST_GLOBAL,
    AST_UNKNOWN
} ASTType;

typedef enum __attribute__((packed)){
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

typedef struct __attribute__((packed)){
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

typedef struct __attribute__((packed)){
    TokenType type;
    uint8_t* value;
} ExprToken;

typedef struct __attribute__((packed)){
    uint8_t count;
    ExprToken tokens[22]; 
} Expr;


typedef struct __attribute__((packed)){
    OperandType type;

    union {
        uint8_t reg[5];
        Expr expr; // imm, label, $, char, ect.
        AddrExpr addr;
        uint64_t imm;
        uint8_t c;
    };

} Operand;

typedef enum __attribute__((packed)){
    U64_INT,
    U64_EXPR
} U64EntryType;

typedef struct __attribute__((packed)){
    U64EntryType type;
    union {
        uint64_t imm;
        Expr expr;
    };
} U64Entry;

typedef struct __attribute__((packed)) AST {
    ASTType type;
    char cmd[12];  // mostly useing for ins

    // sizeof(AST) == 1670
    union {     
        struct { Operand  operands[3]; int oper_count; uint64_t pc;} ins; 
        struct { uint8_t  data[256]; int size; } u8;
        struct { uint16_t data[256]; int size; } u16;
        struct { uint32_t data[256]; int size; } u32;
        struct { U64Entry entries[8]; int size; uint64_t pc; } u64; // bigest
        struct { uint64_t size; } resb;
        struct { uint64_t size; } resq;
        struct { uint64_t size; } resd;
        struct { uint64_t size; } resl;
        struct { uint8_t c;     } chr;
        struct { uint8_t secname[64]; uint64_t adress; uint64_t vadress;} section;
        struct { uint8_t name[64]; uint64_t adress; uint64_t vadress; int is_global; } label; 
        struct { uint8_t labels[25][64]; int lab_count;} global;
        struct { uint64_t vaddr;} pc; // $
    };

    uint8_t machine_code[32]; 
    uint8_t machine_code_size;
        
} AST;

typedef struct {
    char* value;      
    int   line;       // for errors
    int type;       
} Token;

typedef struct __attribute__((packed)){   
    const char* filename;  
    char        buf[256]; 
    Token*      toks;
    char labelscope[64]; 
} Lexer;

/* == utility == */
int    isin(const char *str, char c);
int    is2arrin(const char *str[], char *str2);
uint64_t find_lab_addr(const uint8_t* name);
uint8_t is_reg(const uint8_t* reg);
extern int astrcmp(const char* s1, const char* s2);  // self-hosted function!!!!

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
uint8_t encode_add_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
uint8_t encode_add_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
uint8_t encode_sub_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
uint8_t encode_sub_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
uint8_t encode_imul_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz);
uint8_t encode_imul_reg_reg(uint8_t *mash_code, uint8_t src, uint8_t dest, uint8_t sz);
uint8_t encode_cmp_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr);
uint8_t encode_cmp_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz);
uint8_t encode_push_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz);
uint8_t encode_pop_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz);

/* == lexer == */
int    LEXER(FILE *fl);
 
/* == parser == */
AST   *PARSE(void);
 
/* == label resolver / linker == */
uint64_t collect_labels_sections(int pie_mode, int obj_file);
void     resolve_labels(void);
 
/* == expression resolver == */
uint64_t resolve_expr(Expr expr, uint64_t pc);

/* == code-gen passes == */
uint8_t parseInst(AST* node, uint64_t *pc);
void parse_size_directives(AST* node, uint64_t *pc);
 
/* == ELF writer == */

typedef struct {
    // e_ident[16]
    unsigned char e_ident[16];
    
    // ELF Header fields
    uint16_t e_type;
    uint16_t e_machine;
    uint32_t e_version;
    uint64_t e_entry;
    uint64_t e_phoff;
    uint64_t e_shoff;
    uint32_t e_flags;
    uint16_t e_ehsize;
    uint16_t e_phentsize;
    uint16_t e_phnum;
    uint16_t e_shentsize;
    uint16_t e_shnum;
    uint16_t e_shstrndx;
} __attribute__((packed)) ELF64_Ehdr;

typedef struct {
    uint32_t p_type;
    uint32_t p_flags;
    uint64_t p_offset;
    uint64_t p_vaddr;
    uint64_t p_paddr;
    uint64_t p_filesz;
    uint64_t p_memsz;
    uint64_t p_align;
} __attribute__((packed)) ELF64_Phdr;

// ======= for obj files =======
typedef struct {
    uint64_t r_offset; // offset(from start of text to disp32) of rip rel instruction
    uint64_t r_info; // symbol index [high 32 bits] + relocation type [low 32 bits]
    int64_t  r_addend; // 
} __attribute__((packed)) Elf64_Rela;
 
typedef struct {
    uint32_t st_name; // offset name in .strtab
    uint8_t  st_info; // bind[4 bits] + type[4 bits]
    uint8_t  st_other; 
    uint16_t st_shndx; // in which section is symbol
    uint64_t st_value; // offset in section
    uint64_t st_size;  // size (mainly 0)
} __attribute__((packed)) Elf64_Sym;
 
typedef struct {
    uint32_t sh_name;
    uint32_t sh_type;
    uint64_t sh_flags;
    uint64_t sh_addr;
    uint64_t sh_offset;
    uint64_t sh_size;
    uint32_t sh_link;
    uint32_t sh_info;
    uint64_t sh_addralign;
    uint64_t sh_entsize;
} __attribute__((packed)) Elf64_Shdr;

int GenObjElfFile(FILE *fl, const char *src_filename);
int ELFgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size, int pie_mode);
 
/* == top-level pipeline == */
void compiler(uint8_t *text, int *textsize, uint64_t *e_entry, int pie_mode, int obj_file);
void handl_pipeline(int argc, char **argv, int pie_mode, int obj_file);
 
/* == debug == */
void DEBUG_PRINT_AST(void);
 

 
