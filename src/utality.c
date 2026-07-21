#include "utality.h"

volatile const char *p;

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

int expr_is_const(Expr *e) {
    int has_pc = 0;
    int has_label = 0;

    for (int i = 0; i < e->count; i++) {
        if (e->tokens[i].type == T_LAB)
            has_label=1;
        else if (e->tokens[i].type == T_PC)
            has_pc=1;
    }

    return (!has_pc && has_label)  ? 0 : // Not const
           (has_pc && !has_label)  ? 2 : // const but needs to be resolved
           (!has_pc && !has_label) ? 1 : // totaly const
           (has_pc && has_label)   ? 0 : // Not const at all
           -1;
}

uint64_t eval_const_expr(Expr *e) {
    char buf[256] = {0};
    int bi = 0;

    for (int i = 0; i < e->count; i++) {
        bi += snprintf(buf + bi, 256 - bi, "%s", e->tokens[i].value);
    }

    return (uint64_t)eval_expr(buf);
}

int expr_label_count(Expr *e) {
    int n = 0;
    for (int i = 0; i < e->count; i++) {
        if (e->tokens[i].type == T_LAB)
            n++;
    }
    return n;
}

void resolve_imm(AST* node, int expr_idx, int imm_size) {
    uint64_t tmp = resolve_expr(node->ins.operands[expr_idx].expr, node->ins.pc, node->line);
    uint64_t val = (tmp == (uint64_t)-2) ? 0 : tmp;

    int offset = node->machine_code_len - imm_size;
    
    switch(imm_size) {
        case 1: *(uint8_t*) (node->machine_code   + offset) = (uint8_t) val; break;
        case 2: *(uint16_t*)(node->machine_code + offset) = (uint16_t)val; break;
        case 4: *(uint32_t*)(node->machine_code + offset) = (uint32_t)val; break;
        case 8: *(uint64_t*)(node->machine_code + offset) = val; break;
    }
}

int get_signed_imm_size_(int64_t imm) {
    if (imm >= (int64_t)-0x80 && imm <= (uint64_t)0xFF) return 1;
    if (imm >= (int64_t)-0x8000 && imm <= (uint64_t)0xFFFF) return 2;
    if (imm >= (int64_t)-0x80000000LL && imm <= (uint64_t)0xFFFFFFFFLL) return 4;
    return 8;
}

int get_unsigned_imm_size_(uint64_t imm) {
    if (imm <= (uint64_t)0xFF) return 1;
    if (imm <= (uint64_t)0xFFFF) return 2;
    if (imm <= (uint64_t)0xFFFFFFFFLL) return 4;
    return 8;
}

int get_lab_indx(const uint8_t* lab){
    for(int i = 0; i < ast_len; i++){
        if(ast[i].type != AST_LABEL) continue;
        if(!astrcmp(lab, ast[i].label.name)) return i;
    }
    return -1;
}

const char* get_label_from_expr(Expr expr){
    for(int i = 0; i < expr.count; i++){
        if(expr.tokens[i].type == T_LAB){
            return expr.tokens[i].value;
        }
    }
    return NULL;
}


uint64_t find_lab_addr(const uint8_t* name){
    for (int j = 0; j < ast_len; j++) {
        if (ast[j].type == AST_LABEL && !astrcmp(ast[j].label.name, name)) {
            return ast[j].label.vadress;
        }
    }

    uint8_t result = externed_label(name);
    return result ? (uint64_t)-2 : (uint64_t)-1;
}

uint8_t externed_label(const uint8_t* name){
    for(int i = 0; i < ast_len; i++){
        if(ast[i].type != AST_EXTERN) continue;
        for(int j = 0; j < ast[i].externs.labels_len; j++){
            if(astrcmp(ast[i].externs.labels[j], name) == 0){
                return 1;
            }
        }
    }
    return 0;
}

uint64_t find_sec_addr(const uint8_t* name){
    for (int j = 0; j < ast_len; j++) {
        if (ast[j].type == AST_SECTION && astrcmp(ast[j].section.secname, name) == 0) {
            return ast[j].section.vadress;
        }
    }

    return 0;
}

// Super fast check

uint8_t find_reg64_index(const char *r) {
    if (!r) return -1;

    char a = r[0];
    char b = r[1];
    char c = r[2];
    char d = r[3];
    

    // lower()
    if (a >= 'A' && a <= 'Z') a += 32;
    if (b >= 'A' && b <= 'Z') b += 32;
    if (c >= 'A' && c <= 'Z') c += 32;
    if (d >= 'A' && d <= 'Z') d += 32;

    // r10..r15
    if (b == '1') return 10 + (c - '0');
    
    // r8, r9
    if (b >= '8' && b <= '9') return b - '0';



    // rax/rbx/rcx/rdx/rsp/rbp/rsi/rdi
    if (b == 'a') return 0;
    if (b == 'c') return 1;
    if (b == 'd' && c == 'x') return 2;
    if (b == 'b' && c == 'x') return 3;

    if (b == 's' && c == 'p') return 4;
    if (b == 'b' && c == 'p') return 5;
    if (b == 's' && c == 'i') return 6;
    if (b == 'd' && c == 'i') return 7;
    

    return -1;
}

uint8_t find_reg32_index(const char *r) {
    if (!r) return -1;

    char a = r[0], b = r[1], c = r[2], d = r[3];

    if (a >= 'A' && a <= 'Z') a += 32;
    if (b >= 'A' && b <= 'Z') b += 32;
    if (c >= 'A' && c <= 'Z') c += 32;
    if (d >= 'A' && d <= 'Z') d += 32;

    // r10d..r15d
    if (b == '1') {
        return 10 + (c - '0');
    }

    // r8d, r9d
    if (b >= '8' && b <= '9') {
        return b - '0';
    }

    // eax/ecx/edx/ebx/esp/ebp/esi/edi
    if (b == 'a') return 0;
    if (b == 'c') return 1;
    if (b == 'd' && c == 'x') return 2;
    if (b == 'b' && c == 'x') return 3;

    if (b == 's' && c == 'p') return 4;
    if (b == 'b' && c == 'p') return 5;
    if (b == 's' && c == 'i') return 6;
    if (b == 'd' && c == 'i') return 7;
    
    return -1;
}

uint8_t find_reg16_index(const char* r) {
    if (!r) return -1;

    char a = r[0], b = r[1], c = r[2], d = r[3];

    if (a >= 'A' && a <= 'Z') a += 32;
    if (b >= 'A' && b <= 'Z') b += 32;
    if (c >= 'A' && c <= 'Z') c += 32;
    if (d >= 'A' && d <= 'Z') d += 32;

    // r10w..r15w
    if (b == '1') {
        return 10 + (c - '0');
    }

    // r8w, r9w
    if (b >= '8' && b <= '9') {
        return b - '0';
    }

    // ax/cx/dx/bx/sp/bp/si/di
    if (a == 'a') return 0;
    if (a == 'c') return 1;
    if (a == 'd' && b == 'x') return 2;
    if (a == 'b' && b == 'x') return 3;

    if (a == 's' && b == 'p') return 4;
    if (a == 'b' && b == 'p') return 5;
    if (a == 's' && b == 'i') return 6;
    if (a == 'd' && b == 'i') return 7;
    

    return -1;
}
uint8_t find_reg8_index(const char* r) {
    if (!r) return -1;

    char a = r[0], b = r[1], c = r[2], d = r[3];

    if (a >= 'A' && a <= 'Z') a += 32;
    if (b >= 'A' && b <= 'Z') b += 32;
    if (c >= 'A' && c <= 'Z') c += 32;
    if (d >= 'A' && d <= 'Z') d += 32;

    // r10b..r15b
    if (b == '1') {
        return 10 + (c - '0');
    }

    // r8b, r9b
    if (b >= '8' && b <= '9') {
        return b - '0';
    }

    // al/cl/dl/bl/spl/bpl/sil/dil
    if (a == 'a') return 0;
    if (a == 'c') return 1;
    if (a == 'd' && b == 'l') return 2;
    if (a == 'b' && b == 'l') return 3;

    if (a == 's' && b == 'p') return 4;
    if (a == 'b' && b == 'p') return 5;
    if (a == 's' && b == 'i') return 6;
    if (a == 'd' && b == 'i') return 7;

    return -1;
}

uint8_t find_xmm_index(const char* r) {
    const char* p = r;
    p += 3; // skip "xmm"
    return eval_expr(p);
}


// calc
long parse_number() {
    while (*p == ' ') p++;

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
       while ((*p >= '0' && *p <= '9') || (*p >= 'a' && *p <= 'f') ||  (*p >= 'A' && *p <= 'F')) {
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

    if (*p >= '0' && *p <= '9'){
        while (*p >= '0' && *p <= '9') {
            res = res * 10 + (*p - '0');
            p++;
        }
        return res;
    }

    else {
        fprintf(stderr, "AmmAsm: Invalid expr\n");
        exit(1);
    }

    // fallback
    return 0;
}

long parse_term() {
    long left = parse_number();
    while (1) {
        while (*p == ' ') p++;
        if (*p == '*') {
            p++;
            left *= parse_number();
        } 
        else if (*p == '/') {
            p++;
            long tmp = parse_number();
            if(tmp == 0){ fprintf(stderr, "AmmAsm: Division by zero\n"); exit(1);}
            else left /= tmp;
        } 
        else break;
    }
    return left;
}

long parse_expr() {
    long left = parse_term();
    while (1) {
        while (*p == ' ') p++;
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


void *append(int *len, int *cap, void *arr, const void *value, size_t elem_size){
    if (*cap == 0) {
        *cap = 4;
        arr = malloc(*cap * elem_size);
    }

    if (*len == *cap) {
        *cap *= 2;
        arr = realloc(arr, *cap * elem_size);
    }

    memcpy((char *)arr + *len * elem_size, value, elem_size);
    (*len)++;

    return arr;
}

// Mainly for Labels
uint8_t** TwoDappend(int *len, int *cap, uint8_t **arr, const uint8_t* value) {
    if (*cap == 0) {                 
        *cap = 4;
        arr = malloc(*cap * sizeof(uint8_t*));
        *len = 0;                 
    }

    if (*len >= *cap) {
        int new_cap = *cap * 2;
        // Allocate space for new_arr[0 .. new_cap - 1], each of type (void *)
        uint8_t **new_arr = malloc(new_cap * sizeof(uint8_t*));

        memcpy(new_arr, arr, *len * sizeof(uint8_t*));
        free(arr);
        arr = new_arr;
        *cap = new_cap;
    }

    uint8_t* strcopy = strdup(value);

    arr[*len] = strcopy;
    (*len)++;

    return arr;
}

void free_expr(Expr *expr)
{
    for (int i = 0; i < expr->count; i++)
        free(expr->tokens[i].value);

    free(expr->tokens);

    expr->tokens = NULL;
    expr->count = 0;
    expr->tok_len = 0;
    expr->tok_cap = 0;
}

void free_ast(AST *ast, int ast_len) {
    if (!ast)
        return;

    for (int i = 0; i < ast_len; i++) {
        switch (ast[i].type) {

        case AST_INS:
            for (int j = 0; j < ast[i].ins.oper_count; j++) {
                Operand *op = &ast[i].ins.operands[j];

                if (op->type == O_EXPR)
                    free_expr(&op->expr);
            }
            break;



        case AST_GLOBAL:
            TwoDfree(ast[i].global.labels, ast[i].global.labels_len);
            break;

        case AST_EXTERN:
            TwoDfree(ast[i].externs.labels, ast[i].externs.labels_len);
            break;        

        case AST_U8:
            free(ast[i].u8.data);
            break;

        case AST_U16:
            free(ast[i].u16.data);
            break;

        case AST_U32:
            free(ast[i].u32.data);
            break;

        case AST_U64:
            for (int j = 0; j < ast[i].u64.entries_len; j++) {
                if (ast[i].u64.entries[j].type == U64_EXPR)
                    free_expr(&ast[i].u64.entries[j].expr);
                
            }
            free(ast[i].u64.entries);
            break;

        default:
            break;
        }
    }

    free(ast);
}

void TwoDfree(uint8_t **arr, int count) {
    if (!arr) return;
    for (int i = 0; i < count; ++i) {
        if (arr[i]) free(arr[i]);
    }
    free(arr);
}

uint8_t is_expr_token(TokenType t)
{
    switch (t) {
        case T_INT:
        case T_LAB:
        case T_PC:
        case T_CHAR:
        case T_PLUS:
        case T_MINUS:
        case T_MULL:
        case T_DIV:
        case T_LPRANT:
        case T_RPRANT:
        case T_AND:
        case T_OR:
        case T_XOR:
        case T_LSHIFT:
        case T_RSHIFT:
            return 1;
        default:
            return 0;
    }
}