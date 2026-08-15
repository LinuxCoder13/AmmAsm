#include "lexer.h"

Token *toks;
int toks_len = 0;
int toks_cap = 0;

void add_token(int type, char* value, int line){
    Token tok = {
        .line = line,
        .type = type,
        .value = strdup(value)
    }; 

    toks = append(&toks_len, &toks_cap, toks, &tok, sizeof(Token));
}

void del_all_toks(void) {
    for (size_t i = 0; i < toks_len; i++) {
        free(toks[i].value);
        toks[i].value = NULL;
    }
    free(toks);
}

char *read_string(char *buff, char *dest, int line) {
    while (*buff != '"' && *buff != '\0') {
        if (*buff == '\\') {
            switch (*(buff + 1)) {
                case 'n': *dest++ = '\n'; buff += 2; continue;
                case '"': *dest++ = '"'; buff += 2; continue;
                case '/': *dest++ = '/'; buff += 2; continue;
                case 't': *dest++ = '\t'; buff += 2; continue;
                case 'b': *dest++ = '\b'; buff += 2; continue;
                case '\\': *dest++ = '\\'; buff += 2; continue;
                // case '0': *dest++ = '\0'; buff += 2; continue;
                default: return NULL; 
            }
        }
        else *dest++ = *buff++;
        
    }
    return buff;
}

// lexer:
int LEXER(FILE* fl) {
    if (!fl) {
        fprintf(stderr, "AmmAsm:\033[;31m Fatal: no such file or dir\033[0m\n");
        exit(1);
    }
    Lexer lexer = {0}; 
    int in_comment = 0;
    uint16_t line = 0;

    while (fgets(lexer.buf, 1024, fl) != NULL) {
        char* buff = lexer.buf;
        line++;
        while (*buff) {
            while (*buff == ' ' || *buff == '\t') buff++;
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
                buff++;
                continue;
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

            else if (*buff == '{'){ buff++; add_token(T_OSHPPRANT,   "{",  line); continue;}
            else if (*buff == '}'){ buff++; add_token(T_CSHPPRANT,   "}",  line); continue;}

            else if (*buff >= '0' && *buff <= '9') {

                char num[128] = {0};
                int i = 0;
                int is_float = 0;
                int dots_c = 0;

                while (*buff && (
                    (*buff >= '0' && *buff <= '9') ||
                    (*buff >= 'a' && *buff <= 'f') ||
                    (*buff >= 'A' && *buff <= 'F') ||
                    *buff == 'x' || *buff == 'X' ||
                    *buff == 'o' || *buff == 'O' ||
                    *buff == 'b' || *buff == 'B')||
                    *buff == '.') {

                    if (i < (int)(sizeof(num) - 1)) {
                        num[i++] = *buff;
                    }

                    if(*buff == '.') {is_float = 1; dots_c++;}
                    if(dots_c > 1){fprintf(stderr, "AmmAsm:%d: Bradar, what is this? delete this.\n", line); exit(1);}

                    buff++;
                }

                // check syntax
                
                num[i] = '\0';

                if(is_float){
                    if (i >= 2 &&
                        (num[1] == 'x' || num[1] == 'X' ||
                        num[1] == 'b' || num[1] == 'B' ||
                        num[1] == 'o' || num[1] == 'O')){
                            fprintf(stderr, "AmmAsm:%d: Bradar, what is this? delete this.\n", line);
                            exit(1);
                    }
                    if(num[i-1] == '.'){
                        fprintf(stderr, "AmmAsm:%d: Bradar, what is this? delete this.\n", line);
                        exit(1);
                    } 
                }

                add_token(is_float ? T_FLOAT : T_INT, num, line);
                continue; 
            }

            else if (isin(LETEXT, *buff)) { 
                char buf[1024] = {0} ;
                int i = 0;
                char buf2[1024] = {0} ;
                
                while (isin(LETEXT, *buff) && i <= 1024) buf[i++] = *buff++; buf[i] = 0;

                strncpy(buf2, buf, i);
                str_tolower(buf);

                while (*buff == ' ' || *buff == '\t') buff++;

                if(strcasecmp(buf, "global") == 0){
                    add_token(T_GLOBAL, buf, line);
                    continue;
                }
                
                else if(strcasecmp(buf, "extern") == 0){
                    if(!obj_file){ fprintf(stderr, "AmmAsm:%d: 'extern` directive in not available in '%s` mode\n", line, pie_mode ? "PIE" : "ET_EXEC"); exit(1);}
                    add_token(T_EXTERN, buf, line);
                    continue;
                }

                else if(strcasecmp(buf, "byte") == 0) { add_token(T_BYTE, "byte", line);   continue;}
                else if(strcasecmp(buf, "word") == 0) { add_token(T_WORD, "word", line);   continue;}
                else if(strcasecmp(buf, "dword") == 0) { add_token(T_DWORD, "dword", line); continue;}
                else if(strcasecmp(buf, "qword") == 0) { add_token(T_QWORD, "qword", line); continue;}

                else if(strcasecmp(buf, "xword") == 0) { add_token(T_XWORD,  "xword", line);   continue;}
                else if(strcasecmp(buf, "yword") == 0) { add_token(T_YWORD, "yword", line); continue;}
                else if(strcasecmp(buf, "zword") == 0) { add_token(T_ZWORD, "zword", line); continue;}                

                else if(strcasecmp(buf, "resb") == 0) { add_token(T_RESB, "resb", line);   continue;}
                else if(strcasecmp(buf, "resw") == 0) { add_token(T_RESW, "resw", line);   continue;}
                else if(strcasecmp(buf, "resd") == 0) { add_token(T_RESD, "resd", line); continue;}
                else if(strcasecmp(buf, "resq") == 0) { add_token(T_RESQ, "resq", line); continue;}

                else if (strcasecmp(buf, "section") == 0) {
                    while (*buff == ' ' || *buff == '\t') buff++;
                    char secname[64] = {0};
                    i = 0;
                    while ((isin(LETEXT, *buff) || *buff == '.')) {
                        if(i >= 64){fprintf(stderr, "AmmAsm:%d: Section name is too long\n", line); exit(1);}
                        secname[i++] = *buff++;
                    }
                    secname[i] = 0;
                    
                    if(!secname[0]) {fprintf(stderr, "AmmAsm:%d: multi-line macro `section' exists, but not taking 0 parameters [-w+pp-macro-params-multi]\n", line); exit(1);}
                    add_token(T_SEC, secname, line);
                    continue;
                }

                else if (*buff == ':') {
                    buff++;
                    add_token(T_LAB, buf2, line);
                    continue;
                }
                else if (is2arrin(CMDS, CMDS_COUNT, buf)){
                    add_token(T_INS, buf, line);
                    continue;
                }

                // registers (GPR)
                else if(is2arrin(regs8,  8, buf)  || is2arrin(regs8GP, 8, buf)) {add_token(T_REG8, buf, line);  continue;}
                else if(is2arrin(regs16, 8, buf) || is2arrin(regs16GP, 8, buf)) {add_token(T_REG16, buf, line); continue;}
                else if(is2arrin(regs32, 8, buf) || is2arrin(regs32GP, 8, buf)) {add_token(T_REG32, buf, line); continue;}
                else if(is2arrin(regs64, 8, buf) || is2arrin(regs64GP, 8, buf)) {add_token(T_REG64, buf, line); continue;} 

                // XMM
                else if(is2arrin(Xmmregs, 32, buf)){add_token(T_XMM, buf, line); continue;}

                // YMM
                else if(is2arrin(Ymmregs, 32, buf)){add_token(T_YMM, buf, line); continue;}

                // ZMM
                else if(is2arrin(Zmmregs, 32, buf)){add_token(T_ZMM, buf, line); continue;}

                // directives
                else if(strcasecmp(buf, "db") == 0){ add_token(T_U8, buf, line);} 
                else if(strcasecmp(buf, "dw") == 0){add_token(T_U16, buf, line);}
                else if(strcasecmp(buf, "dd") == 0){add_token(T_U32, buf, line);}
                else if(strcasecmp(buf, "dq") == 0){add_token(T_U64, buf, line);}
                
                else if(!strcasecmp(buf, "align")) { add_token(T_ALIGN, buf, line); continue;}

                else {add_token(T_LAB, buf2, line);}
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
                if(!buff){ fprintf(stderr, "AmmAsm:%d: invalid escape sequence\n", line); exit(1);}
                if(*buff != '"'){
                    fprintf(stderr, "AmmAsm:%d: unterminated string literal\n", line);
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
                            fprintf(stderr, "AmmAsm:%d: Unknown escape sequence\n", line);
                            exit(1);
                    }
                    buff++;
                }
                else tmp = *buff++; 

                if (*buff != '\'') {
                    fprintf(stderr, "AmmAsm:%d: Unterminated character literal\n", line);
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
                else {fprintf(stderr, "AmmAsm:%d: you fogot to close '['\n", line); exit(1);}
                expr_buf[i] = '\0';


                char clean_expr[128] = {0};
                int k = 0;
                for (int j = 0; expr_buf[j]; j++) {
                    if (expr_buf[j] != ' ') {
                        clean_expr[k++] = expr_buf[j];
                    }
                }
                clean_expr[k] = '\0';
                str_tolower(clean_expr);
                add_token(T_ADDR_EXPR, clean_expr, line);
                continue;
            }

            else if(*buff == ','){
                buff++;
                while(*buff == ' ') buff++;
                add_token(T_COMMA, ",", line);
                continue;
            }

            else{ 
                fprintf(stderr, "AmmAsm:%d: unvalid syntax or char\n", line); 
                exit(1); 
            }
            buff++;
        }
        
        add_token(T_EOL, "", line);
    }

    add_token(T_EOF, "", line);
    return line;
}