#include "instruction_parse.h"

uint8_t parseInst(AST* node, uint64_t *pc) {
    if (node->type != AST_INS) return 0;
    int pos = 0;
    int err = 0;

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


    if (strcasecmp(cmd, "mov") == 0) {
    
        // ========================================================================
        // 1. MOV REG, IMM (reg <- imm)
        // ========================================================================
        
        // MOV R64, IMM64
        if (a->type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(*b)) {

            uint8_t reg_idx = find_reg64_index(a->reg);
            uint64_t imm = b->imm;

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, imm, 64);
            *pc += *s;
            
        }

        // MOV R32, IMM32
        else if (a->type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(*b)) {

            uint8_t reg_idx = find_reg32_index(a->reg);
            uint32_t imm = (uint32_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint32_t)imm, 32);
            *pc += *s;
            
        }

        // MOV R16, IMM16
        else if (a->type == O_REG16 && b->type == O_IMM) {

            uint8_t reg_idx = find_reg16_index(a->reg);
            uint16_t imm = (uint16_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint16_t)imm, 16);
            *pc += *s;
            
        }

        // MOV R8, IMM8/CHAR
        else if (a->type == O_REG8 && (b->type == O_IMM || b->type == O_CHAR)) {

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
        else if (a->type == O_REG64 && b->type == O_REG64) {
        
            uint8_t rm = find_reg64_index(a->reg);
            uint8_t reg = find_reg64_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 64);
            *pc += *s;
            
        }

        // MOV R32, R32
        else if (a->type == O_REG32 && b->type == O_REG32) {
        
            uint8_t rm = find_reg32_index(a->reg);
            uint8_t reg = find_reg32_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 32);
            *pc += *s;
            
        }

        // MOV R16, R16
        else if (a->type == O_REG16 && b->type == O_REG16) {
        
            uint8_t rm = find_reg16_index(a->reg);
            uint8_t reg = find_reg16_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 16);
            *pc += *s;
            
        }

        // MOV R8, R8
        else if (a->type == O_REG8 && b->type == O_REG8) {
        
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
        else if (a->type == O_REG64 && b->type == O_MEM) {
            uint8_t reg = find_reg64_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R32, [ADDR]
        else if (a->type == O_REG32 && b->type == O_MEM) {
            uint8_t reg = find_reg32_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 32, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R16, [ADDR]
        else if (a->type == O_REG16 && b->type == O_MEM) {
            uint8_t reg = find_reg16_index(a->reg);
            AddrExpr *mem = &b->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 16, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R8, [ADDR]
        else if (a->type == O_REG8 && b->type == O_MEM) {
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
        else if (a->type == O_MEM && b->type == O_REG64) {
            uint8_t reg = find_reg64_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R32
        else if (a->type == O_MEM && b->type == O_REG32) {
            uint8_t reg = find_reg32_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 32, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R16
        else if (a->type == O_MEM && b->type == O_REG16) {
            uint8_t reg = find_reg16_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 16, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R8
        else if (a->type == O_MEM && b->type == O_REG8) {
            uint8_t reg = find_reg8_index(b->reg);
            AddrExpr *mem = &a->addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 8, 0x88, 0, 0);
            *pc += *s;
            
        }


        else if (a->type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR)){
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
    else if (strcasecmp(node->cmd, "add") == 0 ||
            strcasecmp(node->cmd, "or")  == 0 ||
            strcasecmp(node->cmd, "adc") == 0 ||
            strcasecmp(node->cmd, "sbb") == 0 ||
            strcasecmp(node->cmd, "and") == 0 ||
            strcasecmp(node->cmd, "sub") == 0 ||
            strcasecmp(node->cmd, "xor") == 0 ||
            strcasecmp(node->cmd, "cmp") == 0){

        // pointers to functions(becouse they have same struct of arguments)
        uint8_t (*encode_imm)    (uint8_t*, uint8_t, uint32_t, uint8_t, int) = NULL; // encode_add/sub/or...._imm
        uint8_t (*encode_reg_reg)(uint8_t*, uint8_t, uint8_t, uint8_t)      = NULL; // encode_add/sub/or...._reg_reg
        uint8_t op_rm_std, op_rm_8;      // reg,[mem]
        uint8_t op_mem_std, op_mem_8;    // [mem],reg
        uint8_t group_digit; // /0 - /7                 

        // gather informmation about current instruction
        if (strcasecmp(node->cmd, "add") == 0) {
            encode_imm     = encode_add_imm;
            encode_reg_reg = encode_add_reg_reg;
            op_rm_std = 0x03; op_rm_8 = 0x02;
            op_mem_std = 0x01; op_mem_8 = 0x00;
            group_digit = 0;
        } 
        else if (strcasecmp(node->cmd, "or") == 0) {
            encode_imm     = encode_or_imm;
            encode_reg_reg = encode_or_reg_reg;
            op_rm_std = 0x0B; op_rm_8 = 0x0A;
            op_mem_std = 0x09; op_mem_8 = 0x08;
            group_digit = 1;
        } 
        else if (strcasecmp(node->cmd, "adc") == 0) {
            encode_imm     = encode_adc_imm;
            encode_reg_reg = encode_adc_reg_reg;
            op_rm_std = 0x13; op_rm_8 = 0x12;
            op_mem_std = 0x11; op_mem_8 = 0x10;
            group_digit = 2;
        } 
        else if (strcasecmp(node->cmd, "sbb") == 0) {
            encode_imm     = encode_sbb_imm;
            encode_reg_reg = encode_sbb_reg_reg;
            op_rm_std = 0x1B; op_rm_8 = 0x1A;
            op_mem_std = 0x19; op_mem_8 = 0x18;
            group_digit = 3;
        }
        else if (strcasecmp(node->cmd, "and") == 0) {
            encode_imm     = encode_and_imm;
            encode_reg_reg = encode_and_reg_reg;
            op_rm_std = 0x23; op_rm_8 = 0x22;
            op_mem_std = 0x21; op_mem_8 = 0x20;
            group_digit = 4;
        }
        else if (strcasecmp(node->cmd, "sub") == 0) {
            encode_imm     = encode_sub_imm;
            encode_reg_reg = encode_sub_reg_reg;
            op_rm_std = 0x2B; op_rm_8 = 0x2A;
            op_mem_std = 0x29; op_mem_8 = 0x28;
            group_digit = 5;
        } 
        else if (strcasecmp(node->cmd, "xor") == 0) {
            encode_imm     = encode_xor_imm;
            encode_reg_reg = encode_xor_reg_reg;
            op_rm_std = 0x33; op_rm_8 = 0x32;
            op_mem_std = 0x31; op_mem_8 = 0x30;
            group_digit = 6;
        } 
        else if (strcasecmp(node->cmd, "cmp") == 0) {
            encode_imm     = encode_cmp_imm;
            encode_reg_reg = encode_cmp_reg_reg;
            op_rm_std = 0x3B; op_rm_8 = 0x3A;
            op_mem_std = 0x39; op_mem_8 = 0x38;
            group_digit = 7;
        }

        // 1. reg, imm
        if (a->type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(*b)) {
            uint8_t reg = find_reg64_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imm(machine_code, reg, b->imm, 64, b->type == O_EXPR);
            *pc += *s;
        }
        else if (a->type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(*b)) {
            uint8_t reg = find_reg32_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imm(machine_code, reg, b->imm, 32, b->type == O_EXPR);
            *pc += *s;
        }
        else if (a->type == O_REG16 && b->type == O_IMM) {
            uint8_t reg = find_reg16_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imm(machine_code, reg, b->imm, 16, 0);
            *pc += *s;
        }
        else if (a->type == O_REG8 && (b->type == O_IMM || b->type == O_CHAR)) {
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imm(machine_code, reg, b->type == O_IMM ? b->imm : b->c, 8, 0);
            *pc += *s;
        }

        // 2. reg, reg
        else if (a->type == O_REG64 && b->type == O_REG64) {
            uint8_t dest = find_reg64_index(a->reg);
            uint8_t src  = find_reg64_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
        }
        else if (a->type == O_REG32 && b->type == O_REG32) {
            uint8_t dest = find_reg32_index(a->reg);
            uint8_t src  = find_reg32_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
        }
        else if (a->type == O_REG16 && b->type == O_REG16) {
            uint8_t dest = find_reg16_index(a->reg);
            uint8_t src  = find_reg16_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
        }
        else if (a->type == O_REG8 && b->type == O_REG8) {
            uint8_t dest = find_reg8_index(a->reg);
            uint8_t src  = find_reg8_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
        }

        // 3. reg, [mem]
        else if (a->type == O_REG64 && b->type == O_MEM) {
            uint8_t dest = find_reg64_index(a->reg);
            AddrExpr *mem = &b->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, mem, 64, op_rm_std, 0, 0);
            *pc += *s;
        }
        else if (a->type == O_REG32 && b->type == O_MEM) {
            uint8_t dest = find_reg32_index(a->reg);
            AddrExpr *mem = &b->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, mem, 32, op_rm_std, 0, 0);
            *pc += *s;
        }
        else if (a->type == O_REG16 && b->type == O_MEM) {
            uint8_t dest = find_reg16_index(a->reg);
            AddrExpr *mem = &b->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, mem, 16, op_rm_std, 0, 0);
            *pc += *s;
        }
        else if (a->type == O_REG8 && b->type == O_MEM) {
            uint8_t dest = find_reg8_index(a->reg);
            AddrExpr *mem = &b->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, mem, 8, op_rm_8, 0, 0);
            *pc += *s;
        }

        // 4. [mem], reg
        else if (a->type == O_MEM && b->type == O_REG64) {
            uint8_t src = find_reg64_index(b->reg);
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, mem, 64, op_mem_std, 0, 0);
            *pc += *s;
        }
        else if (a->type == O_MEM && b->type == O_REG32) {
            uint8_t src = find_reg32_index(b->reg);
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, mem, 32, op_mem_std, 0, 0);
            *pc += *s;
        }
        else if (a->type == O_MEM && b->type == O_REG16) {
            uint8_t src = find_reg16_index(b->reg);
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, mem, 16, op_mem_std, 0, 0);
            *pc += *s;
        }
        else if (a->type == O_MEM && b->type == O_REG8) {
            uint8_t src = find_reg8_index(b->reg);
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, mem, 8, op_mem_8, 0, 0);
            *pc += *s;
        }

        // 5. [mem], imm
        else if (a->type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR)) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz) {
                case 1:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8,  0x80, 1, b->type == O_IMM ? b->imm : b->c);
                    break;
                case 2:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0x81, 2, b->type == O_IMM ? b->imm : b->c);
                    break;
                case 4:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0x81, 4, b->type == O_IMM ? b->imm : b->c);
                    break;
                case 8:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0x81, 4, b->type == O_IMM ? b->imm : b->c);
                    break;
            }
            *pc += *s;
        }
    }

    // Group 2 instructions: rol, ror, rcl, rcr, shl, shr, sar
    else if (strcasecmp(node->cmd, "rol") == 0 ||
            strcasecmp(node->cmd, "ror") == 0 ||
            strcasecmp(node->cmd, "rcl") == 0 ||
            strcasecmp(node->cmd, "rcr") == 0 ||
            strcasecmp(node->cmd, "shl") == 0 ||
            strcasecmp(node->cmd, "sal") == 0 ||
            strcasecmp(node->cmd, "shr") == 0 ||
            strcasecmp(node->cmd, "sar") == 0) {

        uint8_t group_digit;  // /0 - /7

        if (strcasecmp(node->cmd, "rol") == 0)        group_digit = 0;
        else if (strcasecmp(node->cmd, "ror") == 0)   group_digit = 1;
        else if (strcasecmp(node->cmd, "rcl") == 0)   group_digit = 2;
        else if (strcasecmp(node->cmd, "rcr") == 0)   group_digit = 3;
        else if (strcasecmp(node->cmd, "shl") == 0 || strcasecmp(node->cmd, "sal") == 0) group_digit = 4;
        else if (strcasecmp(node->cmd, "shr") == 0)   group_digit = 5;
        else if (strcasecmp(node->cmd, "sar") == 0)   group_digit = 7;

        // 1. op reg, 1  /  op [mem], 1
        if ((b->type == O_IMM && b->imm == 1)) {

            if (a->type == O_REG64) {
                uint8_t reg = find_reg64_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xD1, group_digit, 1, 64);
                *pc += *s;
            }
            else if (a->type == O_REG32) {
                uint8_t reg = find_reg32_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xD1, group_digit, 1, 32);
                *pc += *s;
            }
            else if (a->type == O_REG16) {
                uint8_t reg = find_reg16_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xD1, group_digit, 1, 16);
                *pc += *s;
            }
            else if (a->type == O_REG8) {
                uint8_t reg = find_reg8_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xD0, group_digit, 1, 8);
                *pc += *s;
            }
            else if (a->type == O_MEM) {
                AddrExpr *mem = &a->addr;
                node->ins.pc = *pc;

                switch (node->ins.operands[1].imm_sz) {
                    case 1:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8,  0xD0, 111, 0);
                        break;
                    case 2:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0xD1, 111, 0);
                        break;
                    case 4:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0xD1, 111, 0);
                        break;
                    case 8:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0xD1, 111, 0);
                        break;
                }
                *pc += *s;
            }
        }

        // 2. op reg, imm8  /  op [mem], imm8
        else if (b->type == O_IMM || b->type == O_CHAR) {
            uint8_t imm = (b->type == O_IMM) ? (uint8_t)b->imm : (uint8_t)b->c;

            if (a->type == O_REG64) {
                uint8_t reg = find_reg64_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xC1, group_digit, imm, 64);
                *pc += *s;
            }
            else if (a->type == O_REG32) {
                uint8_t reg = find_reg32_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xC1, group_digit, imm, 32);
                *pc += *s;
            }
            else if (a->type == O_REG16) {
                uint8_t reg = find_reg16_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xC1, group_digit, imm, 16);
                *pc += *s;
            }
            else if (a->type == O_REG8) {
                uint8_t reg = find_reg8_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_imm(machine_code, reg, 0xC0, group_digit, imm, 8);
                *pc += *s;
            }
            else if (a->type == O_MEM) {
                AddrExpr *mem = &a->addr;
                node->ins.pc = *pc;
                switch (node->ins.operands[1].imm_sz) {
                    case 1:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8,  0xC0, 111, 0);
                        machine_code[*s] = (uint8_t)b->imm;
                        (*s)++;
                        break;
                    case 2:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0xC1, 111, 0);
                        machine_code[*s] = (uint8_t)b->imm;
                        (*s)++;
                        break;
                    case 4:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0xC1, 111, 0);
                        machine_code[*s] = (uint8_t)b->imm;
                        (*s)++;
                        break;
                    case 8:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0xC1, 111, 0);
                        machine_code[*s] = (uint8_t)b->imm;
                        (*s)++;
                        break;
                }
                *pc += *s;
            }
        }

        // ── 3. op reg, cl  /  op [mem], cl ──────────────────────────────────
        else if (b->type == O_REG8 && strcasecmp(b->reg, "cl") == 0) {
            
            if (a->type == O_REG64) {
                uint8_t reg = find_reg64_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_cl(machine_code, reg, 0xD3, group_digit, 64);
                *pc += *s;
            }
            else if (a->type == O_REG32) {
                uint8_t reg = find_reg32_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_cl(machine_code, reg, 0xD3, group_digit, 32);
                *pc += *s;
            }
            else if (a->type == O_REG16) {
                uint8_t reg = find_reg16_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_cl(machine_code, reg, 0xD3, group_digit, 16);
                *pc += *s;
            }
            else if (a->type == O_REG8) {
                uint8_t reg = find_reg8_index(a->reg);
                node->ins.pc = *pc;
                *s = encode_group2_reg_cl(machine_code, reg, 0xD2, group_digit, 8);
                *pc += *s;
            }
            else if (a->type == O_MEM) {
                AddrExpr *mem = &a->addr;
                node->ins.pc = *pc;
                switch (node->ins.operands[1].imm_sz) {
                    case 1:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8,  0xD2, 111, 0);
                        break;
                    case 2:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0xD3, 111, 0);
                        break;
                    case 4:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0xD3, 111, 0);
                        break;
                    case 8:
                        *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0xD3, 111, 0);
                        break;
                }
                *pc += *s;
            }
        }
    }

    // Group 3 instructions: not, neg, mul
    else if (strcasecmp(node->cmd, "not") == 0 ||
            strcasecmp(node->cmd, "neg") == 0 ||
            strcasecmp(node->cmd, "mul") == 0) {

        uint8_t group_digit;

        // instructions such as imul, mul, div, idiv, test also includes to group, as they implemented below

        if (strcasecmp(node->cmd, "not") == 0)        group_digit = 2;
        else if (strcasecmp(node->cmd, "neg") == 0)   group_digit = 3;
        else if (strcasecmp(node->cmd, "mul") == 0)   group_digit = 4;

        if (a->type == O_REG64) {
            uint8_t reg = find_reg64_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group3_reg(machine_code, reg, 0xF7, group_digit, 64);
            *pc += *s;
        }
        else if (a->type == O_REG32) {
            uint8_t reg = find_reg32_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group3_reg(machine_code, reg, 0xF7, group_digit, 32);
            *pc += *s;
        }
        else if (a->type == O_REG16) {
            uint8_t reg = find_reg16_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group3_reg(machine_code, reg, 0xF7, group_digit, 16);
            *pc += *s;
        }
        else if (a->type == O_REG8) {
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group3_reg(machine_code, reg, 0xF6, group_digit, 8);
            *pc += *s;
        }
        else if (a->type == O_MEM) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;

            switch (node->ins.operands[1].imm_sz) {
                case 1:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8, 0xF6, 111, 0);
                    break;
                case 2:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0xF7, 111, 0);
                    break;
                case 4:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0xF7, 111, 0);
                    break;
                case 8:
                    *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0xF7, 111, 0);
                    break;
            }

            *pc += *s;
        }
    }


    else if(!strcasecmp(cmd, "test")){
        // ========================================================================
        // 1. TEST REG, IMM (reg <- imm)
        // ========================================================================
        
        // TEST R64, IMM64
        if (a->type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(*b)) {

            uint8_t reg_idx = find_reg64_index(a->reg);
            uint64_t imm = b->imm;

            node->ins.pc = *pc;
            *s = encode_test_reg_imm(machine_code, reg_idx, imm, 64);
            *pc += *s;
            
        }

        // TEST R32, IMM32
        else if (a->type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(*b)) {

            uint8_t reg_idx = find_reg32_index(a->reg);
            uint32_t imm = (uint32_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_test_reg_imm(machine_code, reg_idx, (uint32_t)imm, 32);
            *pc += *s;
            
        }

        // TEST R16, IMM16
        else if (a->type == O_REG16 && b->type == O_IMM) {

            uint8_t reg_idx = find_reg16_index(a->reg);
            uint16_t imm = (uint16_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_test_reg_imm(machine_code, reg_idx, (uint16_t)imm, 16);
            *pc += *s;
            
        }

        // TEST R8, IMM8/CHAR
        else if (a->type == O_REG8 && (b->type == O_IMM || b->type == O_CHAR)) {

            uint8_t c = b->c;
            uint8_t reg_idx = find_reg8_index(a->reg);
            uint8_t imm = (uint8_t)(b->imm);

            node->ins.pc = *pc;
            *s = encode_test_reg_imm(machine_code, reg_idx, (b->type == O_CHAR) ? (uint8_t)c : (uint8_t)imm, 8);
            *pc += *s;
            
        }


        // ========================================================================
        // 2. TEST REG, REG (reg <- reg) (mod = 11)
        // ========================================================================

        else if (a->type == O_REG64 && b->type == O_REG64) {
        
            uint8_t rm = find_reg64_index(a->reg);
            uint8_t reg = find_reg64_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_test_reg_reg(machine_code, rm, reg, 64);
            *pc += *s;
            
        }

        else if (a->type == O_REG32 && b->type == O_REG32) {
        
            uint8_t rm = find_reg32_index(a->reg);
            uint8_t reg = find_reg32_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_test_reg_reg(machine_code, rm, reg, 32);
            *pc += *s;
            
        }

        else if (a->type == O_REG16 && b->type == O_REG16) {
        
            uint8_t rm = find_reg16_index(a->reg);
            uint8_t reg = find_reg16_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_test_reg_reg(machine_code, rm, reg, 16);
            *pc += *s;
            
        }

        else if (a->type == O_REG8 && b->type == O_REG8) {
        
            uint8_t rm = find_reg8_index(a->reg);
            uint8_t reg = find_reg8_index(b->reg);

            node->ins.pc = *pc;
            *s = encode_test_reg_reg(machine_code, rm, reg, 8);
            *pc += *s;
            
        }


        // ========================================================================
        // 3. TEST REG, [ADDR] / TEST [ADDR], REG
        // ========================================================================

        else if (
            (a->type == O_REG64 && b->type == O_MEM) ||
            (a->type == O_MEM   && b->type == O_REG64)
        ) {
            uint8_t reg;
            AddrExpr *mem;

            if (a->type == O_MEM) {
                reg = find_reg64_index(b->reg);
                mem = &a->addr;
            } else {
                reg = find_reg64_index(a->reg);
                mem = &b->addr;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x85, 0, 0);
            *pc += *s;
        }

        else if (
            (a->type == O_REG32 && b->type == O_MEM) ||
            (a->type == O_MEM   && b->type == O_REG32)
        ) {
            uint8_t reg;
            AddrExpr *mem;

            if (a->type == O_MEM) {
                reg = find_reg32_index(b->reg);
                mem = &a->addr;
            } else {
                reg = find_reg32_index(a->reg);
                mem = &b->addr;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 32, 0x85, 0, 0);
            *pc += *s;
        }

        else if (
            (a->type == O_REG16 && b->type == O_MEM) ||
            (a->type == O_MEM   && b->type == O_REG16)
        ) {
            uint8_t reg;
            AddrExpr *mem;

            if (a->type == O_MEM) {
                reg = find_reg16_index(b->reg);
                mem = &a->addr;
            } else {
                reg = find_reg16_index(a->reg);
                mem = &b->addr;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 16, 0x85, 0, 0);
            *pc += *s;
        }

        else if (
            (a->type == O_REG8 && b->type == O_MEM) ||
            (a->type == O_MEM  && b->type == O_REG8)
        ) {
            uint8_t reg;
            AddrExpr *mem;

            if (a->type == O_MEM) {
                reg = find_reg8_index(b->reg);
                mem = &a->addr;
            } else {
                reg = find_reg8_index(a->reg);
                mem = &b->addr;
            }

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 8, 0x84, 0, 0);
            *pc += *s;
        }

        else if (a->type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(*b) || b->type == O_CHAR)){
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

    // IMUL - Signed Multiply
    else if(!strcasecmp(cmd, "imul")){
        // imul r64
        if(a->type == O_REG64 && b->type == O_NONE){
            uint8_t reg = find_reg64_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 64);
            *pc += *s;
        }

        // imul r32
        else if(a->type == O_REG32 && b->type == O_NONE){
            uint8_t reg = find_reg32_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 32);
            *pc += *s;
        }

        // imul r16
        else if(a->type == O_REG16 && b->type == O_NONE){
            uint8_t reg = find_reg16_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 16);
            *pc += *s;
        }

        // imul r8
        else if(a->type == O_REG8 && b->type == O_NONE){
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 8);
            *pc += *s;
        }


        //===============
        // imul reg, reg 
        //===============

        // imul r64, r64
        else if(a->type == O_REG64 && b->type == O_REG64){
            uint8_t src = find_reg64_index(a->reg);
            uint8_t dest = find_reg64_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
        }

        // imul r32, r32
        else if(a->type == O_REG32 && b->type == O_REG32){
            uint8_t src = find_reg32_index(a->reg);
            uint8_t dest = find_reg32_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
        }

        // imul r16, r16
        else if(a->type == O_REG16 && b->type == O_REG16){
            uint8_t src = find_reg16_index(a->reg);
            uint8_t dest = find_reg16_index(b->reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
        }

        // =====================================
        // imul reg, reg, imm 
        // =====================================

        // imul r64, r64, imm32/imm8
        if (a->type == O_REG64 && b->type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(*c)) {
            uint8_t dest = find_reg64_index(a->reg);
            uint8_t src = find_reg64_index(b->reg);
            uint64_t imm = c->imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 64, c->type == O_EXPR);
            *pc += *s;
            
        }

        // imul r32, r32, imm32/imm8
        else if (a->type == O_REG32 && b->type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(*c)) {
            uint8_t dest = find_reg32_index(a->reg);
            uint8_t src = find_reg32_index(b->reg);
            uint64_t imm = c->imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 32, c->type == O_EXPR);
            *pc += *s;
            
        }

        // imul r16, r16, imm16/imm8
        else if (a->type == O_REG16 && b->type == O_REG16 && c->type == O_IMM) {
            uint8_t dest = find_reg16_index(a->reg);
            uint8_t src = find_reg16_index(b->reg);
            uint64_t imm = c->imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 16, c->type == O_EXPR);
            *pc += *s;
            
        }

        // =====================================
        // 2. imul reg, imm (abstraction)
        // =====================================

        // imul r64, imm
        else if (a->type == O_REG64 && (b->type == O_IMM || b->type == O_EXPR) && c->type == O_NONE) {
            uint8_t reg = find_reg64_index(a->reg);
            uint64_t imm = b->imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 64, b->type == O_EXPR);
            *pc += *s;
            
        }

        // imul r32, imm
        else if (a->type == O_REG32 && (b->type == O_IMM || b->type == O_EXPR) && c->type == O_NONE) {
            uint8_t reg = find_reg32_index(a->reg);
            uint64_t imm = b->imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 32, b->type == O_EXPR);
            *pc += *s;
            
        }

        // imul r16, imm
        else if (a->type == O_REG16 && b->type == O_IMM) {
            uint8_t reg = find_reg16_index(a->reg);
            uint64_t imm = b->imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 16, b->type == O_EXPR);
            *pc += *s;
            
        }
        
    }

    // DIV-Unsigned Divide
    // IDIV-Signed Divide
    else if (!strcasecmp(cmd, "div") || !strcasecmp(cmd, "idiv")){
        
        uint8_t group_digit = !strcasecmp(cmd, "div") ? 6 : 7;

        // i/div reg64        
        if(a->type == O_REG64){
            uint8_t src = find_reg64_index(a->reg);

            *s = encode_div_or_idiv_reg(machine_code, group_digit, src, 64);
            *pc += *s;
        }

        // i/div reg32      
        else if(a->type == O_REG32){
            uint8_t src = find_reg32_index(a->reg);

            *s = encode_div_or_idiv_reg(machine_code, group_digit, src, 32);
            *pc += *s;
        }

        // i/div reg16        
        else if(a->type == O_REG16){
            uint8_t src = find_reg16_index(a->reg);

            *s = encode_div_or_idiv_reg(machine_code, group_digit, src, 16);
            *pc += *s;
        }

        // i/div reg8        
        else if(a->type == O_REG8){
            uint8_t src = find_reg8_index(a->reg);

            *s = encode_div_or_idiv_reg(machine_code, group_digit, src, 8);
            *pc += *s;
        }

        // =========
        // i/div [mem] 
        // =========       
        else if(a->type == O_MEM){
            AddrExpr *mem = &a->addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){                 /* div [mem] does not gain imm*/
                case 1: *s = encode_inst_rm_rm(machine_code, group_digit, mem, 8,  0xF6, 111, 0); break;
                case 2: *s = encode_inst_rm_rm(machine_code, group_digit, mem, 16, 0xF7, 111, 0); break;
                case 4: *s = encode_inst_rm_rm(machine_code, group_digit, mem, 32, 0xF7, 111, 0); break;
                case 8: *s = encode_inst_rm_rm(machine_code, group_digit, mem, 64, 0xF7, 111, 0); break; 
            }
            *pc += *s;
            
        }

    }
   
    // Group 4 instructions: inc, dec (r/m8)
    else if ((!strcasecmp(node->cmd, "inc") && (a->type == O_REG8 || node->ins.operands[1].imm_sz == 1)) ||
             (!strcasecmp(node->cmd, "dec") && (a->type == O_REG8 || node->ins.operands[1].imm_sz == 1))) {

        uint8_t group_digit;

        if (strcasecmp(node->cmd, "inc") == 0) group_digit = 0;
        else group_digit = 1;

        if (a->type == O_REG8) {
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group4_reg(machine_code, reg, 0xFE, group_digit, 8);
            *pc += *s;
        }
        else if (a->type == O_MEM) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm( machine_code, group_digit, mem, 8, 0xFE, 111, 0);
            *pc += *s;
        }
    }

    // Group 5 instructions: inc, dec
    else if (strcasecmp(node->cmd, "inc") == 0 ||
            strcasecmp(node->cmd, "dec") == 0) {

        // also push, jmp, call implemented below

        uint8_t group_digit = (strcasecmp(node->cmd, "inc") == 0) ? 0 : 1;

        if (a->type == O_REG64) {
            uint8_t reg = find_reg64_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group5_reg(machine_code, reg, 0xFF, group_digit, 64);
            *pc += *s;
        }
        else if (a->type == O_REG32) {
            uint8_t reg = find_reg32_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group5_reg(machine_code, reg, 0xFF, group_digit, 32);
            *pc += *s;
        }
        else if (a->type == O_REG16) {
            uint8_t reg = find_reg16_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_group5_reg(machine_code, reg, 0xFF, group_digit, 16);
            *pc += *s;
        }
        else if (a->type == O_MEM) {
            AddrExpr *mem = &a->addr;
            node->ins.pc = *pc;

            switch (node->ins.operands[1].imm_sz) {
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

    // push reg into stack
    else if(!strcasecmp(cmd, "push")){
        // ==============
        // push reg
        // ==============

        if(a->type == O_REG64){
            uint8_t reg = find_reg64_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 64);
            *pc += *s;
            
        }

        // N.E in 64 bit mode!
        else if(a->type == O_REG32){
            uint8_t reg = find_reg32_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 32);
            *pc += *s;
            
        }

        else if(a->type == O_REG16){
            uint8_t reg = find_reg16_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 16);
            *pc += *s;
            
        }

        else if(a->type == O_REG8){
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 8);
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
    else if(!strcasecmp(cmd, "pop")){
        // ==============
        // pop reg
        // ==============

        if(a->type == O_REG64){
            uint8_t reg = find_reg64_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 64);
            *pc += *s;
            
        }

        // N.E in 64 bit mode!
        else if(a->type == O_REG32){
            uint8_t reg = find_reg32_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 32);
            *pc += *s;
            
        }

        else if(a->type == O_REG16){
            uint8_t reg = find_reg16_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 16);
            *pc += *s;
            
        }

        else if(a->type == O_REG8){
            uint8_t reg = find_reg8_index(a->reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 8);
            *pc += *s;
            
        }
        
    }

    
    // legacy code
    else if(!strcasecmp(cmd, "jmp") || !strcasecmp(cmd, "call")) {

        uint8_t group_digit = !strcasecmp(cmd, "jmp") ? 4 : 2;

        // =========================
        // JMP/CALL label (REL32)
        // =========================
        if(a->type == O_EXPR || a->type == O_PC) { 
            uint8_t opcode = (!strcasecmp(cmd, "jmp")) ? 0xE9 : 0xE8;

            machine_code[0] = opcode;
            *(uint32_t*)(machine_code + 1) = 0x0;
        
            node->ins.pc = *pc;
            *s = 5;
            *pc += 5;
            
        }
        
        else if(a->type == O_REG64) {
            uint8_t rex = REX_BASE | REX_W;
            uint8_t opcode = 0xFF;
            uint8_t modrm;
            
            int reg_idx = find_reg64_index(node->ins.operands[0].reg);
            if(reg_idx >= 8) rex |= REX_B;
            
            if(!strcasecmp(node->cmd, "jmp"))  modrm = emit_modrm(0b11, group_digit, reg_idx); // FF /4
            else modrm = emit_modrm(0b11, group_digit, reg_idx);  // FF /2
            
            
            node->machine_code[0] = rex;
            node->machine_code[1] = opcode;
            node->machine_code[2] = modrm;
            
            node->ins.pc = *pc;
            *s = 3;
            *pc += 3;
            
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
        else if (!strcasecmp(node->cmd, "jae"))  opcode2 = 0x83;
        else if (!strcasecmp(node->cmd, "jbe"))  opcode2 = 0x86;

        node->machine_code[pos++] = 0x0F;
        node->machine_code[pos++] = opcode2;
        *(uint32_t*)(machine_code + pos) = 0x0; // rel32
        pos += 4;

        node->ins.pc = *pc;
        *pc += pos;
        *s = pos;
        
    }


    // // movzx, movsx
    if(!strcasecmp(cmd, "movzx") || !strcasecmp(cmd, "movsx")){
        uint8_t opcode = !strcasecmp(cmd, "movzx") ? 0xB7 : 0xBF;


        // b->type = 8bit reg
        if(a->type == O_REG16 && b->type == O_REG8){
            uint8_t dest = find_reg16_index(a->reg);
            uint8_t src = find_reg8_index(b->reg);

            node->ins.pc = *pc;
            *s =  encode_two_byte_opcode_reg(machine_code, opcode - 1, dest, src, 16);
            *pc += pos;
        }

        if(a->type == O_REG32 && b->type == O_REG8){
            uint8_t dest = find_reg32_index(a->reg);
            uint8_t src = find_reg8_index(b->reg);

            node->ins.pc = *pc;
            *s =  encode_two_byte_opcode_reg(machine_code, opcode - 1, dest, src, 32);
            *pc += pos;
        }
    
        if(a->type == O_REG64 && b->type == O_REG8){
            uint8_t dest = find_reg64_index(a->reg);
            uint8_t src = find_reg8_index(b->reg);

            node->ins.pc = *pc;
            *s =  encode_two_byte_opcode_reg(machine_code, opcode - 1, dest, src, 64);
            *pc += pos;
        }

        
        // b->type = 16bit reg

        if(a->type == O_REG32 && b->type == O_REG16){
            uint8_t dest = find_reg32_index(a->reg);
            uint8_t src = find_reg16_index(b->reg);

            node->ins.pc = *pc;
            *s =  encode_two_byte_opcode_reg(machine_code, opcode, dest, src, 32);
            *pc += pos;
        }
    
        if(a->type == O_REG64 && b->type == O_REG16){
            uint8_t dest = find_reg64_index(a->reg);
            uint8_t src = find_reg16_index(b->reg);

            node->ins.pc = *pc;
            *s =  encode_two_byte_opcode_reg(machine_code, opcode, dest, src, 64);
            *pc += pos;
        }        

        // r16 <- r/m8
        if (a->type == O_REG16 && b->type == O_MEM && b->imm_sz == 1) {
            uint8_t dest = find_reg16_index(a->reg);

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode - 1, dest, &b->addr, 16);
            *pc += *s;
        }

        // r32 <- r/m8
        if (a->type == O_REG32 && b->type == O_MEM && b->imm_sz == 1) {
            uint8_t dest = find_reg32_index(a->reg);

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode - 1, dest, &b->addr, 32);
            *pc += *s;
        }

        // r64 <- r/m8
        if (a->type == O_REG64 && b->type == O_MEM && b->imm_sz == 1) {
            uint8_t dest = find_reg64_index(a->reg);

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode - 1, dest, &b->addr, 64);
            *pc += *s;
        }

        // r32 <- r/m16
        if (a->type == O_REG32 && b->type == O_MEM && b->imm_sz == 2) {
            uint8_t dest = find_reg32_index(a->reg);

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode, dest, &b->addr, 32);
            *pc += *s;
        }

        // r64 <- r/m16
        if (a->type == O_REG64 && b->type == O_MEM && b->imm_sz == 2) {
            uint8_t dest = find_reg64_index(a->reg);

            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode, dest, &b->addr, 64);
            *pc += *s;
        }

    } 

    // cmovcc
    if (!strncasecmp(cmd, "cmov", 4)) {

        uint8_t opcode = 0;

        if      (!strcasecmp(cmd, "cmovo"))  opcode = 0x40;
        else if (!strcasecmp(cmd, "cmovno")) opcode = 0x41;
        else if (!strcasecmp(cmd, "cmovb"))  opcode = 0x42;
        else if (!strcasecmp(cmd, "cmovc"))  opcode = 0x42;
        else if (!strcasecmp(cmd, "cmovnae"))opcode = 0x42;
        else if (!strcasecmp(cmd, "cmovae")) opcode = 0x43;
        else if (!strcasecmp(cmd, "cmovnb")) opcode = 0x43;
        else if (!strcasecmp(cmd, "cmovnc")) opcode = 0x43;
        else if (!strcasecmp(cmd, "cmove"))  opcode = 0x44;
        else if (!strcasecmp(cmd, "cmovz"))  opcode = 0x44;
        else if (!strcasecmp(cmd, "cmovne")) opcode = 0x45;
        else if (!strcasecmp(cmd, "cmovnz")) opcode = 0x45;
        else if (!strcasecmp(cmd, "cmovbe")) opcode = 0x46;
        else if (!strcasecmp(cmd, "cmovna")) opcode = 0x46;
        else if (!strcasecmp(cmd, "cmova"))  opcode = 0x47;
        else if (!strcasecmp(cmd, "cmovnbe"))opcode = 0x47;
        else if (!strcasecmp(cmd, "cmovs"))  opcode = 0x48;
        else if (!strcasecmp(cmd, "cmovns")) opcode = 0x49;
        else if (!strcasecmp(cmd, "cmovp"))  opcode = 0x4A;
        else if (!strcasecmp(cmd, "cmovpe")) opcode = 0x4A;
        else if (!strcasecmp(cmd, "cmovnp")) opcode = 0x4B;
        else if (!strcasecmp(cmd, "cmovpo")) opcode = 0x4B;
        else if (!strcasecmp(cmd, "cmovl"))  opcode = 0x4C;
        else if (!strcasecmp(cmd, "cmovnge"))opcode = 0x4C;
        else if (!strcasecmp(cmd, "cmovge")) opcode = 0x4D;
        else if (!strcasecmp(cmd, "cmovnl")) opcode = 0x4D;
        else if (!strcasecmp(cmd, "cmovle")) opcode = 0x4E;
        else if (!strcasecmp(cmd, "cmovng")) opcode = 0x4E;
        else if (!strcasecmp(cmd, "cmovg"))  opcode = 0x4F;
        else if (!strcasecmp(cmd, "cmovnle"))opcode = 0x4F;

        // r16 <- r16
        if (a->type == O_REG16 && b->type == O_REG16) {
            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code, opcode,
                find_reg16_index(a->reg),
                find_reg16_index(b->reg), 16);
            *pc += *s;
        }

        // r32 <- r32
        if (a->type == O_REG32 && b->type == O_REG32) {
            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code, opcode,
                find_reg32_index(a->reg),
                find_reg32_index(b->reg), 32);
            *pc += *s;
        }

        // r64 <- r64
        if (a->type == O_REG64 && b->type == O_REG64) {
            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code, opcode,
                find_reg64_index(a->reg),
                find_reg64_index(b->reg), 64);
            *pc += *s;
        }

        // r16 <- r/m16
        if (a->type == O_REG16 && b->type == O_MEM) {
            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode,
                find_reg16_index(a->reg),
                &b->addr, 16);
            *pc += *s;
        }

        // r32 <- r/m32
        if (a->type == O_REG32 && b->type == O_MEM) {
            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode,
                find_reg32_index(a->reg),
                &b->addr, 32);
            *pc += *s;
        }

        // r64 <- r/m64
        if (a->type == O_REG64 && b->type == O_MEM) {
            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode,
                find_reg64_index(a->reg),
                &b->addr, 64);
            *pc += *s;
        }
    }

    // setcc
    if (!strncasecmp(cmd, "set", 3)) {
        
        uint8_t opcode = 0;

        if      (!strcasecmp(cmd, "seto"))   opcode = 0x90;
        else if (!strcasecmp(cmd, "setno"))  opcode = 0x91;
        else if (!strcasecmp(cmd, "setb"))   opcode = 0x92;
        else if (!strcasecmp(cmd, "setc"))   opcode = 0x92;
        else if (!strcasecmp(cmd, "setnae")) opcode = 0x92;
        else if (!strcasecmp(cmd, "setae"))  opcode = 0x93;
        else if (!strcasecmp(cmd, "setnb"))  opcode = 0x93;
        else if (!strcasecmp(cmd, "setnc"))  opcode = 0x93;
        else if (!strcasecmp(cmd, "sete"))   opcode = 0x94;
        else if (!strcasecmp(cmd, "setz"))   opcode = 0x94;
        else if (!strcasecmp(cmd, "setne"))  opcode = 0x95;
        else if (!strcasecmp(cmd, "setnz"))  opcode = 0x95;
        else if (!strcasecmp(cmd, "setbe"))  opcode = 0x96;
        else if (!strcasecmp(cmd, "setna"))  opcode = 0x96;
        else if (!strcasecmp(cmd, "seta"))   opcode = 0x97;
        else if (!strcasecmp(cmd, "setnbe")) opcode = 0x97;
        else if (!strcasecmp(cmd, "sets"))   opcode = 0x98;
        else if (!strcasecmp(cmd, "setns"))  opcode = 0x99;
        else if (!strcasecmp(cmd, "setp"))   opcode = 0x9A;
        else if (!strcasecmp(cmd, "setpe"))  opcode = 0x9A;
        else if (!strcasecmp(cmd, "setnp"))  opcode = 0x9B;
        else if (!strcasecmp(cmd, "setpo"))  opcode = 0x9B;
        else if (!strcasecmp(cmd, "setl"))   opcode = 0x9C;
        else if (!strcasecmp(cmd, "setnge")) opcode = 0x9C;
        else if (!strcasecmp(cmd, "setge"))  opcode = 0x9D;
        else if (!strcasecmp(cmd, "setnl"))  opcode = 0x9D;
        else if (!strcasecmp(cmd, "setle"))  opcode = 0x9E;
        else if (!strcasecmp(cmd, "setng"))  opcode = 0x9E;
        else if (!strcasecmp(cmd, "setg"))   opcode = 0x9F;
        else if (!strcasecmp(cmd, "setnle")) opcode = 0x9F;

        // r/m8 <- 1/0
        if (a->type == O_REG8) {
            node->ins.pc = *pc;
            *s = encode_two_byte_opcode_reg(machine_code, opcode, 0, find_reg8_index(a->reg), 8);
            *pc += *s;
        }

        if (a->type == O_MEM) {
            node->ins.pc = *pc;
            *s = encode_inst_reg_rm2(machine_code, opcode, 0, &a->addr, 8);
            *pc += *s;
        }
    }

    // SSE XMM register instructions
    if (!strcasecmp(cmd, "movaps") ||
        !strcasecmp(cmd, "movups") ||
        !strcasecmp(cmd, "xorps")  ||
        !strcasecmp(cmd, "andps")  ||
        !strcasecmp(cmd, "andnps") ||
        !strcasecmp(cmd, "orps")   ||
        !strcasecmp(cmd, "addps")  ||
        !strcasecmp(cmd, "subps")  ||
        !strcasecmp(cmd, "mulps")  ||
        !strcasecmp(cmd, "divps")) {

        uint8_t opcode = 0;
        int store = 0;

        if (!strcasecmp(cmd, "movaps")) {
            opcode = 0x28;
        }
        else if (!strcasecmp(cmd, "movups")) {
            opcode = 0x10;
        }
        else if (!strcasecmp(cmd, "xorps")) {
            opcode = 0x57;
        }
        else if (!strcasecmp(cmd, "andps")) {
            opcode = 0x54;
        }
        else if (!strcasecmp(cmd, "andnps")) {
            opcode = 0x55;
        }
        else if (!strcasecmp(cmd, "orps")) {
            opcode = 0x56;
        }
        else if (!strcasecmp(cmd, "addps")) {
            opcode = 0x58;
        }
        else if (!strcasecmp(cmd, "mulps")) {
            opcode = 0x59;
        }
        else if (!strcasecmp(cmd, "subps")) {
            opcode = 0x5C;
        }
        else if (!strcasecmp(cmd, "divps")) {
            opcode = 0x5E;
        }


        // xmm, xmm
        if (a->type == O_XMM && b->type == O_XMM) {

            node->ins.pc = *pc;

            *s = encode_two_byte_opcode_reg( machine_code, opcode, find_xmm_index(a->reg), find_xmm_index(b->reg), 128);

            *pc += *s;
        }


        // xmm, [mem]
        if (a->type == O_XMM && b->type == O_MEM) {

            node->ins.pc = *pc;

            *s = encode_inst_reg_rm2(
                machine_code,
                opcode,
                find_xmm_index(a->reg),
                &b->addr,
                128
            );

            *pc += *s;
        }


        // [mem], xmm
        if (!strcasecmp(cmd, "movaps") ||
            !strcasecmp(cmd, "movups")) {

            if (a->type == O_MEM && b->type == O_XMM) {

                node->ins.pc = *pc;

                *s = encode_inst_reg_rm2(
                    machine_code,
                    opcode + 1,
                    find_xmm_index(b->reg),
                    &a->addr,
                    128
                );

                *pc += *s;
            }
        }
    }

    // lea - Load Effective Address

    else if(!strcasecmp(cmd, "lea")){
        if (a->type == O_REG64 && b->type == O_MEM) {
            uint8_t reg = find_reg64_index(a->reg);
            AddrExpr *mem = &b->addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, mem, 64, 0x8D, 0, 0);
            *pc += *s;
            
        }
        
    }
    
    // ABI SYSTEM-V
    else if(!strcasecmp(node->cmd, "syscall")){
        node->ins.pc = *pc;
        node->machine_code[0] = 0x0F;
        node->machine_code[1] = 0x05;
        *s = 2;
        *pc += 2;
    }

    // pop rip
    else if(!strcasecmp(cmd, "ret")){
        node->ins.pc = *pc;
        node->machine_code[0] = 0xC3;
        *s = 1;
        *pc += 1;   
    }

    else if(!strcasecmp(cmd, "nop")){
        node->ins.pc = *pc;
        node->machine_code[0] = 0x90;
        *s = 1;
        *pc += 1;
    }

    else if (is2arrin(Sign_extensions, (char*)cmd)) {
        if (strcasecmp(cmd, "cqo") == 0) {
            machine_code[0] = 0x48;
            machine_code[1] = 0x99;
            *s = 2;
        }
        else if (strcasecmp(cmd, "cdq") == 0) {
            machine_code[0] = 0x99;
            *s = 1;
        }
        else if (strcasecmp(cmd, "cwd") == 0) {
            machine_code[0] = 0x66;
            machine_code[1] = 0x99;
            *s = 2;
        }
        else if (strcasecmp(cmd, "cdqe") == 0) {
            machine_code[0] = 0x48;
            machine_code[1] = 0x98;
            *s = 2;
        }
        else if (strcasecmp(cmd, "cwde") == 0) {
            machine_code[0] = 0x98;
            *s = 1;
        }
        else if (strcasecmp(cmd, "cbw") == 0) {
            machine_code[0] = 0x66;
            machine_code[1] = 0x98;
            *s = 2;
        }

        *pc += *s;
    }



    if(*s == 0){
        printf("AmmAsm: Debug: !Instruction did\'t compile, operands:\n");
        printf("AmmAsm:%d: %s ", node->line, cmd);
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
                "?",
                node->ins.operands[i + 1].type == O_NONE ? "" : ", ");
        }
        puts("");
    }



    return *s;
}



void parse_size_directives(AST *node, uint64_t *pc){
    node->machine_code_len = 0;

    switch (node->type) {

    case AST_U8:
        for (int i = 0; i < node->u8.data_len; ++i)
            node->machine_code = append(
                (int *)&node->machine_code_len,
                (int *)&node->machine_code_cap,
                node->machine_code,
                &node->u8.data[i],
                sizeof(uint8_t));

        *pc += node->machine_code_len;
        break;

    case AST_U16:
        for (int i = 0; i < node->u16.data_len; ++i)
            node->machine_code = append(
                (int *)&node->machine_code_len,
                (int *)&node->machine_code_cap,
                node->machine_code,
                &node->u16.data[i],
                sizeof(uint16_t));

        *pc += (uint64_t)node->machine_code_len * sizeof(uint16_t);
        break;

    case AST_U32:
        for (int i = 0; i < node->u32.data_len; ++i)
            node->machine_code = append(
                (int *)&node->machine_code_len,
                (int *)&node->machine_code_cap,
                node->machine_code,
                &node->u32.data[i],
                sizeof(uint32_t));

        *pc += (uint64_t)node->machine_code_len * sizeof(uint32_t);
        break;

    case AST_U64: {
        int count = 0;

        for (int i = 0; i < node->u64.entries_len; ++i) {
            uint64_t value = 0;

            if (node->u64.entries[i].type != U64_EXPR)
                value = node->u64.entries[i].imm;

            node->machine_code = append(
                (int *)&count,
                (int *)&node->machine_code_cap,
                node->machine_code,
                &value,
                sizeof(uint64_t));
        }

        node->machine_code_len = count * sizeof(uint64_t);
        node->u64.pc = *pc;
        *pc += node->machine_code_len;
        break;
    }

    case AST_BSS_RES:
        if (!obj_file)
            node->machine_code_len = node->bss_res.res;
        break;
    }
}