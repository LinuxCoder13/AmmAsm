#include "instruction_parse.h"

uint8_t parseInst(AST* node, uint64_t *pc) {
    if (node->type != AST_INS) return 0;

    Operand *a = &node->ins.operands[0];
    Operand *b = &node->ins.operands[1];
    Operand *c = &node->ins.operands[2];
    const uint8_t *cmd = node->cmd;
    
    node->machine_code = malloc(16);
    uint8_t *machine_code = node->machine_code;
    node->machine_code_cap = 16;
    memset(node->machine_code, 0, node->machine_code_cap);
    uint64_t* s = &node->machine_code_len;
    *s = 0;


    // ============================================================================
    // |                "MOV" INSTRUCTION ENCODING REFERENCE                      |
    // ============================================================================
    // 
    // I wrote this table by my self, stop saying AI slop
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



    if((a->type == O_REG16 || a->type == O_REG8) && b->type == O_EXPR){
        fprintf(stderr, "AmmAsm:%d: Non-const expr doesn't fit in %s-bit register\n", node->line, a->type == O_REG8 ? "8" : "16");
        exit(1);
    }


    if (strcmp(cmd, "mov") == 0) {
    
        // ========================================================================
        // 1. MOV REG, IMM (reg <- imm)
        // ========================================================================
        
        // MOV R64, IMM64
        if (a->type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(*b) && c->type == O_NONE) {

            uint8_t reg_idx = find_reg64_index(a->reg);
            uint64_t imm = b->imm;

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, imm, 64);
            *pc += *s;
            
        }

        // MOV R32, IMM32
        else if (a->type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(*b) && c->type == O_NONE) {

            uint8_t reg_idx = find_reg32_index(a->reg);
            uint32_t imm = (uint32_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint32_t)imm, 32);
            *pc += *s;
            
        }

        // MOV R16, IMM16
        else if (a->type == O_REG16 && b->type == O_IMM && c->type == O_NONE) {

            uint8_t reg_idx = find_reg16_index(a->reg);
            uint16_t imm = (uint16_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint16_t)imm, 16);
            *pc += *s;
            
        }

        // MOV R8, IMM8/CHAR
        else if (a->type == O_REG8 && (b->type == O_IMM || b->type == O_CHAR) && c->type == O_NONE) {

            uint8_t c = b->c;
            uint8_t reg_idx = find_reg8_index(a->reg);
            uint8_t imm = (uint8_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (b->type == O_CHAR) ? (uint8_t)c : (uint8_t)imm, 8);
            *pc += *s;
            
        }


        // ========================================================================
        // 2. MOV REG, REG (reg <- reg) (mod = 11)
        // ========================================================================

        // MOV R64, R64
        else if (a->type == O_REG64 && b->type == O_REG64 && c->type == O_NONE) {
        
            uint8_t rm = find_reg64_index(a->reg);
            uint8_t reg = find_reg64_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 64);
            *pc += *s;
            
        }

        // MOV R32, R32
        else if (a->type == O_REG32 && b->type == O_REG32 && c->type == O_NONE) {
        
            uint8_t rm = find_reg32_index(a->reg);
            uint8_t reg = find_reg32_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 32);
            *pc += *s;
            
        }

        // MOV R16, R16
        else if (a->type == O_REG16 && b->type == O_REG16 && c->type == O_NONE) {
        
            uint8_t rm = find_reg16_index(a->reg);
            uint8_t reg = find_reg16_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 16);
            *pc += *s;
            
        }

        // MOV R8, R8
        else if (a->type == O_REG8 && b->type == O_REG8 && c->type == O_NONE) {
        
            uint8_t rm = find_reg8_index(a->reg);
            uint8_t reg = find_reg8_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 8);
            *pc += *s;
            
        }


        // ========================================================================
        // 3. MOV REG, [ADDR] (mem <- reg)
        // ========================================================================


        // MOV R64, [ADDR]
        else if (a->type == O_REG64 && b->type == O_MEM && c->type == O_NONE) {
            uint8_t reg = find_reg64_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R32, [ADDR]
        else if (a->type == O_REG32 && b->type == O_MEM && c->type == O_NONE) {
            uint8_t reg = find_reg32_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 32, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R16, [ADDR]
        else if (a->type == O_REG16 && b->type == O_MEM && c->type == O_NONE) {
            uint8_t reg = find_reg16_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 16, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R8, [ADDR]
        else if (a->type == O_REG8 && b->type == O_MEM && c->type == O_NONE) {
            uint8_t reg = find_reg8_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 8, 0x8A, 0, 0);
            *pc += *s;
            
        }

        // ========================================================================
        // 4. MOV [ADDR], REG (mem -> reg)
        // ========================================================================


        // MOV [ADDR], R64
        else if (a->type == O_MEM && b->type == O_REG64 && c->type == O_NONE) {
            uint8_t reg = find_reg64_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R32
        else if (a->type == O_MEM && b->type == O_REG32 && c->type == O_NONE) {
            uint8_t reg = find_reg32_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 32, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R16
        else if (a->type == O_MEM && b->type == O_REG16 && c->type == O_NONE)  {
            uint8_t reg = find_reg16_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 16, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R8
        else if (a->type == O_MEM && b->type == O_REG8 && c->type == O_NONE) {
            uint8_t reg = find_reg8_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 8, 0x88, 0, 0);
            *pc += *s;
            
        }


        else if (a->type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && c->type == O_NONE){
            AddrExpr *mem = &a->addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){
                case 1: *s = encode_inst_rm_rm(machine_code, 0, mem, 8, 0xC6, 1,  b->type == O_IMM ? b->imm : b->c); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 0, mem, 16, 0xC7, 2, b->type == O_IMM ? b->imm : b->c); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 0, mem, 32, 0xC7, 4, b->type == O_IMM ? b->imm : b->c); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 0, mem, 64, 0xC7, 4, b->type == O_IMM ? b->imm : b->c); break; // no mov [mem], imm64
            }
            *pc += *s;
            
        }
        
    }

    // Group 1 instructions: add, or, adc, sbb, and, sub, xor, cmp
    else if (strcmp(node->cmd, "adc") == 0 ||
            strcmp(node->cmd, "add") == 0 ||
            strcmp(node->cmd, "and") == 0 ||
            strcmp(node->cmd, "cmp") == 0 ||
            strcmp(node->cmd, "or")  == 0 ||
            strcmp(node->cmd, "sbb") == 0 ||
            strcmp(node->cmd, "sub") == 0 ||
            strcmp(node->cmd, "xor") == 0) {

                    
        static const Group1Insn group1_table[] = {
            {"adc", 0x13, 0x12, 0x13, 0x12, 0x11, 0x10, 2},
            {"add", 0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0},
            {"and", 0x23, 0x22, 0x23, 0x22, 0x21, 0x20, 4},
            {"cmp", 0x3B, 0x3A, 0x3B, 0x3A, 0x39, 0x38, 7},
            {"or",  0x0B, 0x0A, 0x0B, 0x0A, 0x09, 0x08, 1},
            {"sbb", 0x1B, 0x1A, 0x1B, 0x1A, 0x19, 0x18, 3},
            {"sub", 0x2B, 0x2A, 0x2B, 0x2A, 0x29, 0x28, 5},
            {"xor", 0x33, 0x32, 0x33, 0x32, 0x31, 0x30, 6},
        };            

        const Group1Insn *insn = &group1_table[find_ins_idx(cmd, sizeof(group1_table) / sizeof(group1_table[0]), group1_table)];

        if ((a->type == O_REG64 || a->type == O_REG32 || a->type == O_REG16 || a->type == O_REG8) && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && c->type == O_NONE && !a->nf) {
            int reg = reg_index(a);
            int sz  = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_group1_imm( machine_code, reg, (a->type == O_REG8 && b->type == O_CHAR) ? b->c : b->imm, sz, insn->group, b->type == O_EXPR);
            *pc += *s;
        }

        else if (((a->type == O_REG64 && b->type == O_REG64) ||
                (a->type == O_REG32 && b->type == O_REG32) ||
                (a->type == O_REG16 && b->type == O_REG16) ||
                (a->type == O_REG8  && b->type == O_REG8)) && c->type == O_NONE && !a->nf) {

            int dest = reg_index(a);
            int src  = reg_index(b);
            int sz   = operand_bits(a);
            node->ins.pc = *pc;
            *s = encode_group1_reg_reg( machine_code, dest, src, sz, a->type == O_REG8 ? insn->op_reg8_reg8 : insn->op_reg_reg);

            *pc += *s;
        }

        else if ((a->type == O_REG64 || a->type == O_REG32 || a->type == O_REG16 || a->type == O_REG8) && b->type == O_MEM && c->type == O_NONE) {

            int reg = reg_index(a);
            int sz  = operand_bits(a);

            node->ins.pc = *pc;

            *s = encode_inst_rm_rm( machine_code, reg, &b->addr, sz, a->type == O_REG8
                    ? insn->op_reg8_mem
                    : insn->op_reg_mem,
                0,0);

            *pc += *s;
        }

        else if (a->type == O_MEM &&
                (b->type == O_REG64 || b->type == O_REG32 || b->type == O_REG16 || b->type == O_REG8) && c->type == O_NONE) {

            int reg = reg_index(b);
            int sz  = operand_bits(b);

            node->ins.pc = *pc;

            *s = encode_inst_rm_rm( machine_code, reg, &a->addr, sz,
                b->type == O_REG8 ? insn->op_mem_reg8 : insn->op_mem_reg, 0,0);

            *pc += *s;
        }

        else if (a->type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && node->ins.operands[1].imm_sz && c->type == O_NONE && !a->nf) {

            int sz = node->ins.operands[1].imm_sz * 8;

            uint32_t imm = b->type == O_CHAR ? b->c : b->imm;

            node->ins.pc = *pc;

            *s = encode_inst_rm_rm( machine_code, insn->group, &a->addr, sz,
                sz == 8 ? 0x80 : 0x81,
                sz == 8 ? 1 : (sz == 64 ? 4 : sz / 8),
                imm);
            *pc += *s;
        }

        // APX reg reg reg/none
        else if((a->type == O_REG64 && b->type == O_REG64 && (c->type == O_REG64 || (a->nf && c->type == O_NONE))) ||
                (a->type == O_REG32 && b->type == O_REG32 && (c->type == O_REG32 || (a->nf && c->type == O_NONE))) ||
                (a->type == O_REG16 && b->type == O_REG16 && (c->type == O_REG16 || (a->nf && c->type == O_NONE))) ||
                (a->type == O_REG8  && b->type == O_REG8  && (c->type == O_REG8  || (a->nf && c->type == O_NONE)))){
            if(insn->group == 7) goto error; // cmp - does not support NDD
            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // sbb/adc

            int dest = reg_index(a);
            int src1 = reg_index(b);
            int src2 = reg_index(c); // will be 0 if c->type == O_NONE
            int sz = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? insn->op_reg8_reg8 : insn->op_reg_reg, 
            c->type == O_NONE ? dest : src1,
            c->type == O_NONE ? src2 : dest,
            c->type == O_NONE ? src1 : src2,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, !(a->nf && c->type == O_NONE));
            *pc += *s;
        }

        // APX reg reg imm
        //     reg imm

        // there is nothing we can do...
        // https://www.youtube.com/watch?v=F0Gkr4MBEO0
        else if((a->type == O_REG64 && (b->type == O_REG64 || ((IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && a->nf)) && (((IS_EXPR_OR_IMM_OR_PC(*c) || c->type == O_CHAR) && b->type == O_REG64) || (c->type == O_NONE && a->nf))) ||
                (a->type == O_REG32 && (b->type == O_REG32 || ((IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && a->nf)) && (((IS_EXPR_OR_IMM_OR_PC(*c) || c->type == O_CHAR) && b->type == O_REG32) || (c->type == O_NONE && a->nf))) ||
                (a->type == O_REG16 && (b->type == O_REG16 || ((IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && a->nf)) && (((IS_EXPR_OR_IMM_OR_PC(*c) || c->type == O_CHAR) && b->type == O_REG16) || (c->type == O_NONE && a->nf))) ||
                (a->type == O_REG8  && (b->type == O_REG8  || ((IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && a->nf)) && (((IS_EXPR_OR_IMM_OR_PC(*c) || c->type == O_CHAR) && b->type == O_REG8 ) || (c->type == O_NONE && a->nf)))){
            if(insn->group == 7) goto error; // cmp - does not support NDD
            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // sbb/adc

            int dest = reg_index(a);
            int src1 = reg_index(b);
            Operand* imm_op = c->type == O_NONE ? b : c;
            uint8_t is_expr = IS_EXPR_OR_PC(*b) || IS_EXPR_OR_PC(*c);
            int sz = operand_bits(a);
            
            node->ins.pc = *pc;
            *s = encode_APX_group1_imm(machine_code, insn->group, dest, src1, sz, c->type != O_NONE, a->nf, imm_op->type == O_CHAR ? imm_op->c : imm_op->imm, is_expr);
            *pc += *s;
        }

        // APX reg rm rm
        else if(((a->type == O_REG64 && b->type == O_MEM && c->type == O_REG64) || (a->type == O_REG64 && b->type == O_REG64 && c->type == O_MEM)) ||
                ((a->type == O_REG32 && b->type == O_MEM && c->type == O_REG32) || (a->type == O_REG32 && b->type == O_REG32 && c->type == O_MEM)) ||
                ((a->type == O_REG16 && b->type == O_MEM && c->type == O_REG16) || (a->type == O_REG16 && b->type == O_REG16 && c->type == O_MEM)) ||
                ((a->type == O_REG8 && b->type == O_MEM && c->type == O_REG8) || (a->type == O_REG8 && b->type == O_REG8 && c->type == O_MEM))){

            node->ins.pc = *pc;
            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // sbb/adc
            int dest = reg_index(a); // co-colled "ndd"
            int reg_src = b->type == O_MEM ? reg_index(c) : reg_index(b);
            AddrExpr *mem = b->type == O_MEM ? &b->addr : &c->addr;
             
            int sz = operand_bits(a);
            uint8_t opcode_reg_rm = sz == 8 ? insn->op_reg8_mem : insn->op_reg_mem;
            uint8_t opcode_rm_reg = sz == 8 ? insn->op_mem_reg8 : insn->op_mem_reg;
            uint8_t opcode = b->type == O_MEM ? opcode_rm_reg : opcode_reg_rm;

            *s = encode_NDD_APX_reg_reg_rm(machine_code, opcode, 
            reg_src,
            dest,
            mem,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 1);
            
            *pc += *s;
        }

        // APX reg mem, imm
        //     mem, imm
        else if((a->type == O_REG64 && b->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*c)) || (a->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*b) && a->nf && c->type == O_NONE) ||
                (a->type == O_REG32 && b->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*c)) || (a->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*b) && a->nf && c->type == O_NONE) ||
                (a->type == O_REG16 && b->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*c)) || (a->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*b) && a->nf && c->type == O_NONE) ||
                (a->type == O_REG8 && b->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*c)) ||  (a->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*b) && a->nf && c->type == O_NONE)){
            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // sbb/adc
            int dest = reg_index(a); // 0 if a->type == O_MEM
            int sz;
            if(a->type == O_MEM){
                sz = b->imm_sz * 8;
                if(!sz) sz = 16; // nasm does the same, idk.
            }
            else sz = operand_bits(a);
            
            Operand *imm_op = c->type == O_NONE ? b : c; 
            AddrExpr* mem = a->type == O_MEM ? &a->addr : &b->addr;
            uint8_t is_expr = IS_EXPR_OR_PC(*b) || IS_EXPR_OR_PC(*c);
            if(is_expr && (sz == 16 || sz == 8)) goto error;

            node->ins.pc = *pc;
            *s = encode_APX_group1_reg_mem_imm(machine_code, insn->group, dest, *mem, sz, c->type != O_NONE, a->nf, imm_op->imm, is_expr);
            *pc += *s;
        }
    }

    // Group 2
    else if (strcmp(node->cmd, "rcl") == 0 ||
            strcmp(node->cmd, "rcr") == 0 ||
            strcmp(node->cmd, "rol") == 0 ||
            strcmp(node->cmd, "ror") == 0 ||
            strcmp(node->cmd, "sar") == 0 ||
            strcmp(node->cmd, "sal") == 0 ||
            strcmp(node->cmd, "shl") == 0 ||
            strcmp(node->cmd, "shr") == 0) {

        static const Group2Insn group2_table[] = {
            {"rcl", 2},
            {"rcr", 3},
            {"rol", 0},
            {"ror", 1},
            {"sal", 4},
            {"sar", 7},
            {"shl", 4},
            {"shr", 5},
        };

        const Group2Insn *insn = &group2_table[find_ins_idx(node->cmd, sizeof(group2_table) / sizeof(group2_table[0]), group2_table)];

        int sz;
        uint8_t reg;

        // [mem]/reg, cl
        if (((a->type == O_REG8 || a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) && !strcmp(b->reg, "cl") && c->type == O_NONE) ||
             (a->type == O_MEM && !strcmp(b->reg, "cl") && c->type == O_NONE)) {
            
            // mem, cl
            // {nf} mem, cl
            if (a->type == O_MEM && !strcmp(b->reg, "cl") && c->type == O_NONE) {
                sz = node->ins.operands[1].imm_sz;

                node->ins.pc = *pc;
                if(!a->nf)*s = encode_inst_rm_rm(machine_code, insn->group, &a->addr, sz * 8, (sz * 8) == 8 ? 0xD2 : 0xD3, 111, 0);
                else{
                    if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
                    *s = encode_NDD_APX_reg_reg_rm(machine_code, (sz * 8) == 8 ? 0xD2 : 0xD3, 
                        insn->group,
                        0,
                        &a->addr,
                        EVEX_MAP_APX,
                        0,
                        sz == 2 ? EVEX_PP_66 : EVEX_PP_NONE , sz*8 == 8 /* bytes */, a->nf , EVEX_Z0, 0);
                }
                *pc += *s;
            }

            // reg, cl
            // {nf} reg, cl
            else if ((a->type == O_REG8 || a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&  !strcmp(b->reg, "cl") && c->type == O_NONE) {

                sz = operand_bits(a);
                reg = reg_index(a);

                node->ins.pc = *pc;
                if(!a->nf)*s = encode_group2_reg_cl(machine_code, reg, sz == 8 ? 0xD2 : 0xD3, insn->group, sz);
                else{
                    *s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? 0xD2 : 0xD3, 
                        insn->group,
                        0,
                        reg,
                        EVEX_MAP_APX,
                        0,
                        sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 0);
                }
                *pc += *s;
            }



            // APX
            // reg, reg, cl
            else if(((a->type == O_REG8  && b->type == O_REG8 )|| 
                     (a->type == O_REG16 && b->type == O_REG16)||
                     (a->type == O_REG32 && b->type == O_REG32)||
                     (a->type == O_REG64 && b->type == O_REG64)) && 
                   !strcmp(c->reg, "cl") ){
                if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
                int dest = reg_index(a);
                int src1 = reg_index(b);

                int sz = operand_bits(a);

                node->ins.pc = *pc;
                *s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? 0xD2 : 0xD3, 
                insn->group,
                dest,
                src1,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 1);
                *pc += *s;
            }
        }   
        // reg, imm8/char
        // {nf} reg, imm8/char
        else if ((b->type == O_IMM || b->type == O_CHAR) && (a->type == O_REG8 || a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) && c->type == O_NONE) {
            
            uint8_t imm = b->type == O_IMM ? (uint8_t)b->imm : b->c;
            sz = operand_bits(a);
            reg = reg_index(a);
            uint8_t opcode = (imm == 1) ? (sz == 8 ? 0xD0 : 0xD1) : 
                                          (sz == 8 ? 0xC0 : 0xC1);
            node->ins.pc = *pc;

            if(!a->nf){
                *s = encode_group2_reg_imm(machine_code, reg, opcode, insn->group, imm, sz);
            }
            else{
                if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
                *s = encode_NDD_APX_reg_reg_reg(machine_code, opcode, 
                    insn->group,
                    0,
                    reg,
                    EVEX_MAP_APX,
                    0,
                    sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 0);
                if(imm != 1)machine_code[(*s)++] = imm;
            }

            *pc += *s;
        }

        // (APX) reg, reg, imm/char
        else if (((a->type == O_REG8  && b->type == O_REG8) || 
                  (a->type == O_REG16 && b->type == O_REG16)||
                  (a->type == O_REG32 && b->type == O_REG32)|| 
                  (a->type == O_REG64 && b->type == O_REG64)) &&
                  (c->type == O_IMM || c->type == O_CHAR))  {

            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
            uint8_t imm = c->type == O_IMM ? (uint8_t)c->imm : c->c;
            int dest = reg_index(a);
            int src1 = reg_index(b);
            int sz = operand_bits(a);
            uint8_t opcode = imm == 1 ? (sz == 8 ? 0xD0 : 0xD1) : 
                                        (sz == 8 ? 0xC0 : 0xC1);
            node->ins.pc = *pc;
            *s = encode_NDD_APX_reg_reg_reg(machine_code, opcode, 
                insn->group,
                dest,
                src1,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 1);
            if(imm != 1)machine_code[(*s)++] = imm;

            *pc += *s;
        }

        // mem, imm/char
        // {nf} mem, imm/char
        else if ((b->type == O_IMM || b->type == O_CHAR) && (a->type == O_MEM) && node->ins.operands[1].imm_sz && c->type == O_NONE) {

            uint8_t imm = b->type == O_IMM ? b->imm : b->c;
            sz = node->ins.operands[1].imm_sz;
            uint8_t opcode = imm == 1 ? (sz == 1 ? 0xD0 : 0xD1) : 
                                        (sz == 1 ? 0xC0 : 0xC1) ;
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;

            if(!a->nf)*s = encode_inst_rm_rm(machine_code, insn->group, &a->addr, sz * 8, opcode, 111, 0);
            else{
                if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
                *s = encode_NDD_APX_reg_reg_rm(machine_code, opcode, 
                    insn->group,
                    0,
                    mem,
                    EVEX_MAP_APX,
                    0,
                    sz == 2 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 8 /* bytes */, a->nf , EVEX_Z0, 0);
            }
            if(imm != 1)machine_code[(*s)++] = imm;

            *pc += *s;
        }

        // (APX) reg, mem, imm/char
        else if((a->type == O_REG8 || a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) && b->type == O_MEM && (c->type == O_IMM || c->type == O_CHAR)){
            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
            uint8_t imm = b->type == O_IMM ? c->imm : c->c;
            sz = operand_bits(a);
            uint8_t opcode = imm == 1 ? (sz == 8 ? 0xD0 : 0xD1) : 
                                        (sz == 8 ? 0xC0 : 0xC1) ;
            AddrExpr *mem = &b->addr;
            uint8_t reg = reg_index(a);
            node->ins.pc = *pc;

            *s = encode_NDD_APX_reg_reg_rm(machine_code, opcode, 
                insn->group,
                reg,
                mem,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64 /* bytes */, a->nf , EVEX_Z0, 1);

            if(imm != 1)machine_code[(*s)++] = imm;

            *pc += *s;   
        }

        // (APX) reg, mem, cl
        else if((a->type == O_REG8 || a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) && b->type == O_MEM && !strcmp(c->reg, "cl")){
            if(a->nf && (insn->group == 2 || insn->group == 3)) goto error; // rcl/rcr
            uint8_t imm = b->type == O_IMM ? c->imm : c->c;
            sz = operand_bits(a);
            reg = reg_index(a);
            uint8_t opcode = sz == 8 ? 0xD2 : 0xD3;

            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;

            *s = encode_NDD_APX_reg_reg_rm(machine_code, opcode, 
                insn->group,
                reg,
                mem,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64 /* bytes */, a->nf , EVEX_Z0, 1);

            *pc += *s;   
        }

    }

    // Group 3 instructions: not, neg, mul, imul, div, idiv, test
    else if (strcmp(node->cmd, "not") == 0 ||
            strcmp(node->cmd, "neg") == 0 ||
            strcmp(node->cmd, "mul") == 0) {

        static const Group3Insn group3_table[] = {
            {"mul", 4},
            {"neg", 3},
            {"not", 2},
        };

        const Group3Insn *insn = &group3_table[find_ins_idx(cmd, sizeof(group3_table) / sizeof(group3_table[0]), group3_table)];

        // reg
        if ((a->type == O_REG64 || a->type == O_REG32 ||
            a->type == O_REG16 || a->type == O_REG8) && b->type == O_NONE) {

            int reg = reg_index(a);
            int sz = operand_bits(a);
            
            if(a->nf && insn->group == 2) goto error;

            node->ins.pc = *pc;
            if(!a->nf)*s = encode_group3_reg(machine_code, reg, sz == 8 ? 0xF6 : 0xF7, insn->group, sz);
            else if(a->nf){*s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? 0xf6 : 0xf7, 
                        insn->group,
                        0,
                        reg,
                        EVEX_MAP_APX,
                        0,
                        sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 0);}
            *pc += *s;
        }

        // mem
        else if (a->type == O_MEM && b->type == O_NONE) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;

            uint8_t sz = node->ins.operands[1].imm_sz * 8;
            if(!sz) goto error;
            if(a->nf && insn->group == 2) goto error;

            if(!a->nf)*s = encode_inst_rm_rm(machine_code, insn->group, mem, sz, sz == 8 ? 0xF6 : 0xf7, 111, 0);
            else{ *s = encode_NDD_APX_reg_reg_rm(machine_code, sz == 8 ? 0xF6 : 0xf7, 
                insn->group,
                0,
                mem,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64 /* bytes */, a->nf , EVEX_Z0, 0);
            }
            

            *pc += *s;
        }

        // ndd, reg -> only for not/neg
        else if((a->type == O_REG8  && b->type == O_REG8 )|| 
                (a->type == O_REG16 && b->type == O_REG16)||
                (a->type == O_REG32 && b->type == O_REG32)||
                (a->type == O_REG64 && b->type == O_REG64)){
            if(insn->group != 2 && insn->group != 3) goto error;

            int reg = reg_index(a);
            int src = reg_index(b);
            int sz = operand_bits(a);
            
            /* 
                Nasm encodes mul reg, reg as imul reg, reg. AmmAsm does not support this sugar yet.

                Basicly nf + mul -> Nasm encodes via VEX prefix as xmul which is BMI2 instruction.
                AmmAsm does not supports BMI yet. so we are exiting with error ;(
            */

            if(a->nf && insn->group == 2) goto error;

            node->ins.pc = *pc;
            *s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? 0xf6 : 0xf7, 
                insn->group,
                reg,
                src,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 1);
            *pc += *s;  
        }

        // ndd, mem -> only for not/neg
        else if ((a->type == O_REG64 || a->type == O_REG32 ||
            a->type == O_REG16 || a->type == O_REG8) && b->type == O_MEM  && c->type == O_NONE) {
            AddrExpr *mem = &b->addr;

            uint8_t sz = operand_bits(a);

            if(a->nf && insn->group == 2) goto error;
            node->ins.pc = *pc;
            *s = encode_NDD_APX_reg_reg_rm(machine_code, sz == 8 ? 0xF6 : 0xf7, 
                insn->group,
                reg_index(b),
                mem,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64 /* bytes */, a->nf , EVEX_Z0, 1);   

            *pc += *s;
        }
    }

    // TEST
    else if (!strcmp(cmd, "test")) {
        if(a->nf) goto error;
        if ((a->type == O_REG64 || a->type == O_REG32 ||
            a->type == O_REG16 || a->type == O_REG8) &&
            (b->type == O_REG64 || b->type == O_REG32 ||
            b->type == O_REG16 || b->type == O_REG8)) {

            int dest = reg_index(a);
            int src = reg_index(b);
            int sz = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_test_reg_reg(machine_code, dest, src, sz);
            *pc += *s;
        }

        else if ((a->type == O_REG64 || a->type == O_REG32 ||
                a->type == O_REG16 || a->type == O_REG8) &&
                IS_EXPR_OR_IMM_OR_PC(*b) && c->type == O_NONE) {

            int reg = reg_index(a);
            int sz = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_test_reg_imm(machine_code, reg, b->imm, sz);
            *pc += *s;
        }

        else if ((a->type == O_REG64 || a->type == O_REG32 ||
                a->type == O_REG16 || a->type == O_REG8) &&
                b->type == O_MEM && c->type == O_NONE) {

            int reg = reg_index(a);
            int sz = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &b->addr, sz,
                sz == 8 ? 0x84 : 0x85, 0, 0);
            *pc += *s;
        }

        else if (a->type == O_MEM &&
                (b->type == O_REG64 || b->type == O_REG32 ||
                b->type == O_REG16 || b->type == O_REG8) && c->type == O_NONE) {

            int reg = reg_index(b);
            int sz = operand_bits(b);

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &a->addr, sz,
                sz == 8 ? 0x84 : 0x85, 0, 0);
            *pc += *s;
        }

        else if (a->type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && c->type == O_NONE){
            AddrExpr *mem = &a->addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){
                case 1: *s = encode_inst_rm_rm(machine_code, 0, mem, 8, 0xF6, 1,  b->type == O_IMM ? b->imm : b->c); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 0, mem, 16, 0xF7, 2, b->type == O_IMM ? b->imm : b->c); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 0, mem, 32, 0xF7, 4, b->type == O_IMM ? b->imm : b->c); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 0, mem, 64, 0xF7, 4, b->type == O_IMM ? b->imm : b->c); break; // no mov [mem], imm64
            }
            *pc += *s;
            
        }   
    }

    // IMUL
    else if (!strcmp(cmd, "imul")) {

        if (a->type == O_REG64 || a->type == O_REG32 ||
            a->type == O_REG16 || a->type == O_REG8) {

            int dest = reg_index(a);
            int sz = operand_bits(a);

            // imul reg
            if (b->type == O_NONE) {
                if(a->zu) goto error;
                node->ins.pc = *pc;
                if(!a->nf)*s = encode_imul_reg(machine_code, dest, sz);
                else{ *s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? 0xf6 : 0xf7, 
                        5,
                        0,
                        dest,
                        EVEX_MAP_APX,
                        0,
                        sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 0);
                }
                *pc += *s;
            }

            // imul reg, reg, none/imm
            else if ((b->type == O_REG64 || b->type == O_REG32 ||
                    b->type == O_REG16 || b->type == O_REG8)) {

                int src = reg_index(b);
                // imul reg, reg
                if (c->type == O_NONE) {
                    node->ins.pc = *pc;
                    if(!a->nf && !a->zu)*s = encode_imul_reg_reg(machine_code, src, dest, sz);
                    else *s = encode_NDD_APX_reg_reg_reg(machine_code, 0xAF, 
                            dest,
                            0,
                            src,
                            EVEX_MAP_APX,
                            0,
                            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, a->zu);
                    
                    *pc += *s;

                }
                // imul reg, reg, imm
                else if (c->type == O_IMM) {
                    node->ins.pc = *pc;
                    if(!a->nf && !a->zu)*s = encode_imul_reg_reg_imm(machine_code, dest, src, c->imm, sz, c->type == O_EXPR);
                    else {
                        uint8_t opcode = c->imm > UINT8_MAX ? 0x69 : 0x6B;
                        *s = encode_NDD_APX_reg_reg_reg(machine_code,  opcode, 
                            dest,
                            0,
                            src,
                            EVEX_MAP_APX,
                            0,
                            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, a->zu);
                        
                        if(opcode == 0x69){*(uint32_t*)(machine_code + *s) = (uint32_t)c->imm; (*s) += 4;}
                        else{machine_code[*s] = (uint8_t)c->imm; (*s)++;}
                    }
                    *pc += *s;
                }

                // imul reg, reg, reg
                else if((c->type == O_REG64 || c->type == O_REG32 ||
                    c->type == O_REG16 || c->type == O_REG8)){
                    int src2 = reg_index(c);
                    node->ins.pc = *pc;
                    *s = encode_NDD_APX_reg_reg_reg(machine_code, 0xAF, 
                        src,
                        dest,
                        src2,
                        EVEX_MAP_APX,
                        0,
                        sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 1);
                    *pc += *s;
                
                }
            }

            // imul reg, imm
            else if (c->type == O_NONE) {
                node->ins.pc = *pc;
                if(!a->nf && !a->zu)*s = encode_imul_reg_reg_imm(machine_code, dest, dest, b->imm, sz, b->type == O_EXPR);
                else{
                    uint8_t opcode = c->imm > UINT8_MAX ? 0x69 : 0x6B;
                    *s = encode_NDD_APX_reg_reg_reg(machine_code,  opcode, 
                        dest,
                        0,
                        dest,
                        EVEX_MAP_APX,
                        0,
                        sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, a->zu);   
                    if(opcode == 0x69){*(uint32_t*)(machine_code + *s) = (uint32_t)b->imm; (*s) += 4;}
                    else{machine_code[*s] = (uint8_t)b->imm; (*s)++;}
                }
                *pc += *s;
            }
        }
    }

    // DIV / IDIV
    else if (!strcmp(cmd, "div") || !strcmp(cmd, "idiv")) {

        static const Group3Insn div_table[] = {
            {"div", 6},
            {"idiv", 7},
        };

        const Group3Insn *insn = &div_table[find_ins_idx(cmd, sizeof(div_table) / sizeof(div_table[0]), div_table)];

        if ((a->type == O_REG64 || a->type == O_REG32 ||
            a->type == O_REG16 || a->type == O_REG8) && b->type == O_NONE) {

            int reg = reg_index(a);
            int sz = operand_bits(a);

            node->ins.pc = *pc;
            if(!a->nf)*s = encode_div_or_idiv_reg(machine_code, insn->group, reg, sz);
            else{*s = encode_NDD_APX_reg_reg_reg(machine_code, sz == 8 ? 0xf6 : 0xf7, 
                    insn->group,
                    0,
                    reg,
                    EVEX_MAP_APX,
                    0,
                    sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 0);}
            *pc += *s;
        }

        else if(a->type == O_MEM && b->type == O_NONE){
            AddrExpr *mem = &a->addr;

            uint8_t sz = node->ins.operands[1].imm_sz * 8;
            if(!sz) goto error;
            
            node->ins.pc = *pc;
            
            if(!a->nf)*s = encode_inst_rm_rm(machine_code, insn->group, mem, sz, sz == 8 ? 0xF6 : 0xf7, 111, 0);
            else{ *s = encode_NDD_APX_reg_reg_rm(machine_code, sz == 8 ? 0xF6 : 0xf7, 
                insn->group,
                0,
                mem,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64 /* bytes */, a->nf , EVEX_Z0, 0);
            }
            *pc += *s;
            
        }
    }



   
    // Group 4 instructions: inc, dec (r/m8)
    else if ((!strcmp(node->cmd, "inc") && (a->type == O_REG8 || node->ins.operands[1].imm_sz == 1)) ||
             (!strcmp(node->cmd, "dec") && (a->type == O_REG8 || node->ins.operands[1].imm_sz == 1))) {

        uint8_t group_digit;

        if (strcmp(node->cmd, "inc") == 0) group_digit = 0;
        else group_digit = 1;

        if (a->type == O_REG8 && b->type == O_NONE) {
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            if(b->type == O_NONE && !a->nf)*s = encode_group4_reg(machine_code, reg, 0xFE, group_digit, 8);
            else{*s = encode_NDD_APX_reg_reg_reg(machine_code, 0xfe, 
                    group_digit,
                    (b->type == O_NONE) ? reg : 0,
                    (b->type == O_NONE) ? 0 : reg_index(b),
                    EVEX_MAP_APX,
                    0,
                    EVEX_PP_NONE , 0, a->nf , 0, b->type != O_NONE);}
            *pc += *s;
        }
        else if (a->type == O_MEM && b->type == O_NONE) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
        
            if(!a->nf)*s = encode_inst_rm_rm( machine_code, group_digit, mem, 8, 0xFE, 111, 0);
            else{ *s = encode_NDD_APX_reg_reg_rm(machine_code, 0xFE , 
                group_digit,
                0,
                mem,
                EVEX_MAP_APX,
                0,
                EVEX_PP_NONE , -0, a->nf , EVEX_Z0, 0);   
            }
            *pc += *s;
        }
    }

    // Group 5 instructions: inc, dec
    else if (strcmp(node->cmd, "inc") == 0 ||
            strcmp(node->cmd, "dec") == 0) {

        // also push, jmp, call implemented below

        uint8_t group_digit = (strcmp(node->cmd, "inc") == 0) ? 0 : 1;


        if((a->type == O_REG16 && (b->type == O_REG16 || b->type == O_NONE)) || 
           (a->type == O_REG32 && (b->type == O_REG32 || b->type == O_NONE)) ||
           (a->type == O_REG64 && (b->type == O_REG64 || b->type == O_NONE))){
            node->ins.pc = *pc;
            uint8_t reg = reg_index(a);
            uint8_t sz = operand_bits(a);

            if(b->type == O_NONE && !a->nf)*s = encode_group5_reg(machine_code, reg, 0xFF, group_digit, sz);
            else{*s = encode_NDD_APX_reg_reg_reg(machine_code, 0xff, 
                    group_digit,
                    (b->type == O_NONE) ? 0 : reg,
                    (b->type == O_NONE) ? reg : reg_index(b),
                    EVEX_MAP_APX,
                    0,
                    sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, b->type != O_NONE);}

            *pc += *s;
        }

        else if (a->type == O_MEM) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;

            uint8_t sz = node->ins.operands[1].imm_sz * 8;

            if(!a->nf)*s = encode_inst_rm_rm(machine_code, group_digit, mem, sz, 0xFF, 111, 0);
            else{ *s = encode_NDD_APX_reg_reg_rm(machine_code, 0xFF, 
                group_digit,
                0,
                mem,
                EVEX_MAP_APX,
                0,
                sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64 /* bytes */, a->nf , EVEX_Z0, 0);
            }
            

            *pc += *s;
        }
    }

    // push reg into stack
    else if(!strcmp(cmd, "push")){
        // ==============
        // push reg
        // ==============
        if (a->type == O_REG8 || a->type == O_REG16 ||
            a->type == O_REG32 || a->type == O_REG64) {

            node->ins.pc = *pc;

            uint8_t reg = reg_index(a);
            *s = encode_push_reg(machine_code, reg, operand_bits(a));

            *pc += *s;
        }

        else if(a->type == O_MEM){
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            switch(node->ins.operands[1].imm_sz){
                case 2:
                    *s = encode_inst_rm_rm(machine_code, 6, mem, 16, 0xFF, 111, 0);
                    break;
                case 8:
                    *s = encode_inst_rm_rm(machine_code, 6, mem, 64, 0xFF, 111, 0);
                    break;

                default:
                    fprintf(stderr, "AmmAsm:%d: invalid operand size for push\n", node->line);
                    exit(1);
                    break; // lol
            }

            *pc += *s;
        }
    }


    // pop reg from stack
    else if(!strcmp(cmd, "pop")){
        // ==============
        // pop reg
        // ==============

        if (a->type == O_REG8 || a->type == O_REG16 ||
            a->type == O_REG32 || a->type == O_REG64) {

            node->ins.pc = *pc;

            uint8_t reg = reg_index(a);
            *s = encode_pop_reg(machine_code, reg, operand_bits(a));

            *pc += *s;
        }
        
    }


    // APX
    else if(!strcmp(cmd, "push2") || !strcmp(cmd, "push2p") ||
            !strcmp(cmd, "pop2")  || !strcmp(cmd, "pop2p")){
        
        uint8_t W;
        uint8_t opcode; 
        uint8_t digit_group;
        /* I hate table >:( */
        if(!strcmp(cmd, "push2")){W=0; opcode=0xFF; digit_group=6;}
        if(!strcmp(cmd, "push2p")){W=1; opcode=0xFF; digit_group=6;}
        if(!strcmp(cmd, "pop2")){W=0; opcode=0x8F; digit_group=0;}
        if(!strcmp(cmd, "pop2p")){W=1; opcode=0x8F; digit_group=0;}

        if(a->type == O_REG64 && b->type == O_REG64 && c->type == O_NONE){
            node->ins.pc = *pc;

            uint8_t b64 = find_reg64_index(a->reg);
            uint8_t v64 = find_reg64_index(b->reg);
            /* NASM skips this checks, LOL. */
            if((b64 == 4 || v64 == 4)) goto error; // rsp
            if((!strcmp(cmd, "pop2") || !strcmp(cmd, "pop2p")) && b64 == v64) goto error;

            *s = encode_push2_pop2_P_b64_v64(machine_code, opcode, b64, v64, digit_group, W);
            *pc += *s;
        }
    }
    

    // legacy code
    else if(!strcmp(cmd, "jmp") || !strcmp(cmd, "call")) {
        if(b->type != O_NONE) goto error;
        uint8_t group_digit = !strcmp(cmd, "jmp") ? 4 : 2;

        // =========================
        // JMP/CALL label (REL32)
        // =========================
        if(a->type == O_EXPR || a->type == O_PC) { 
            uint8_t opcode = (!strcmp(cmd, "jmp")) ? 0xE9 : 0xE8;

            machine_code[0] = opcode;
            *(uint32_t*)(machine_code + 1) = 0x0;
        
            node->ins.pc = *pc;
            *s = 5;
            *pc += 5;
            
        }
        
        else if(a->type == O_REG64) {
            uint8_t rex2 = 0xD5;
            uint8_t rex = 0;
            uint8_t is_apx = 0;
            uint8_t opcode = 0xFF;
            uint8_t modrm;
            uint8_t pos = 0;
            
            int reg_idx = find_reg64_index(node->ins.operands[0].reg);
            if((reg_idx >> 3) & 1) rex |= REX_BASE | REX_B;
            if((reg_idx >> 4) & 1) {
                if(CHECK_REX_BASE(rex)) rex = CLEAR_REX_BASE(rex);
                rex |= REX2_B4; is_apx = 1;
            }
            if(!strcmp(node->cmd, "jmp"))  modrm = emit_modrm(0b11, group_digit, reg_idx); // FF /4
            else modrm = emit_modrm(0b11, group_digit, reg_idx);  // FF /2
            
            
            if(is_apx){
                node->machine_code[pos++] = rex2;
                node->machine_code[pos++] = rex;
            }
            else
                if(rex)node->machine_code[pos++] = rex;
            
            node->machine_code[pos++] = opcode;
            node->machine_code[pos++] = modrm;
            
            node->ins.pc = *pc;
            *s = pos;
            *pc += *s;
            
        }

        else if(a->type == O_MEM){
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            switch(node->ins.operands[1].imm_sz){
                case 1:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8, 0xFF, 111, 0);
                    break;

                case 2:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0xFF, 111, 0);
                    break;

                case 4:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0xFF, 111, 0);
                    break;

                case 8:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0xFF, 111, 0);
                    break;

            }

            *pc += *s;
        }
        
    }

    // JMPABS64(APX)
    else if(!strcmp(cmd, "jmpabs")){
        if(a->type == O_EXPR && b->type == O_NONE){
            node->ins.pc = *pc;
            uint8_t rex2 = 0xD5;
            uint8_t rex = 0;
            uint8_t opcode = 0xA1;
            int pos = 0;

            machine_code[pos++] = rex2;
            machine_code[pos++] = rex;
            machine_code[pos++] = opcode;
            *(uint64_t*)(machine_code + pos) = 0x0; // placeholder
            *s = 11;
            *pc += *s;
        }

        // in future version I might add `jmpabs imm64` but I'm too lazy
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

    else if (is2arrin(JCC, JCC_COUNT, node->cmd)) {
        if(b->type != O_NONE) goto error;

        int pos = 0;
        uint8_t opcode2 = 0;

        if (!strcmp(node->cmd, "je") || !strcmp(node->cmd, "jz"))        opcode2 = 0x84;
        else if (!strcmp(node->cmd, "jne") || !strcmp(node->cmd, "jnz")) opcode2 = 0x85;
        else if (!strcmp(node->cmd, "jl"))  opcode2 = 0x8C;
        else if (!strcmp(node->cmd, "jge")) opcode2 = 0x8D;
        else if (!strcmp(node->cmd, "jle")) opcode2 = 0x8E; 
        else if (!strcmp(node->cmd, "jg"))  opcode2 = 0x8F;
        else if (!strcmp(node->cmd, "jb") || !strcmp(node->cmd, "jc"))   opcode2 = 0x82;    
        else if (!strcmp(node->cmd, "ja"))  opcode2 = 0x87;
        else if (!strcmp(node->cmd, "jae"))  opcode2 = 0x83;
        else if (!strcmp(node->cmd, "jbe"))  opcode2 = 0x86;

        node->machine_code[pos++] = 0x0F;
        node->machine_code[pos++] = opcode2;
        *(uint32_t*)(machine_code + pos) = 0x0; // rel32
        pos += 4;

        node->ins.pc = *pc;
        *pc += pos;
        *s = pos;
        
    }


    else if (!strcmp(cmd, "movzx") || !strcmp(cmd, "movsx")) {
        uint8_t opcode = !strcmp(cmd, "movzx") ? 0xB6 : 0xBE;

        if ((b->type == O_REG8  && a->type >= O_REG16) ||
            (b->type == O_REG16 && a->type >= O_REG32)) {

            uint8_t dest = reg_index(a);
            uint8_t src  = reg_index(b);
            uint8_t sz   = operand_bits(a);

            if (b->type == O_REG16)opcode++;

            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code, opcode, dest, src, sz, 0);
            *pc += *s;
            
        }

        else if ((a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&
                b->type == O_MEM) {

            uint8_t src_sz = b->imm_sz;

            if ((src_sz == 1 && a->type >= O_REG16) ||
                (src_sz == 2 && a->type >= O_REG32)) {

                uint8_t dest = reg_index(a);
                uint8_t sz   = operand_bits(a);


                node->ins.pc = *pc;
                *s = encode_inst_reg_rm2(machine_code, opcode, dest, &b->addr, sz, 0);
                *pc += *s;
            }
        }
    } 

    // bsf, bsr
    else if (!strcmp(cmd, "bsf") || !strcmp(cmd, "bsr")) {
        uint8_t opcode = !strcmp(cmd, "bsf") ? 0xBC : 0xBD;

        if ((a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&
            b->type == a->type) {

            uint8_t dest = reg_index(a);
            uint8_t src  = reg_index(b);
            uint8_t sz   = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code, opcode, dest, src, sz, 0);
            *pc += *s;
        }

        else if ((a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&
                b->type == O_MEM &&
                b->imm_sz == operand_bits(a) / 8) {

            uint8_t dest = reg_index(a);
            uint8_t sz   = operand_bits(a);

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode, dest, &b->addr, sz, 0);
            *pc += *s;
        }
    }

    // cmovcc
    else if (!strncasecmp(cmd, "cmov", 4)) {
        
        static const CmovccInsn movcc_table[] = {
            {"cmova",   0x47},
            {"cmovae",  0x43},
            {"cmovb",   0x42},
            {"cmovbe",  0x46},
            {"cmovc",   0x42},
            {"cmove",   0x44},
            {"cmovg",   0x4F},
            {"cmovge",  0x4D},
            {"cmovl",   0x4C},
            {"cmovle",  0x4E},
            {"cmovna",  0x46},
            {"cmovnae", 0x42},
            {"cmovnb",  0x43},
            {"cmovnbe", 0x47},
            {"cmovnc",  0x43},
            {"cmovne",  0x45},
            {"cmovng",  0x4E},
            {"cmovnge", 0x4C},
            {"cmovnl",  0x4D},
            {"cmovnle", 0x4F},
            {"cmovno",  0x41},
            {"cmovnp",  0x4B},
            {"cmovns", 0x49},
            {"cmovnz", 0x45},
            {"cmovo",   0x40},
            {"cmovp",   0x4A},
            {"cmovpe",  0x4A},
            {"cmovpo",  0x4B},
            {"cmovs",   0x48},
            {"cmovz",   0x44},
        };

        const CmovccInsn *insn = &movcc_table[find_ins_idx( cmd, sizeof(movcc_table) / sizeof(movcc_table[0]), movcc_table)];


        uint8_t bits = operand_bits(a);
        uint8_t dest = reg_index(a);

        // reg, reg
        if ((a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&
            a->type == b->type && c->type == O_NONE) {

            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg( machine_code, insn->opcode, dest, reg_index(b), bits, 0);
            *pc += *s;
        }

        // reg, mem
        else if ((a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&
                b->type == O_MEM && c->type == O_NONE) {

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2( machine_code, insn->opcode, dest, &b->addr, bits, 0);
            *pc += *s;
        }

        // reg, reg, reg   
        else if((a->type == O_REG16 || a->type == O_REG32 || a->type == O_REG64) &&
            a->type == b->type && b->type == c->type){
            // cmovz rax, rbx, rcx == rax = (zf) ? rcx : rbx    
            node->ins.pc = *pc;
                *s = encode_NDD_APX_reg_reg_reg(machine_code, insn->opcode, 
                    reg_index(b),
                    dest,
                    reg_index(c),
                    EVEX_MAP_APX,
                    0,
                    bits == 16 ? EVEX_PP_66 : EVEX_PP_NONE , bits == 64, EVEX_K0, EVEX_Z0, 1);
                *pc += *s;
        }

        // reg, reg, mem
        // reg, mem, reg 
        else if((a->type == O_REG64 && b->type == O_REG64 && c->type == O_MEM) || 
                (a->type == O_REG32 && b->type == O_REG32 && c->type == O_MEM) || 
                (a->type == O_REG16 && b->type == O_REG16 && c->type == O_MEM) ||
                ((a->type == O_REG64 && b->type == O_MEM && c->type == O_REG64) || 
                (a->type == O_REG32 && b->type == O_MEM && c->type == O_REG32) || 
                (a->type == O_REG16 && b->type == O_MEM && c->type == O_REG16))
            ){

            /* 
                Opcode for `reg, mem, reg' does not exists. ;(
                So to eschew this limitation I inversed scc(condition) field by XORing it,
                and now you can write `cmove reg, mem, reg'

                Expamle:
                    input:
                       cmovb rax, [b=rcx, i=rdx], rax 
                       cmovb rax, rax, [b=rcx, i=rdx]
                    output(objdump):
                       cmovae rax,rax,QWORD PTR [rcx+rdx*1]
                       cmovb  rax,rax,QWORD PTR [rcx+rdx*1]

                NASM does not support this syntakic-sugar >:)
            */

            node->ins.pc = *pc;

            int dest = reg_index(a); // co-colled "ndd"
            int reg_src = b->type == O_MEM ? reg_index(c) : reg_index(b);
            AddrExpr *mem = b->type == O_MEM ? &b->addr : &c->addr;
             
            int sz = operand_bits(a);

            uint8_t opcode = insn->opcode;
            uint8_t inverse_opc = opcode ^ 1; // inversed condition

            *s = encode_NDD_APX_reg_reg_rm(machine_code, b->type == O_MEM ? inverse_opc : opcode, 
            reg_src,
            dest,
            mem,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, a->nf , EVEX_Z0, 1);
            
            *pc += *s;   
        }
    }

    // setcc
    else if (!strncasecmp(cmd, "set", 3)) {

        static const SetccInsn setcc_table[] = {
            {"seta",    0x97},
            {"setae",   0x93},
            {"setb",    0x92},
            {"setbe",   0x96},
            {"setc",    0x92},
            {"sete",    0x94},
            {"setg",    0x9F},
            {"setge",   0x9D},
            {"setl",    0x9C},
            {"setle",   0x9E},
            {"setna",   0x96},
            {"setnae",  0x92},
            {"setnb",   0x93},
            {"setnbe",  0x97},
            {"setnc",   0x93},
            {"setne",   0x95},
            {"setng",   0x9E},
            {"setnge",  0x9C},
            {"setnl",   0x9D},
            {"setnle",  0x9F},
            {"setno",   0x91},
            {"setnp",   0x9B},
            {"setns",   0x99},
            {"setnz",   0x95},
            {"seto",    0x90},
            {"setp",    0x9A},
            {"setpe",   0x9A},
            {"setpo",   0x9B},
            {"sets",    0x98},
            {"setz",    0x94},
        };
        const SetccInsn *insn = &setcc_table[find_ins_idx(cmd,sizeof(setcc_table) / sizeof(setcc_table[0]),setcc_table)];

        uint8_t opcode = insn->opcode;
        // reg8
        if (a->type == O_REG8 && b->type == O_NONE && !a->zu) {
            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code,opcode,0,find_reg8_index(a->reg),8,0);
            *pc += *s;
        }

        // mem8
        else if (a->type == O_MEM && b->type == O_NONE && !a->zu) {
            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code,opcode,0,&a->addr,8,0);
            *pc += *s;
        }

        // {zu} reg8
        else if(a->type == O_REG8 && b->type == O_NONE && a->zu){

            node->ins.pc = *pc;
                *s = encode_NDD_APX_reg_reg_reg(machine_code, opcode - 0x50 , // must be.
                    0,
                    0,
                    reg_index(a),
                    EVEX_MAP_APX,
                    0,
                    EVEX_PP_F2 , 0, EVEX_K0, 0, 1);
            *pc += *s;
        }

        // {zu} mem8
        else if(a->type == O_MEM && b->type == O_NONE && a->zu){
            node->ins.pc = *pc;
                *s = encode_NDD_APX_reg_reg_rm(machine_code, opcode - 0x50 , // must be.
                    0,
                    0,
                    &a->addr,
                    EVEX_MAP_APX,
                    0,
                    EVEX_PP_F2 , 0, EVEX_K0, 0, 1);
            *pc += *s;
        }
    }

    // APX CCMP/CTEST
    else if(!strncmp(cmd, "ccmp", 4) || !strncmp(cmd, "ctest", 4)){

        static const CCMPccInsn ccmp_table[] = {
            {"ccmpa",   0x07, 0x39, 0x3B},
            {"ccmpae",  0x03, 0x39, 0x3B},
            {"ccmpb",   0x02, 0x39, 0x3B},
            {"ccmpbe",  0x06, 0x39, 0x3B},
            {"ccmpe",   0x04, 0x39, 0x3B},
            {"ccmpf",   0x0B, 0x39, 0x3B},
            {"ccmpg",   0x0F, 0x39, 0x3B},
            {"ccmpge",  0x0D, 0x39, 0x3B},
            {"ccmpl",   0x0C, 0x39, 0x3B},
            {"ccmple",  0x0E, 0x39, 0x3B},
            {"ccmpne",  0x05, 0x39, 0x3B},
            {"ccmpno",  0x01, 0x39, 0x3B},
            {"ccmpns",  0x09, 0x39, 0x3B},
            {"ccmpo",   0x00, 0x39, 0x3B},
            {"ccmps",   0x08, 0x39, 0x3B},
            {"ccmpt",   0x0A, 0x39, 0x3B},
        };

        static const CTESTccInsn ctest_table[] = {
            {"ctesta",   0x07, 0x85, 0x86},
            {"ctestae",  0x03, 0x85, 0x86},
            {"ctestb",   0x02, 0x85, 0x86},
            {"ctestbe",  0x06, 0x85, 0x86},
            {"cteste",   0x04, 0x85, 0x86},
            {"ctestf",   0x0B, 0x85, 0x86},
            {"ctestg",   0x0F, 0x85, 0x86},
            {"ctestge",  0x0D, 0x85, 0x86},
            {"ctestl",   0x0C, 0x85, 0x86},
            {"ctestle",  0x0E, 0x85, 0x86},
            {"ctestne",  0x05, 0x85, 0x86},
            {"ctestno",  0x01, 0x85, 0x86},
            {"ctestns",  0x09, 0x85, 0x86},
            {"ctesto",   0x00, 0x85, 0x86},
            {"ctests",   0x08, 0x85, 0x86},
            {"ctestt",   0x0A, 0x85, 0x86},
        };

        uint8_t is_ccmp  = strncmp(cmd, "ccmp", 4) == 0; 
        uint8_t is_ctest = strncmp(cmd, "ctest", 5) == 0; 

        int idx; 
        if(is_ccmp)  idx = find_ins_idx(cmd,sizeof(ccmp_table) / sizeof(ccmp_table[0]),ccmp_table); // first seeking for CCMP
        if(is_ctest) idx = find_ins_idx(cmd,sizeof(ctest_table) / sizeof(ctest_table[0]),ctest_table); // then it is probly CTEST

        const void* insn;
        if(is_ccmp) insn = &ccmp_table[idx];
        if(is_ctest) insn = &ctest_table[idx];

        // makeing cast for ccmp because fields of ccmp and ctest are same(see struct.h)
        uint8_t reg_reg = ((const CCMPccInsn*)insn)->reg_reg; // same as mem_reg
        uint8_t mem_reg = reg_reg;
        uint8_t reg_mem = ((const CCMPccInsn*)insn)->reg_mem;
        uint8_t scc =     ((const CCMPccInsn*)insn)->scc;
        if(a->nf) goto error;


        // reg, reg
        if(((a->type == O_REG64 && b->type == O_REG64) || (a->type == O_REG32 && b->type == O_REG32) ||
           (a->type == O_REG16 && b->type == O_REG16) || (a->type == O_REG8 && b->type == O_REG8)) && c->type == O_NONE){

            uint8_t sz = operand_bits(a);
            uint8_t dest = reg_index(a);
            uint8_t src = reg_index(b);
            if(sz == 8)reg_reg--;

            node->ins.pc = *pc;
            *s = encode_CCMPcc_reg_reg(machine_code, reg_reg, // same function for ctest is also valid
            src,
            a->dfv,
            dest,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, scc , EVEX_Z0, 0);
            *pc += *s;
        }

        // reg, imm
        else if((a->type == O_REG64 || a->type == O_REG32 || a->type == O_REG16 || a->type == O_REG8) && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR) && c->type == O_NONE){
            int dest = reg_index(a);
            int src1 = reg_index(b);
            Operand* imm_op = b;
            uint8_t is_expr = IS_EXPR_OR_PC(*b);
            int sz = operand_bits(a);
            
            node->ins.pc = *pc;
            if(is_ccmp) *s = encode_CCMPcc_reg_imm(machine_code, 7, dest, a->dfv, sz, scc, imm_op->type == O_CHAR ? imm_op->c : imm_op->imm , is_expr);
            if(is_ctest) *s = encode_CTESTcc_reg_imm(machine_code, 0, dest, a->dfv, sz, scc, imm_op->type == O_CHAR ? imm_op->c : imm_op->imm , is_expr);
            *pc += *s;

        }

        // reg, mem
        // mem, reg
        else if((a->type == O_MEM && (b->type == O_REG64 || b->type == O_REG32 || b->type == O_REG16 || b->type == O_REG8) && c->type == O_NONE) ||
                (b->type == O_MEM && (a->type == O_REG64 || a->type == O_REG32 || a->type == O_REG16 || a->type == O_REG8) && c->type == O_NONE)){

            int reg = b->type == O_MEM ?  reg_index(a) : reg_index(b);
            AddrExpr *mem = b->type == O_MEM ? &b->addr : &a->addr;
             
            int sz = b->type == O_MEM ? operand_bits(a) : operand_bits(b);
            if(sz == 8){reg_mem--; mem_reg--;}
            uint8_t opcode = b->type == O_MEM ? reg_mem :mem_reg ;
            /* for ctest -> opcode for `mem, reg' and `reg, mem' are same.*/
            if(is_ctest) opcode = reg_reg; // nasm can't encode `ctest {dfv=} reg, mem' form, but aasm can!
            node->ins.pc = *pc;
            *s = encode_CCMPcc_reg_rm(machine_code, opcode, // same function for ctest is also valid
            reg,
            a->dfv,
            mem,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, scc , EVEX_Z0, 0);
            *pc += *s;
        }

        // mem, imm
        else if(a->type == O_MEM && IS_EXPR_OR_IMM_OR_PC(*b)){

            AddrExpr *mem = &a->addr;
             
            int sz = node->ins.operands[1].imm_sz * 8;

            node->ins.pc = *pc;
            if(is_ccmp)*s = encode_CCMPcc_mem_imm(machine_code, 7,  a->dfv, mem, EVEX_MAP_APX, 0, sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, scc , EVEX_Z0, 0, b->imm, b->type == O_EXPR, sz);
            if(is_ctest) *s = encode_CTESTcc_mem_imm(machine_code, 0, a->dfv, mem, EVEX_MAP_APX, 0, sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, scc , EVEX_Z0, 0, b->imm, b->type == O_EXPR, sz);
            *pc += *s;      
        }
    }

    // CFCMOV
    else if(!strncmp(cmd, "cfcmov", 6)){

        static const CmovccInsn cfcmovcc_table[] = {
            {"cfcmova",   0x47},
            {"cfcmovae",  0x43},
            {"cfcmovb",   0x42},
            {"cfcmovbe",  0x46},
            {"cfcmovc",   0x42},
            {"cfcmove",   0x44},
            {"cfcmovg",   0x4F},
            {"cfcmovge",  0x4D},
            {"cfcmovl",   0x4C},
            {"cfcmovle",  0x4E},
            {"cfcmovna",  0x46},
            {"cfcmovnae", 0x42},
            {"cfcmovnb",  0x43},
            {"cfcmovnbe", 0x47},
            {"cfcmovnc",  0x43},
            {"cfcmovne",  0x45},
            {"cfcmovng",  0x4E},
            {"cfcmovnge", 0x4C},
            {"cfcmovnl",  0x4D},
            {"cfcmovnle", 0x4F},
            {"cfcmovno",  0x41},
            {"cfcmovnp",  0x4B},
            {"cfcmovns",  0x49},
            {"cfcmovnz", 0x45},
            {"cfcmovo",   0x40},
            {"cfcmovp",   0x4A},
            {"cfcmovpe",  0x4A},
            {"cfcmovpo",  0x4B},
            {"cfcmovs",   0x48},
            {"cfcmovz",   0x44},
        };

        /*
            Encodes same as cmov, but EVEX.aaa = 0b100 and allways use EVEX.
            But if you remember, cmov does not have form `mem, reg`, cfcmov use this form by just EVEX.aaa = 0;
        */

        const CmovccInsn *insn = &cfcmovcc_table[find_ins_idx(cmd,sizeof(cfcmovcc_table) / sizeof(cfcmovcc_table[0]),cfcmovcc_table)];

        // reg, reg
        if(((a->type == O_REG16 && b->type == O_REG16) ||
           (a->type == O_REG32 && b->type == O_REG32) ||
           (a->type == O_REG64 && b->type == O_REG64)) && c->type == O_NONE){

            uint8_t bits = operand_bits(a);

            node->ins.pc = *pc;
                *s = encode_NDD_APX_reg_reg_reg(machine_code, insn->opcode, 
                    reg_index(a),
                    0,
                    reg_index(b),
                    EVEX_MAP_APX,
                    0,
                    bits == 16 ? EVEX_PP_66 : EVEX_PP_NONE , bits == 64, EVEX_K4, EVEX_Z0, 0);
            *pc += *s;
        }

        // reg, mem
        // mem, reg
        else if(((a->type == O_REG16 && b->type == O_MEM) ||
                 (a->type == O_REG32 && b->type == O_MEM) ||
                 (a->type == O_REG64 && b->type == O_MEM) ||    (a->type == O_MEM && b->type == O_REG16) ||
                                                                (a->type == O_MEM && b->type == O_REG32) ||
                                                                (a->type == O_MEM && b->type == O_REG64)) 
                 && c->type == O_NONE){

            node->ins.pc = *pc;

            int reg =       b->type == O_MEM ? reg_index(a) : reg_index(b);
            AddrExpr *mem = b->type == O_MEM ? &b->addr : &a->addr;
            int sz =        b->type == O_MEM ? operand_bits(a) : operand_bits(b);

            uint8_t opcode = insn->opcode;

            *s = encode_NDD_APX_reg_reg_rm(machine_code, opcode, 
            reg,
            0,
            mem,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, 
            b->type == O_MEM ? 0 : EVEX_K4, 
            EVEX_Z0, 0);
            
            *pc += *s;             

        }

        // reg, reg, reg
        else if((a->type == O_REG16 && b->type == O_REG16 && c->type == O_REG16) ||
                (a->type == O_REG32 && b->type == O_REG32 && c->type == O_REG32) ||
                (a->type == O_REG64 && b->type == O_REG64 && c->type == O_REG64)){
            uint8_t bits = operand_bits(a);

            node->ins.pc = *pc;
                *s = encode_NDD_APX_reg_reg_reg(machine_code, insn->opcode, 
                    reg_index(b),
                    reg_index(a),
                    reg_index(c),
                    EVEX_MAP_APX,
                    0,
                    bits == 16 ? EVEX_PP_66 : EVEX_PP_NONE , bits == 64, EVEX_K4, EVEX_Z0, 1);
            *pc += *s;
        }


        // reg, reg, mem
        // reg, mem, reg 
        else if((a->type == O_REG64 && b->type == O_REG64 && c->type == O_MEM) || 
                (a->type == O_REG32 && b->type == O_REG32 && c->type == O_MEM) || 
                (a->type == O_REG16 && b->type == O_REG16 && c->type == O_MEM) ||
                ((a->type == O_REG64 && b->type == O_MEM && c->type == O_REG64) || 
                (a->type == O_REG32 && b->type == O_MEM && c->type == O_REG32) || 
                (a->type == O_REG16 && b->type == O_MEM && c->type == O_REG16))
            ){

            /* 
                Opcode for `reg, mem, reg' does not exists. ;(
                So I did the same as in CMOVcc
            */

            node->ins.pc = *pc;

            int dest = reg_index(a); 
            int reg_src = b->type == O_MEM ? reg_index(c) : reg_index(b);
            AddrExpr *mem = b->type == O_MEM ? &b->addr : &c->addr;
             
            int sz = operand_bits(a);

            uint8_t opcode = insn->opcode;
            uint8_t inverse_opc = opcode ^ 1; // inversed condition

            *s = encode_NDD_APX_reg_reg_rm(machine_code, b->type == O_MEM ? inverse_opc : opcode, 
            reg_src,
            dest,
            mem,
            EVEX_MAP_APX,
            0,
            sz == 16 ? EVEX_PP_66 : EVEX_PP_NONE , sz == 64, EVEX_K4 , EVEX_Z0, 1);
            
            *pc += *s;   
        }
    }

    else if (is2arrin(Sign_extensions, Sign_extensions_COUNT, (char*)cmd)) {
        if (strcmp(cmd, "cqo") == 0) {machine_code[0] = 0x48;machine_code[1] = 0x99;*s = 2;}
        else if (strcmp(cmd, "cdq") == 0) {machine_code[0] = 0x99;*s = 1;}
        else if (strcmp(cmd, "cwd") == 0) {machine_code[0] = 0x66;machine_code[1] = 0x99;*s = 2;}
        else if (strcmp(cmd, "cdqe") == 0) {machine_code[0] = 0x48;machine_code[1] = 0x98;*s = 2;}
        else if (strcmp(cmd, "cwde") == 0) {machine_code[0] = 0x98;*s = 1;}
        else if (strcmp(cmd, "cbw") == 0) {machine_code[0] = 0x66;machine_code[1] = 0x98;*s = 2;}
        *pc += *s;
    }

    else if(is2arrin(zero_operand_instructions, zero_operand_instructions_COUNT, (char*)cmd)){
        if(a->type != O_NONE) goto error;

        if(!strcmp(node->cmd, "syscall")){  machine_code[0] = 0x0F; machine_code[1] = 0x05; *s = 2;}
        else if(!strcmp(cmd, "ret")){machine_code[0] = 0xC3;*s = 1;}
        else if(!strcmp(cmd, "nop")){machine_code[0] = 0x90; *s = 1;}
        else if (strcmp(cmd, "clc") == 0) {machine_code[0] = 0xF8;*s = 1;}
        else if (strcmp(cmd, "stc") == 0) {machine_code[0] = 0xF9;*s = 1;}
        else if (strcmp(cmd, "cmc") == 0) {machine_code[0] = 0xF5;*s = 1;}
        else if (strcmp(cmd, "cld") == 0) {machine_code[0] = 0xFC;*s = 1;}
        else if (strcmp(cmd, "std") == 0) {machine_code[0] = 0xFD;*s = 1;}
        else if (strcmp(cmd, "cli") == 0) {machine_code[0] = 0xFA;*s = 1;}
        else if (strcmp(cmd, "sti") == 0) {machine_code[0] = 0xFB;*s = 1;}
        else if (strcmp(cmd, "lahf") == 0) {machine_code[0] = 0x9F;*s = 1;}
        else if (strcmp(cmd, "sahf") == 0) {machine_code[0] = 0x9E;*s = 1;}
        else if (strcmp(cmd, "pushf") == 0 || strcmp(cmd, "pushfq") == 0) {machine_code[0] = 0x9C;*s = 1;}
        else if (strcmp(cmd, "popf") == 0 || strcmp(cmd, "popfq") == 0) {machine_code[0] = 0x9D;*s = 1;}
        else if (strcmp(cmd, "leave") == 0) {machine_code[0] = 0xC9;*s = 1;}
        else if (strcmp(cmd, "iret") == 0 || strcmp(cmd, "iretq") == 0) {machine_code[0] = 0xCF;*s = 1;}
        else if (strcmp(cmd, "cpuid") == 0) {machine_code[0] = 0x0F;machine_code[1] = 0xA2;*s = 2;}
        else if (strcmp(cmd, "hlt") == 0) {machine_code[0] = 0xF4;*s = 1;}
        else if (strcmp(cmd, "wait") == 0 || strcmp(cmd, "fwait") == 0) {machine_code[0] = 0x9B;*s = 1;}
        else if (strcmp(cmd, "pause") == 0) {machine_code[0] = 0xF3;machine_code[1] = 0x90;*s = 2;}
        else if (strcmp(cmd, "ud2") == 0) {machine_code[0] = 0x0F;machine_code[1] = 0x0B;*s = 2;}
        else if (strcmp(cmd, "lfence") == 0){machine_code[0] = 0x0F; machine_code[1] = 0xAE; machine_code[2] = 0xE8;*s = 3;}
        else if (strcmp(cmd, "rdtscp") == 0){machine_code[0] = 0x0F; machine_code[1] = 0x01; machine_code[2] = 0xF9;*s = 3;}
        else if (strcmp(cmd, "rdtsc") == 0) {machine_code[0] = 0x0F;machine_code[1] = 0x31;*s = 2;}
        else if (strcmp(cmd, "endbr64") == 0){machine_code[0] = 0xF3; machine_code[1] = 0x0F; machine_code[2] = 0x1E; machine_code[3] = 0xFA; *s = 4;}
        else if (!strcmp(cmd, "rdpru")){
            if (!rdpru_defined) {fprintf(stderr,"AmmAsm:%d: Warn: program uses RDPRU but current CPU doesn't support it (might give #UD)\n", node->line);}
            machine_code[0] = 0x0F; machine_code[1] = 0x01; machine_code[2] = 0xFD;*s = 3;
        }
        *pc += *s;
    }


    else if(!strcmp(cmd, "lea")){
        if (a->type == O_REG64 && b->type == O_MEM) {
            uint8_t reg = find_reg64_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x8D, 0, 0);
            *pc += *s;
        }
        
    }


    else if (!strcmp("xchg", cmd)) {

        uint8_t size = 0;
        uint8_t opcode = 0;

        if (a->type == O_REG64 && b->type == O_REG64) { size = 64; opcode = 0x87;}
        else if (a->type == O_REG32 && b->type == O_REG32) { size = 32; opcode = 0x87;}
        else if (a->type == O_REG16 && b->type == O_REG16) {size = 16;opcode = 0x87;}
        else if (a->type == O_REG8 && b->type == O_REG8) {size = 8;opcode = 0x86;}

        /* reg, reg */
        if (size) {
            uint8_t rm = reg_index(a);
            uint8_t reg = reg_index(b);

            node->ins.pc = *pc;
            *s = encode_xchg_reg_reg(machine_code, rm, reg, size);
            *pc += *s;
        }

        /* reg, mem / mem, reg */
        else if ((a->type == O_REG64 && b->type == O_MEM) ||
                (a->type == O_MEM && b->type == O_REG64) ||
                (a->type == O_REG32 && b->type == O_MEM) ||
                (a->type == O_MEM && b->type == O_REG32) ||
                (a->type == O_REG16 && b->type == O_MEM) ||
                (a->type == O_MEM && b->type == O_REG16) ||
                (a->type == O_REG8  && b->type == O_MEM) ||
                (a->type == O_MEM && b->type == O_REG8)) {

            int reg_is_a = (a->type != O_MEM);
            Operand *r = reg_is_a ? a : b;
            Operand *m = reg_is_a ? b : a;

            uint8_t opcode = 0x87;

            size = operand_bits(r);
            if(size == 8) opcode --; 

            uint8_t reg = reg_index(r);

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm( machine_code, reg, &m->addr, size, opcode, 0, 0);
            *pc += *s;
        }
    }


    // SSE XMM register instructions
    else if (!strcmp(cmd, "movaps") ||
        !strcmp(cmd, "movups") ||
        !strcmp(cmd, "xorps")  ||
        !strcmp(cmd, "andps")  ||
        !strcmp(cmd, "andnps") ||
        !strcmp(cmd, "orps")   ||
        !strcmp(cmd, "addps")  ||
        !strcmp(cmd, "subps")  ||
        !strcmp(cmd, "mulps")  ||
        !strcmp(cmd, "divps")) {

        if(!sse_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses SSE, but current CPU does't support it(might give #UD)\n", node->line);}

        static const SseInsn sse_table[] = {
            {"addps",  0x58},
            {"andnps", 0x55},
            {"andps",  0x54},
            {"divps",  0x5E},
            {"movaps", 0x28},
            {"movups", 0x10},
            {"mulps",  0x59},
            {"orps",   0x56},
            {"subps",  0x5C},
            {"xorps",  0x57},

        };

        int sse_idx = find_ins_idx(cmd, (sizeof(sse_table) / sizeof(sse_table[0])), sse_table);


        if (!sse_defined) {fprintf(stderr,"AmmAsm:%d: Warn: program uses SSE, but current CPU doesn't support it (might give #UD)\n", node->line);}

        uint8_t opcode = sse_table[sse_idx].opcode;

        // XMM, XMM
        if (a->type == O_XMM && b->type == O_XMM) {
            node->ins.pc = *pc;

            *s = encode_two_byte_opcode_reg( machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), 128, 0);

            *pc += *s;
        }


        // xmm, [mem]
        else if (a->type == O_XMM && b->type == O_MEM) {
            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2( machine_code, opcode, find_xmm_index(a->reg), &b->addr, 128, 0);
            *pc += *s;
        }


        // [mem], xmm
        else if (!strcasecmp(cmd, "movaps") || !strcasecmp(cmd, "movups")) {
            if (a->type == O_MEM && b->type == O_XMM) {
                node->ins.pc = *pc;
                *s = encode_inst_reg_rm2( machine_code, opcode + 1, find_xmm_index(b->reg), &a->addr, 128, 0);
                *pc += *s;
            }
        }
    }
    


    // SSE2 XMM register instructions (old version)
    else if ((!strcmp("movdqa", cmd) || !strcmp("movdqu", cmd)) || !strcmp("movq", cmd) || cmd[0] == 'p'){
        uint8_t opcode = 0;
        uint8_t prefix = 0x66;
        uint8_t group_digit = 0;

        if      (!strcmp(cmd, "movdqa"))  opcode = 0x6F;
        else if (!strcmp(cmd, "movdqu"))  { opcode = 0x6F; prefix = 0xF3; }

        else if (!strcmp(cmd, "paddb"))   opcode = 0xFC;
        else if (!strcmp(cmd, "paddw"))   opcode = 0xFD;
        else if (!strcmp(cmd, "paddd"))   opcode = 0xFE;

        else if (!strcmp(cmd, "psubb"))   opcode = 0xF8;
        else if (!strcmp(cmd, "psubw"))   opcode = 0xF9;
        else if (!strcmp(cmd, "psubd"))   opcode = 0xFA;

        else if (!strcmp(cmd, "pand"))    opcode = 0xDB;
        else if (!strcmp(cmd, "pandn"))   opcode = 0xDF;
        else if (!strcmp(cmd, "por"))     opcode = 0xEB;
        else if (!strcmp(cmd, "pxor"))    opcode = 0xEF;

        else if (!strcmp(cmd, "pcmpeqb")) opcode = 0x74;
        else if (!strcmp(cmd, "pcmpeqw")) opcode = 0x75;
        else if (!strcmp(cmd, "pcmpeqd")) opcode = 0x76;

        else if (!strcmp(cmd, "pcmpgtb")) opcode = 0x64;
        else if (!strcmp(cmd, "pcmpgtw")) opcode = 0x65;
        else if (!strcmp(cmd, "pcmpgtd")) opcode = 0x66;
        else if (!strcmp(cmd, "punpcklbw")) opcode = 0x60;
        
        else if (!strcmp(cmd, "punpcklwd")) opcode = 0x61;
        else if (!strcmp(cmd, "punpckldq")) opcode = 0x62;
        else if (!strcmp(cmd, "punpcklqdq"))opcode = 0x6C;

        else if (!strcmp(cmd, "punpckhbw")) opcode = 0x68;
        else if (!strcmp(cmd, "punpckhwd")) opcode = 0x69;
        else if (!strcmp(cmd, "punpckhdq")) opcode = 0x6A;
        else if (!strcmp(cmd, "punpckhqdq"))opcode = 0x6D;

        else if (!strcmp(cmd, "packsswb"))  opcode = 0x63;
        else if (!strcmp(cmd, "packuswb"))  opcode = 0x67;
        else if (!strcmp(cmd, "packssdw"))  opcode = 0x6B;

        else if (!strcmp(cmd, "pmaxub"))    opcode = 0xDE;
        else if (!strcmp(cmd, "pminub"))    opcode = 0xDA;
        else if (!strcmp(cmd, "pmaxsw"))    opcode = 0xEE;
        else if (!strcmp(cmd, "pminsw"))    opcode = 0xEA;

        else if (!strcmp(cmd, "psllw"))     {opcode = 0xF1; group_digit = 6;}
        else if (!strcmp(cmd, "pslld"))     {opcode = 0xF2; group_digit = 6;}
        else if (!strcmp(cmd, "psllq"))     {opcode = 0xF3; group_digit = 6;}

        else if (!strcmp(cmd, "psrlw"))     {opcode = 0xD1; group_digit = 2;}
        else if (!strcmp(cmd, "psrld"))     {opcode = 0xD2; group_digit = 2;}
        else if (!strcmp(cmd, "psrlq"))     {opcode = 0xD3; group_digit = 2;}

        else if (!strcmp(cmd, "pslldq")) group_digit = 7;
        else if (!strcmp(cmd, "psrldq")) group_digit = 3;

        else if (!strcmp(cmd, "pmovmskb"))  opcode = 0xD7;
        else if (!strcmp(cmd, "psraw"))     {opcode = 0xE1; group_digit = 4;}
        else if (!strcmp(cmd, "psrad"))     {opcode = 0xE2; group_digit = 4;}

        if(!sse2_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses SSE2, but current CPU does't support it(might give #UD)\n", node->line);}

        // pmovmskb r32, xmm
        if (!strcmp(cmd, "pmovmskb")) {

            if (a->type == O_REG32 && b->type == O_XMM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_two_byte_opcode_reg( machine_code, 0xD7, find_reg32_index(a->reg), find_xmm_index(b->reg),     32, 0x66);
                *pc += *s;
            }
        }

        // movdqa / movdqu
        else if (!strcmp(cmd, "movdqa") ||
                !strcmp(cmd, "movdqu")) {

            // xmm, xmm
            if (a->type == O_XMM && b->type == O_XMM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_two_byte_opcode_reg( machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), 128, prefix);
                *pc += *s;
            }

            // xmm, [mem]
            else if (a->type == O_XMM && b->type == O_MEM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_inst_reg_rm2( machine_code, opcode, find_xmm_index(a->reg), &b->addr, 128, prefix);
                *pc += *s;
            }

            // [mem], xmm
            else if (a->type == O_MEM && b->type == O_XMM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_inst_reg_rm2( machine_code, opcode + 0x10, find_xmm_index(b->reg), &a->addr, 128, prefix);
                *pc += *s;
            }
        }

        // xmm, imm8 (group 12)
        else if((!strcmp(cmd, "psrlw") || !strcmp(cmd, "psraw") || 
                 !strcmp(cmd, "psllw")) && b->type == O_IMM && c->type == O_NONE){
            
            // pack you intel, what is this? I done, I switch to ARM!
            node->ins.pc = *pc;
            *s = encode_group12_xmm_imm(machine_code, find_xmm_index(a->reg), b->imm, group_digit);
            *pc += *s;
        }

        // xmm, imm8 (group 13)
        else if((!strcmp(cmd, "psrld") || !strcmp(cmd, "psrad") || 
                 !strcmp(cmd, "pslld")) && b->type == O_IMM && c->type == O_NONE){
            
            // pack you intel, what is this? I done, I switch to ARM!
            node->ins.pc = *pc;
            *s = encode_group13_xmm_imm(machine_code, find_xmm_index(a->reg), b->imm, group_digit);
            *pc += *s;
        }

        // xmm, imm8 (group 14)
        else if((!strcmp(cmd, "psrlq") || !strcmp(cmd, "psrldq") || 
                 !strcmp(cmd, "psllq") || !strcmp(cmd, "pslldq")) && b->type == O_IMM && c->type == O_NONE){
            
            // pack you intel, what is this? I done, I switch to ARM!
            node->ins.pc = *pc;
            *s = encode_group14_xmm_imm(machine_code, find_xmm_index(a->reg), b->imm, group_digit);
            *pc += *s;
        }

        // xmm, xmm
        else if (a->type == O_XMM && b->type == O_XMM && c->type == O_NONE) {
            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg( machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), 128, prefix);
            *pc += *s;
        }

        // xmm, [mem]
        else if (a->type == O_XMM && b->type == O_MEM && c->type == O_NONE) {

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2( machine_code, opcode, find_xmm_index(a->reg), &b->addr, 128, prefix);
            *pc += *s;
        }

        else if (!strcmp(cmd, "movq")) {

            // xmm, xmm
            if (a->type == O_XMM && b->type == O_XMM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_two_byte_opcode_reg(machine_code, 0x7E, find_xmm_index(a->reg), find_xmm_index(b->reg), 128, 0xF3);
                *pc += *s;
            }

            // xmm, [mem]
            if (a->type == O_XMM && b->type == O_MEM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_inst_reg_rm2(machine_code, 0x7E, find_xmm_index(a->reg), &b->addr, 128, 0xF3);
                *pc += *s;
            }

            // [mem], xmm
            if (a->type == O_MEM && b->type == O_XMM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_inst_reg_rm2(machine_code, 0xD6, find_xmm_index(b->reg), &a->addr, 128, 0x66);
                *pc += *s;
            }

            // xmm, r64
            if (a->type == O_XMM && b->type == O_REG64 && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_xmm_or_r64__xmm_or_r64(machine_code, find_xmm_index(a->reg), find_reg64_index(b->reg), 0);
                *pc += *s;
            }

            // r64, xmm
            if (a->type == O_REG64 && b->type == O_XMM && c->type == O_NONE) {
                node->ins.pc = *pc;
                *s = encode_xmm_or_r64__xmm_or_r64(machine_code, find_reg64_index(a->reg), find_xmm_index(b->reg), 1);
                *pc += *s;
            }
        }

    }



    // весь ад здесь
    // AVX1 / AVX2 / AVX-512 / AVX10.1 (Refactored version)
    else if(cmd[0] == 'v') {
        
        if(!avx2_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX2, but current CPU does't support it(might give #UD)\n", node->line);}
        if(!avx_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX, but current CPU does't support it(might give #UD)\n", node->line);}

        static const AvxInsn avx_table[] = {
            {"vaddpd",  0x58, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = ER},
            {"vaddps",  0x58, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = ER},
            {"vaddsd",  0x58, VEX_PP_F2,  VEX_MAP_0F, VEX_PP_F2,  VEX_MAP_0F, 3, 1, TUPLE_T1,   0, 0, FORM_RRR | FORM_RRM,              FORM_SCALAR, ER},
            {"vaddss",  0x58, VEX_PP_F3,  VEX_MAP_0F, VEX_PP_F3,  VEX_MAP_0F, 3, 0, TUPLE_T1,   0, 0, FORM_RRR | FORM_RRM32 | FORM_RRM, FORM_SCALAR, ER},
            {"vandpd",  0x54, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vandps",  0x54, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vbcstnebf162ps", 0xB1, VEX_PP_F3, VEX_MAP_0F38, 0, 0, 2, 0, 0, 0, 1, FORM_RM16, .sae = NO_DECORATOR},
            {"vbcstnebf16ps",  0xB1, VEX_PP_F3, VEX_MAP_0F38, 0, 0, 2, 0, 0, 0, 1, FORM_RM16, .sae = NO_DECORATOR},
            {"vbcstnesh2ps",   0xB1, VEX_PP_66, VEX_MAP_0F38, 0, 0, 2, 0, 0, 0, 1, FORM_RM16, .sae = NO_DECORATOR},
            {"vcvtdq2ps",  0x5B, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 2, 0, TUPLE_HALF, 0, 0, FORM_RR | FORM_RM, .sae = ER},
            {"vcvtne2ps2bf16", 0x72, 0, 0, EVEX_PP_F2, EVEX_MAP_0F38, 3, 0, TUPLE_FULL, 1, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vcvtneebf162ps", 0xB0, VEX_PP_F3, VEX_MAP_0F38, 0, 0, 2, 0, 0, 0, 1, FORM_RM, .sae = NO_DECORATOR},
            {"vcvtneeph2ps", 0xB0, VEX_PP_66, VEX_MAP_0F38,   0, 0, 2, 0, 0, 0, 1, FORM_RM, .sae = NO_DECORATOR},
            {"vcvtneobf162ps", 0xB0, VEX_PP_F2, VEX_MAP_0F38, 0, 0, 2, 0, 0, 0, 1, FORM_RM, .sae = NO_DECORATOR},
            {"vcvtneoph2ps", 0xB0, VEX_PP_NONE, VEX_MAP_0F38, 0, 0, 2, 0, 0, 0, 1, FORM_RM, .sae = NO_DECORATOR},
            {"vcvtneps2bf16", 0x72, VEX_PP_F3, VEX_MAP_0F38, EVEX_PP_F3, EVEX_MAP_0F38, 2, 0, TUPLE_T1, 0, 0,FORM_RM | FORM_RR, .sae = NO_DECORATOR},
            {"vcvtpd2ps",  0x5A, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 2, 1, TUPLE_HALF, 0, 0,FORM_RR | FORM_RM, .sae = ER},
            {"vcvtps2dq",  0x5B, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 2, 0, TUPLE_HALF, 0, 0,FORM_RR | FORM_RM, .sae = ER},
            {"vcvtps2pd",  0x5A, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 2, 0, TUPLE_HALF, 0, 0,FORM_RR | FORM_RM, .sae = SAE},
            {"vcvtps2ph", 0x1D, VEX_PP_66, VEX_MAP_0F3A, EVEX_PP_66, EVEX_MAP_0F3A, 3, 0, TUPLE_HALF, 0, 0, FORM_RRI | FORM_MRI, .sae = SAE},
            {"vcvtps2phx", 0x1D, 0, 0, EVEX_PP_66, EVEX_MAP_UNNAMED5, 2, 0, TUPLE_FULL, 1, 0,            FORM_RR | FORM_RM, .sae = ER},
            {"vcvttps2dq", 0x5B, VEX_PP_F3,  VEX_MAP_0F, VEX_PP_F3,  VEX_MAP_0F, 2, 0, TUPLE_HALF,0,0, FORM_RR | FORM_RM, .sae = SAE},
            {"vdivpd",  0x5E, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = ER},
            {"vdivps",  0x5E, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = ER},
            {"vmaxpd",  0x5F, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = SAE},
            {"vmaxps",  0x5F, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = SAE},
            {"vmaxsh",  0x5F, 0, 0, EVEX_PP_F3, EVEX_MAP_UNNAMED5, 3, 0, TUPLE_T1,              1,  0, FORM_RRR | FORM_RRM16 | FORM_RRM, FORM_SCALAR, SAE},
            {"vminpd",  0x5D, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = SAE},
            {"vminps",  0x5D, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = SAE},
            {"vminsh",  0x5D, 0, 0, EVEX_PP_F3, EVEX_MAP_UNNAMED5, 3, 0, TUPLE_T1,              1,  0, FORM_RRR | FORM_RRM16 | FORM_RRM, FORM_SCALAR, SAE},
            {"vmovapd", 0x28, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 2, 1, TUPLE_FULL, 0,  0, FORM_RR | FORM_RM | FORM_MR, .sae = NO_DECORATOR},
            {"vmovaps", 0x28, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 2, 0, TUPLE_FULL, 0,  0, FORM_RR | FORM_RM | FORM_MR, .sae = NO_DECORATOR},
            {"vmovdqa", 0x6F, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 2, 1, TUPLE_FULL, 0,  0, FORM_RR | FORM_RM | FORM_MR, .sae = NO_DECORATOR},
            {"vmovdqu", 0x6F, VEX_PP_F3,  VEX_MAP_0F, VEX_PP_F3,  VEX_MAP_0F, 2, 0, TUPLE_FULL, 0,  0, FORM_RR | FORM_RM | FORM_MR, .sae = NO_DECORATOR},
            {"vmovupd", 0x10, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 2, 1, TUPLE_FULL, 0,  0, FORM_RR | FORM_RM | FORM_MR, .sae = NO_DECORATOR},
            {"vmovups", 0x10, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 2, 0, TUPLE_FULL, 0,  0, FORM_RR | FORM_RM | FORM_MR, .sae = NO_DECORATOR},
            {"vmulpd",  0x59, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = ER},
            {"vmulps",  0x59, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = ER},
            {"vmulsd",  0x59, VEX_PP_F2,  VEX_MAP_0F, VEX_PP_F2,  VEX_MAP_0F, 3, 1, TUPLE_T1,   0,  0, FORM_RRR | FORM_RRM, FORM_SCALAR, ER},
            {"vmulss",  0x59, VEX_PP_F3,  VEX_MAP_0F, VEX_PP_F3,  VEX_MAP_0F, 3, 0, TUPLE_T1,   0,  0, FORM_RRR | FORM_RRM32 | FORM_RRM, FORM_SCALAR, ER},
            {"vorpd",   0x56, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vorps",   0x56, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpackssdw", 0x6B, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpacksswb", 0x63, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpackuswb", 0x67, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpaddb",  0xFC, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpaddd",  0xFE, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpaddq",  0xD4, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpaddw",  0xFD, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpand",   0xDB, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpcmpeqd",0x76, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpcmpgtd",0x66, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpmaxsw", 0xEE, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpmaxub", 0xDE, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpminsw", 0xEA, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpminub", 0xDA, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpor",    0xEB, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpslld",  0xF2, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsllq",  0xF3, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsllw",  0xF1, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsrad",  0xE2, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsraw",  0xE1, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsrld",  0xD2, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsrlq",  0xD3, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsrlw",  0xD1, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsubb",  0xF8, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsubd",  0xFA, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpsubw",  0xF9, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vptest",  0x17, VEX_PP_66, VEX_MAP_0F38, 0,                  0, 2, 0, TUPLE_FULL,0, 1,   FORM_RR  | FORM_RM , .sae = NO_DECORATOR}, 
            {"vpunpckhbw", 0x68, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpunpckhdq", 0x6A, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpunpckhwd", 0x69, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpunpcklbw", 0x60, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpunpckldq", 0x62, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpunpcklqdq", 0x6C, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 1, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpunpcklwd", 0x61, VEX_PP_66, VEX_MAP_0F, VEX_PP_66, VEX_MAP_0F, 3, 0, TUPLE_FULL, 0, 0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vpxor",   0xEF, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vsqrtpd", 0x51, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 2, 1, TUPLE_FULL, 0,  0, FORM_RR  | FORM_RM, .sae = ER },
            {"vsqrtps", 0x51, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 2, 0, TUPLE_FULL, 0,  0, FORM_RR  | FORM_RM, .sae = ER },
            {"vsubpd",  0x5C, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM,.sae = ER},
            {"vsubps",  0x5C, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM,.sae = ER},
            {"vxorpd",  0x57, VEX_PP_66,  VEX_MAP_0F, VEX_PP_66,  VEX_MAP_0F, 3, 1, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
            {"vxorps",  0x57, VEX_PP_NONE,VEX_MAP_0F, VEX_PP_NONE,VEX_MAP_0F, 3, 0, TUPLE_FULL, 0,  0, FORM_RRR | FORM_RRM, .sae = NO_DECORATOR},
        };

        const AvxInsn *insn = &avx_table[find_ins_idx(cmd, sizeof(avx_table) / sizeof(avx_table[0]), avx_table)];

        uint8_t opcode = insn->opcode;
        uint8_t vex_pp = insn->vex_pp;
        uint8_t vex_map = insn->vex_map;
        uint8_t only_can_be_evex = insn->only_evex;

        uint8_t evex_pp = insn->evex_pp;
        uint8_t evex_map = insn->evex_map;
        
        uint8_t evex_aaa = a->mask_reg;
        uint8_t evex_z   = a->z_reg;

        uint8_t broatcast = c->brotcast;

        uint8_t need_evex = 0;

        uint8_t operands = insn->operands;

        uint8_t W = insn->W;
        
        uint8_t typle = insn->tuple;

        uint8_t only_can_be_vex = insn->vex_only;

        uint16_t form = insn->form;

        uint8_t sae = b->sae;

        uint8_t special_format = broatcast | sae;

        // ============
        uint8_t ra = (a->type == O_XMM || a->type == O_YMM || a->type == O_ZMM) ? find_xmm_index(a->reg) : 0;
        uint8_t rb = (b->type == O_XMM || b->type == O_YMM || b->type == O_ZMM) ? find_xmm_index(b->reg) : 0;
        uint8_t rc = (c->type == O_XMM || c->type == O_YMM || c->type == O_ZMM) ? find_xmm_index(c->reg) : 0;

        // @todo: Add APX support for EVEX-AVX*
        need_evex = need_evex ? need_evex : is_avx512( inst_uses_zmm(a->reg, b->reg, c->reg), 
                                                       broatcast, a->mask_reg, 
                                                       vector_reg_bigger_than_15(ra, rb, operands == 2 ? 0 : rc), 
                                                       node->ins.operands[1].imm_sz, sae);
        // ============
        if((only_can_be_evex && only_can_be_vex) || (need_evex && only_can_be_vex)) goto error;

        uint8_t eff_typle = (broatcast && typle != TUPLE_T1) ? TUPLE_T1 : typle;

        // Fuck you intel...
        if(only_can_be_evex){
            if((insn->vector_form & FORM_SCALAR) && (a->type != O_XMM || b->type != O_XMM  || c->type != O_XMM)) goto error;
            if(insn->sae == SAE && (sae & 0b00011110)) goto error; /* Look src/encoder.c line 1145*/
            if(insn->sae == ER && (sae & 0b00000001)) goto error;
            if(insn->sae == NO_DECORATOR && sae) goto error;
            

            // reg, reg, reg
            if(form & FORM_RRR && ((a->type == O_XMM && b->type == O_XMM && c->type == O_XMM) || (a->type == O_YMM && b->type == O_YMM && c->type == O_YMM) || (a->type == O_ZMM && b->type == O_ZMM && c->type == O_ZMM))){

                if(!avx512vl_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX-512_vl, but current CPU does't support it(might give #UD)\n", node->line);}
                node->ins.pc = *pc;
                *s = encode_avx512_reg_reg_reg(machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), find_xmm_index(c->reg),evex_map,
                    b->type == O_XMM ? EVEX_XMM : 
                    b->type == O_YMM ? EVEX_YMM : EVEX_ZMM,evex_pp, W, evex_aaa, evex_z, sae);
                *pc += *s;
            }

             // reg, reg, mem 
            else if(form & FORM_RRM && ((a->type == O_XMM && b->type == O_XMM) || (a->type == O_YMM && b->type == O_YMM) || (a->type == O_ZMM && b->type == O_ZMM)) && c->type == O_MEM){
                node->ins.pc = *pc;
                AddrExpr *mem = &c->addr; 
                if(sae){fprintf(stderr, "AmmAsm:%d: SAE is only valid for register-to-register form\n", node->line); exit(1);}
                if(evex_z) {fprintf(stderr, "AmmAsm:%d: Can't use zero mask for '%s' instruction\n", node->line, cmd); exit(1);}
                *s = encode_avx512_reg_reg_rm( machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), mem,evex_map, 
                    a->type == O_XMM ? EVEX_XMM : 
                    a->type == O_YMM ? EVEX_YMM : EVEX_ZMM, evex_pp, W, evex_aaa, evex_z, eff_typle, broatcast);
                *pc += *s;
            }            

                // reg, reg
            else if(form & FORM_RR && ((a->type == O_XMM && b->type == O_XMM) || (a->type == O_XMM && b->type == O_YMM) || (a->type == O_YMM && b->type == O_ZMM)) && c->type == O_NONE){
                if(!avx512vl_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX-512_vl, but current CPU does't support it(might give #UD)\n", node->line);}
                node->ins.pc = *pc;
                *s = encode_avx512_reg_reg_reg(machine_code, opcode,  find_xmm_index(a->reg),  0, find_xmm_index(b->reg), evex_map,
                    b->type == O_XMM ? EVEX_XMM : 
                    b->type == O_YMM ? EVEX_YMM : EVEX_ZMM, 
                    evex_pp, W, evex_aaa, evex_z, sae);
                *pc += *s;
            }
                
            // reg, mem 
            else if(form & FORM_RM && ((a->type == O_XMM || a->type == O_YMM) && b->type == O_MEM)){
                    node->ins.pc = *pc;
                    AddrExpr *mem = &b->addr;
                    switch(node->ins.operands[1].imm_sz){
                        case 0: fprintf(stderr, "AmmAsm:%d: '%s' requires addres size such as `xword', `yword', or `zword'\n", node->line, cmd); exit(1); break; // safe code
                        case 1: case 2: case 4: case 8: fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1); break;
                        case 16: case 32: if(a->type == O_ZMM){fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1);} break;
                        case 64: if(a->type == O_XMM){fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1);} break;
                        default: break;
                    }
                if(sae){fprintf(stderr, "AmmAsm:%d: SAE is only valid for register-to-register form\n", node->line); exit(1);}
                if(evex_z) {fprintf(stderr, "AmmAsm:%d: Can't use zero mask for '%s' instruction\n", node->line, cmd); exit(1);}
                    *s = encode_avx512_reg_reg_rm( machine_code, opcode, find_xmm_index(a->reg), 0, mem,evex_map, 
                        node->ins.operands[1].imm_sz == 16 ? EVEX_XMM :
                        node->ins.operands[1].imm_sz == 32 ? EVEX_YMM :
                        EVEX_ZMM,
                        evex_pp, W, evex_aaa, evex_z, eff_typle, broatcast);
                    *pc += *s;
            }

        }

        else if(only_can_be_vex){

            // mem, reg
            if((form & FORM_RM || form & FORM_RM16) && ((a->type == O_XMM || a->type == O_YMM) && b->type == O_MEM)){
                node->ins.pc = *pc;
                switch(node->ins.operands[1].imm_sz){ // mainly auto but we will check for user's shit input
                    case 0:  break; // AUTO
                    case 1:  case 4: case 8: {fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1);} break;
                    case 2:  if(!(form & FORM_RM16)){fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1);} break;
                    case 16: if(a->type != O_XMM || form & FORM_RM16){fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1);} break;
                    case 32: if(a->type != O_YMM || form & FORM_RM16){fprintf(stderr, "AmmAsm:%d: impossible combination of address sizes\n", node->line); exit(1);} break;
                }
                AddrExpr *mem = &b->addr;
                if((mem->base >> 4) & 1 || (mem->index >> 4) & 1) {fprintf(stderr, "AmmAsm:%d: Can't encode AVX1/2 with APX registers yet\n", node->line); goto error; } 
                *s = encode_avx_reg_reg_mem(machine_code, opcode, 
                    find_xmm_index(a->reg), 
                    0,
                    mem,
                    a->type == O_XMM ? VEX_XMM : 
                    a->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
            }
        }

        else if(need_evex){
            if(!avx512f_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses general AVX-512, but current CPU does't support it(might give #UD)\n", node->line);}
            if((insn->vector_form & FORM_SCALAR) && (a->type != O_XMM || b->type != O_XMM  || c->type != O_XMM)) goto error;
            if(insn->sae == SAE && (sae & 0b00011110)) goto error;
            if(insn->sae == ER && (sae & 1)) goto error;
            if(insn->sae == NO_DECORATOR && sae) goto error;

            // reg, reg, reg
            if ((form & FORM_RRR) &&
                ((a->type == O_XMM && b->type == O_XMM && c->type == O_XMM) ||
                (a->type == O_YMM && b->type == O_YMM && c->type == O_YMM) ||
                (a->type == O_ZMM && b->type == O_ZMM && c->type == O_ZMM))) {

                if (!avx512vl_defined) fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX-512_vl, but current CPU doesn't support it (might give #UD)\n", node->line);
                node->ins.pc = *pc;

                *s = encode_avx512_reg_reg_reg(machine_code,opcode,
                    find_xmm_index(a->reg),
                    find_xmm_index(b->reg),
                    find_xmm_index(c->reg),
                    evex_map,
                    a->type == O_XMM ? EVEX_XMM :
                    a->type == O_YMM ? EVEX_YMM : EVEX_ZMM,
                    evex_pp, W, evex_aaa, evex_z, sae
                );

                *pc += *s;
            }

            // reg, reg, imm
            else if ((form & FORM_RRI) &&
                    ((a->type == O_XMM && b->type == O_XMM && c->type == O_IMM) ||
                    (a->type == O_YMM && b->type == O_YMM && c->type == O_IMM) ||
                    (a->type == O_ZMM && b->type == O_ZMM && c->type == O_IMM))) {

                if (!avx512vl_defined) fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX-512_vl, but current CPU doesn't support it (might give #UD)\n", node->line);
                node->ins.pc = *pc;

                *s = encode_avx512_reg_reg_reg(machine_code,opcode,
                    find_xmm_index(a->reg),
                    find_xmm_index(b->reg),
                    0,
                    evex_map,
                    a->type == O_XMM ? EVEX_XMM :
                    a->type == O_YMM ? EVEX_YMM : EVEX_ZMM,
                    evex_pp,W,evex_aaa,evex_z,sae
                );
                *pc += *s;
                machine_code[(*s)++] = (uint8_t)c->imm;
            }

            // reg, reg
            else if(form & FORM_RR &&((a->type == O_XMM && b->type == O_XMM)|| // I have 130 iq :)
                                      (a->type == O_YMM && b->type == O_YMM)||
                                      (a->type == O_ZMM && b->type == O_ZMM)||
                                      (a->type == O_XMM && b->type == O_YMM)||
                                      (a->type == O_YMM && b->type == O_ZMM)) && c->type == O_NONE){
                if(!avx512vl_defined) {fprintf(stderr, "AmmAsm:%d: Warn: program uses AVX-512_vl, but current CPU does't support it(might give #UD)\n", node->line);}
                node->ins.pc = *pc;
                *s = encode_avx512_reg_reg_reg(machine_code, opcode, find_xmm_index(a->reg), 0, find_xmm_index(b->reg),evex_map,
                    b->type == O_XMM ? EVEX_XMM : 
                    b->type == O_YMM ? EVEX_YMM : EVEX_ZMM, 
                    evex_pp, W, evex_aaa, evex_z, sae);
                *pc += *s;
            }

             // reg, reg, mem 
            else if(form & FORM_RRM && ((a->type == O_XMM && b->type == O_XMM) || (a->type == O_YMM && b->type == O_YMM) || (a->type == O_ZMM && b->type == O_ZMM)) && c->type == O_MEM){
                node->ins.pc = *pc;
                AddrExpr *mem = &c->addr; 
                if(sae){fprintf(stderr, "AmmAsm:%d: SAE is only valid for register-to-register form\n", node->line); exit(1);}
                if(evex_z) {fprintf(stderr, "AmmAsm:%d: Can't use zero mask for '%s' instruction\n", node->line, cmd); exit(1);}
                *s = encode_avx512_reg_reg_rm( machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), mem,evex_map, 
                    a->type == O_XMM ? EVEX_XMM : 
                    a->type == O_YMM ? EVEX_YMM : EVEX_ZMM, evex_pp, W, evex_aaa, evex_z, eff_typle, broatcast);
                *pc += *s;
            } 


            // mem, reg, imm
            else if((form & FORM_MRI) && ( a->type == O_MEM &&((b->type == O_XMM && c->type == O_IMM) ||
                                                               (b->type == O_YMM && c->type == O_IMM) ||
                                                               (b->type == O_ZMM && c->type == O_IMM)))){
                if(sae){fprintf(stderr, "AmmAsm:%d: SAE is only valid for register-to-register form\n", node->line); exit(1);}
                if(evex_z) {fprintf(stderr, "AmmAsm:%d: Can't use zero mask for '%s' instruction\n", node->line, cmd); exit(1);}
                node->ins.pc = *pc;
                AddrExpr *mem = &a->addr; 
                *s = encode_avx512_reg_reg_rm( machine_code, opcode, 
                    find_xmm_index(b->reg), 
                    0, 
                    mem,
                    evex_map, 
                    b->type == O_XMM ? EVEX_XMM : 
                    b->type == O_YMM ? EVEX_YMM : EVEX_ZMM,
                    evex_pp, W, evex_aaa, evex_z, eff_typle, 0);
                machine_code[(*s)++] = (uint8_t)c->imm;
                *pc += *s;
            }

            // reg, mem 
            else if(form & FORM_RM && ((a->type == O_XMM || a->type == O_YMM || a->type == O_ZMM) && b->type == O_MEM)){
                    node->ins.pc = *pc;
                    AddrExpr *mem = &b->addr;
                if(sae){fprintf(stderr, "AmmAsm:%d: SAE is only valid for register-to-register form\n", node->line); exit(1);}
                if(evex_z) {fprintf(stderr, "AmmAsm:%d: Can't use zero mask for '%s' instruction\n", node->line, cmd); exit(1);}
                    *s = encode_avx512_reg_reg_rm( machine_code, opcode, find_xmm_index(a->reg), 0, mem,evex_map, 
                        node->ins.operands[1].imm_sz == 16 ? EVEX_XMM :
                        node->ins.operands[1].imm_sz == 32 ? EVEX_YMM :
                        a->type == O_XMM ? EVEX_XMM : 
                        a->type == O_YMM ? EVEX_YMM : EVEX_ZMM,
                        evex_pp, W, evex_aaa, evex_z, eff_typle, broatcast);
                    *pc += *s;
            }

            // mem, reg  
            else if(form & FORM_MR && ((b->type == O_XMM || b->type == O_YMM || b->type == O_ZMM) && a->type == O_MEM)){
                    node->ins.pc = *pc;
                    AddrExpr *mem = &a->addr;
                if(sae){fprintf(stderr, "AmmAsm:%d: SAE is only valid for register-to-register form\n", node->line); exit(1);}
                if(evex_z) {fprintf(stderr, "AmmAsm:%d: Can't use zero mask for '%s' instruction\n", node->line, cmd); exit(1);}
                    *s = encode_avx512_reg_reg_rm( machine_code, !strncmp(cmd, "vmov", 4) ? opcode+1 : opcode, find_xmm_index(b->reg), 0, mem,evex_map, 
                        node->ins.operands[1].imm_sz == 16 ? EVEX_XMM :
                        node->ins.operands[1].imm_sz == 32 ? EVEX_YMM :
                        a->type == O_XMM ? EVEX_XMM : 
                        a->type == O_YMM ? EVEX_YMM : EVEX_ZMM,
                        evex_pp, W, evex_aaa, evex_z, eff_typle, broatcast);
                    *pc += *s;
            }
            
        }

        else{ // AVX
            if((insn->vector_form & FORM_SCALAR) && (a->type != O_XMM || b->type != O_XMM  || c->type != O_XMM)) goto error;
            if(sae)goto error;
            // reg, reg, reg
            if(form & FORM_RRR && (a->type == O_XMM && b->type == O_XMM &&  c->type == O_XMM) ||
                                  (a->type == O_YMM && b->type == O_YMM &&  c->type == O_YMM)){
                node->ins.pc = *pc;
                *s = encode_avx_reg_reg_reg(machine_code, opcode, 
                    find_xmm_index(a->reg), 
                    find_xmm_index(b->reg), 
                    find_xmm_index(c->reg),
                    a->type == O_XMM ? VEX_XMM : 
                    a->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
            }


            // reg, reg
            else if(form & FORM_RR && (a->type == O_XMM && b->type == O_XMM &&  c->type == O_NONE) ||
                                      (a->type == O_YMM && b->type == O_YMM &&  c->type == O_NONE) ||
                                      (a->type == O_XMM && b->type == O_YMM &&  c->type == O_NONE) ||
                                      (a->type == O_YMM && b->type == O_XMM &&  c->type == O_NONE)){
                node->ins.pc = *pc;
                *s = encode_avx_reg_reg_reg(machine_code, opcode, 
                    find_xmm_index(a->reg), 
                    0, 
                    find_xmm_index(b->reg), 
                    a->type == O_YMM && b->type == O_XMM ? VEX_YMM :
                    b->type == O_XMM ? VEX_XMM : 
                    b->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
            }


            // reg, mem
            else if(form & FORM_RM && ((a->type == O_XMM && b->type == O_MEM && c->type == O_NONE) ||
                                       (a->type == O_YMM && b->type == O_MEM && c->type == O_NONE))){
                node->ins.pc = *pc;
                AddrExpr *mem = &b->addr; 
                if((mem->base >> 4) & 1 || (mem->index >> 4) & 1) {fprintf(stderr, "AmmAsm:%d: Can't encode AVX1/2 with APX registers yet\n", node->line); goto error; }
                *s = encode_avx_reg_reg_mem(machine_code, opcode, 
                    find_xmm_index(a->reg), 
                    0,
                    mem,
                    node->ins.operands[1].imm_sz == 16 ? VEX_XMM :
                    node->ins.operands[1].imm_sz == 32 ? VEX_YMM :
                    a->type == O_XMM ? VEX_XMM : 
                    a->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
            }
            
            // mem, reg
            else if((form & FORM_MR) && ((a->type == O_MEM && b->type == O_XMM && c->type == O_NONE) ||
                                         (a->type == O_MEM && b->type == O_YMM && c->type == O_NONE))){
                                       
                node->ins.pc = *pc;
                AddrExpr *mem = &a->addr; 
                if((mem->base >> 4) & 1 || (mem->index >> 4) & 1) {fprintf(stderr, "AmmAsm:%d: Can't encode AVX1/2 with APX registers yet\n", node->line); goto error; }
                *s = encode_avx_reg_reg_mem(machine_code, !strncmp(cmd, "vmov", 4) ? opcode+1 : opcode, 
                    find_xmm_index(b->reg), 
                    0,
                    mem,
                    node->ins.operands[1].imm_sz == 16 ? VEX_XMM :
                    node->ins.operands[1].imm_sz == 32 ? VEX_YMM :
                    b->type == O_XMM ? VEX_XMM : 
                    b->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
            }

            // reg, reg, mem
            else if((form & FORM_RRM) && ((a->type == O_XMM && b->type == O_XMM && c->type == O_MEM) ||
                                          (a->type == O_YMM && b->type == O_YMM && c->type == O_MEM))){
                                       
                node->ins.pc = *pc;
                AddrExpr *mem = &c->addr; 
                if((mem->base >> 4) & 1 || (mem->index >> 4) & 1) {fprintf(stderr, "AmmAsm:%d: Can't encode AVX1/2 with APX registers yet\n", node->line); goto error; }
                *s = encode_avx_reg_reg_mem(machine_code,opcode, 
                    find_xmm_index(a->reg), 
                    find_xmm_index(b->reg),
                    mem,
                    node->ins.operands[1].imm_sz == 16 ? VEX_XMM :
                    node->ins.operands[1].imm_sz == 32 ? VEX_YMM :
                    b->type == O_XMM ? VEX_XMM : 
                    b->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
            }

            // mem, reg, imm
            else if(form & FORM_MRI && ((a->type == O_MEM && b->type == O_XMM && c->type == O_IMM)||
                                        (a->type == O_MEM && b->type == O_YMM && c->type == O_IMM))){

                node->ins.pc = *pc;
                AddrExpr *mem = &a->addr; 
                if((mem->base >> 4) & 1 || (mem->index >> 4) & 1) {fprintf(stderr, "AmmAsm:%d: Can't encode AVX1/2 with APX registers yet\n", node->line); goto error; }
                *s = encode_avx_reg_reg_mem(machine_code, opcode, 
                    find_xmm_index(b->reg), 
                    0, 
                    mem,
                    b->type == O_XMM ? VEX_XMM : 
                    b->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                machine_code[(*s)++] = (uint8_t)c->imm;
                *pc += *s;
            }

            // reg, reg, imm
            else if(form & FORM_RRI && (a->type == O_XMM && b->type == O_XMM &&  c->type == O_IMM)||
                                       (a->type == O_XMM && b->type == O_YMM &&  c->type == O_IMM)){
                node->ins.pc = *pc;
                *s = encode_avx_reg_reg_reg(machine_code, opcode, 
                    find_xmm_index(a->reg),
                    0, 
                    find_xmm_index(b->reg),
                    b->type == O_XMM ? VEX_XMM : 
                    b->type == O_YMM ? VEX_YMM : 0,
                    vex_pp, vex_map);
                *pc += *s;
                machine_code[(*s)++] = (uint8_t)c->imm;
            }

        }
    }


error:
    if(*s == 0){
        isnt_error = 1;
        printf("AmmAsm:%d: Instruction did not compile, operands: ", node->line);
        printf("%s ", cmd);
        for (int i = 0; i < 3; i++) {
            if (node->ins.operands[i].type == O_NONE)
                break;

            printf("%s%s",
                node->ins.operands[i].type == O_REG8  ? "REG8"  :
                node->ins.operands[i].type == O_REG16 ? "REG16" :
                node->ins.operands[i].type == O_REG32 ? "REG32" :
                node->ins.operands[i].type == O_REG64 ? "REG64" :
                node->ins.operands[i].type == O_EXPR  ? "EXPR"  :
                node->ins.operands[i].type == O_PC    ? "PC"    :
                node->ins.operands[i].type == O_CHAR  ? "CHAR"  :
                node->ins.operands[i].type == O_IMM   ? "IMM"   :
                node->ins.operands[i].type == O_MEM   ? "[MEM]" :
                node->ins.operands[i].type == O_XMM   ? "XMM"   :
                node->ins.operands[i].type == O_YMM   ? "YMM"   :
                node->ins.operands[i].type == O_ZMM   ? "ZMM"   :
                "?",
                node->ins.operands[i + 1].type == O_NONE ? "" : ", ");
        }
        puts("");
    }



    return *s;
}


void emit_align(AST *node, uint64_t *pc){
    uint64_t old = *pc;
    node->machine_code_len = 0;
    *pc = (*pc + node->align.size - 1) & ~(node->align.size - 1);

    while (old < *pc) {

        uint8_t decimal = node->align.desimal;

        node->machine_code = append(
            (int *)&node->machine_code_len,
            (int *)&node->machine_code_cap,
            node->machine_code,
            &decimal,
            1);

        old++;
    }
}

void parse_size_directives(AST *node, uint64_t *pc){
    node->machine_code_len = 0;

    switch (node->type) {

    case AST_U8:
        for (int i = 0; i < node->u8.data_len; ++i)
            node->machine_code = append( (int *)&node->machine_code_len, (int *)&node->machine_code_cap, node->machine_code, &node->u8.data[i], sizeof(uint8_t));

        *pc += node->machine_code_len;
        break;

    case AST_U16:{
        int count = 0;

        for (int i = 0; i < node->u16.data_len; ++i)
            node->machine_code = append(&count, (int *)&node->machine_code_cap, node->machine_code, &node->u16.data[i], sizeof(uint16_t));

        node->machine_code_len = count * sizeof(uint16_t);
        *pc += node->machine_code_len;

        break;
    }

    case AST_U32: {
        int count = 0;

        for (int i = 0; i < node->u32.data_len; ++i)
            node->machine_code = append( &count, (int *)&node->machine_code_cap, node->machine_code, &node->u32.data[i], sizeof(uint32_t));
            
        node->machine_code_len = count * sizeof(uint32_t);
        *pc += node->machine_code_len;
        break;
    }

    case AST_U64: {
        int count = 0;

        for (int i = 0; i < node->u64.entries_len; ++i) {
            uint64_t value = 0;
            if (node->u64.entries[i].type != U64_EXPR)
                value = node->u64.entries[i].imm;

            node->machine_code = append( (int *)&count, (int *)&node->machine_code_cap, node->machine_code, &value, sizeof(uint64_t));
        }

        node->machine_code_len = count * sizeof(uint64_t);
        node->u64.pc = *pc;
        *pc += node->machine_code_len;
        break;
    }

    case AST_BSS_RES:
        if (!obj_file){
            uint8_t zero = 0;
            for(uint64_t i = 0; i < node->bss_res.res; i++)
            node->machine_code = append((int*)&node->machine_code_len, (int*)&node->machine_code_cap, node->machine_code, &zero, 1);
        }
        break;
    }
}