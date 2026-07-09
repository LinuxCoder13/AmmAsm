#include "instruction_parse.h"

uint8_t parseInst(AST* node, uint64_t *pc) {
    if (node->type != AST_INS) return 0;
    int pos = 0;
    int err = 0;

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



    if((a.type == O_REG16 || a.type == O_REG8) && b.type == O_EXPR){
        fprintf(stderr, "AmmAsm:%d: Non-const expr doesn't fit in %s-bit register\n", node->line, a.type == O_REG8 ? "8" : "16");
        exit(1);
    }


    if (strcasecmp(cmd, "mov") == 0) {
    
        // ========================================================================
        // 1. MOV REG, IMM (reg <- imm)
        // ========================================================================
        
        // MOV R64, IMM64
        if (a.type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(b)) {

            uint8_t reg_idx = find_reg64_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, imm, 64);
            *pc += *s;
            
        }

        // MOV R32, IMM32
        else if (a.type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(b)) {

            uint8_t reg_idx = find_reg32_index(a.reg);
            uint32_t imm = (uint32_t)(b.imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint32_t)imm, 32);
            *pc += *s;
            
        }

        // MOV R16, IMM16
        else if (a.type == O_REG16 && b.type == O_IMM) {

            uint8_t reg_idx = find_reg16_index(a.reg);
            uint16_t imm = (uint16_t)(b.imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (uint16_t)imm, 16);
            *pc += *s;
            
        }

        // MOV R8, IMM8/CHAR
        else if (a.type == O_REG8 && (b.type == O_IMM || b.type == O_CHAR)) {

            uint8_t c = b.c;
            uint8_t reg_idx = find_reg8_index(a.reg);
            uint8_t imm = (uint8_t)(b.imm);

            node->ins.pc = *pc;
            *s = encode_mov_reg_imm(machine_code, reg_idx, (b.type == O_CHAR) ? (uint8_t)c : (uint8_t)imm, 8);
            *pc += *s;
            
        }


        // ========================================================================
        // 2. MOV REG, REG (reg <- reg) (mod = 11)
        // ========================================================================

        // MOV R64, R64
        else if (a.type == O_REG64 && b.type == O_REG64) {
        
            uint8_t rm = find_reg64_index(a.reg);
            uint8_t reg = find_reg64_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 64);
            *pc += *s;
            
        }

        // MOV R32, R32
        else if (a.type == O_REG32 && b.type == O_REG32) {
        
            uint8_t rm = find_reg32_index(a.reg);
            uint8_t reg = find_reg32_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 32);
            *pc += *s;
            
        }

        // MOV R16, R16
        else if (a.type == O_REG16 && b.type == O_REG16) {
        
            uint8_t rm = find_reg16_index(a.reg);
            uint8_t reg = find_reg16_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 16);
            *pc += *s;
            
        }

        // MOV R8, R8
        else if (a.type == O_REG8 && b.type == O_REG8) {
        
            uint8_t rm = find_reg8_index(a.reg);
            uint8_t reg = find_reg8_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_mov_reg_reg(machine_code, rm, reg, 8);
            *pc += *s;
            
        }


        // ========================================================================
        // 3. MOV REG, [ADDR] (mem <- reg)
        // ========================================================================


        // MOV R64, [ADDR]
        else if (a.type == O_REG64 && b.type == O_MEM) {
            uint8_t reg = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 64, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R32, [ADDR]
        else if (a.type == O_REG32 && b.type == O_MEM) {
            uint8_t reg = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 32, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R16, [ADDR]
        else if (a.type == O_REG16 && b.type == O_MEM) {
            uint8_t reg = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 16, 0x8B, 0, 0);
            *pc += *s;
            
        }

        // MOV R8, [ADDR]
        else if (a.type == O_REG8 && b.type == O_MEM) {
            uint8_t reg = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 8, 0x8A, 0, 0);
            *pc += *s;
            
        }

        // ========================================================================
        // 4. MOV [ADDR], REG (mem -> reg)
        // ========================================================================


        // MOV [ADDR], R64
        else if (a.type == O_MEM && b.type == O_REG64) {
            uint8_t reg = find_reg64_index(b.reg);
            AddrExpr mem = a.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 64, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R32
        else if (a.type == O_MEM && b.type == O_REG32) {
            uint8_t reg = find_reg32_index(b.reg);
            AddrExpr mem = a.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 32, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R16
        else if (a.type == O_MEM && b.type == O_REG16) {
            uint8_t reg = find_reg16_index(b.reg);
            AddrExpr mem = a.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 16, 0x89, 0, 0);
            *pc += *s;
            
        }

        // MOV [ADDR], R8
        else if (a.type == O_MEM && b.type == O_REG8) {
            uint8_t reg = find_reg8_index(b.reg);
            AddrExpr mem = a.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 8, 0x88, 0, 0);
            *pc += *s;
            
        }


        else if (a.type == O_MEM && IS_EXPR_OR_IMM_OR_PC(b) || b.type == O_CHAR){
            AddrExpr mem = a.addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){
                case 1: *s = encode_inst_rm_rm(machine_code, 0, &mem, 8, 0xC6, 1,  b.type == O_IMM ? b.imm : b.c); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 0, &mem, 16, 0xC7, 2, b.type == O_IMM ? b.imm : b.c); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 0, &mem, 32, 0xC7, 4, b.type == O_IMM ? b.imm : b.c); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 0, &mem, 64, 0xC7, 4, b.type == O_IMM ? b.imm : b.c); break; // no mov [mem], imm64
            }
            *pc += *s;
            
        }
        
    }

    // add -> add two operands 

    else if(strcasecmp(node->cmd, "add") == 0){
        
        // =====================================
        // ADD reg, imm (mod = 11)
        // =====================================

        // add r/m64, imm32
        if(a.type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(b)){
            uint8_t reg = find_reg64_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_add_imm(machine_code, reg, b.imm, 64, b.type == O_EXPR); 
            *pc += *s;
            
        }

        // add r/m32, imm32
        else if(a.type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(b)){
            uint8_t reg = find_reg32_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_add_imm(machine_code, reg, b.imm, 32, b.type == O_EXPR); 
            *pc += *s;
            
        }

        // add r/m16, imm16
        else if(a.type == O_REG16 && b.type == O_IMM){
            uint8_t reg = find_reg16_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_add_imm(machine_code, reg, b.imm, 16, 0); 
            *pc += *s;
            
        }

        // add r/m8, imm8
        else if(a.type == O_REG8 && b.type == O_IMM){
            uint8_t reg = find_reg8_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_add_imm(machine_code, reg, b.imm, 8, 0); 
            *pc += *s;
            
        }

        // ===========================================
        // 2. add reg, reg (mod = 11)
        // ===========================================
        
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src  = find_reg64_index(b.reg);
            
            node->ins.pc = *pc;
            *s = encode_add_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
            
        }

        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src  = find_reg32_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_add_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
            
        }

        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src  = find_reg16_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_add_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
            
        }

        else if(a.type == O_REG8 && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            uint8_t src  = find_reg8_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_add_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
            
        }

        // ===================
        // 3. add reg, [addr]
        // ===================

        else if(a.type == O_REG64 && b.type == O_MEM){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x03, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG32 && b.type == O_MEM){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x03, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG16 && b.type == O_MEM){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x03, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG8 && b.type == O_MEM){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;
            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x02, 0, 0);
            *pc += *s;
            
        }

        // ================
        // add [addr], reg
        // ================

        else if(a.type == O_MEM && b.type == O_REG64){
            uint8_t src = find_reg64_index(b.reg);
            AddrExpr mem = a.addr;

            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, &mem, 64, 0x01, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG32){
            uint8_t src = find_reg32_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, &mem, 32, 0x01, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG16){
            uint8_t src = find_reg16_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, &mem, 16, 0x01, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG8){
            uint8_t src = find_reg8_index(b.reg);
            AddrExpr mem = a.addr;

            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, src, &mem, 8, 0x00, 0, 0);
            *pc += *s;
            
        }

        else if (a.type == O_MEM && IS_EXPR_OR_IMM_OR_PC(b) || b.type == O_CHAR){
            AddrExpr mem = a.addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){
                case 1: *s = encode_inst_rm_rm(machine_code, 0, &mem, 8,  0x80, 1, b.type == O_IMM ? b.imm : b.c); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 0, &mem, 16, 0x81, 2, b.type == O_IMM ? b.imm : b.c); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 0, &mem, 32, 0x81, 4, b.type == O_IMM ? b.imm : b.c); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 0, &mem, 64, 0x81, 4, b.type == O_IMM ? b.imm : b.c); break; // no mov [mem], imm64
            }
            *pc += *s;
            
        }
        
    }


    // sub - Subtract

    else if(strcasecmp(node->cmd, "sub") == 0){
        
        // =====================================
        // SUB reg, imm (mod = 11)
        // =====================================

        // sub r/m64, imm32
        if(a.type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(b)){
            uint8_t reg = find_reg64_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_sub_imm(machine_code, reg, b.imm, 64, b.type == O_EXPR); 
            *pc += *s;
        }

        // sub r/m32, imm32
        else if(a.type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(b)){
            uint8_t reg = find_reg32_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_sub_imm(machine_code, reg, b.imm, 32, b.type == O_EXPR); 
            *pc += *s;
        }

        // sub r/m16, imm16
        else if(a.type == O_REG16 && b.type == O_IMM){
            uint8_t reg = find_reg16_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_sub_imm(machine_code, reg, b.imm, 16, 0); 
            *pc += *s;
        }

        // sub r/m8, imm8
        else if(a.type == O_REG8 && (b.type == O_IMM || b.type == O_CHAR)){
            uint8_t reg = find_reg8_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_sub_imm(machine_code, reg, b.type == O_IMM ? b.imm : b.c, 8, 0); 
            *pc += *s;
        }

        // ===========================================
        // 2. sub reg, reg (mod = 11)
        // ===========================================
        
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src  = find_reg64_index(b.reg);
            
            node->ins.pc = *pc;
            *s = encode_sub_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
            
        }

        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src  = find_reg32_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_sub_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
            
        }

        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src  = find_reg16_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_sub_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
            
        }

        else if(a.type == O_REG8 && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            uint8_t src  = find_reg8_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_sub_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
            
        }

        // ===================
        // 3. sub reg, [addr]
        // ===================

        else if(a.type == O_REG64 && b.type == O_MEM){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x2B, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG32 && b.type == O_MEM){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x2B, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG16 && b.type == O_MEM){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x2B, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG8 && b.type == O_MEM){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;

            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x2A, 0, 0);
            *pc += *s;
            
        }

        // ================
        // sub [addr], reg
        // ================

        else if(a.type == O_MEM && b.type == O_REG64){
            uint8_t dest = find_reg64_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x29, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG32){
            uint8_t dest = find_reg32_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x29, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG16){
            uint8_t dest = find_reg16_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x29, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG8){
            uint8_t dest = find_reg8_index(b.reg);
            AddrExpr mem = a.addr;

            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x28, 0, 0);
            *pc += *s;
            
        }

        else if (a.type == O_MEM && IS_EXPR_OR_IMM_OR_PC(b) || b.type == O_CHAR){
            AddrExpr mem = a.addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){
                case 1: *s = encode_inst_rm_rm(machine_code, 5, &mem, 8, 0x80, 1, b.type == O_IMM ? b.imm : b.c); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 5, &mem, 16, 0x81, 2, b.type == O_IMM ? b.imm : b.c); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 5, &mem, 32, 0x81, 4, b.type == O_IMM ? b.imm : b.c); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 5/* /5 - sub */, &mem, 64, 0x81, 4, b.type == O_IMM ? b.imm : b.c); break; 
            }
            *pc += *s;
            
        }
        
    }

    // IMUL - Signed Multiply
    else if(!strcasecmp(cmd, "imul")){
        // imul r64
        if(a.type == O_REG64 && b.type == O_NONE){
            uint8_t reg = find_reg64_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 64);
            *pc += *s;
        }

        // imul r32
        else if(a.type == O_REG32 && b.type == O_NONE){
            uint8_t reg = find_reg32_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 32);
            *pc += *s;
        }

        // imul r16
        else if(a.type == O_REG16 && b.type == O_NONE){
            uint8_t reg = find_reg16_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg(machine_code, reg, 16);
            *pc += *s;
        }

        // imul r8
        else if(a.type == O_REG8 && b.type == O_NONE){
            uint8_t reg = find_reg8_index(a.reg);
            node->ins.pc = *pc;
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
            node->ins.pc = *pc;
            *s = encode_imul_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
        }

        // imul r32, r32
        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t src = find_reg32_index(a.reg);
            uint8_t dest = find_reg32_index(b.reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
        }

        // imul r16, r16
        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t src = find_reg16_index(a.reg);
            uint8_t dest = find_reg16_index(b.reg);
            node->ins.pc = *pc;
            *s = encode_imul_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
        }

        // =====================================
        // imul reg, reg, imm 
        // =====================================

        // imul r64, r64, imm32/imm8
        if (a.type == O_REG64 && b.type == O_REG64 && IS_EXPR_OR_IMM_OR_PC(c)) {
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src = find_reg64_index(b.reg);
            uint64_t imm = c.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 64, c.type == O_EXPR);
            *pc += *s;
            
        }

        // imul r32, r32, imm32/imm8
        else if (a.type == O_REG32 && b.type == O_REG32 && IS_EXPR_OR_IMM_OR_PC(c)) {
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src = find_reg32_index(b.reg);
            uint64_t imm = c.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 32, c.type == O_EXPR);
            *pc += *s;
            
        }

        // imul r16, r16, imm16/imm8
        else if (a.type == O_REG16 && b.type == O_REG16 && c.type == O_IMM) {
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src = find_reg16_index(b.reg);
            uint64_t imm = c.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, dest, src, imm, 16, c.type == O_EXPR);
            *pc += *s;
            
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
            
        }

        // imul r32, imm
        else if (a.type == O_REG32 && (b.type == O_IMM || b.type == O_EXPR) && c.type == O_NONE) {
            uint8_t reg = find_reg32_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 32, b.type == O_EXPR);
            *pc += *s;
            
        }

        // imul r16, imm
        else if (a.type == O_REG16 && b.type == O_IMM) {
            uint8_t reg = find_reg16_index(a.reg);
            uint64_t imm = b.imm;

            node->ins.pc = *pc;
            *s = encode_imul_reg_reg_imm(machine_code, reg, reg, imm, 16, b.type == O_EXPR);
            *pc += *s;
            
        }
        
    }

    // DIV—Unsigned Divide
    else if(!strcasecmp(cmd, "div")){
        
        // div reg64        
        if(a.type == O_REG64){
            uint8_t src = find_reg64_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 6, src, 64);
            *pc += *s;
        }

        // div reg32      
        else if(a.type == O_REG32){
            uint8_t src = find_reg32_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 6, src, 32);
            *pc += *s;
        }

        // div reg16        
        else if(a.type == O_REG16){
            uint8_t src = find_reg16_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 6, src, 16);
            *pc += *s;
        }

        // div reg8        
        else if(a.type == O_REG8){
            uint8_t src = find_reg8_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 6, src, 8);
            *pc += *s;
        }

        // =========
        // div [mem] 
        // =========       
        else if(a.type == O_MEM){
            AddrExpr mem = a.addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){                 /* div [mem] does not gain imm*/
                case 1: *s = encode_inst_rm_rm(machine_code, 6, &mem, 8,  0xF6, 111, 0); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 6, &mem, 16, 0xF7, 111, 0); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 6, &mem, 32, 0xF7, 111, 0); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 6, &mem, 64, 0xF7, 111, 0); break; 
            }
            *pc += *s;
            
        }

    }
 
    // IDIV—Signed Divide
    else if(!strcasecmp(cmd, "idiv")){
        
        // idiv reg64        
        if(a.type == O_REG64){
            uint8_t src = find_reg64_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 7, src, 64);
            *pc += *s;
        }

        // idiv reg32      
        else if(a.type == O_REG32){
            uint8_t src = find_reg32_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 7, src, 32);
            *pc += *s;
        }

        // idiv reg16        
        else if(a.type == O_REG16){
            uint8_t src = find_reg16_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 7, src, 16);
            *pc += *s;
        }

        // idiv reg8        
        else if(a.type == O_REG8){
            uint8_t src = find_reg8_index(a.reg);

            *s = encode_div_or_idiv_reg(machine_code, 7, src, 8);
            *pc += *s;
        }


        // =========
        // idiv [mem] 
        // =========       
        else if(a.type == O_MEM){
            AddrExpr mem = a.addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){                 /* idiv [mem] does not gain imm*/
                case 1: *s = encode_inst_rm_rm(machine_code, 7, &mem, 8,  0xF6, 111, 0); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 7, &mem, 16, 0xF7, 111, 0); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 7, &mem, 32, 0xF7, 111, 0); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 7, &mem, 64, 0xF7, 111, 0); break; 
            }
            *pc += *s;
            
        }
    }

    else if (is2arrin(Sign_extensions, (char*)cmd)) {
        if (strcasecmp(cmd, "cqo") == 0) {
            machine_code[0] = 0x48;
            machine_code[1] = 0x99;
            *s = 2;
        }
        else if (strcasecmp(cmd, "cdq") == 0 ||
                strcasecmp(cmd, "cwd") == 0) {
            machine_code[0] = 0x99;
            *s = 1;
        }
        else if (strcasecmp(cmd, "cdqe") == 0) {
            machine_code[0] = 0x48;
            machine_code[1] = 0x98;
            *s = 2;
        }
        else if (strcasecmp(cmd, "cwde") == 0 ||
                strcasecmp(cmd, "cbw") == 0) {
            machine_code[0] = 0x98;
            *s = 1;
        }

        *pc += *s;
    }

    // место для документации jmp/call
    
    else if(!strcasecmp(cmd, "jmp") || !strcasecmp(cmd, "call")) {
        
        // =========================
        // JMP/CALL label (REL32)
        // =========================
        if(a.type == O_EXPR || a.type == O_PC) { 
            uint8_t opcode = (!strcasecmp(cmd, "jmp")) ? 0xE9 : 0xE8;

            machine_code[0] = opcode;
            *(uint32_t*)(machine_code + 1) = 0x0;
        
            node->ins.pc = *pc;
            *s = 5;
            *pc += 5;
            
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
            
            node->ins.pc = *pc;
            *s = 3;
            *pc += 3;
            
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
            
            node->ins.pc = *pc;
            *s = encode_cmp_imm(machine_code, reg, b.imm, 16, 0); 
            *pc += *s;
        }

        // cmp r/m8, imm8
        else if(a.type == O_REG8 && (b.type == O_IMM || b.type == O_CHAR)){
            uint8_t reg = find_reg8_index(a.reg);

            node->ins.pc = *pc;
            *s = encode_cmp_imm(machine_code, reg, b.type == O_IMM ? b.imm : b.c, 8, 0); 
            *pc += *s;
        }

        // ===========================================
        // 2. cmp reg, reg (mod = 11)
        // ===========================================
        
        else if(a.type == O_REG64 && b.type == O_REG64){
            uint8_t dest = find_reg64_index(a.reg);
            uint8_t src  = find_reg64_index(b.reg);
            
            node->ins.pc = *pc;
            *s = encode_cmp_reg_reg(machine_code, dest, src, 64);
            *pc += *s;
            
        }

        else if(a.type == O_REG32 && b.type == O_REG32){
            uint8_t dest = find_reg32_index(a.reg);
            uint8_t src  = find_reg32_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_cmp_reg_reg(machine_code, dest, src, 32);
            *pc += *s;
            
        }

        else if(a.type == O_REG16 && b.type == O_REG16){
            uint8_t dest = find_reg16_index(a.reg);
            uint8_t src  = find_reg16_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_cmp_reg_reg(machine_code, dest, src, 16);
            *pc += *s;
            
        }

        else if(a.type == O_REG8 && b.type == O_REG8){
            uint8_t dest = find_reg8_index(a.reg);
            uint8_t src  = find_reg8_index(b.reg);

            node->ins.pc = *pc;
            *s = encode_cmp_reg_reg(machine_code, dest, src, 8);
            *pc += *s;
            
        }

        // ===================
        // 3. cmp reg, [addr]
        // ===================

        else if(a.type == O_REG64 && b.type == O_MEM){
            uint8_t dest = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x3B, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG32 && b.type == O_MEM){
            uint8_t dest = find_reg32_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x3B, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG16 && b.type == O_MEM){
            uint8_t dest = find_reg16_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x3B, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_REG8 && b.type == O_MEM){
            uint8_t dest = find_reg8_index(a.reg);
            AddrExpr mem = b.addr;

            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x3A, 0, 0);
            *pc += *s;
            
        }

        // ================
        // cmp [addr], reg
        // ================

        else if(a.type == O_MEM && b.type == O_REG64){
            uint8_t dest = find_reg64_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 64, 0x39, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG32){
            uint8_t dest = find_reg32_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 32, 0x39, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG16){
            uint8_t dest = find_reg16_index(b.reg);
            AddrExpr mem = a.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 16, 0x39, 0, 0);
            *pc += *s;
            
        }

        else if(a.type == O_MEM && b.type == O_REG8){
            uint8_t dest = find_reg8_index(b.reg);
            AddrExpr mem = a.addr;

            
            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, dest, &mem, 8, 0x38, 0, 0);
            *pc += *s;
            
        }

        else if (a.type == O_MEM && (IS_EXPR_OR_IMM_OR_PC(b) || b.type == O_CHAR)){
            AddrExpr mem = a.addr;
            
            node->ins.pc = *pc;
            switch (node->ins.operands[1].imm_sz){
                case 1: *s = encode_inst_rm_rm(machine_code, 7, &mem, 8, 0x80, 1,  b.type == O_IMM ? b.imm : b.c); break;
                case 2: *s = encode_inst_rm_rm(machine_code, 7, &mem, 16, 0x81, 2, b.type == O_IMM ? b.imm : b.c); break;
                case 4: *s = encode_inst_rm_rm(machine_code, 7, &mem, 32, 0x81, 4, b.type == O_IMM ? b.imm : b.c); break;
                case 8: *s = encode_inst_rm_rm(machine_code, 7/* /7 - cmp */, &mem, 64, 0x81, 4, b.type == O_IMM ? b.imm : b.c); break; 
            }
            *pc += *s;
            
        }
 
    }

    // lea - Load Effective Address

    else if(!strcasecmp(cmd, "lea")){
        if (a.type == O_REG64 && b.type == O_MEM) {
            uint8_t reg = find_reg64_index(a.reg);
            AddrExpr mem = b.addr;


            node->ins.pc = *pc;
            *s = encode_inst_rm_rm(machine_code, reg, &mem, 64, 0x8D, 0, 0);
            *pc += *s;
            
        }
        
    }

    // push reg into stack
    else if(!strcasecmp(cmd, "push")){
        // ==============
        // push reg
        // ==============

        if(a.type == O_REG64){
            uint8_t reg = find_reg64_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 64);
            *pc += *s;
            
        }

        // N.E in 64 bit mode!
        else if(a.type == O_REG32){
            uint8_t reg = find_reg32_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 32);
            *pc += *s;
            
        }

        else if(a.type == O_REG16){
            uint8_t reg = find_reg16_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 16);
            *pc += *s;
            
        }

        else if(a.type == O_REG8){
            uint8_t reg = find_reg8_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_push_reg(machine_code, reg, 8);
            *pc += *s;
            
        }
        
    }


    // pop reg from stack
    else if(!strcasecmp(cmd, "pop")){
        // ==============
        // pop reg
        // ==============

        if(a.type == O_REG64){
            uint8_t reg = find_reg64_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 64);
            *pc += *s;
            
        }

        // N.E in 64 bit mode!
        else if(a.type == O_REG32){
            uint8_t reg = find_reg32_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 32);
            *pc += *s;
            
        }

        else if(a.type == O_REG16){
            uint8_t reg = find_reg16_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 16);
            *pc += *s;
            
        }

        else if(a.type == O_REG8){
            uint8_t reg = find_reg8_index(a.reg);
            node->ins.pc = *pc;
            *s = encode_pop_reg(machine_code, reg, 8);
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
                "?",
                node->ins.operands[i + 1].type == O_NONE ? "" : ", ");
        }
        puts("");
    }



    return *s;
}



void parse_size_directives(AST* node, uint64_t *pc) {
    int type = node->type;
    uint8_t *mc = (uint8_t*)node->machine_code;

    switch(type) {
        case AST_U8:
            memcpy(mc, node->u8.data, node->u8.data_len);
            node->machine_code_size = node->u8.data_len; 
            *pc += node->u8.data_len;
            break;

        case AST_U16: {
            int offset = 0;
            for(int i = 0; i < node->u16.data_len; ++i){
                *(uint16_t*)(mc + offset) = (uint16_t)node->u16.data[i];
                offset += sizeof(uint16_t);
            }
            node->machine_code_size = offset; 
            *pc += offset;
            break;
        }

        case AST_U32: {
            int offset = 0;
            for(int i = 0; i < node->u32.data_len; ++i){
                *(uint32_t*)(mc + offset) = node->u32.data[i];
                offset += sizeof(uint32_t);
            }
            node->machine_code_size = offset;
            *pc += offset;
            break;
        }

        case AST_U64: {
            int offset = 0;
            for(int i = 0; i < node->u64.entries_len; ++i){
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