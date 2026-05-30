# 0 "Aasm.c"

/*
 * AmmAsm - Linux x86-64 Assembler 
 * Copyright (C) 2026 Ammar Najafli
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

 #define DEBUG


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/mman.h>
#include <time.h>
#include <pthread.h>
#include <sys/wait.h>
#include <signal.h>
#include <ctype.h>
#include <stdint.h>
#include <inttypes.h>

#include "Aasm.h"

#define MAX_TOKENS 1024

// .rodata            
const char *CMDS[] = {"mov", "push", "pop", "syscall", "call", "jmp", "add", "sub", "imul",
               "mul", "div", "je", "jne", "jg", "jl", "jge", "jle", "jz", "ja", "jb", "jnz", "jc",
               "xor", "or", "cmp", "inc", "dec", "nop", "ret", "leave", "test", "lea", "not", 
               "and", "shl", "shr", NULL};

const char *JCC[] = { "je", "jne", "jg", "jl", "jge", "jle", "jz", "ja", "jb", "jnz", "jc", NULL};

const char *HUMAN_AST[] = { "db", "dw", "dd", "dq", NULL};

// sign-extended immediate instructions
const char* short_imm_instructions[] = { "add", "sub", "cmp", NULL};


/* name of label can include only this chars */

const char *LETEXT = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_1234567890";
const char* DIG    = "0123456789";
const char* DIGEXT = "0123456789abcdefABCDEF";
const char* DIGBIN = "01";
const char* DIGOCT = "01234567";

// 8-bit low registers
const char* regs8[] = {
    "al", "cl", "dl", "bl",
    "spl", "bpl", "sil", "dil",
    NULL
};

// 8-bit high registers (r8–r15)
const char* regs8GP[] = {
    "r8b", "r9b", "r10b", "r11b",
    "r12b", "r13b", "r14b", "r15b",
    NULL
};

// 16-bit registers
const char* regs16[] = {
    "ax", "cx", "dx", "bx",
    "sp", "bp", "si", "di",
    NULL
};

// 16-bit general-purpose (r8–r15)
const char* regs16GP[] = {
    "r8w", "r9w", "r10w", "r11w",
    "r12w", "r13w", "r14w", "r15w",
    NULL
};

// 32-bit registers
const char* regs32[] = {
    "eax", "ecx", "edx", "ebx",
    "esp", "ebp", "esi", "edi",
    NULL
};

// 32-bit general-purpose (r8–r15)
const char* regs32GP[] = {
    "r8d", "r9d", "r10d", "r11d",
    "r12d", "r13d", "r14d", "r15d",
    NULL
};

// 64-bit registers
const char* regs64[] = {
    "rax", "rcx", "rdx", "rbx",
    "rsp", "rbp", "rsi", "rdi",
    "rip", NULL // user can control inst-pointer
};

// 64-bit general-purpose (r8–r15)
const char* regs64GP[] = {
    "r8", "r9", "r10", "r11",
    "r12", "r13", "r14", "r15",
    NULL
};

#define TEXT 0x401000

// uint64_t pc = 0;
// #define vpc (pc + TEXT)
uint16_t line = 0;

Token toks[MAX_TOKENS];
int toks_count = 0;

AST ast[MAX_TOKENS / 8];
int ast_count = 0;

const char *p;


int isin(const char *str, char c){ 
    for(int i = 0; str[i] != '\0'; i++)
        if(str[i] == c) return 1;
    return 0;
}

int is2arrin(const char *str[], char *str2){ 
    for(int i=0; str[i] != NULL; ++i) 
        if(strcasecmp(str[i], str2) == 0) 
            return 1; 
    return 0;
}
long parse_expr(); // forward

long parse_number() {
    while (isspace(*p)) p++;

    if (*p == '-') {
        p++;
        return -parse_number();
    }

    if (*p == '(') {
        p++;
        long val = parse_expr();
        if (*p == ')') p++;
        return val;
    }

    long res = 0;

    if (p[0] == '0' && (p[1] == 'x' || p[1] == 'X')) {
        p += 2;
        while (isxdigit(*p)) {
            if (*p >= '0' && *p <= '9') res = res * 16 + (*p - '0');
            else if (*p >= 'a' && *p <= 'f') res = res * 16 + (*p - 'a' + 10);
            else if (*p >= 'A' && *p <= 'F') res = res * 16 + (*p - 'A' + 10);
            p++;
        }
        return res;
    }

    if (p[0] == '0' && (p[1] == 'b' || p[1] == 'B')) {
        p += 2;
        while (*p == '0' || *p == '1') {
            res = res * 2 + (*p - '0');
            p++;
        }
        return res;
    }

    if (p[0] == '0' && (p[1] == 'o' || p[1] == 'O')) {
        p += 2;
        while (*p >= '0' && *p <= '7') {
            res = res * 8 + (*p - '0');
            p++;
        }
        return res;
    }

    if (isdigit(*p)) {
        while (isdigit(*p)) {
            res = res * 10 + (*p - '0');
            p++;
        }
        return res;
    }

    // fallback
    return 0;
}

long parse_term() {
    long left = parse_number();
    while (1) {
        while (isspace(*p)) p++;
        if (*p == '*') {
            p++;
            left *= parse_number();
        } 
        else if (*p == '/') {
            p++;
            left /= parse_number();
        } 
        else break;
    }
    return left;
}

long parse_expr() {
    long left = parse_term();
    while (1) {
        while (isspace(*p)) p++;
        if (*p == '+') {
            p++;
            left += parse_term();
        } 
        else if (*p == '-') {
            p++;
            left -= parse_term();
        }
        else if (*p == '^'){
            p++;
            left ^= parse_term();
        }
        else if (*p == '|'){
            p++;
            left |= parse_term();
        }
        else if (*p == '&'){
            p++;
            left &= parse_term();
        }
        else if (*p == '>' && *(p+1) == '>'){
            p+=2;
            left >>= parse_term();
        }
        else if (*p == '<' && *(p+1) == '<'){
            p+=2;
            left <<= parse_term();
        }
        else break;
    }
    return left;
}

long eval_expr(const uint8_t *str) {
    p = str;
    return parse_expr();
}

int expr_is_const(Expr *e) {
    for (int i = 0; i < e->count; i++) {
        if (e->tokens[i].type == T_LAB || e->tokens[i].type == T_PC)
            return 0;
    }
    return 1;
}

uint64_t eval_const_expr(Expr *e) {
    char buf[256] = {0};
    int bi = 0;

    for (int i = 0; i < e->count; i++) {
        bi += snprintf(buf + bi, 256 - bi, "%s", e->tokens[i].value);
    }

    return (uint64_t)eval_expr(buf);
}

void itoa(uint64_t value, uint8_t* str) {
    if (value == 0) {
        str[0] = '0';
        str[1] = '\0';
        return;
    }

    uint8_t buff[20];
    int i = 0;
    int is_negative = 0;

    if (value < 0) {
        is_negative = 1;
        value = -value;
    }

    while (value > 0) {
        buff[i++] = (value % 10) + '0';
        value /= 10;
    }

    if (is_negative) {
        buff[i++] = '-';
    }

    int j = 0;
    while (i > 0) {
        str[j++] = buff[--i];
    }
    str[j] = '\0';
}


void add_token(int type, char* value, int line){
    if(toks_count >= MAX_TOKENS){
        fprintf(stderr, "AmmAsm:\033[;31m Fatal: Too mant tokens (max 1024)\033[0m\n");
        exit(1);
    }
    toks[toks_count].line = line;
    toks[toks_count].type = type;
    toks[toks_count].value = strdup(value);
    toks_count++;
}

#define del_token(tokidx) free(toks[tokidx].value);

void del_all_toks(){
    for(int i = MAX_TOKENS - 1; i >= 0; i--){
        del_token(i);
    }
}


void DEBUG_PRINT_TOKENS() {
    #ifdef DEBUG
    printf("=== TOKENS DUMP (%d tokens) ===\n", toks_count);
    for (int i = 0; i < toks_count; i++) {
        const char* type_str = "UNKNOWN";
        switch(toks[i].type) {
            case T_SOF: type_str = "T_SOF"; break;
            case T_INS: type_str = "T_INS"; break;
            case T_INT: type_str = "T_INT"; break;
            case T_PLUS: type_str = "T_PLUS"; break;
            case T_MINUS: type_str = "T_MINUS"; break;
            case T_MULL: type_str = "T_MULL"; break;
            case T_DIV: type_str = "T_DIV"; break;
            case T_OR: type_str = "T_OR"; break;
            case T_XOR: type_str = "T_XOR"; break;
            case T_AND: type_str = "T_AND"; break;
            case T_LSHIFT: type_str = "T_LSHIFT"; break;
            case T_RSHIFT: type_str = "T_RSHIFT"; break;
            case T_LAB: type_str = "T_LAB"; break;
            case T_REG8: type_str = "T_REG8"; break;
            case T_REG16: type_str = "T_REG16"; break;
            case T_REG32: type_str = "T_REG32"; break;
            case T_REG64: type_str = "T_REG64"; break;
            case T_ADDR_EXPR: type_str = "T_ADDR_EXPR"; break;
            case T_PC: type_str = "T_PC"; break;
            case T_STR: type_str = "T_STR"; break;
            case T_EOL: type_str = "T_EOL"; break;
            case T_EOF: type_str = "T_EOF"; break;
            case T_SEC: type_str = "T_SEC"; break;
            case T_U8: type_str = "T_U8"; break;
            case T_U8PTR: type_str = "T_U8PTR"; break;
            case T_U16: type_str = "T_U16"; break;
            case T_U16PTR: type_str = "T_U16PTR"; break;
            case T_U32: type_str = "T_U32"; break;
            case T_U32PTR: type_str = "T_U32PTR"; break;
            case T_U64: type_str = "T_U64"; break;
            case T_U64PTR: type_str = "T_U64PTR"; break;
            case T_CHAR: type_str = "T_CHAR"; break;
            case T_COMMA: type_str = "T_COMMA"; break;
            case T_LPRANT: type_str = "T_LPRANT"; break;
            case T_RPRANT: type_str = "T_RPRANT"; break;
            case T_RESB: type_str = "T_RESB"; break;
            case T_RESQ: type_str = "T_RESQ"; break;
            case T_RESD: type_str = "T_RESD"; break;
            case T_RESL: type_str = "T_RESL"; break;
        }
        
        printf("Token[%d]: type=%-12s value='%s' line=%d\n", 
               i, type_str, toks[i].value ? toks[i].value : "(null)", toks[i].line);
    }
    printf("=== END TOKENS ===\n\n");
    #endif
}


char *read_string(char *buff, char *dest, int line) {
    while (*buff != '\0' && *buff != '"') {
        if (*buff == '\\') {
            switch (*(buff + 1)) {
                case 'n': *dest++ = '\n'; buff += 2; continue;
                case '"': *dest++ = '"'; buff += 2; continue;
                case '/': *dest++ = '/'; buff += 2; continue;
                case 't': *dest++ = '\t'; buff += 2; continue;
                case 'b': *dest++ = '\b'; buff += 2; continue;
                case '\\': *dest++ = '\\'; buff += 2; continue;
                case '0': *dest = '\0'; buff += 2; return buff;
                default : fprintf(stderr, "AmmAsm: invalid escape sequence on line %d\n", line); exit(1);
            }
        }
        else *dest++ = *buff++;
        
    }
    return buff;
}


void expand_local_labels(){
    char global_lab[64] = {0};
    int glob_defined = 0;

    for(int i = 0; i < ast_count; ++i){
        AST* node = &ast[i];

        // LABEL
        if(node->type == AST_LABEL){

            if(node->label.name[0] != '.'){  
                strncpy(global_lab, node->label.name, 63);
                global_lab[63] = 0;
                glob_defined = 1;
            }
            else {
                if(!glob_defined){ 
                    fprintf(stderr, "AmmAsm: Local label \"%s\" without global\n", node->label.name);
                    exit(1);
                }

                char full[64];
                snprintf(full, sizeof full, "%s%s", global_lab, node->label.name);
                strncpy(node->label.name, full, 63);
                node->label.name[63] = 0;
            }
        }

        // INSTRUCTIONS (EXPR)
        else if(node->type == AST_INS){
            for(int j = 0; j < node->ins.oper_count; j++){
                if(node->ins.operands[j].type == O_EXPR){
                    Expr *expr = &node->ins.operands[j].expr;
                    for(int k = 0; k < expr->count; ++k){
                        if(expr->tokens[k].type == T_LAB && expr->tokens[k].value[0] == '.'){
                            if(!glob_defined){ fprintf(stderr, "AmmAsm: local label used without global\n"); exit(1);}

                            char full[64] = {0};
                            snprintf(full, sizeof(full), "%s%s", global_lab, expr->tokens[k].value);
                            free(expr->tokens[k].value);
                            expr->tokens[k].value = strdup(full);
                        }
                    }
                }
            }
        }

        else if(node->type == AST_U64){
            for(int j = 0; j < node->u64.size; j++){
                if(node->u64.entries[j].type == U64_EXPR){
                    Expr *expr = &node->u64.entries[j].expr;
                    for(int k = 0; k < expr->count; ++k){
                        if(expr->tokens[k].type == T_LAB && expr->tokens[k].value[0] == '.'){
                            if(!glob_defined){ fprintf(stderr, "AmmAsm: local label used without global\n"); exit(1);}

                            char full[64] = {0};
                            snprintf(full, sizeof(full), "%s%s", global_lab, expr->tokens[k].value);
                            free(expr->tokens[k].value);
                            expr->tokens[k].value = strdup(full);
                        }
                    }
                }
            }            
        }
    }
}

 
// lexer:
int LEXER(FILE* fl) {
    if (!fl) {
        fprintf(stderr, "AmmAsm:\033[;31m Fatal: no such file or dir\033[0m\n");
        exit(1);
    }
    Lexer lexer = {0}; 
    int in_comment = 0;

    add_token(T_SOF, "", 1); // start of file

    while (fgets(lexer.buf, 256, fl) != NULL) {
        char* buff = lexer.buf;
        line++;
        #ifdef DEBUG
            printf("Processing line %d: %s", line, lexer.buf);
            fflush(stdout);
        #endif

        while (*buff) {
            #ifdef DEBUG
                printf("Current char: '%c' (0x%02x)\n", *buff, *buff);
            #endif
            fflush(stdout);
            while (isspace(*buff)) buff++;
            if (*buff == '\0' || *buff == '\n') break;
            if ((*buff == '/' && *(buff + 1) == '/') || *buff == ';') break; // skip comment till end of line
            if(!in_comment && *buff == '/' && *(buff+1) == '*'){
                in_comment = 1;
                buff += 2;
                continue;
            }
            else if(in_comment){
                if(*buff == '*' && *(buff+1) == '/'){
                    in_comment = 0;
                    buff += 2;
                } else buff++;
                continue;
            }
            else if(*buff == '$'){
                add_token(T_PC, (uint8_t[2]){'$', '\0'}, line);
            }

            else if (*buff == '-'){ buff++; add_token(T_MINUS, "-",  line); continue;}
            else if (*buff == '+'){ buff++; add_token(T_PLUS,  "+",  line); continue;}
            else if (*buff == '*'){ buff++; add_token(T_MULL,  "*",  line); continue;}
            else if (*buff == '/'){ buff++; add_token(T_DIV,   "/",  line); continue;}

            else if (*buff == '|'){ buff++; add_token(T_OR,    "|",  line); continue;}
            else if (*buff == '^'){ buff++; add_token(T_XOR,   "^",  line); continue;}
            else if (*buff == '&'){ buff++; add_token(T_AND,   "&",  line); continue;}
            
            else if (*buff == '>' && *(buff+1) == '>'){ buff+=2; add_token(T_RSHIFT, ">>", line); continue;}
            else if (*buff == '<' && *(buff+1) == '<'){ buff+=2; add_token(T_LSHIFT, "<<", line); continue;}

            else if (*buff == '('){ buff++; add_token(T_LPRANT,   "(",  line); continue;}
            else if (*buff == ')'){ buff++; add_token(T_RPRANT,   ")",  line); continue;}


            else if (isdigit(*buff)) {

                char num[128] = {0};
                int i = 0;

                while (*buff && (
                    isdigit(*buff) || 
                    isxdigit(*buff) ||
                    *buff == 'x' || *buff == 'X' || 
                    *buff == 'o' || *buff == 'O' ||  
                    *buff == 'b' || *buff == 'B' )){

                    if (i < (int)(sizeof(num) - 1)) {
                        num[i++] = *buff;
                    }
                    buff++;
                }
                
                num[i] = '\0';
                
                add_token(T_INT, num, line);
                continue; 
            }

            else if (isin(LETEXT, *buff)) { // global label
                char buf[256] = {0};
                int i = 0;
                while (isin(LETEXT, *buff) && i <= 256) {
                    buf[i++] = *buff++;
                }
                buf[i] = 0;
                
                while (*buff == ' ' || *buff == '\t') buff++;

                if (*buff == ':') {
                    buff++;
                    add_token(T_LAB, buf, line);
                    continue;
                }
                else if (is2arrin(CMDS, buf)){
                    add_token(T_INS, buf, line);
                    continue;
                }

                // registers
                else if(is2arrin(regs8, buf)  || is2arrin(regs8GP, buf))  {add_token(T_REG8, buf, line);  continue;}
                else if(is2arrin(regs16, buf) || is2arrin(regs16GP, buf)) {add_token(T_REG16, buf, line); continue;}
                else if(is2arrin(regs32, buf) || is2arrin(regs32GP, buf)) {add_token(T_REG32, buf, line); continue;}
                else if(is2arrin(regs64, buf) || is2arrin(regs64GP, buf)) {add_token(T_REG64, buf, line); continue;}                    

                // directives
                else if(strcasecmp(buf, HUMAN_AST[0]) == 0) add_token(T_U8, buf, line); 
                else if(strcasecmp(buf, HUMAN_AST[1]) == 0) add_token(T_U16, buf, line);
                else if(strcasecmp(buf, HUMAN_AST[2]) == 0) add_token(T_U32, buf, line);
                else if(strcasecmp(buf, HUMAN_AST[3]) == 0) add_token(T_U64, buf, line);
                
                else {                  
                    add_token(T_LAB, buf, line);
                }
                continue;
            }

            else if (*buff == '.') { // local label
                char buf[256] = {0};
                buf[0] = '.'; buff++;
                int i = 1;
                while (isin(LETEXT, *buff) ) {
                    buf[i++] = *buff++;
                }
                char full[64] = {0};
                snprintf(full, 64, "%s", buf);

                if (*buff == ':') {
                    buff++;
                    add_token(T_LAB, full, line);
                    continue;
                } 
                else {
                    add_token(T_LAB, full, line);
                    continue;
                }
            }

            else if(*buff == '"'){
                buff++;

                char parsed_str[256] = {0};
                
                buff = read_string(buff, parsed_str, line);
                if(*buff != '"'){
                    fprintf(stderr, "AmmAsm: unterminated string literal at line %d\n", line);
                    exit(1);                    
                } 
                buff++;

                add_token(T_STR, parsed_str, line);
                continue;
            }
            else if (*buff == '\'') {
                buff++; 
                char tmp;      

                if (*buff == '\\') {
                    switch (*++buff) {
                        case 'n': tmp = '\n'; break;
                        case 'r': tmp = '\r'; break;
                        case 't': tmp = '\t'; break;
                        case '0': tmp = '\0'; break;
                        case '\\': tmp = '\\'; break;
                        case '\"': tmp = '\"'; break;
                        case '\'': tmp = '\''; break;
                        default:
                            fprintf(stderr, "AmmAsm: Unknown escape sequence on line %d\n", line);
                            exit(1);
                    }
                    buff++;
                }
                else tmp = *buff++; 

                if (*buff != '\'') {
                    fprintf(stderr, "AmmAsm: Unterminated character literal on line %d\n", line);
                    exit(1);
                }
                
                buff++; 
                
                char tmp2[2] = {tmp, '\0'};
                add_token(T_CHAR, tmp2, line);
                continue;
            }

            else if (*buff == '[') {
                buff++; 

                char expr_buf[128] = {0};
                int i = 0;

                while (*buff && *buff != ']') {
                    if (i < (int)(sizeof(expr_buf) - 1)) {
                        expr_buf[i++] = *buff++;
                    }
                }

                if (*buff == ']') buff++;
                else {fprintf(stderr, "AmmAsm: you fogot to close '[' at line %d", line); exit(1);}
                expr_buf[i] = '\0';


                char clean_expr[128] = {0};
                int k = 0;
                for (int j = 0; expr_buf[j]; j++) {
                    if (!isspace(expr_buf[j])) {
                        clean_expr[k++] = expr_buf[j];
                    }
                }
                clean_expr[k] = '\0';
                
                add_token(T_ADDR_EXPR, clean_expr, line);
                continue;
            }

            else if(*buff == ','){
                buff++;
                while(isspace(*buff)) buff++;
                add_token(T_COMMA, ",", line);
                continue;
            }

            else if(*buff == '$'){
                buff++;
                add_token(T_PC, "$", line);
                continue;
            }

            else if (strncasecmp(buff, "resb", 4) == 0){ add_token(T_RESB, buff, line); buff += 4; while (isspace(*buff)) buff++; continue;}
            else if (strncasecmp(buff, "resw", 4) == 0){ add_token(T_RESQ, buff, line); buff += 4; while (isspace(*buff)) buff++; continue;}
            else if (strncasecmp(buff, "resd", 4) == 0){ add_token(T_RESD, buff, line); buff += 4; while (isspace(*buff)) buff++; continue;}
            else if (strncasecmp(buff, "resq", 4) == 0){ add_token(T_RESL, buff, line); buff += 4; while (isspace(*buff)) buff++; continue;}
                
            else{ 
                fprintf(stderr, "AmmAsm: unvalid syntax or char on line '%d'\n", line); 
                exit(1); 
            }
            buff++;
        }

        add_token(T_EOL, "", line);
    }
    add_token(T_EOF, "ELF", line); // LOL
    return line;
}

void DEBUG_PRINT_AST() {
    #ifdef DEBUG
    printf("=== AST DUMP (%d nodes) ===\n", ast_count);
    for (int i = 0; i < ast_count; i++) {
        AST* node = &ast[i];
        const char* type_str = "UNKNOWN";
        
        switch(node->type) {
            case AST_INS: type_str = "AST_INS"; break;
            case AST_U8: type_str = "AST_U8"; break;
            case AST_U16: type_str = "AST_U16"; break;
            case AST_U32: type_str = "AST_U32"; break;
            case AST_U64: type_str = "AST_U64"; break;
            case AST_RESB: type_str = "AST_RESB"; break;
            case AST_RESQ: type_str = "AST_RESQ"; break;
            case AST_RESD: type_str = "AST_RESD"; break;
            case AST_RESL: type_str = "AST_RESL"; break;
            case AST_LABEL: type_str = "AST_LABEL"; break;
            case AST_ADDR_EXPR: type_str = "AST_ADDR_EXPR"; break;
            case AST_CHAR: type_str = "AST_CHAR"; break;
            case AST_INT: type_str = "AST_INT"; break;
        }
        
        printf("AST[%d]: type=%-15s", i, type_str);
        
        switch(node->type) {
            case AST_INS:
                printf(" cmd='%s' operands=%d", node->cmd, node->ins.oper_count);
                for (int j = 0; j < node->ins.oper_count; j++) {
                    const char* otype_str = "?";
                    switch(node->ins.operands[j].type) {
                        case O_REG8: otype_str = "REG8"; break;
                        case O_REG16: otype_str = "REG16"; break;
                        case O_REG32: otype_str = "REG32"; break;
                        case O_REG64: otype_str = "REG64"; break;
                        case O_IMM: otype_str = "IMM"; break;
                        case O_MEM: otype_str = "MEM"; break;
                        case O_EXPR: otype_str = "EXPR"; break;
                        case O_CHAR: otype_str = "CHAR"; break;
                    }
                    printf(" [%s:", otype_str);
                    
                    switch(node->ins.operands[j].type) {
                        case O_REG8:
                        case O_REG16:
                        case O_REG32:
                        case O_REG64:
                            printf("'%s'", node->ins.operands[j].reg);
                            break;
                        case O_IMM:
                            printf("0x%lx", node->ins.operands[j].imm);
                            break;
                        case O_CHAR:
                            printf("'%c'", node->ins.operands[j].c);
                            break;
                        case O_EXPR:
                            printf("(");
                            for (int k = 0; k < node->ins.operands[j].expr.count; k++) {
                                if (node->ins.operands[j].expr.tokens[k].type == T_CHAR) {
                                    printf("'%s'", node->ins.operands[j].expr.tokens[k].value);
                                } else {
                                    printf("%s", node->ins.operands[j].expr.tokens[k].value);
                                }
                                if (k < node->ins.operands[j].expr.count - 1) printf(" ");
                            }
                            printf(")");
                            break;
                        case O_MEM:
                            if (node->ins.operands[j].addr.is_rip_rel) {
                                printf("rip+");
                            }
                            printf("b=%d", node->ins.operands[j].addr.base);
                            if (node->ins.operands[j].addr.have_index) {
                                printf(", i=%d", node->ins.operands[j].addr.index);
                                printf(", s=%d", node->ins.operands[j].addr.scale);
                            }
                            if (node->ins.operands[j].addr.have_disp) {
                                printf(", d=0x%x", node->ins.operands[j].addr.disp);
                            }
                            break;
                        default:
                            printf("?");
                            break;
                    }
                    printf("]");
                }
                printf(" inst size=%d", node->machine_code_size);
                break;
                
            case AST_LABEL:
                printf(" name='%s' addr=0x%lx  vaddr=0x%lx", node->label.name, node->label.adress, node->label.vadress);
                break;

            case AST_CHAR:
                printf(" name='%c'", node->chr.c);    
                break;

            case AST_U8:
                printf(" size=%d data=[", node->u8.size);
                for (int j = 0; j < node->u8.size; j++) {
                    printf("%02x", node->u8.data[j]);
                    if (j < node->u8.size - 1) printf(" ");
                }
                printf("]");
                break;
                
            case AST_U16:
                printf(" size=%d data=[", node->u16.size * sizeof(short));
                for (int j = 0; j < node->u16.size; j++) {
                    printf("%04x", node->u16.data[j]);
                    if (j < node->u16.size - 1) printf(" ");
                }
                printf("]");
                break;
                
            case AST_U32:
                printf(" size=%d data=[", node->u32.size * sizeof(int));
                for (int j = 0; j < node->u32.size; j++) {
                    printf("%08x", node->u32.data[j]);
                    if (j < node->u32.size - 1) printf(" ");
                }
                printf("]");
                break;
                
            case AST_U64:
                printf(" size=%d data=[", node->u64.size);
                for (int j = 0; j < node->u64.size; j++) {
                    if (node->u64.entries[j].type == U64_INT) {
                        printf("%016llx", node->u64.entries[j].imm);
                    } else {
                        printf("(");
                        for (int k = 0; k < node->u64.entries[j].expr.count; k++) {
                            printf("%s", node->u64.entries[j].expr.tokens[k].value);
                            if (k < node->u64.entries[j].expr.count - 1) printf(" ");
                        }
                        printf(")");
                    }
                    if (j < node->u64.size - 1) printf(", ");
                }
                printf("]");
                break;
                
            case AST_RESB:
                printf(" size=%ld bytes", node->resb.size);
                break;
                
            case AST_RESQ:
                printf(" size=%ld qwords", node->resq.size);
                break;
                
            case AST_RESD:
                printf(" size=%ld dwords", node->resd.size);
                break;
                
            case AST_RESL:
                printf(" size=%ld lbytes", node->resl.size);
                break;
        }
        
        if (node->machine_code_size > 0) {
            printf(" machine_code=[");
            for (int j = 0; j < node->machine_code_size; j++) {
                printf("%02x", node->machine_code[j]);
                if (j < node->machine_code_size - 1) printf(" ");
            }
            printf("]");
        }
        
        printf("\n");
    }
    printf("=== END AST ===\n\n");
    #endif
    
}

/* post-link resolve O(n^2) */


// collect labels and find e_entry 
uint64_t collect_labels(int pie_mode) {
    uint64_t current_pc = pie_mode ? 0x1000 : 0x401000; // .text section starts here 
    uint8_t e_entry_defined = 0;
    uint64_t e_entry;

    for (int i = 0; i < ast_count; i++) {
        if (ast[i].type == AST_LABEL) {
            ast[i].label.adress = pie_mode ? current_pc : current_pc - 0x400000; // offset in file(for debug) 
            ast[i].label.vadress = current_pc;
            
            #ifdef DEBUG
            printf("Label '%s' at 0x%lx\n", ast[i].label.name, (pie_mode) ? ast[i].label.adress : ast[i].label.vadress);
            #endif

            if(!strcmp(ast[i].label.name, "_start")){
                e_entry_defined = 1;
                e_entry = current_pc;
            }
        }
        else if ((ast[i].type == AST_INS && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U8  && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U16 && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U32 && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U64 && ast[i].machine_code_size > 0))
            current_pc += ast[i].machine_code_size; 
    }
    
    if(!e_entry_defined){
        printf("AmmAsm: Linker: Entry point '_start' not found. Using %s%s as default\n", (pie_mode) ? "0x1000" : "0x401000", (pie_mode) ? "(PIE)" : "");
        e_entry = pie_mode ? 0x1000 : 0x401000;
    }

    return e_entry;
}

void resolve_imm(AST* node, int expr_idx, int imm_size) {
    uint64_t val = resolve_expr(node->ins.operands[expr_idx].expr, node->ins.pc);
    int offset = node->machine_code_size - imm_size;
    
    switch(imm_size) {
        case 1: *(uint8_t*) (node->machine_code   + offset) = (uint8_t) val; break;
        case 2: *(uint16_t*)(node->machine_code + offset) = (uint16_t)val; break;
        case 4: *(uint32_t*)(node->machine_code + offset) = (uint32_t)val; break;
        case 8: *(uint64_t*)(node->machine_code + offset) = val; break;
    }
}

// Ammlinker
void resolve_labels() {
    for (int i = 0; i < ast_count; i++) {
        AST* node = &ast[i];
        if(node->type != AST_INS && node->type != AST_U64) continue;    

        if(node->type == AST_INS){
            Operand a = node->ins.operands[0];
            Operand b = node->ins.operands[1];
            Operand c = node->ins.operands[2];

            if(is2arrin(short_imm_instructions, node->cmd) && b.type == O_EXPR){
                uint64_t val = resolve_expr(b.expr, node->ins.pc);
                int immsz = 0;
                if(a.type == O_REG64) {
                    if((int64_t)val >= -128 && (int64_t)val <= 127) immsz = 1;
                    else immsz = 4;
                }
                else if(a.type == O_REG32) {
                    if((int64_t)val >= -128 && (int64_t)val <= 127) immsz = 1;
                    else immsz = 4;  
                } 
                resolve_imm(node, 1, immsz);
            }

            // inst r64, expr(imm)
            else if(a.type == O_REG64 && b.type == O_EXPR) resolve_imm(node, 1, 8); // 1?

            // inst r32, expr(imm)
            else if(a.type == O_REG32 && b.type == O_EXPR) resolve_imm(node, 1, 4);
        }
         
        // JMP/CALL/JCC label (REL32)
        if ((strcasecmp(node->cmd, "jmp")  == 0 || 
                  strcasecmp(node->cmd, "call") == 0 ||
                  is2arrin(JCC, node->cmd)) &&
                 node->ins.operands[0].type == O_EXPR) {
            
            uint64_t addr = resolve_expr(node->ins.operands[0].expr, node->ins.pc);
            int32_t rel32 = (int32_t)(addr - (node->ins.pc + node->machine_code_size));
            *(uint32_t*)(node->machine_code + node->machine_code_size - 4) = rel32;
        }
        // [RIP REL] (DISP32)
        if ((node->ins.operands[0].addr.is_rip_rel || node->ins.operands[1].addr.is_rip_rel) &&
                (node->ins.operands[0].type == O_MEM || node->ins.operands[1].type == O_MEM)) {
            
            int idx = (node->ins.operands[0].type == O_MEM && node->ins.operands[0].addr.is_rip_rel) ? 0 : 1;
            AddrExpr *mem = &node->ins.operands[idx].addr;
            int32_t disp = mem->disp;
            
            uint64_t addr = find_lab_addr(mem->label);
            if (!addr) {
                fprintf(stderr, "AmmAsm: undefined label '%s' in RIP-relative addressing\n", mem->label);
                exit(1);
            }
            
            int32_t disp32 = (int32_t)(addr - (node->ins.pc + node->machine_code_size)) + disp;
            *(uint32_t*)(node->machine_code + node->machine_code_size - 4) = disp32;
        }

        // U64 (dq)
        if (node->type == AST_U64) {
            int offset = 0;
            for (int j = 0; j < node->u64.size; ++j) {
                if (node->u64.entries[j].type == U64_EXPR) {
                    uint64_t val = resolve_expr(node->u64.entries[j].expr, node->u64.pc + offset);
                    *(uint64_t*)(node->machine_code + offset) = val;
                }
                offset += sizeof(uint64_t);
            }
        }

        // we will not free() all Expr.tokens[i].value, becouse we need them for DEBUG_AST_PRINT() which calls at end of compiler.
        // OS will do it by him self.
    }
}

uint64_t find_lab_addr(const uint8_t* name){
    for (int j = 0; j < ast_count; j++) {
        if (ast[j].type == AST_LABEL && strcmp(ast[j].label.name, name) == 0) {
            return ast[j].label.vadress;
        }
    }

    return 0;
}

uint64_t resolve_expr(Expr expr, uint64_t pc){

    static char buffer[1024] = {0}; // for eval_expr
    buffer[0] = 0;
    int bi = 0;
    uint64_t addr; // label

    for(int i = 0; i < expr.count; i++){
        switch(expr.tokens[i].type){
            case T_LAB: {
                if(expr.tokens[i].value[0] == '.') { fprintf(stderr, "AmmAsm: can't use local lab in expr\n"); exit(1);}
                addr = find_lab_addr(expr.tokens[i].value);
                if(!addr){ fprintf(stderr, "AmmAsm: symbol \"%s\" undefined\n", expr.tokens[i].value); exit(1); }
 
                bi += snprintf(buffer + bi, 1024 - bi, "%lu", addr);
                break;
            }
            case T_PC: {
                bi += snprintf(buffer + bi, 1024 - bi, "%lu", pc);
                break;
            }
            case T_CHAR: {
                bi += snprintf(buffer + bi, 1024 - bi, "%d", expr.tokens[i].value[0]);
                break;
            }
            default:{ // just copy
                bi += snprintf(buffer + bi, 1024 - bi, "%s", expr.tokens[i].value);
                break;
            }
        }
    }
    
    return (uint64_t)eval_expr(buffer);
}

// parser:
AST* PARSE(){
    int pos = 0;

    while(pos < toks_count && toks[pos].type != T_EOF){
        Token *tok = &toks[pos];
        AST node = { 0 }; // memset(&node, 0, sizeof(AST));
        if (tok->type == T_INS) {
            node.type = AST_INS;
            node.ins.oper_count = 0;
            strncpy(node.cmd, toks[pos].value, sizeof node.cmd);
            pos++;

            while(pos < toks_count){
                if(toks[pos].type == T_COMMA){ pos++; continue;}
                else if(toks[pos].type == T_REG8 || toks[pos].type == T_REG16 ||
                        toks[pos].type == T_REG32 || toks[pos].type == T_REG64){
                    int tt = toks[pos].type;
                    strncpy(node.ins.operands[node.ins.oper_count].reg, toks[pos++].value, 8);
                    switch (tt) {
                        case T_REG8:  node.ins.operands[node.ins.oper_count++].type = O_REG8;  break;
                        case T_REG16: node.ins.operands[node.ins.oper_count++].type = O_REG16; break;
                        case T_REG32: node.ins.operands[node.ins.oper_count++].type = O_REG32; break;
                        case T_REG64: node.ins.operands[node.ins.oper_count++].type = O_REG64; break;
                        default:      node.ins.operands[node.ins.oper_count++].type = O_NONE;  break;
                    }
                }
                else if(toks[pos].type == T_ADDR_EXPR){
                    node.ins.operands[node.ins.oper_count].addr = parse_addr_expr(toks[pos].value);
                    pos++;
                    node.ins.operands[node.ins.oper_count++].type = O_MEM;
                    continue;
                    ((void(*)())0)(); // sacred artifact
                }

                // constexpr
                else if(toks[pos].type == T_CHAR && toks[pos+1].type == T_EOL){
                    node.ins.operands[node.ins.oper_count].c = toks[pos].value[0]; // okay?
                    node.ins.operands[node.ins.oper_count++].type = O_CHAR;
                    pos++;
                    continue;
                }

                // constexpr
                else if((toks[pos].type == T_INT || toks[pos].type == T_MINUS) && toks[pos + ((toks[pos].type == T_INT) ? 1 : 2)].type == T_EOL) {
                    
                    char expr_value[64]; 
                    if(toks[pos].type == T_MINUS && toks[pos + 1].type == T_INT) {
                        snprintf(expr_value, sizeof(expr_value), "%s%s", toks[pos].value, toks[pos + 1].value);
                        node.ins.operands[node.ins.oper_count].imm = (uint64_t)eval_expr(expr_value);
                        pos += 2;
                    } 
                    else {
                        node.ins.operands[node.ins.oper_count].imm = (uint64_t)eval_expr(toks[pos].value);
                        pos++;
                    }
                    
                    node.ins.operands[node.ins.oper_count++].type = O_IMM;
                    continue;
                }
                
                // expr
                else if((toks[pos].type == T_LAB || toks[pos].type == T_INT ||
                        toks[pos].type == T_PC|| toks[pos].type == T_MINUS
                        ||toks[pos].type == T_PLUS || toks[pos].type == T_CHAR || toks[pos].type == T_LPRANT)){

                    Expr expr = {0};
                    while (toks[pos].type != T_COMMA && toks[pos].type != T_EOL && toks[pos].type != T_EOF) {
                        expr.tokens[expr.count].type = toks[pos].type;
                        expr.tokens[expr.count].value = strdup(toks[pos].value); 
                        (expr.count >= 25) ? fprintf(stderr, "AmmAsm: Too many tokens in expr(max 16)\n"), exit(1) : expr.count++;
                        toks[pos].value = NULL; // escape double free()
                        pos++;
                    } 

                    if (expr_is_const(&expr)) {
                        node.ins.operands[node.ins.oper_count].type = O_IMM;
                        node.ins.operands[node.ins.oper_count].imm = eval_const_expr(&expr);
                    } 
                    else {
                        node.ins.operands[node.ins.oper_count].type = O_EXPR;
                        node.ins.operands[node.ins.oper_count].expr = expr;
                    }
                    node.ins.oper_count++;
                }

                else if(toks[pos].type == T_EOL || toks[pos].type == T_EOF){
                    node.ins.operands[node.ins.oper_count].type = O_NONE;
                    pos++;
                    break;
                }
                else {
                    fprintf(stderr, "AmmAsm: Unexpected token \"%s\" at line %d\n", toks[pos].value, toks[pos].line);
                    exit(1); 
                }
            }
            ast[ast_count++] = node;
            continue;
        }
        if(tok->type == T_LAB){
            node.type = AST_LABEL;
            if(tok->type != T_EOF && tok->type != T_EOL){
                strncpy(node.label.name, toks[pos++].value, sizeof(node.label.name));
            }
            ast[ast_count++] = node;
            continue;
        }
        if(tok->type == T_U8 && (pos == 0 || toks[pos-1].type == T_LAB)){  
            node.type = AST_U8;
            node.u8.size = 0;
            pos++;
            while(pos < toks_count){  
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF) break;
                if(toks[pos].type == T_COMMA){ pos++; continue;} // skip this shit
                if (node.u8.size >= 256) { fprintf(stderr, "AmmAsm: Too many bytes in string literal at line %d\n", toks[pos].line); exit(1); }
                
                if(toks[pos].type == T_CHAR){ 
                    node.u8.data[node.u8.size++] = (unsigned char)toks[pos].value[0];
                    pos++;
                }
                else if(toks[pos].type == T_INT){   // can be hex, octal, des see line 417
                    node.u8.data[node.u8.size++] = (unsigned char)eval_expr(toks[pos].value);
                    pos++;
                }
                else if(toks[pos].type == T_STR){
                    char *s = toks[pos].value;
                    while (*s) {
                    if (node.u8.size >= sizeof(node.u8.data)){ fprintf(stderr, "AmmAsm: String too long in U8 directive at line %d\n", toks[pos].line); exit(1);}
                        node.u8.data[node.u8.size++] = (unsigned char)*s++;
                    }
                    pos++;
                }
                else{
                    fprintf(stderr, "AmmAsm: Bytes are too cooked at line %d\n", toks[pos].line);
                    exit(1);
                }

            }
            ast[ast_count++] = node;
            if (pos < toks_count && (toks[pos].type == T_EOL || toks[pos].type == T_EOF)) ++pos;
            continue;
        }

        else if(tok->type == T_U16 && (pos == 0 || toks[pos-1].type == T_LAB)){
            node.type = AST_U16;
            node.u16.size = 0;
            pos++;
            while(pos < toks_count){
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF) break;
                if(toks[pos].type == T_COMMA){ pos++; continue;} 
                if(node.u16.size >= 256) fprintf(stderr, "AmmAsm: to many u16x leterals at line \"%d\"", toks[pos].line);
                
                if(toks[pos].type == T_INT){
                    node.u16.data[node.u16.size++] = (short)eval_expr(toks[pos].value);
                    ++pos;
                }
                else {
                    fprintf(stderr, "AmmAsm: unexpected token in u16 at line %d: '%s'\n", toks[pos].line, toks[pos].value);
                    exit(1);
                }
            }
            ast[ast_count++] = node;
            if(pos < toks_count && toks[pos].type == T_EOL) ++pos;
            continue;
        }
        else if (tok->type == T_U32 && (pos == 0 || toks[pos-1].type == T_LAB)) {
            node.type = AST_U32;
            node.u32.size = 0;
            pos++; 

            while (pos < toks_count && toks[pos].type != T_EOL && toks[pos].type != T_EOF) {
                if (toks[pos].type == T_COMMA){ pos++; continue; }
                if (node.u32.size >= 256){ fprintf(stderr, "AmmAsm: Too many u32 at line %d\n", toks[pos].line); exit(1);}
                if (toks[pos].type == T_INT) {
                    node.u32.data[node.u32.size++] = eval_expr(toks[pos].value);
                    pos++;
                } 
                else {
                    fprintf(stderr, "AmmAsm: unexpected token in u32 at line %d: '%s'\n", toks[pos].line, toks[pos].value);
                    exit(1);
                }
            }

            ast[ast_count++] = node;
            if (pos < toks_count && toks[pos].type == T_EOL) pos++;
        }

        else if (tok->type == T_U64 && (pos == 0 || toks[pos-1].type == T_LAB)) {
            node.type = AST_U64;
            node.u64.size = 0;
            pos++; 

            while (pos < toks_count && toks[pos].type != T_EOL && toks[pos].type != T_EOF) {
                if (toks[pos].type == T_COMMA){ pos++; continue; }
                if (node.u64.size >= 32){ fprintf(stderr, "AmmAsm: Too many u64 entries (max 32) at line %d\n", toks[pos].line); exit(1); }
                
                if (toks[pos].type == T_INT && (toks[pos+1].type == T_COMMA || toks[pos+1].type == T_EOL || toks[pos+1].type == T_EOF)) {
                    node.u64.entries[node.u64.size].type = U64_INT;
                    node.u64.entries[node.u64.size].imm = (uint64_t)eval_expr(toks[pos].value);
                    node.u64.size++;
                    pos++;
                } 
                else if(toks[pos].type == T_PC || toks[pos].type == T_LAB || toks[pos].type == T_INT ||
                        toks[pos].type == T_MINUS || toks[pos].type == T_PLUS) {
                    
                    Expr expr = {0};
                    expr.count = 0;
                    
                    while (pos < toks_count && toks[pos].type != T_COMMA && toks[pos].type != T_EOL && toks[pos].type != T_EOF) {
                        expr.tokens[expr.count].value = strdup(toks[pos].value);
                        expr.tokens[expr.count].type = toks[pos].type;
                        toks[pos].value = NULL; // escape double free()
                        expr.count++;
                        pos++;
                        
                        if (expr.count >= 16){fprintf(stderr, "AmmAsm: Expression too complex (max 16 tokens) at line %d\n", toks[pos].line); exit(1);}
                    }
                    
                    node.u64.entries[node.u64.size].type = U64_EXPR;
                    node.u64.entries[node.u64.size].expr = expr;
                    node.u64.size++;
                }
                else {
                    fprintf(stderr, "AmmAsm: unexpected token in u64 at line %d: '%s'\n", toks[pos].line, toks[pos].value);
                    exit(1);
                }
            }

            ast[ast_count++] = node;
        }

        else if(tok->type == T_RESB || tok->type == T_RESQ || tok->type == T_RESD || tok->type == T_RESL){
            Token *pp = tok;
            if(toks[(pos-1)].type != T_LAB || toks[(pos+1)].type != T_INT){ 
                fprintf(stderr, "AmmAsm: syntax erorr. expected identifier before \"%s\" and decimal number after\n", 
                    (pp->type == T_RESB) ? "resb" : 
                    (pp->type == T_RESQ) ? "resq" : 
                    (pp->type == T_RESD) ? "resd" : 
                    (pp->type == T_RESL) ? "resl" : "?");                    
                exit(1);    
            }

            switch (tok->type){
            case T_RESB: node.type = AST_RESB; node.resb.size = (long)eval_expr(toks[pos].value); break;
            case T_RESQ: node.type = AST_RESQ; node.resq.size = (long)eval_expr(toks[pos].value); break;
            case T_RESD: node.type = AST_RESD; node.resd.size = (long)eval_expr(toks[pos].value); break;
            case T_RESL: node.type = AST_RESL; node.resl.size = (long)eval_expr(toks[pos].value); break;
            }
            pos += 1;

            ast[ast_count++] = node;
            if(pos < toks_count && toks[pos].type == T_EOL) ++pos;
            continue;              
        }


        if (pos < toks_count && toks[pos].type != T_EOF) {
            pos++;
        }
    }

    del_all_toks();
    return ast; // for debug
}

uint8_t find_reg64_index(const char* reg) {
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs64[i], reg) == 0) return i;
    }
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs64GP[i], reg) == 0) return i + 8;
    }
    return -1;
}
uint8_t find_reg32_index(const char* reg) {
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs32[i], reg) == 0) return i;
    }
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs32GP[i], reg) == 0) return i + 8;
    }
    return -1;
}
uint8_t find_reg16_index(const char* reg) {
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs16[i], reg) == 0) return i;
    }
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs16GP[i], reg) == 0) return i + 8;
    }
    return -1;
}
uint8_t find_reg8_index(const char* reg) {
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs8[i], reg) == 0) return i;
    }
    for (int i=0; i<8; i++) {
        if (strcasecmp(regs8GP[i], reg) == 0) return i + 8;
    }
    return -1;
}

uint8_t is_reg(const uint8_t* reg){
    uint8_t res = 0;
    if((res = find_reg8_index(reg)) != (uint8_t)-1) return 1;
    if((res = find_reg16_index(reg)) != (uint8_t)-1) return 1;
    if((res = find_reg32_index(reg)) != (uint8_t)-1) return 1;
    if((res = find_reg64_index(reg)) != (uint8_t)-1) return 1;
    return 0;
}

/*
===============================================================================
Address Expression Parsing Rules - AmmAsm (x86-64)
===============================================================================

Unlike NASM/MASM, AmmAsm uses a *key-based format* for clarity and predictable parsing.  
No brackets, no “pretty” syntax - everything is explicitly labeled:
we parse expressions like:

    b=rbx, i=rcx, s=4, d=0x10

instead of NASM-like `[rbx + rcx*4 + 0x10]`.

This makes parsing trivial, avoids ambiguity, and still maps 1:1
to actual x86-64 SIB/modRM encoding logic.

===============================================================================
Allowed Keys:
===============================================================================

    b=REG or b=ADDR      -> base register (e.g. rax) or numeric address (0xB8000)
    i=REG                -> index register (e.g.rcx)
    s=NUM                -> scale (1, 2, 4, 8 only)
    d=NUM or HEX or BIN  -> displacement (e.g. 16, 0x10, 0b1010)

Each key is optional, but you must specify at least one of:
    base (b), index (i), or displacement (d)

===============================================================================
Examples (valid):
===============================================================================

    b=rax, d=32             ; [rax + 32]
    b=rbx, i=rcx, s=4       ; [rbx + rcx*4]
    b=r8, i=r9, s=8, d=0x10 ; [r8 + r9*8 + 0x10]
    d=0xB8000               ; [0xB8000]
    i=rbx, s=2              ; [rbx*2]

===============================================================================
Invalid (rejected at parse time):
===============================================================================

    s=2                ; scale without index
    i=rsp              ; rsp cannot be used as index
    s=3                ; invalid scale (must be 1,2,4,8)
    (empty)            ; nothing specified
    b=r14abcdef        ; invalid register name

===============================================================================
Parsing Algorithm
===============================================================================

1) Split expression by commas -> read tokens like `b=rax`, `i=rcx`, `s=4`, `d=0x10`
2) For each token:
      - skip spaces
      - identify the key (b, i, s, d)
      - parse right-hand side:
            * registers: stored as strings (`rax`)
            * numbers: auto-detected base (0x, 0b, 0o, decimal)
3) Validate:
      - if `scale` exists -> `index` must exist
      - if `index == rsp` -> error
      - if `scale` not in {1,2,4,8} -> error
      - if nothing set -> error

===============================================================================
Design Purpose
===============================================================================

No ambiguity - each field explicit (`b=`, `i=`, `s=`, `d=`)  
Easy to parse using simple `if(*p == 'b')` etc.  
Simple validation without complex expression grammar  
Maps directly to SIB/modRM logic for encoder  
Perfect for JIT/compilers - minimal string parsing

===============================================================================
Example:
Input:
    "b=rbx, i=rcx, s=4, d=0x10"

Output:
    AddrExpr {
        base = "rbx",
        index = "rcx",
        disp = 0x10,
        scale = 4
    }

===============================================================================
*/


#define REX_BASE  0x40
#define REX_W     0b00001000
#define REX_R     0b00000100
#define REX_X     0b00000010
#define REX_B     0b00000001

#define emit_modrm(mod, reg, rm) (((mod & 7) << 6) | ((reg & 7) << 3) | (rm & 7))
#define emit_sib(scale, idx, base) (((scale & 3) << 6) | ((idx & 7) << 3) | (base & 7))

AddrExpr parse_addr_expr(const uint8_t* expr) {
    AddrExpr new = { 0 };
    const uint8_t *p = expr;
    uint8_t find_b = 0, find_i = 0, find_s = 0, find_d = 0; 
    uint8_t base[64], index[4], scale[3], disp[32];
    base[0] = 0; index[0] = 0; scale[0] = 0; disp[0] = 0;

    scale[0] = '1'; // base value
    disp[0]  = '0'; // base value

    while (*p) {
        if(*p == 'b' || *p == 'B'){
            find_b = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm: Line %d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while(*p && *p != ',' &&  i < (int)(sizeof(base)) - 1)
                base[i++] = *p++;
            base[i] = '\0';
            if (*p == ',') p++;
        }

        else if(*p == 'i' || *p == 'I'){
            find_i = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm: Line %d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while(*p && *p != ',' &&  i < (int)(sizeof(index)) - 1)
                index[i++] = *p++;
            index[i] = '\0';
            if (*p == ',') p++;
        }

        else if(*p == 's' || *p == 'S'){
            find_s = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm: Line %d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while(isdigit(*p) && i < sizeof(scale)-1) scale[i++] = *p++;
            scale[i] = '\0';
            if (*p == ',') p++;
        }

        else if(*p == 'd' || *p == 'D'){
            find_d = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm: Line %d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while (*p && *p != ',' && i < sizeof(disp)-1) {
                disp[i++] = *p++;
            }
            disp[i] = '\0';
            if (*p == ',') p++;
        } 
        else {
            fprintf(stderr, "AmmAsm: Line %d: unknown key '%c'\n", line, *p);
            exit(1);
        }     
    }

    new.have_base  = find_b;
    new.have_index = find_i;
    new.have_disp  = find_d;

    new.scale = (uint8_t)eval_expr(scale);
    new.disp = (int32_t)eval_expr(disp);

    /* *trying to eliminate user */
    if (find_s && !new.have_index) {
        fprintf(stderr, "AmmAsm: Line %d: scale used without index register\n", line);
        exit(1);
    }

    if (new.have_index && strcasecmp(index, "rsp") == 0) {
        fprintf(stderr, "AmmAsm: Line %d: rsp cannot be used as index register\n", line);
        exit(1);
    }

    if (new.scale && !(new.scale == 1 || new.scale == 2 || new.scale == 4 || new.scale == 8)) {
        fprintf(stderr, "AmmAsm: Line %d: invalid scale factor %d (must be 1,2,4,8)\n", line, new.scale);
        exit(1);
    }

    if (!new.have_base && !new.have_index && eval_expr(disp) == 0) {
        fprintf(stderr, "AmmAsm: Line %d: addressing mode must have at least base, index or displacement\n", line);
        exit(1);
    }

    if (new.have_base && find_reg64_index(base) == (uint8_t)-1) {
        strncpy(new.label, base, sizeof new.label);
        new.is_rip_rel = 1;
        new.have_base = 0;
    }

    if (new.have_index && find_reg64_index(index) == (uint8_t)-1) {
        fprintf(stderr, "AmmAsm: Line %d: invalid index register name '%s'\n", line, index);
        exit(1);
    }
    
    if (!new.have_base && new.have_index && !new.have_disp) {
        fprintf(stderr, "AmmAsm: Line %d: index-only addressing is not supported (require base or disp32)\n", line);
        exit(1);
    }

    new.base  = (new.have_base)  ? find_reg64_index(base)  : 0;
    new.index = (new.have_index) ? find_reg64_index(index) : 0b100;

    return new;
}



// mov reg, imm
uint8_t encode_mov_reg_imm(uint8_t *mash_code, uint8_t reg_idx, uint64_t imm, uint8_t sz){
    uint8_t legacy_prefix = 0x66; // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0xB0 : 0xB8; 
    uint8_t pos = 0;
    uint8_t rm_idx = reg_idx;

    if(reg_idx >= 8){
        rex = REX_BASE | REX_B;
        rm_idx -= 8;
    }

    switch(sz){
        case 8: if(reg_idx >= 4 && reg_idx <= 7) rex |= REX_BASE; break; // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break; // none
        case 64: rex |= REX_BASE | REX_W; break;
    }
    

    opcode += rm_idx;

    if(rex)mash_code[pos++] = rex;
    mash_code[pos++] = opcode;

    switch (sz){
        case 8:  mash_code[pos++] = (uint8_t)imm; break;
        case 16: *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos+=2; break;
        case 32: *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos+=4; break;
        case 64: *(uint64_t*)(mash_code + pos) = (uint64_t)imm; pos+=8; break;
    }

    return pos; // mashine code size
}

// mov reg, reg
uint8_t encode_mov_reg_reg(uint8_t *mash_code, uint8_t dest_idx, uint8_t src_idx, uint8_t sz){
    uint8_t legacy_prefix = 0x66; // 16 bit 
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x88 : 0x89;
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm = dest_idx;
    uint8_t reg = src_idx;
    
    if(dest_idx >= 8){ 
        rex |= REX_B;
        rm -= 8;
    }

    if(src_idx >= 8){ 
        rex |= REX_R;
        reg -= 8;
    }

    switch (sz){
        case 8: if((dest_idx >= 4 && dest_idx <= 7) || (src_idx >= 4 && src_idx <= 7)) rex |= REX_BASE; break;// spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;           
        case 64: rex |= REX_BASE | REX_W; break;            
               
    }

    if(rex)mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    // mod = 0b11 means that this operation take place between 2 regs (no memory used)
    mash_code[pos++] = emit_modrm(0b11, reg, rm);

    return pos;
}



// inst reg, [addr] | inst [addr], reg
uint8_t encode_inst_rm_rm(uint8_t *mash_code, uint8_t reg, AddrExpr *expr, uint8_t sz,  uint8_t opcode){
    uint8_t legacy_prefix = 0x66; // 16 bit
    uint8_t rex = 0;
    uint8_t modrm = 0;
    uint8_t sib = 0;
    uint8_t need_sib = 0; // for now
    uint8_t disp_sz = 0;
    uint8_t mod;
    int pos = 0;

    // sib
    uint8_t base  = expr->base;
    uint8_t index = expr->index; // if index == 0b100 then no index
    uint8_t scale = 0b00; // base value

    switch(sz){
        case 64: rex |= REX_BASE | REX_W; break;
        case 32: break;
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 8:  if(reg >= 4) rex |= REX_BASE; break;
    }

    switch(expr->scale){
        case 1: scale = 0b00; break;
        case 2: scale = 0b01; break;
        case 4: scale = 0b10; break;
        case 8: scale = 0b11; break;
    }
    /*  
    
    Addresing | mod | r/m| SIB?| disp? |
    |---------|-----|----|-----|-------|     
 1. |[reg]    | 00  | reg| n/a | n/a   | v
 2. |[reg+d8] | 01  | reg| n/a | disp8 | v
 3. |[reg+d32]| 10  | reg| n/a | disp32| v
 4. |[rsp]    | 00  | 100| yes | n/a   | v
 5. |[rsp+d8] | 01  | 100| yes | disp8 | v
 6. |[rsp+d32]| 10  | 100| yes | disp32| v
 7. |[rbp]    | 01  | 101| n/a | disp=0| v
 8. |[b+i*s]  | 00  | 100| yes | n/a   | v
 9. |[b+i+d*s]|01/10| 100| yes | d8/d32| v
 10.|[i*s+d32]| 00  | 100|b=101| disp32| v
 11.|[rip+d32]| 00  | 101| n/a | disp32| v
            [DONE] :-)
    */

    if(reg >= 8)   rex |= REX_R;
    if(base >= 8)  rex |= REX_B;
    if(index >= 8) rex |= REX_X;

    if(expr->have_disp && expr->disp == 0) expr->have_disp = 0;
    if(!expr->have_disp){ mod = 0b00; expr->have_disp = 0;}
    else if(expr->disp >= -128 && expr->disp <= 127){ mod = 0b01; expr->have_disp = 1; disp_sz = 1;} 
    else /* disp fits in int32_t */ {mod = 0b10; expr->have_disp = 1; disp_sz = 4;}

    // 4, 5, 6.
    if(base == 0b100){ // rsp, r12
        modrm = emit_modrm(mod, reg, 0b100);
        sib   = emit_sib(0b00, 0b100, 0b100);
        need_sib = 1;
    }
    // 7.
    else if(base == 0b101){ // rbp, r13
        mod = 0b01;
        expr->disp = expr->have_disp ? expr->disp : 0;
        disp_sz = 1;
        expr->have_disp = 1;
        modrm = emit_modrm(mod, reg, 0b101);
    }

    // 8, 9
    else if(expr->have_index){
        modrm = emit_modrm(mod, reg, 0b100);
        sib   = emit_sib(scale, index, base);
        need_sib = 1;
    }

    // 1, 2, 3
    else if(expr->have_base && !expr->have_index){
        modrm = emit_modrm(mod, reg, base);
        need_sib = 0;
    }
        
    // 10.
    else if(!expr->is_rip_rel && !expr->have_base && expr->have_disp){
        modrm = emit_modrm(0b00, reg, 0b100);
        sib   = emit_sib(scale, index, 0b101);
        need_sib = 1;
        expr->have_disp = 1;
        disp_sz = 4;
    }

    // 11.
    else if(expr->is_rip_rel && !expr->have_base){
        modrm = emit_modrm(0b00, reg, 0b101);
        need_sib = 0;
    }
    
    if(rex != 0) mash_code[pos++] = rex | REX_BASE;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;
    if(need_sib) mash_code[pos++] = sib;
    if(expr->have_disp && !expr->is_rip_rel){
        if(disp_sz == 1) mash_code[pos++] = (uint8_t)expr->disp;
        else {*(uint32_t*)(mash_code + pos) = expr->disp; pos+=4; }
    }
    else if(expr->is_rip_rel){*(uint32_t*)(mash_code + pos) = 0x0; pos+=4; } // placeholder
    return pos;
}

uint8_t encode_add_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
    uint8_t rex = 0;
    uint8_t opcode = 0;
    uint8_t modrm = 0;
    uint8_t rm = reg;
    int pos = 0;

    if (reg >= 8) {
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz){
        case 8:
            if (reg >= 4 && reg <= 7) rex |= REX_BASE;
            break;

        case 16:
            mash_code[pos++] = 0x66;
            break;

        case 32:
            break;

        case 64:
            rex |= REX_BASE | REX_W;
            break;
    }

    if (sz == 8) opcode = 0x80;
     
    else {
        int32_t simm = (int32_t)imm;
        if (simm >= -128 && simm <= 127 && !is_expr) opcode = 0x83;
        else opcode = 0x81;
        
    }

    // rax, eax, ax, al
    if (reg == 0) {
        if (rex) mash_code[pos++] = rex;

        if (sz == 8) {
            mash_code[pos++] = 0x04;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x05;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b000, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_add_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x00 : 0x01; // first ever instruction?
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm  = dest;
    uint8_t reg = src;
    
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    if(src >= 8){
        rex |= REX_BASE | REX_R;
        reg -= 8;
    }

    switch(sz){
        case 8 : { if((dest >= 4 && dest <= 7) || (src >= 4 && src <= 7)){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, reg, rm);

    if(rex)mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
}

uint8_t encode_sub_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
    uint8_t rex = 0;
    uint8_t opcode = 0;
    uint8_t modrm = 0;
    uint8_t rm = reg;
    int pos = 0;

    if (reg >= 8) {
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz){
        case 8:
            if (reg >= 4 && reg <= 7) rex |= REX_BASE;
            break;

        case 16:
            mash_code[pos++] = 0x66;
            break;

        case 32:
            break;

        case 64:
            rex |= REX_BASE | REX_W;
            break;
    }

    if (sz == 8) opcode = 0x80;
     
    else {
        int32_t simm = (int32_t)imm;
        if (simm >= -128 && simm <= 127 && !is_expr) opcode = 0x83;
        else opcode = 0x81;
        
    }

    // rax, eax, ax, al
    if (reg == 0) {
        if (rex) mash_code[pos++] = rex;

        if (sz == 8) {
            mash_code[pos++] = 0x2C;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x2D;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b101, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_sub_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x28 : 0x29; 
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm  = dest;
    uint8_t reg = src;
    
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    if(src >= 8){
        rex |= REX_BASE | REX_R;
        reg -= 8;
    }

    switch(sz){
        case 8 : { if((dest >= 4 && dest <= 7) || (src >= 4 && src <= 7)){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, reg, rm);

    if(rex)mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
}

uint8_t encode_imul_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0xF6 : 0xF7;
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm = reg;

    if(reg >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }
    
    // if sz == 64: result of imul is in RDX:RAX
    // if sz == 32: result of imul is in EDX:EAX
    // if sz == 16: result of imul is in DX:AX
    // if sz == 8 : result of imul is in AH:AL(AX)

    switch(sz){
        case 8: if(reg >= 4 && reg <= 7) rex |= REX_BASE; break;
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, 0b101, rm);

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
}

uint8_t encode_imul_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    // Warn: imul r8, r8 does not exists
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t modrm = 0;
    uint8_t opc = 0x0F; // Two-byte escape opcode
    uint8_t opcode = 0xAF;
    int pos = 0;

    uint8_t rm = dest;
    uint8_t reg = src;
    
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    if(src >= 8){
        rex |= REX_BASE | REX_R;
        reg -= 8;
    }


    switch(sz){
        case 8:  {fprintf(stderr, "AmmAasm: invalid instruction 'imul r8, r8'\n"); exit(1); } break;
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W;
    }

    modrm = emit_modrm(0b11, reg, rm);

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opc;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
    
}

uint8_t encode_imul_reg_reg_imm(uint8_t *mash_code, uint8_t dest, uint8_t src, uint64_t imm, uint8_t sz, int is_expr) {
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t modrm = 0;
    uint8_t opcode;
    int pos = 0;

    uint8_t rm = src;
    uint8_t reg = dest; 

    if (dest >= 8) {
        rex |= REX_BASE | REX_R;
        reg -= 8;
    }
    if (src >= 8) {
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz) {
        case 16:
            mash_code[pos++] = legacy_prefix;
            if (imm == (int16_t)imm && (int16_t)imm >= -128 && (int16_t)imm <= 127 && !is_expr) {
                opcode = 0x6B;
            } 
            else {
                opcode = 0x69;
            }
            break;
        case 32:
            if (imm == (int32_t)imm && (int32_t)imm >= -128 && (int32_t)imm <= 127 && !is_expr) {
                opcode = 0x6B;
            } 
            else {
                opcode = 0x69;
            }
            break;
        case 64:
            rex |= REX_BASE | REX_W;
            if ((int64_t)imm >= -128 && (int64_t)imm <= 127 && !is_expr) {
                opcode = 0x6B;
            } 
            else {
                opcode = 0x69;
            }
            break;
    }

    modrm = emit_modrm(0b11, reg, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;


    if (opcode == 0x6B) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16) {
        *(uint16_t*)(mash_code + pos) = (uint16_t)imm;
        pos += 2;
    } 
    else {
        *(uint32_t*)(mash_code + pos) = (uint32_t)imm;
        pos += 4;
    }

    return pos;
}


uint8_t encode_cmp_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
    uint8_t rex = 0;
    uint8_t opcode = 0;
    uint8_t modrm = 0;
    uint8_t rm = reg;
    int pos = 0;

    if (reg >= 8) {
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz){
        case 8:
            if (reg >= 4 && reg <= 7) rex |= REX_BASE;
            break;

        case 16:
            mash_code[pos++] = 0x66;
            break;

        case 32:
            break;

        case 64:
            rex |= REX_BASE | REX_W;
            break;
    }

    if (sz == 8) opcode = 0x80;
     
    else {
        int32_t simm = (int32_t)imm;
        if (simm >= -128 && simm <= 127 && !is_expr) opcode = 0x83;
        else opcode = 0x81;
        
    }

    // rax, eax, ax, al
    if (reg == 0) {
        if (rex) mash_code[pos++] = rex;

        if (sz == 8) {
            mash_code[pos++] = 0x3C;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x3D;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b111, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_cmp_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x38 : 0x39; 
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm  = dest;
    uint8_t reg = src;
    
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    if(src >= 8){
        rex |= REX_BASE | REX_R;
        reg -= 8;
    }

    switch(sz){
        case 8 : { if((dest >= 4 && dest <= 7) || (src >= 4 && src <= 7)){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, reg, rm);

    if(rex)mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
}


uint8_t parseInst(AST* node, uint64_t *pc) {
    if (node->type != AST_INS) return 0;
    int pos = 0;

    Operand a = node->ins.operands[0];
    Operand b = node->ins.operands[1];
    Operand c = node->ins.operands[2];
    const uint8_t *cmd = node->cmd;
    uint8_t *machine_code = node->machine_code;
    
    memset(node->machine_code, 0, sizeof(node->machine_code));
    uint8_t* s = &node->machine_code_size;
    *s = 0;


    // ============================================================================
    // |                "MOV" INSTRUCTION ENCODING REFERENCE                      |
    // ============================================================================
    // 
    // REX prefix (0x40-0x4F):
    //   REX.W (bit 3) = 1 for 64-bit operands
    //   REX.R (bit 2) = 1 if reg field uses r8-r15
    //   REX.X (bit 1) = 1 if SIB index uses r8-r15  
    //   REX.B (bit 0) = 1 if r/m or SIB base uses r8-r15
    //
    // ModR/M byte format: [mod:2bit][reg:3bit][r/m:3bit]
    //   mod = 00: [base] (no disp, except RBP/R13 needs disp8)
    //   mod = 01: [base + disp8]
    //   mod = 10: [base + disp32]
    //   mod = 11: register direct (no memory)
    //   
    //   ===(REX.B = 0)=== 
    //   rax/eax/ax/al = 0b000; // 0
    //   rcx/ecx/cx/cl = 0b001; // 1
    //   rdx/edx/dx/dl = 0b010; // 2
    //   rbx/ebx/bx/bl = 0b011; // 3
    //   SIB = 0b100;           // 4
    //   rip + disp32 = 0b101;  // 5 (modrm.mod == 00)
    //   rsi/esi/si/sil = 0b110;// 6
    //   rdi/edi/di/dil = 0b111;// 7     

    //   ===(REX.B = 1)===
    //   r8/r8d/r8w/r8b = 0b000;     // 0
    //   r9/r9d/r9w/r9b = 0b001;     // 1
    //   r10/r10d/r10w/r10b = 0b010; // 2
    //   r11/r11d/r11w/r11b = 0b011; // 3
    //   SIB = 0b100;                // 4
    //   r13/r13d/r13w/r13b = 0b101; // 5 if (modrm.mod != 00) else rip-relative
    //   r14/r14d/r14w/r14b = 0b110; // 6
    //   r15/r15d/r15w/r15b = 0b111; // 7
    //
    // SIB byte format: [scale:2bit][index:3bit][base:3bit]
    //   scale: 00=*1, 01=*2, 10=*4, 11=*8
    //
    // Special cases:
    //   - RBP/R13 (r/m=101): ALWAYS needs displacement (min disp8)
    //   - RSP/R12 (r/m=100): ALWAYS needs SIB byte
    //   - No imm64 to memory (use reg as intermediate)
    //
    // ============================================================================


    if((a.type == O_REG16 || a.type == O_REG8) && b.type == O_EXPR){
        fprintf(stderr, "AmmAsm: Non-const expr doesn't fit in %s-bit register\n", a.type == O_REG8 ? "8" : "16");
        exit(1);
    }


    if (strcasecmp(cmd, "mov") == 0) {
    
        // ========================================================================
        // 1. MOV REG, IMM (reg <- imm)
        // ========================================================================
        
        // MOV R64, IMM64
        if (a.type == O_REG64 && (b.type == O_IMM || b.type == O_EXPR)) {

            uint8_t reg_idx = find_reg64_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, imm, 64);
            *pc += *s;
            
            return *s;
        }

        // MOV R32, IMM32
        else if (a.type == O_REG32 && b.type == O_IMM) {

            uint8_t reg_idx = find_reg32_index(a.reg);
            uint32_t imm = (uint32_t)(b.imm);
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint32_t)imm, 32);
            *pc += *s;
            return *s;
        }

        // MOV R16, IMM16
        else if (a.type == O_REG16 && b.type == O_IMM) {

            uint8_t reg_idx = find_reg16_index(a.reg);
            uint16_t imm = (uint16_t)(b.imm);
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint16_t)imm, 16);
            *pc += *s;
            return *s;
        }

        // MOV R8, IMM8/CHAR
        else if (a.type == O_REG8 && (b.type == O_IMM || b.type == O_CHAR)) {

            uint8_t c = b.c;
            uint8_t reg_idx = find_reg8_index(a.reg);
            uint8_t imm = (uint8_t)(b.imm);
            *s = encode_mov_reg_imm(machine_code, reg_idx, (b.type == O_CHAR) ? (uint8_t)c : (uint8_t)imm, 8);
            *pc += *s;
            return *s;
        }


        // ========================================================================
        // 2. MOV REG, REG (reg <- reg) (mod = 11)
        // ========================================================================

        // MOV R64, R64
        else if (a.type == O_REG64 && b.type == O_REG64) {
        
            uint8_t rm = find_reg64_index(a.reg);
            uint8_t reg = find_reg64_index(b.reg);
            *s = encode_mov_reg_reg(machine_code, rm, reg, 64);
            *pc += *s;
            return *s;
        }

        // MOV R32, R32
        else if (a.type == O_REG32 && b.type == O_REG32) {
        
            uint8_t rm = find_reg32_index(a.reg);
            uint8_t reg = find_reg32_index(b.reg);
            *s = encode_mov_reg_reg(machine_code, rm, reg, 32);
            *pc += *s;
            return *s;
        }

        // MOV R16, R16
        else if (a.type == O_REG16 && b.type == O_REG16) {
        
            uint8_t rm = find_reg16_index(a.reg);
            uint8_t reg = find_reg16_index(b.reg);
            *s = encode_mov_reg_reg(machine_code, rm, reg, 16);
            *pc += *s;
            return *s;
        }

        // MOV R8, R8
        else if (a.type == O_REG8 && b.type == O_REG8) {
        
            uint8_t rm = find_reg8_index(a.reg);
            uint8_t reg = find_reg8_index(b.reg);
            *s = encode_mov_reg_reg(machine_code, rm, reg, 8);
            *pc += *s;
            return *s;
        }


        // ========================================================================
        // 3. MOV REG, [ADDR] (mem <- reg)
        // ========================================================================


        // MOV R64, [ADDR]
        else if (a.type == O_REG64 && b.type == O_MEM) {
            uint8_t reg = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 64, 0x8B);
            *pc += *s;
            return *s;
        }

        // MOV R32, [ADDR]
        else if (a.type == O_REG32 && b.type == O_MEM) {
            uint8_t reg = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 32, 0x8B);
            *pc += *s;
            return *s;
        }

        // MOV R16, [ADDR]
        else if (a.type == O_REG16 && b.type == O_MEM) {
            uint8_t reg = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 16, 0x8B);
            *pc += *s;
            return *s;
        }

        // MOV R8, [ADDR]
        else if (a.type == O_REG8 && b.type == O_MEM) {
            uint8_t reg = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 8, 0x8A);
            *pc += *s;
            return *s;
        }

        // ========================================================================
        // 4. MOV [ADDR], REG (mem -> reg)
        // ========================================================================


        // MOV [ADDR], R64
        else if (a.type == O_MEM && b.type == O_REG64) {
            uint8_t reg = find_reg64_index(b.reg);
            AddrExpr mem = a.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 64, 0x89);
            *pc += *s;
            return *s;
        }

        // MOV [ADDR], R32
        else if (a.type == O_MEM && b.type == O_REG32) {
            uint8_t reg = find_reg32_index(b.reg);
            AddrExpr mem = a.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 32, 0x89);
            *pc += *s;
            return *s;
        }

        // MOV [ADDR], R16
        else if (a.type == O_MEM && b.type == O_REG16) {
            uint8_t reg = find_reg16_index(b.reg);
            AddrExpr mem = a.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 16, 0x89);
            *pc += *s;
            return *s;
        }

        // MOV [ADDR], R8
        else if (a.type == O_MEM && b.type == O_REG8) {
            uint8_t reg = find_reg8_index(b.reg);
            AddrExpr mem = a.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 8, 0x88);
            *pc += *s;
            return *s;
        }
    
        // MOV R64, EXPR
        else if (a.type == O_REG64 && b.type == O_EXPR) {

            uint8_t rex = REX_BASE | REX_W; 
            uint8_t opcode = 0xB8;
            uint8_t reg = find_reg64_index(a.reg);
            uint8_t rm = reg;

            if(reg >= 8){
                rm -= 8;
                rex |= REX_B;  
            }  

            opcode += rm;
            node->machine_code[0] = rex;
            node->machine_code[1] = opcode;
            *(uint64_t*)(node->machine_code + 2) = 0x0;  // placeholder
            
            node->ins.pc = *pc;
            *s = 10;
            *pc += 10;
            return *s;
        }

        // MOV R32, EXPR
        else if (a.type == O_REG32 && b.type == O_EXPR) {
            uint8_t rex = 0; 
            uint8_t opcode = 0xB8;
            uint8_t reg = find_reg32_index(a.reg);
            uint8_t rm = reg;
            int pos = 0;
            
            if(reg >= 8){
                rm -= 8;
                rex |= REX_B;  
            }
            
            opcode += rm;
            if(rex) node->machine_code[pos++] = rex;
            node->machine_code[pos++] = opcode;
            *(uint32_t*)(node->machine_code + pos) = 0; 
            pos+=4;
            
            node->ins.pc = *pc;
            *s = pos; 
            *pc += *s;
            return *s;
        }
    }

    // add -> add two operands 

    else if(strcasecmp(node->cmd, "add") == 0){
        
        // =====================================
        // ADD reg, imm (mod = 11)
        // =====================================

        // add r/m64, imm32
        if(a.type == O_REG64 && (b.type == O_IMM || b.type == O_EXPR)){
            uint8_t reg = find_reg64_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_add_imm(machine_code, reg, b.imm, 64, b.type == O_EXPR); 
            *pc += *s;
            return *s;
        }

        // add r/m32, imm32
        else if(a.type == O_REG32 && (b.type == O_IMM || b.type == O_EXPR)){
            uint8_t reg = find_reg32_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_add_imm(machine_code, reg, b.imm, 32, b.type == O_EXPR); 
            *pc += *s;
            return *s;
        }

        // add r/m16, imm16
        else if(a.type == O_REG16 && b.type == O_IMM){
            uint8_t reg = find_reg16_index(a.reg);

            *s = encode_add_imm(machine_code, reg, b.imm, 16, 0); 
            *pc += *s;
            return *s;
        }

        // add r/m8, imm8
        else if(a.type == O_REG8 && b.type == O_IMM){
            uint8_t reg = find_reg8_index(a.reg);

            *s = encode_add_imm(machine_code, reg, b.imm, 8, 0); 
            *pc += *s;
            return *s;
        }

        // ===========================================
        // 2. add reg, reg (mod = 11)
        // ===========================================
        
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src  = find_reg64_index(b.reg);
            

            *s = encode_add_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src  = find_reg32_index(b.reg);

            *s = encode_add_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src  = find_reg16_index(b.reg);

            *s = encode_add_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG8 && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            uint8_t src  = find_reg8_index(b.reg);

            *s = encode_add_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
            return *s;
        }

        // ===================
        // 3. add reg, [addr]
        // ===================

        else if(a.type == O_REG64 && b.type == O_MEM){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x03);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG32 && b.type == O_MEM){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x03);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG16 && b.type == O_MEM){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x03);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG8 && b.type == O_MEM){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x02);
            *pc += *s;
            return *s;
        }

        // ================
        // add [addr], reg
        // ================

        else if(a.type == O_MEM && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x01);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x01);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x01);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x00);
            *pc += *s;
            return *s;
        }
    }


    // sub - Subtract

    else if(strcasecmp(node->cmd, "sub") == 0){
        
        // =====================================
        // SUB reg, imm (mod = 11)
        // =====================================

        // sub r/m64, imm32
        if(a.type == O_REG64 && (b.type == O_IMM || b.type == O_EXPR)){
            uint8_t reg = find_reg64_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_sub_imm(machine_code, reg, b.imm, 64, b.type == O_EXPR); 
            *pc += *s;
        }

        // sub r/m32, imm32
        else if(a.type == O_REG32 && (b.type == O_IMM || b.type == O_EXPR)){
            uint8_t reg = find_reg32_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_sub_imm(machine_code, reg, b.imm, 32, b.type == O_EXPR); 
            *pc += *s;
        }

        // sub r/m16, imm16
        else if(a.type == O_REG16 && b.type == O_IMM){
            uint8_t reg = find_reg16_index(a.reg);

            *s = encode_sub_imm(machine_code, reg, b.imm, 16, 0); 
            *pc += *s;
        }

        // sub r/m8, imm8
        else if(a.type == O_REG8 && (b.type == O_IMM || b.type == O_CHAR)){
            uint8_t reg = find_reg8_index(a.reg);

            *s = encode_sub_imm(machine_code, reg, b.type == O_IMM ? b.imm : b.c, 8, 0); 
            *pc += *s;
        }

        // ===========================================
        // 2. sub reg, reg (mod = 11)
        // ===========================================
        
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src  = find_reg64_index(b.reg);
            

            *s = encode_sub_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src  = find_reg32_index(b.reg);

            *s = encode_sub_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src  = find_reg16_index(b.reg);

            *s = encode_sub_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG8 && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            uint8_t src  = find_reg8_index(b.reg);

            *s = encode_sub_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
            return *s;
        }

        // ===================
        // 3. sub reg, [addr]
        // ===================

        else if(a.type == O_REG64 && b.type == O_MEM){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x2B);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG32 && b.type == O_MEM){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x2B);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG16 && b.type == O_MEM){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x2B);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG8 && b.type == O_MEM){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x2A);
            *pc += *s;
            return *s;
        }

        // ================
        // sub [addr], reg
        // ================

        else if(a.type == O_MEM && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x29);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x29);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x29);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x28);
            *pc += *s;
            return *s;
        }
    }

    // IMUL - Signed Multiply
    else if(!strcasecmp(cmd, "imul")){
        // imul r64
        if(a.type == O_REG64 && b.type == O_NONE){
            uint8_t reg = find_reg64_index(a.reg);
            *s = encode_imul_reg(machine_code, reg, 64);
            *pc += *s;
        }

        // imul r32
        else if(a.type == O_REG32 && b.type == O_NONE){
            uint8_t reg = find_reg32_index(a.reg);
            *s = encode_imul_reg(machine_code, reg, 32);
            *pc += *s;
        }

        // imul r16
        else if(a.type == O_REG16 && b.type == O_NONE){
            uint8_t reg = find_reg16_index(a.reg);
            *s = encode_imul_reg(machine_code, reg, 16);
            *pc += *s;
        }

        // imul r8
        else if(a.type == O_REG8 && b.type == O_NONE){
            uint8_t reg = find_reg8_index(a.reg);
            *s = encode_imul_reg(machine_code, reg, 8);
            *pc += *s;
        }


        //===============
        // imul reg, reg 
        //===============

        // imul r64, r64
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t src = find_reg64_index(a.reg);
            uint8_t dest = find_reg64_index(b.reg);
            
            *s = encode_imul_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
        }

        // imul r32, r32
        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t src = find_reg32_index(a.reg);
            uint8_t dest = find_reg32_index(b.reg);
            
            *s = encode_imul_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
        }

        // imul r16, r16
        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t src = find_reg16_index(a.reg);
            uint8_t dest = find_reg16_index(b.reg);
            
            *s = encode_imul_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
        }

        // =====================================
        // imul reg, reg, imm 
        // =====================================

        // imul r64, r64, imm32/imm8
        if (a.type == O_REG64 && b.type == O_REG64 && (c.type == O_IMM || c.type == O_EXPR)) {
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src = find_reg64_index(b.reg);
            uint64_t imm = c.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 64, c.type == O_EXPR);
            *pc += *s;
            return *s;
        }

        // imul r32, r32, imm32/imm8
        else if (a.type == O_REG32 && b.type == O_REG32 && (c.type == O_IMM || c.type == O_EXPR)) {
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src = find_reg32_index(b.reg);
            uint64_t imm = c.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 32, c.type == O_EXPR);
            *pc += *s;
            return *s;
        }

        // imul r16, r16, imm16/imm8
        else if (a.type == O_REG16 && b.type == O_REG16 && c.type == O_IMM) {
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src = find_reg16_index(b.reg);
            uint64_t imm = c.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 16, c.type == O_EXPR);
            *pc += *s;
            return *s;
        }

        // =====================================
        // 2. imul reg, imm (abstraction)
        // =====================================

        // imul r64, imm
        else if (a.type == O_REG64 && (b.type == O_IMM || b.type == O_EXPR) && c.type == O_NONE) {
            uint8_t reg = find_reg64_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 64, b.type == O_EXPR);
            *pc += *s;
            return *s;
        }

        // imul r32, imm
        else if (a.type == O_REG32 && (b.type == O_IMM || b.type == O_EXPR) && c.type == O_NONE) {
            uint8_t reg = find_reg32_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 32, b.type == O_EXPR);
            *pc += *s;
            return *s;
        }

        // imul r16, imm
        else if (a.type == O_REG16 && b.type == O_IMM) {
            uint8_t reg = find_reg16_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 16, b.type == O_EXPR);
            *pc += *s;
            return *s;
        }

    }
 
    // место для документации jmp/call
    
    else if(!strcasecmp(cmd, "jmp") || !strcasecmp(cmd, "call")) {
        
        // =========================
        // JMP/CALL label (REL32)
        // =========================
        if(a.type == O_EXPR) { 
            uint8_t opcode = (!strcasecmp(cmd, "jmp")) ? 0xE9 : 0xE8;

            machine_code[0] = opcode;
            *(uint32_t*)(machine_code + 1) = 0x0;
        
            node->ins.pc = *pc;
            *s = 5;
            *pc += 5;
            return *s;
        }
        
        // =========================
        // JMP/CALL r64 (FAR)
        // =========================
        else if(node->ins.operands[0].type == O_REG64) {
            uint8_t rex = REX_BASE | REX_W;
            uint8_t opcode = 0xFF;
            uint8_t modrm;
            
            int reg_idx = find_reg64_index(node->ins.operands[0].reg);
            if(reg_idx >= 8) rex |= REX_B;
            
            // ModR/M: mod=11 (register), reg=extension, rm=register
            if(!strcasecmp(node->cmd, "jmp")) { // jmp
                modrm = emit_modrm(0b11, 0b100, reg_idx); // FF /4
            } 
            else { // call
                modrm = emit_modrm(0b11, 0b010, reg_idx);  // FF /2
            }
            
            node->machine_code[0] = rex;
            node->machine_code[1] = opcode;
            node->machine_code[2] = modrm;
            
            *s = 3;
            *pc += 3;
            return *s;
        }
    }

    
    // ===============================================
    // JCC -> Jump if Condition Is Met 
    // ===============================================

    // ======================
    // Equality
    // je / jz	ZF == 1
    // jne / jnz ZF == 0
    // ======================
    // Signed
    // jl	SF != OF
    // jge	SF == OF
    // jg	ZF == 0 && SF == OF
    // jle	ZF == 1
    // ======================
    // Unsigned	
    // ======================
    // ja	CF == 0 && ZF == 0
    // jae	CF == 0
    // jb	CF == 1
    // jbe	CF == 1

    else if (is2arrin(JCC, node->cmd)) {

        int pos = 0;
        uint8_t opcode2 = 0;

        if (!strcasecmp(node->cmd, "je") || !strcasecmp(node->cmd, "jz"))        opcode2 = 0x84;
        else if (!strcasecmp(node->cmd, "jne") || !strcasecmp(node->cmd, "jnz")) opcode2 = 0x85;
        else if (!strcasecmp(node->cmd, "jl"))  opcode2 = 0x8C;
        else if (!strcasecmp(node->cmd, "jge")) opcode2 = 0x8D;
        else if (!strcasecmp(node->cmd, "jle")) opcode2 = 0x8E; 
        else if (!strcasecmp(node->cmd, "jg"))  opcode2 = 0x8F;
        else if (!strcasecmp(node->cmd, "jb") || !strcasecmp(node->cmd, "jc"))   opcode2 = 0x82;    
        else if (!strcasecmp(node->cmd, "ja"))  opcode2 = 0x87;
        else { fprintf(stderr, "AmmAsm: unknown JCC '%s'\n", node->cmd); exit(1);}

        node->machine_code[pos++] = 0x0F;
        node->machine_code[pos++] = opcode2;
        *(uint32_t*)(machine_code + pos) = 0x0; // rel32
        pos += 4;

        node->ins.pc = *pc;
        *pc += pos;
        *s = pos;
        return *s;
    }

    // CMP


    else if(strcasecmp(node->cmd, "cmp") == 0){
        
        // =====================================
        // CMP reg, imm (mod = 11)
        // =====================================

        // cmp r/m64, imm32
        if(a.type == O_REG64 && (b.type == O_IMM || b.type == O_EXPR)){
            uint8_t reg = find_reg64_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_cmp_imm(machine_code, reg, b.imm, 64, b.type == O_EXPR); 
            *pc += *s;
        }

        // cmp r/m32, imm32
        else if(a.type == O_REG32 && (b.type == O_IMM || b.type == O_EXPR)){
            uint8_t reg = find_reg32_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_cmp_imm(machine_code, reg, b.imm, 32, b.type == O_EXPR); 
            *pc += *s;
        }

        // cmp r/m16, imm16
        else if(a.type == O_REG16 && b.type == O_IMM){
            uint8_t reg = find_reg16_index(a.reg);

            *s = encode_cmp_imm(machine_code, reg, b.imm, 16, 0); 
            *pc += *s;
        }

        // cmp r/m8, imm8
        else if(a.type == O_REG8 && (b.type == O_IMM || b.type == O_CHAR)){
            uint8_t reg = find_reg8_index(a.reg);

            *s = encode_cmp_imm(machine_code, reg, b.type == O_IMM ? b.imm : b.c, 8, 0); 
            *pc += *s;
        }

        // ===========================================
        // 2. cmp reg, reg (mod = 11)
        // ===========================================
        
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src  = find_reg64_index(b.reg);
            

            *s = encode_cmp_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src  = find_reg32_index(b.reg);

            *s = encode_cmp_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src  = find_reg16_index(b.reg);

            *s = encode_cmp_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG8 && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            uint8_t src  = find_reg8_index(b.reg);

            *s = encode_cmp_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
            return *s;
        }

        // ===================
        // 3. cmp reg, [addr]
        // ===================

        else if(a.type == O_REG64 && b.type == O_MEM){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x3B);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG32 && b.type == O_MEM){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x3B);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG16 && b.type == O_MEM){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x3B);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_REG8 && b.type == O_MEM){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x3A);
            *pc += *s;
            return *s;
        }

        // ================
        // cmp [addr], reg
        // ================

        else if(a.type == O_MEM && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x39);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x39);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x39);
            *pc += *s;
            return *s;
        }

        else if(a.type == O_MEM && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[0].addr = mem;
            }
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x38);
            *pc += *s;
            return *s;
        }
    }

    else if(!strcasecmp(cmd, "lea")){
        if (a.type == O_REG64 && b.type == O_MEM) {
            uint8_t reg = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;
            if(mem.is_rip_rel) {
                node->ins.operands[1].addr = mem;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 64, 0x8D);
            *pc += *s;
            return *s;
        }
    }
    
    // ABI SYSTEM-V
    else if(!strcasecmp(node->cmd, "syscall")){
        node->machine_code[0] = 0x0F;
        node->machine_code[1] = 0x05;
        *s = 2;
        *pc += 2;
        return *s;
    }

    // pop rip
    else if(!strcasecmp(cmd, "ret")){
        node->machine_code[0] = 0xC3;
        *s = 1;
        *pc += 1;
        return *s;
    }

    return 0;
}

void parse_size_directives(AST* node, uint64_t *pc) {
    int type = node->type;
    uint8_t *mc = (uint8_t*)node->machine_code;

    switch(type) {
        case AST_U8:
            memcpy(mc, node->u8.data, node->u8.size);
            node->machine_code_size = node->u8.size; 
            *pc += node->u8.size;
            break;

        case AST_U16: {
            int offset = 0;
            for(int i = 0; i < node->u16.size; ++i){
                *(uint16_t*)(mc + offset) = (uint16_t)node->u16.data[i];
                offset += sizeof(uint16_t);
            }
            node->machine_code_size = offset; 
            *pc += offset;
            break;
        }

        case AST_U32: {
            int offset = 0;
            for(int i = 0; i < node->u32.size; ++i){
                *(uint32_t*)(mc + offset) = node->u32.data[i];
                offset += sizeof(uint32_t);
            }
            node->machine_code_size = offset;
            *pc += offset;
            break;
        }

        case AST_U64: {
            int offset = 0;
            for(int i = 0; i < node->u64.size; ++i){
                if(node->u64.entries[i].type == U64_EXPR){
                    *(uint64_t*)(mc + offset) = 0x0; // placeholder, resolved later
                }  
                else {
                    *(uint64_t*)(mc + offset) = node->u64.entries[i].imm;
                }
                offset += sizeof(uint64_t);
            }
            node->machine_code_size = offset;
            node->u64.pc = *pc; 
            *pc += offset;
            break;
        }
    }
}



int ELFgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size, int pie_mode) {
    if (!fl) return 0;

    // ELF Header
    unsigned char elf_header[64] = {
        0x7F,'E','L','F', 0x02,0x01,0x01,0x00,
        0,0,0,0,0,0,0,0,
        pie_mode ? 0x03 : 0x02 ,0x00,0x3E,0x00, 0x01,0x00,0x00,0x00,
        0,0,0,0,0,0,0,0, // e_entry placeholder
        0x40,0x00,0x00,0x00,0,0,0,0, // e_phoff = 0x40
        0,0,0,0,0,0,0,0,  // e_shoff
        0,0,0,0,          // e_flags
        0x40,0x00,        // e_ehsize
        0x38,0x00,        // e_phentsize
        0x01,0x00,        // e_phnum = 1
        0,0,0,0,0,0
    };

    uint64_t text_offset = 0x1000; 
    uint64_t text_vaddr = pie_mode ? text_offset : 0x401000;

    memcpy(&elf_header[0x18], &e_entry, 8);
    fwrite(elf_header, 1, 64, fl);

    //  Program Header (.text RX) 
    uint8_t phdr[56] = {
        0x01,0x00,0x00,0x00, // p_type PT_LOAD
        0x07,0x00,0x00,0x00, // p_flags PF_R | PF_X | RF_W (for now)
        0,0,0,0,0,0,0,0,     // p_offset
        0,0,0,0,0,0,0,0,     // p_vaddr
        0,0,0,0,0,0,0,0,     // p_paddr
        0,0,0,0,0,0,0,0,     // p_filesz
        0,0,0,0,0,0,0,0,     // p_memsz
        0x00,0x10,0x00,0x00,0,0,0,0  // p_align
    };

    memcpy(&phdr[8],  &text_offset, 8);
    memcpy(&phdr[16], &text_vaddr,  8);
    memcpy(&phdr[24], &text_vaddr,  8);
    memcpy(&phdr[32], &text_size,   8);
    memcpy(&phdr[40], &text_size,   8);

    fwrite(phdr, 1, 56, fl);

    // Padding till 0x1000
    uint64_t padding_size = 0x1000 - (64 + 56);
    uint8_t *padding = calloc(1, padding_size);
    fwrite(padding, 1, padding_size, fl);
    free(padding);

    // 3976 - padding till .text
    // 64   - elf header
    // 56   - 1. prog header (.text)
    int elf_cap = 3976 + 64 + 56;

    //.text section 
    fwrite(text_code, 1, text_size, fl);
    return elf_cap;
}

void compiler(uint8_t *text, int *textsize, uint64_t *e_entry, int pie_mode) {
    if (!text) return;
    int pos = 0;

    // of text
    uint64_t pc = pie_mode ? 0x1000 : 0x401000;

    for(int i = 0; i < ast_count; i++){
        if(ast[i].type == AST_INS) parseInst(&ast[i], &pc);
        else if(ast[i].type == AST_U8 || ast[i].type == AST_U16 || ast[i].type == AST_U32 || ast[i].type == AST_U64) parse_size_directives(&ast[i], &pc);
    }

    expand_local_labels();
    *e_entry = collect_labels(pie_mode);
    resolve_labels();

    for (int i = 0; i < ast_count; ++i) {
        if(ast[i].type == AST_INS && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U8 
        else if(ast[i].type == AST_U8 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U16
        else if(ast[i].type == AST_U16 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U32
        else if(ast[i].type == AST_U32 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U64
        else if(ast[i].type == AST_U64 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
    }

    *textsize = pos;
}

void handl_pipeline(int argc, char **argv, int pie_mode){ 
    static uint8_t text[1024 * 64];
    int textsize = 0;
    int flsz = 0;

    uint64_t entry_point = (pie_mode) ? 0x1000 : 0x401000; 

    FILE *input = fopen(argv[0], "r");
    LEXER(input);
    DEBUG_PRINT_TOKENS();

    fclose(input);
    
    PARSE();
    
    FILE *output = fopen(argv[1], "wb");

    compiler(text, &textsize, &entry_point, pie_mode);
    flsz += ELFgenfile(output, entry_point, text, textsize, pie_mode);
    DEBUG_PRINT_AST();

    fclose(output);

    flsz += textsize;
    printf("AmmAsm: Compiled successfully! %s (%d bytes)\n", argv[1], flsz);

    exit(0);
}

int main(int argc, char **argv){
    if (argc < 2) {
        printf("AmmAsm v1.8: \033[5;41mFatal: No file given\033[0m\n");
        return 1;
    }

    const char* input = NULL;
    const char* out = "a.out";
    int pie_mode = 0; // ASLR

    for (int i = 1; i < argc; ++i){
        if (!strcmp(argv[i], "-o")){ out = argv[i+1]; i++; continue; }
        if (!strcmp(argv[i], "-pie")){ pie_mode = 1;  continue; }
        if (argv[i][0] != '-') input = argv[i];
    }

    if (!input) {
        fprintf(stderr, "AmmAsm v1.8: \033[5;41mFatal: No input file given\033[0m\n");
        return 1; 
    }

    if(!out) {
        fprintf(stderr, "AmmAsm: v1.8: option `-o' requires an argument");
        return 1;
    }

    char* fake_argv[] = { (char*)input, (char*)out};
    handl_pipeline(2, fake_argv, pie_mode);

    return 0;
}