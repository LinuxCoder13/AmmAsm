#include "debug.h"
#include "enum.h"
#include "struct.h"
#include "lexer.h"
#include "parse.h"

void DEBUG_PRINT_TOKENS() {
    if(debug){
    printf("=== TOKENS DUMP (%d tokens) ===\n", toks_len);
    for (int i = 0; i < toks_len; i++) {
        const char* type_str = "UNKNOWN";
        switch(toks[i].type) {
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
            case T_U16: type_str = "T_U16"; break;
            case T_U32: type_str = "T_U32"; break;
            case T_U64: type_str = "T_U64"; break;
            case T_BYTE: type_str = "T_BYTE"; break;
            case T_WORD: type_str = "T_WORD"; break;
            case T_DWORD: type_str = "T_DWORD"; break;
            case T_QWORD: type_str = "T_QWORD"; break;
            case T_CHAR: type_str = "T_CHAR"; break;
            case T_COMMA: type_str = "T_COMMA"; break;
            case T_LPRANT: type_str = "T_LPRANT"; break;
            case T_RPRANT: type_str = "T_RPRANT"; break;
            case T_RESB: type_str = "T_RESB"; break;
            case T_RESQ: type_str = "T_RESQ"; break;
            case T_RESD: type_str = "T_RESD"; break;
            case T_RESL: type_str = "T_RESL"; break;
            case T_GLOBAL: type_str = "T_GLOBAL"; break;
            case T_EXTERN: type_str = "T_EXTERN"; break;
        }
        
        printf("Token[%d]: type=%-12s value='%s' line=%d\n", 
               i, type_str, toks[i].value ? toks[i].value : "(null)", toks[i].line);
    }
    printf("=== END TOKENS ===\n\n");
    }
}

void DEBUG_PRINT_AST() {
    if(debug){
    printf("\n=== AST DUMP (%d nodes) ===\n", ast_len);
    for (int i = 0; i < ast_len; i++) {
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
            case AST_GLOBAL: type_str = "AST_GLOBAL"; break;
            case AST_SECTION: type_str = "AST_SECTION"; break;
            case AST_EXTERN: type_str = "AST_EXTERN"; break;
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
                        case O_PC: otype_str = "PC"; break;
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
                        case O_PC:
                            printf("0x%lx", resolve_expr(node->ins.operands[j].expr, node->ins.pc, node->line));
                            break;
                        case O_EXPR:
                            printf("(");
                            for (int k = 0; k < node->ins.operands[j].expr.count; k++) {
                                if (node->ins.operands[j].expr.tokens[k].type == T_CHAR) {
                                    printf("'%s'", node->ins.operands[j].expr.tokens[k].value);
                                } else {
                                    printf("%s", node->ins.operands[j].expr.tokens[k].value);
                                }
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
            
            case AST_GLOBAL:
                printf(" directive='global' labels = [ ");
                for (int i = 0; i < node->global.labels_len; i++){
                    printf("%s%c ", node->global.labels[i], (i+1 == node->global.labels_len) ? '\0' : ','); // more readable :)
                }
                printf("]");
                break;

            case AST_EXTERN:
                printf(" directive='extern' labels = [ ");
                for (int i = 0; i < node->externs.labels_len; i++){
                    printf("%s%c ", node->externs.labels[i], (i+1 == node->externs.labels_len) ? '\0' : ','); // more readable :)
                }
                printf("]");
                break;
    
            case AST_LABEL:
                printf(" name='%s' addr=0x%lx  vaddr=0x%lx global=%d", node->label.name, node->label.adress, node->label.vadress, node->label.is_global);
                break;

            case AST_SECTION:
                printf(" name='%s' addr=0x%lx  vaddr=0x%lx", node->section.secname, node->section.adress, node->section.vadress);
                break;

            case AST_U8:
                printf(" size=%d data=[", node->u8.data_len);
                for (int j = 0; j < node->u8.data_len; j++) {
                    printf("%02x", node->u8.data[j]);
                    if (j < node->u8.data_len - 1) printf(" ");
                }
                printf("]");
                break;
                
            case AST_U16:
                printf(" size=%d data=[", node->u16.data_len * sizeof(short));
                for (int j = 0; j < node->u16.data_len; j++) {
                    printf("%04x", node->u16.data[j]);
                    if (j < node->u16.data_len - 1) printf(" ");
                }
                printf("]");
                break;
                
            case AST_U32:
                printf(" size=%d data=[", node->u32.data_len * sizeof(int));
                for (int j = 0; j < node->u32.data_len; j++) {
                    printf("%08x", node->u32.data[j]);
                    if (j < node->u32.data_len - 1) printf(" ");
                }
                printf("]");
                break;
                
            case AST_U64:
                printf(" size=%d data=[", node->u64.entries_len);
                for (int j = 0; j < node->u64.entries_len; j++) {
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
                    if (j < node->u64.entries_len - 1) printf(", ");
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
    }
    
}