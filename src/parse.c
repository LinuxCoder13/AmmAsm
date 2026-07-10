#include "parse.h"


AST *ast;
int ast_len = 0;
int ast_cap = 0;

// parser:
AST* PARSE(){
    int pos = 0;
    

    while(pos < toks_len && toks[pos].type != T_EOF){
        Token *tok = &toks[pos];
        AST node = { 0 }; // memset(&node, 0, sizeof(AST));
        AST *ASTptr = &node;
        node.line = tok->line;
        if(tok->type == T_EOL) goto skip;
        if (tok->type == T_INS) {
            node.type = AST_INS;
            node.ins.oper_count = 0;
            strncpy(node.cmd, toks[pos].value, sizeof node.cmd);
            pos++;

            while(pos < toks_len){
                if(toks[pos].type == T_COMMA){ pos++; continue;}
                if (node.ins.oper_count > 3) {
                    fprintf(stderr, "AmmAsm:%d: too many operands\n", node.line);
                    exit(1);
                }
                else if(toks[pos].type == T_REG8 || toks[pos].type == T_REG16 ||
                        toks[pos].type == T_REG32 || toks[pos].type == T_REG64 ){
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
                // only for `inst [addr], imm`
                else if(toks[pos].type == T_BYTE || toks[pos].type == T_WORD ||
                        toks[pos].type == T_DWORD|| toks[pos].type == T_QWORD ){
                    
                    if(node.ins.operands[1].imm_sz > 0) fprintf(stderr, "AmmAsm:%d: Size of operand is already defined, useing last one\n", node.line);
                    int imm_size = toks[pos++].type;
                    switch (imm_size) {
                        case T_BYTE:  node.ins.operands[1].imm_sz = 1; break;
                        case T_WORD:  node.ins.operands[1].imm_sz = 2; break;
                        case T_DWORD: node.ins.operands[1].imm_sz = 4; break;
                        case T_QWORD: node.ins.operands[1].imm_sz = 8; break;
                    }      
                    continue; 
                }
                else if(toks[pos].type == T_ADDR_EXPR){
                    node.ins.operands[node.ins.oper_count].addr = parse_addr_expr(toks[pos].value, node.line);
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

                        if (!is_expr_token(toks[pos].type)) {
                            fprintf(stderr,
                                "AmmAsm:%d: expected end of line before instruction '%s'\n",
                                toks[pos].line,
                                toks[pos].value);
                            exit(1);
                        }

                        ExprToken tok = {
                            .type = toks[pos].type,
                            .value = strdup(toks[pos].value)
                        };

                        expr.tokens = append(&expr.tok_len,
                                             &expr.tok_cap, 
                                             expr.tokens, 
                                             &tok, 
                                             sizeof(ExprToken));
                        expr.count++;
                        pos++;
                    } 

                    int result = expr_is_const(&expr);
                    if (result == 1) {
                        node.ins.operands[node.ins.oper_count].type = O_IMM;
                        node.ins.operands[node.ins.oper_count].imm = eval_const_expr(&expr);
                    } 
                    else if(result == 2){
                        node.ins.operands[node.ins.oper_count].type = O_PC;
                        node.ins.operands[node.ins.oper_count].expr = expr; // not expr but needs to be resolved 
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
                    fprintf(stderr, "AmmAsm:%d: Unexpected token \"%s\"\n", node.line, toks[pos].value);
                    exit(1); 
                }
            }


            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;;
            continue;
        }
        if(tok->type == T_LAB){
            node.type = AST_LABEL;
            node.label.is_global = 0; // by default
            if(tok->type != T_EOF && tok->type != T_EOL){
                strncpy(node.label.name, toks[pos++].value, sizeof(node.label.name));
            }
            
            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;
            continue;
        }

        if(tok->type == T_SEC){
            node.type = AST_SECTION;
            if(tok->type != T_EOF && tok->type != T_EOL){
                strncpy(node.section.secname, toks[pos++].value, sizeof(node.section.secname));
            }
            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;
            continue;
        }

        if(tok->type == T_GLOBAL){
            node.type = AST_GLOBAL;
            pos++;
            while (pos < toks_len){
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF) break;
                if(toks[pos].type == T_COMMA){ pos++; continue;}

                if(toks[pos].type == T_LAB){
                    node.global.labels = TwoDappend(&node.global.labels_len, &node.global.labels_cap,
                                                    node.global.labels, toks[pos].value);
                }

                else { fprintf(stderr, "AmmAsm:%d: invalid global symbol '%s'\n", node.line, toks[pos].value); exit(1);}
                pos++; 
            }
            
            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;
            continue;
        }
        
        if(tok->type == T_EXTERN){
            node.type = AST_EXTERN;
            pos++;

            while (pos < toks_len){
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF) break;
                if(toks[pos].type == T_COMMA){ pos++; continue;}

                if(toks[pos].type == T_LAB){
                    node.global.labels = TwoDappend(&node.externs.labels_len, &node.externs.labels_cap,
                                                    node.externs.labels, toks[pos].value);
                }

                else { fprintf(stderr, "AmmAsm:%d: invalid extern symbol '%s'\n", node.line, toks[pos].value); exit(1);}
                pos++; 
            }
            
            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;
            continue;
        }

        if(tok->type == T_U8){  
            node.type = AST_U8;

            pos++;
            while(pos < toks_len){  
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF) break;
                if(toks[pos].type == T_COMMA){ pos++; continue;}
                
                if(toks[pos].type == T_CHAR){ 
                    node.u8.data = append(&node.u8.data_len, &node.u8.data_cap, node.u8.data, &toks[pos].value[0], sizeof(uint8_t));
                    pos++;
                }
                else if(toks[pos].type == T_INT){   // can be hex, octal, des see line 417
                    uint8_t tmp = (unsigned char)eval_expr(toks[pos].value);
                    node.u8.data = append(&node.u8.data_len, &node.u8.data_cap, node.u8.data, &tmp, sizeof(uint8_t));
                    pos++;
                }
                else if(toks[pos].type == T_STR){
                    char *s = toks[pos].value;
                    while (*s) {
                        node.u8.data = append(&node.u8.data_len, &node.u8.data_cap, node.u8.data, s++, sizeof(uint8_t));
                    }
                    pos++;
                }
                else{
                    fprintf(stderr, "AmmAsm:%d: Bytes are too cooked\n", node.line);
                    exit(1);
                }

            }
            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;
            continue;
        }

        else if (tok->type == T_U16) {
            node.type = AST_U16;

            pos++;
            while (pos < toks_len) {
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF)
                    break;

                if (toks[pos].type == T_COMMA) {
                    pos++;
                    continue;
                }

                if (toks[pos].type == T_INT) {
                    uint16_t tmp = (uint16_t)eval_expr(toks[pos].value);

                    node.u16.data = append(&node.u16.data_len,
                                        &node.u16.data_cap,
                                        node.u16.data,
                                        &tmp,
                                        sizeof(tmp));
                    pos++;
                }
                else {
                    fprintf(stderr, "AmmAsm:%d: unexpected token in u16\n", toks[pos].line);
                    exit(1);
                }
            }

            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));

            if (pos < toks_len && toks[pos].type == T_EOL)
                while (toks[pos].type == T_EOL)
                    pos++;

            continue;
        }

        else if (tok->type == T_U32) {
            node.type = AST_U32;

            pos++;
            while (pos < toks_len) {
                if (toks[pos].type == T_EOL || toks[pos].type == T_EOF)
                    break;

                if (toks[pos].type == T_COMMA) {
                    pos++;
                    continue;
                }

                if (toks[pos].type == T_INT) {
                    uint32_t tmp = (uint32_t)eval_expr(toks[pos].value);

                    node.u32.data = append(&node.u32.data_len,
                                        &node.u32.data_cap,
                                        node.u32.data,
                                        &tmp,
                                        sizeof(tmp));
                    pos++;
                }
                else {
                    fprintf(stderr, "AmmAsm:%d: unexpected token in u32\n", toks[pos].line);
                    exit(1);
                }
            }

            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));

            if (pos < toks_len && toks[pos].type == T_EOL)
                while (toks[pos].type == T_EOL)
                    pos++;

            continue;
        }

        else if (tok->type == T_U64) {
            node.type = AST_U64;
            pos++; 

            while (pos < toks_len && toks[pos].type != T_EOL && toks[pos].type != T_EOF) {
                if (toks[pos].type == T_COMMA){ pos++; continue; }
                
                if (toks[pos].type == T_INT && (toks[pos+1].type == T_COMMA || toks[pos+1].type == T_EOL || toks[pos+1].type == T_EOF)) {
                    U64Entry entry = {.type = U64_INT, .imm = (uint64_t)eval_expr(toks[pos].value)};
                    node.u64.entries = append(&node.u64.entries_len, &node.u64.entries_cap,
                                               node.u64.entries, &entry, sizeof(U64Entry));
                    pos++;
                } 
                else if((toks[pos].type == T_LAB || toks[pos].type == T_INT ||
                        toks[pos].type == T_PC   || toks[pos].type == T_MINUS
                        ||toks[pos].type == T_PLUS || toks[pos].type == T_CHAR || toks[pos].type == T_LPRANT)) {
                    
                    Expr expr = {0};
                    // dynaMic version 
                    while (pos < toks_len && toks[pos].type != T_COMMA && toks[pos].type != T_EOL && toks[pos].type != T_EOF) {

                        ExprToken tok = {
                            .type = toks[pos].type,
                            .value = strdup(toks[pos].value),
                        };

                        expr.tokens = append(&expr.tok_len,
                                             &expr.tok_cap,
                                             expr.tokens,
                                             &tok,
                                            sizeof(ExprToken));
                
                        expr.count++;
                        pos++;
                    }

                    U64Entry entry = {.type = U64_EXPR, .expr = expr};
                    node.u64.entries = append(&node.u64.entries_len, &node.u64.entries_cap,
                                               node.u64.entries, &entry, sizeof(U64Entry));
                }
                else {
                    fprintf(stderr, "AmmAsm:%d: unexpected token in u64\n", toks[pos].line);
                    exit(1);
                }
            }

            ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
            if (pos < toks_len && toks[pos].type == T_EOL) while(toks[pos].type == T_EOL) pos++;
            continue;
        }

        // else if(tok->type == T_RESB || tok->type == T_RESQ || tok->type == T_RESD || tok->type == T_RESL){
        //     Token *pp = tok;
        //     if(toks[(pos-1)].type != T_LAB || toks[(pos+1)].type != T_INT){ 
        //         fprintf(stderr, "AmmAsm: syntax erorr. expected identifier before \"%s\" and decimal number after\n", 
        //             (pp->type == T_RESB) ? "resb" : 
        //             (pp->type == T_RESQ) ? "resq" : 
        //             (pp->type == T_RESD) ? "resd" : 
        //             (pp->type == T_RESL) ? "resl" : "?");                    
        //         exit(1);    
        //     }

        //     switch (tok->type){
        //     case T_RESB: node.type = AST_RESB; node.resb.size = (long)eval_expr(toks[pos].value); break;
        //     case T_RESQ: node.type = AST_RESQ; node.resq.size = (long)eval_expr(toks[pos].value); break;
        //     case T_RESD: node.type = AST_RESD; node.resd.size = (long)eval_expr(toks[pos].value); break;
        //     case T_RESL: node.type = AST_RESL; node.resl.size = (long)eval_expr(toks[pos].value); break;
        //     }
        //     pos += 1;

        //     ast = append(&ast_len, &ast_cap, ast, ASTptr, sizeof(AST));
        //     if(pos < toks_len && toks[pos].type == T_EOL) ++pos;
        //     continue;              
        // }

        else {
            fprintf(stderr,
                "AmmAsm:%d: label, instruction, directive or section declaration expected\n",
                toks[pos].line
            );
            exit(1);
        }

skip:
        if (pos < toks_len && toks[pos].type != T_EOF) {
            pos++;
        }
    }

    del_all_toks();
    
    return ast; // for debug
}