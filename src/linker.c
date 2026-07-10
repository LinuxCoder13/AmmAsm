#include "linker.h"


void expand_local_labels(){
    char global_lab[64] = {0};
    int glob_defined = 0;

    for(int i = 0; i < ast_len; ++i){
        AST* node = &ast[i];

        // LABEL
        if(node->type == AST_LABEL){

            if(node->label.name[0] != '.'){  
                strncpy(global_lab, node->label.name, 63);
                global_lab[63] = 0;
                glob_defined = 1;
            }
            else {
                if(node->label.name[1] == '.'){ fprintf(stderr, "AmmAsm:%d: unrecognised special symbol `%s'\n", node->line, node->label.name); exit(1);}
                if(!glob_defined){ 
                    fprintf(stderr, "AmmAsm:%d: Local label \"%s\" without global\n", node->line, node->label.name);
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
                            if(expr->tokens[k].value[1] == '.'){ fprintf(stderr, "AmmAsm:%d: unrecognised special symbol `%s'\n", node->line, expr->tokens[k].value); exit(1);}
                            if(!glob_defined){ fprintf(stderr, "AmmAsm:%d: local label used without global\n", node->line); exit(1);}

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
            for(int j = 0; j < node->u64.entries_len; j++){
                if(node->u64.entries[j].type == U64_EXPR){
                    Expr *expr = &node->u64.entries[j].expr;
                    for(int k = 0; k < expr->count; ++k){
                        if(expr->tokens[k].type == T_LAB && expr->tokens[k].value[0] == '.'){
                            if(expr->tokens[k].value[1] == '.'){ fprintf(stderr, "AmmAsm:%d: unrecognised special symbol `%s'\n", node->line, expr->tokens[k].value); exit(1);}
                            if(!glob_defined){ fprintf(stderr, "AmmAsm:%d: local label used without global\n", node->line); exit(1);}

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


/* post-link resolve O(n^2) */
// collect labels with sections and find e_entry 
uint64_t collect_labels_sections() {
    uint64_t current_pc = pie_mode ? 0x78 : 0x400078; // .text section starts here 
    uint8_t e_entry_defined = 0;
    uint64_t e_entry;
    int j = 0;
    int l = 0;

    for (int i = 0; i < ast_len; i++) {
        if (ast[i].type == AST_LABEL) {

            for (int k = 0; k < i; k++) {
                if (ast[k].type == AST_LABEL && !astrcmp(ast[k].label.name, ast[i].label.name)) {
                    fprintf(stderr, "AmmAsm:%d: label `%s` already defined\n", ast[i].line, ast[i].label.name);
                    exit(1);
                }
            }

            ast[i].label.adress = pie_mode ? current_pc : current_pc - 0x400000; // offset in file(for debug) 
            ast[i].label.vadress = current_pc;
            
            if(debug){
                printf("Label[%lx]: name='%s' vaddr=0x%lx\n", j, ast[i].label.name, (pie_mode) ? ast[i].label.adress : ast[i].label.vadress);
            }

            j++;

            if(!astrcmp(ast[i].label.name, "_start")){
                e_entry_defined = 1;
                e_entry = current_pc;
            }
        }

        else if (ast[i].type == AST_SECTION) {

            for (int k = 0; k < i; k++) {
                if (ast[k].type == AST_SECTION && !astrcmp(ast[k].section.secname, ast[i].section.secname)) {
                    fprintf(stderr, "AmmAsm:%d: section `%s` already defined\n", ast[i].line, ast[i].section.secname);
                    exit(1);
                }
            }

            ast[i].section.adress = pie_mode ? current_pc : current_pc - 0x400000; // offset in file(for debug) 
            ast[i].section.vadress = current_pc;

            if(debug){
                printf("Section[%lx]: name='%s' vaddr=0x%lx\n", l, ast[i].section.secname, (pie_mode) ? ast[i].section.adress : ast[i].section.vadress);
            }
            l++;   
        }
        else if ((ast[i].type == AST_INS && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U8  && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U16 && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U32 && ast[i].machine_code_size > 0) ||
                 (ast[i].type == AST_U64 && ast[i].machine_code_size > 0))
            current_pc += ast[i].machine_code_size; 
    }
    
    if(!e_entry_defined && !obj_file){
        printf("AmmAsm: Linker: Entry point '_start' not found. Using %s%s as default\n", (pie_mode) ? "0x78" : "0x400078", (pie_mode) ? "(PIE)" : "");
        e_entry = pie_mode ? 0x78 : 0x400078;
    }

    return e_entry;
}


// Ammlinker
void resolve_labels() {
    for (int i = 0; i < ast_len; i++) {
        AST* node = &ast[i];
        if(node->type != AST_INS && node->type != AST_U64 && node->type != AST_GLOBAL && node->type != AST_EXTERN) continue;    

        if(node->type == AST_INS){
            Operand a = node->ins.operands[0];
            Operand b = node->ins.operands[1];
            Operand c = node->ins.operands[2];

            uint8_t real_imm_sz = node->ins.operands[1].imm_sz == 8 ? 4 : node->ins.operands[1].imm_sz;

            if (is2arrin(short_imm_instructions, node->cmd) && IS_EXPR_OR_PC(b)) {
                int immsz = 0;

                if (a.type == O_MEM) {
                    immsz = b.imm_sz == 8 ? 4 : b.imm_sz;
                }
                else if (a.type == O_REG32 || a.type == O_REG64) {
                    immsz = b.imm_sz ? (b.imm_sz == 8 ? 4 : b.imm_sz) : 4;
                }

                resolve_imm(node, 1, immsz);
            }

            // inst r64, expr(imm)
            else if(a.type == O_REG64 && IS_EXPR_OR_PC(b)) resolve_imm(node, 1, 8);

            // inst r32, expr(imm)
            else if(a.type == O_REG32 && IS_EXPR_OR_PC(b)) resolve_imm(node, 1, 4);

            // mov [mem], imm
            else if(a.type == O_MEM && IS_EXPR_OR_PC(b)){ resolve_imm(node, 1, real_imm_sz);}

        }
         
        // JMP/CALL/JCC label (REL32)
        if ((strcasecmp(node->cmd, "jmp")  == 0 || 
                  strcasecmp(node->cmd, "call") == 0 ||
                  is2arrin(JCC, node->cmd)) &&
                  IS_EXPR_OR_PC(node->ins.operands[0])) {
            
            uint64_t addr = resolve_expr(node->ins.operands[0].expr, node->ins.pc, node->line);
            int32_t rel32;
            if(addr == (uint64_t)-2) rel32 = 0x0; 
            else rel32 = (int32_t)(addr - (node->ins.pc + node->machine_code_size));
            *(uint32_t*)(node->machine_code + node->machine_code_size - 4) = rel32;
        }

        // [RIP REL] (DISP32)
        if ((node->ins.operands[0].type == O_MEM && node->ins.operands[0].addr.is_rip_rel) ||
            (node->ins.operands[1].type == O_MEM && node->ins.operands[1].addr.is_rip_rel)) {
            
            int op0_rip = node->ins.operands[0].type == O_MEM && node->ins.operands[0].addr.is_rip_rel;
            int op1_rip = node->ins.operands[1].type == O_MEM && node->ins.operands[1].addr.is_rip_rel;

            if (op0_rip || op1_rip) {
                int idx = op0_rip ? 0 : 1;
                AddrExpr *mem = &node->ins.operands[idx].addr;

                if (!mem->label[0]) {
                    fprintf(stderr, "AmmAsm:%d: internal error: RIP-relative memory operand has empty label\n", ast[i].line);
                    exit(1);
                }

                uint64_t addr_for_disp = find_lab_addr(mem->label);
                if (addr_for_disp == (uint64_t)-1) {
                    fprintf(stderr, "AmmAsm:%d: undefined label '%s' in RIP-relative addressing\n", ast[i].line, mem->label);
                    exit(1);
                }
                if (addr_for_disp == (uint64_t)-2) {
                    fprintf(stderr, "AmmAsm:%d: can't use externed label '%s' in RIP-relative addressing\n", ast[i].line, mem->label);
                    exit(1);
                }

                int32_t disp32 = (int32_t)((int64_t)addr_for_disp - (int64_t)(node->ins.pc + node->machine_code_size)) + mem->disp;
                uint8_t real_imm_sz = node->ins.operands[1].imm_sz == 8 ? 4 : node->ins.operands[1].imm_sz;
                
                if(real_imm_sz) *(uint32_t*)(node->machine_code + node->machine_code_size - real_imm_sz - 4) = disp32;
                else *(uint32_t*)(node->machine_code + node->machine_code_size - 4) = disp32;
                
                // inst [mem], label
                if(node->ins.operands[1].type == O_EXPR){
                    uint32_t expr_addr = (uint32_t)resolve_expr(node->ins.operands[1].expr, node->ins.pc, node->line);
                    if(expr_addr == (uint32_t)-2) *(uint32_t*)(node->machine_code + node->machine_code_size - 4) = 0x0;
                    else *(uint32_t*)(node->machine_code + node->machine_code_size - 4) = expr_addr;
                    *(uint32_t*)(node->machine_code + node->machine_code_size - real_imm_sz - 4) = disp32;
                }

            }
            
        }

        // U64 (dq)
        if (node->type == AST_U64) {
            int offset = 0;
            for (int j = 0; j < node->u64.entries_len; ++j) {
                if (node->u64.entries[j].type == U64_EXPR) {
                    uint64_t val = resolve_expr(node->u64.entries[j].expr, node->u64.pc + offset, node->line);
                    *(uint64_t*)(node->machine_code + offset) = val;
                }
                offset += sizeof(uint64_t);
            }

        }

        // GLOBAL lab, ...
        if (node->type == AST_GLOBAL){
            int l;
            for(int j = 0; j < node->global.labels_len; ++j){
                l = get_lab_indx(node->global.labels[j]);
                if(l < 0){fprintf(stderr, "AmmAsm:%d: symbol `%s' not defined\n", ast[i].line, node->global.labels[j]); exit(1);}
                ast[l].label.is_global = 1;
            }
        }

        if (node->type == AST_EXTERN){
   
            for(int j = 0; j < ast_len; j++){
                if(ast[j].type != AST_LABEL) continue;
                for(int l=0; l<node->externs.labels_len; l++){
                    if(!astrcmp(ast[j].label.name, node->externs.labels[l])){ 
                        printf("AmmAsm:%d: label `%s' extern vs global\n", ast[j].line, ast[j].label.name);
                        exit(1); 
                    }
                }
            }
        }

        // we will not free() all Expr.tokens[i].value, becouse we need them for DEBUG_AST_PRINT() which calls at end of compiler.
        // OS will do it by it self.
    }
}

uint64_t resolve_expr(Expr expr, uint64_t pc, int line){

    static char buffer[1024] = {0}; // for eval_expr
    buffer[0] = 0;
    int bi = 0;
    uint64_t addr; // label

    for(int i = 0; i < expr.count; i++){
        switch(expr.tokens[i].type){
            case T_LAB: {
                if(expr.tokens[i].value[0] == '.') { fprintf(stderr, "AmmAsm:%d: can't use local lab in expr\n", line); exit(1);}
                addr = find_lab_addr(expr.tokens[i].value);
                if(addr == (uint64_t)-1){ fprintf(stderr, "AmmAsm:%d: symbol \"%s\" undefined\n", line, expr.tokens[i].value); exit(1); }
                if(addr == (uint64_t)-2) return (uint64_t)-2; 
                bi += snprintf(buffer + bi, 1024 - bi, "%lu", addr);
                break;
            }
            case T_SEC:
                addr = find_sec_addr(expr.tokens[i].value);
                if(!addr){ fprintf(stderr, "AmmAsm:%d: symbol \"%s\" undefined\n", line, expr.tokens[i].value); exit(1); }
 
                bi += snprintf(buffer + bi, 1024 - bi, "%lu", addr);
                break;
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