#include "encoder.h"

/*
Address format: b=reg, i=reg, s=num, d=num
 Example: b=rbx, i=rcx, s=4, d=0x10
 
 Rules:
   b and i: register names
   s: 1,2,4,8 only
   d: any number
   scale requires index
   rsp can't be index
*/

AddrExpr parse_addr_expr(const uint8_t* expr, int line) {
    AddrExpr new = { 0 };
    const uint8_t *p = expr;
    uint8_t find_b = 0, find_i = 0, find_s = 0, find_d = 0; 
    uint8_t base[64]  = {0};
    uint8_t index[16] = {0};
    uint8_t scale[8]  = {0};
    uint8_t disp[32]  = {0};

    scale[0] = '1';
    scale[1] = '\0';

    disp[0] = '0';
    disp[1] = '\0';

    while (*p) {
        if(*p == 'b' || *p == 'B'){
            find_b = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm:%d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while(*p && *p != ',' &&  i < (int)(sizeof(base)) - 1)
                base[i++] = *p++;
            base[i] = '\0';
            if (*p == ',') p++;
        }

        else if(*p == 'i' || *p == 'I'){
            find_i = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm:%d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while(*p && *p != ',' &&  i < (int)(sizeof(index)) - 1)
                index[i++] = *p++;
            index[i] = '\0';
            if (*p == ',') p++;
        }

        else if(*p == 's' || *p == 'S'){
            find_s = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm:%d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while((*p >= '0' && *p <= '9') && i < sizeof(scale)-1) scale[i++] = *p++;
            scale[i] = '\0';
            if (*p == ',') p++;
        }

        else if(*p == 'd' || *p == 'D'){
            find_d = 1; p++;
            if(!*p || *p != '='){ fprintf(stderr, "AmmAsm:%d: SIB syntax error\n", line); exit(1);}
            p++;
            int i = 0;
            while (*p && *p != ',' && i < sizeof(disp)-1) {
                disp[i++] = *p++;
            }
            disp[i] = '\0';
            if (*p == ',') p++;
        } 
        else {
            fprintf(stderr, "AmmAsm:%d: unknown key '%c'\n", line, *p);
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
        fprintf(stderr, "AmmAsm:%d: scale used without index register\n", line);
        exit(1);
    }

    if (new.have_index && strcasecmp(index, "rsp") == 0) {
        fprintf(stderr, "AmmAsm:%d: rsp cannot be used as index register\n", line);
        exit(1);
    }

    if (new.scale && !(new.scale == 1 || new.scale == 2 || new.scale == 4 || new.scale == 8)) {
        fprintf(stderr, "AmmAsm:%d: invalid scale factor %d (must be 1,2,4,8)\n", line, new.scale);
        exit(1);
    }

    if (((disp[0] >= 'A' && disp[0] <= 'Z') || (disp[0] >= 'a' && disp[0] <= 'z') || disp[0] == '.' || disp[0] == '_')){
        fprintf(stderr, "AmmAsm:%d: disp can't be label\n", line);
        exit(1);
    }

    if (!new.have_base && !new.have_index && !new.have_disp) {
        fprintf(stderr, "AmmAsm:%d: addressing mode must have at least base, index or displacement\n", line);
        exit(1);
    }


    if (new.have_index && !(is2arrin(regs64, index) || is2arrin(regs64GP, index))) {
        fprintf(stderr, "AmmAsm:%d: invalid index register name '%s'\n", line, index);
        exit(1);
    }
    
    if (new.have_base && !(is2arrin(regs64, base) || is2arrin(regs64GP, base))) {
        strncpy(new.label, base, sizeof new.label);
        new.label[sizeof(new.label) - 1] = '\0';
        new.is_rip_rel = 1;
        new.have_base = 0;
    }

    else if (!new.have_base && new.have_index && !new.have_disp) {
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



// most powerfull encoder in AmmAsm!!!!!!!!!!!!!!!!!!

// inst reg, [addr] | inst [addr], reg/imm
uint8_t encode_inst_rm_rm(uint8_t *mash_code, uint8_t reg, AddrExpr *expr, uint8_t sz,  uint8_t opcode, uint8_t imm_sz, uint64_t imm){
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
        case 8:  if(reg >= 4 && imm_sz == 0) rex |= REX_BASE; break;
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

    if ((expr->have_base || expr->have_index) && expr->have_disp && expr->disp == 0){
        expr->have_disp = 0;
    }
    if(!expr->have_disp){ mod = 0b00; expr->have_disp = 0;}
    else if(expr->disp >= -128 && expr->disp <= 127){ mod = 0b01; expr->have_disp = 1; disp_sz = 1;} 
    else /* disp fits in int32_t */ {mod = 0b10; expr->have_disp = 1; disp_sz = 4;}
   
    // 8, 9
    if (expr->have_index && !expr->is_rip_rel) {
        if ((base & 7) == 0b101 && !expr->have_disp) {
            mod = 0b01;
            expr->disp = 0;
            expr->have_disp = 1;
            disp_sz = 1;
        }
        modrm = emit_modrm(mod, reg, 0b100);
        sib   = emit_sib(scale, index, base);
        need_sib = 1;
    }

    // 4, 5, 6
    else if ((base & 7) == 0b100) {
        modrm = emit_modrm(mod, reg, 0b100);
        sib   = emit_sib(0b00, 0b100, base);
        need_sib = 1;
    }

    // 7
    else if ((base & 7) == 0b101) {

        if (!expr->have_disp) {
            mod = 0b01;
            expr->disp = 0;
            disp_sz = 1;
            expr->have_disp = 1;
        }

        modrm = emit_modrm(mod, reg, base);
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


    if(expr->is_rip_rel && !expr->have_base && expr->have_index){
        fprintf(stderr, "AmmAsm: RIP-relative addressing cannot use index register");
        exit(1);
    }
    
    if(rex != 0) mash_code[pos++] = rex | REX_BASE;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;
    if(need_sib) mash_code[pos++] = sib;
    
    if(expr->have_disp && !expr->is_rip_rel){
        if(disp_sz == 1) mash_code[pos++] = (uint8_t)expr->disp;
        else {*(uint32_t*)(mash_code + pos) = expr->disp; pos+=4; }
    }
    
    if(expr->is_rip_rel){*(uint32_t*)(mash_code + pos) = 0x0; pos+=4; } // placeholder
    
    if(imm_sz > 0){
        switch(imm_sz){
            case 1: mash_code[pos++] = imm & 0xFF; break;
            case 2: *(uint16_t*)(mash_code + pos) = imm & 0XFFFF; pos+=2; break;
            case 4: *(uint32_t*)(mash_code + pos) = imm & 0xFFFFFFFF; pos+=4; break;
        }
    }
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

uint8_t encode_div_or_idiv_reg(uint8_t* mash_code, uint8_t reg ,uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t opcode = sz == 8 ? 0xF6 : 0xF7;
    uint8_t modrm = 0;
    int pos = 0;

    uint8_t rm = src;

    if(src >= 8){
        rm -= 8;
        rex |= REX_BASE | REX_B;
    }

    switch(sz){
        case 8 : { if(src >= 4 && src <= 7){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, reg, rm);

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;  
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
uint8_t encode_push_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t opcode = 0x50;
   // uint8_t opcode2[] = {0x0F, 0xA0};
    int pos = 0;

    uint8_t src = reg;

    if(reg >= 8){
        rex |= REX_BASE | REX_B;
        src -= 8;
    }

    switch(sz){
        case 8: if(reg >= 4 && reg <= 7) rex |= REX_BASE; break;
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: fprintf(stderr, "AmmAsm: instruction 'push' not supported 32-bit register in 64-bit mode\n"); exit(1); 
        case 64: break; // no need rex.w
    }

    opcode += src;

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    return pos;
}

uint8_t encode_pop_reg(uint8_t *mash_code, uint8_t reg, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t opcode = 0x58;
    int pos = 0;

    uint8_t src = reg;

    if(reg >= 8){
        rex |= REX_BASE | REX_B;
        src -= 8;
    }

    switch(sz){
        case 8: fprintf(stderr, "AmmAsm: instruction 'pop' not supported 8-bit register\n"); exit(1);
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: fprintf(stderr, "AmmAsm: instruction 'pop' not supported 32-bit register in 64-bit mode\n"); exit(1);
        case 64: break; // no need rex.w
    }

    opcode += src;

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    return pos;
}


uint8_t encode_xor_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
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
            mash_code[pos++] = 0x34;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x35;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b110, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_xor_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x30 : 0x31; 
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


uint8_t encode_adc_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
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
            mash_code[pos++] = 0x14;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x15;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b010, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_adc_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x10 : 0x11; 
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

uint8_t encode_or_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
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
            mash_code[pos++] = 0x0C;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x0D;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b001, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_or_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x08 : 0x09; 
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

uint8_t encode_sbb_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
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
            mash_code[pos++] = 0x1C;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x1D;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b011, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_sbb_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x18 : 0x19; 
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

uint8_t encode_and_imm(uint8_t *mash_code, uint8_t reg, uint32_t imm, uint8_t sz, int is_expr){
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
            mash_code[pos++] = 0x24;
            mash_code[pos++] = (uint8_t)imm;
        } 
        else {
            mash_code[pos++] = 0x25;
            if (sz == 16) { *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
            else {*(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
        }

        return pos;
    }

    modrm = emit_modrm(0b11, 0b100, rm);

    if (rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    if (opcode == 0x83) mash_code[pos++] = (uint8_t)imm;
    else if (sz == 16){ *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos += 2;}
    else if (sz == 32 || sz == 64){ *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos += 4;}
    else mash_code[pos++] = (uint8_t)imm;

    return pos;
}

uint8_t encode_and_reg_reg(uint8_t *mash_code, uint8_t dest, uint8_t src, uint8_t sz){
    uint8_t legacy_prefix = 0x66;  // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x20 : 0x21; 
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


// test reg, reg
uint8_t encode_test_reg_reg(uint8_t *mash_code, uint8_t dest_idx, uint8_t src_idx, uint8_t sz){
    uint8_t legacy_prefix = 0x66; // 16 bit 
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0x84 : 0x85;
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
    mash_code[pos++] = emit_modrm(0b11, reg, rm);

    return pos;
}

uint8_t encode_group2_reg_imm(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t imm, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm = dest;
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz){
        case 8 : { if((dest >= 4 && dest <= 7)){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, group_digit, rm);

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;
    if(imm != 1) mash_code[pos++] = imm;

    return pos;
}

uint8_t encode_group2_reg_cl(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm = dest;
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz){
        case 8 : { if((dest >= 4 && dest <= 7)){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, group_digit, rm);

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
}


uint8_t encode_group3_reg(uint8_t* mash_code, uint8_t dest, uint8_t opcode, uint8_t group_digit, uint8_t sz){
    uint8_t legacy_prefix = 0x66;
    uint8_t rex = 0;
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm = dest;
    if(dest >= 8){
        rex |= REX_BASE | REX_B;
        rm -= 8;
    }

    switch(sz){
        case 8 : { if((dest >= 4 && dest <= 7)){ rex |= REX_BASE;} break; } // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break;
        case 64: rex |= REX_BASE | REX_W; break;
    }

    modrm = emit_modrm(0b11, group_digit, rm);

    if(rex) mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    return pos;
}

uint8_t encode_test_reg_imm(uint8_t *mash_code, uint8_t reg_idx, uint64_t imm, uint8_t sz){
    uint8_t legacy_prefix = 0x66; // 16 bit
    uint8_t rex = 0;
    uint8_t opcode = (sz == 8) ? 0xF6 : 0xF7;
    uint8_t modrm = 0;
    uint8_t pos = 0;

    uint8_t rm_ = reg_idx;

    if(reg_idx >= 8){
        rex = REX_BASE | REX_B;
        rm_ -= 8;
    }

    switch(sz){
        case 8: if(reg_idx >= 4 && reg_idx <= 7) rex |= REX_BASE; break; // spl, bpl, sil, dil
        case 16: mash_code[pos++] = legacy_prefix; break;
        case 32: break; // none
        case 64: rex |= REX_BASE | REX_W; break;
    }
    
    modrm = emit_modrm(0b11, 0b000, rm_);


    if(rex)mash_code[pos++] = rex;
    mash_code[pos++] = opcode;
    mash_code[pos++] = modrm;

    switch (sz){
        case 8:  mash_code[pos++] = (uint8_t)imm; break;
        case 16: *(uint16_t*)(mash_code + pos) = (uint16_t)imm; pos+=2; break;
        case 32: *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos+=4; break;
        case 64: *(uint32_t*)(mash_code + pos) = (uint32_t)imm; pos+=4; break;
    }

    return pos; // mashine code size
}

// uint8_t encode_not_reg()