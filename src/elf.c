#include "elf.h"

/* ============================================================
 * GenObjElfFile() - Generate ELF64 relocatable object file
 *
 * Layout (ET_REL):
 *   [ELF header]
 *   [.data bytes]           offset = 0x40
 *   [.text machine code]    offset = 0x40 + data_size  (aligned 16)
 *   [.shstrtab]
 *   [.symtab]
 *   [.strtab]
 *   [.rela.text]            R_X86_64_PC32 and R_X86_64_64 (for now)
 *   [section header table]
 *
 * Section indices:
 *   0  NULL
 *   1  .data
 *   2  .text
 *   3  .shstrtab
 *   4  .symtab
 *   5  .strtab
 *   6  .rela.text
 *   7  .note.GNU-stack
 * ============================================================ */
 
// relocation types for x86-64 ELF (will be added more in new version)
#define R_X86_64_PC32  2
#define R_X86_64_64    1
#define R_X86_64_32    10

// bind in st_info (high 4 bits)
#define STB_LOCAL      0 // local lab (other .o will not see it)
#define STB_GLOBAL     1 // global lab(same as 'global lab' in nasm)

// type of sybol
#define STT_NOTYPE     0 // ???
#define STT_OBJECT     1 // data, ex msg
#define STT_FUNC       2 // function, code label, ex _start
#define STT_SECTION    3 // section
#define STT_FILE       4 // name or 'path to' file

#define SHN_UNDEF      0 // symbol is not defined in this file
#define SHN_ABS        0xfff1 // independent symbol (not included in any section)

// type of section
#define SHT_NULL       0 // ???
#define SHT_PROGBITS   1 // basic bytes (.text/.data)
#define SHT_SYMTAB     2 // symbol table
#define SHT_STRTAB     3 // string table
#define SHT_RELA       4 // relocation with addend

// flags

// .data = ALLOC | WRITE
// .text = ALLOC | EXECINSTR
#define SHF_ALLOC      0x2 // section must mmaped in memory after linking
#define SHF_EXECINSTR  0x4 // execute
#define SHF_WRITE      0x1 // write
 
int GenObjElfFile(FILE *fl, const char *src_filename) {
    if (!fl) return -1;
    /*  1. Scan AST: collect .data bytes and .text machine code */
 
    // I don't know why but GCC is puting this buffers to bss, not stack as expected
    uint8_t  *data_buf = malloc(65536);
    uint16_t data_size = 0;
 
    uint8_t  *text_buf = malloc(65536);
    uint16_t text_size = 0;
    
 
    /* Find .data and .text section boundaries in AST */
    int data_start_idx = -1;
    int text_start_idx = -1;
 
    for (int i = 0; i < ast_len; i++) {
        if (ast[i].type == AST_SECTION) {
            if (strcasecmp(ast[i].section.secname, ".data") == 0 ||
                strcasecmp(ast[i].section.secname, "data")  == 0)
                data_start_idx = i;
            else if (strcasecmp(ast[i].section.secname, ".text") == 0 ||
                     strcasecmp(ast[i].section.secname, "text")  == 0)
                text_start_idx = i;
        }
    }
 
    /* Collect .data bytes: starting from (AST_SEC && ast[i].section.secname == "data") till (AST_LAB && node[i].label.name == "_start")*/
    if (data_start_idx >= 0) {
        for (int i = data_start_idx + 1; i < ast_len; i++) {
            if (ast[i].type == AST_SECTION) break;  /* next section */
            if (ast[i].machine_code_size > 0 &&
                (ast[i].type == AST_U8  || ast[i].type == AST_U16 ||
                 ast[i].type == AST_U32 || ast[i].type == AST_U64)) {
                memcpy(data_buf + data_size, ast[i].machine_code, ast[i].machine_code_size);
                data_size += ast[i].machine_code_size;
            }
        }
    }
 
    /* Collect .text machine code */
    if (text_start_idx >= 0) {
        for (int i = text_start_idx + 1; i < ast_len; i++) {
            if (ast[i].type == AST_SECTION) break;
            if ((ast[i].machine_code_size > 0 && ast[i].type == AST_INS) || ast[i].type == AST_U8 || ast[i].type == AST_U16 || ast[i].type == AST_U32 || ast[i].type == AST_U64) {
                memcpy(text_buf + text_size, ast[i].machine_code, ast[i].machine_code_size);
                text_size += ast[i].machine_code_size;
            }
        }
    }
 
    /* 2. Assign section-relative offsets to labels 

     * In ET_REL, section sh_addr = 0.
     * Label value = offset from the start of its section's data.
     *
     * For .data labels: offset = bytes accumulated before the label
     *                   within the .data section nodes.
     * For .text labels: offset = their vadress minus the vaddr of
     *                   the first .text instruction (i.e. their pc
     *                   relative to text_start_pc stored in the AST).
     *
     * We compute text_start_pc from the first INS node in .text.
     */
 
    uint64_t text_start_pc = 0;

    if (text_start_idx >= 0) {
        for (int i = text_start_idx + 1; i < ast_len; i++) {
            if (ast[i].type == AST_SECTION) break;
            if (ast[i].type == AST_INS && ast[i].machine_code_size > 0) {
                text_start_pc = ast[i].ins.pc;
                break;
            }
        }
    }

    /* Walk .data section: accumulate byte offset per label */
    if (data_start_idx >= 0) {
        uint32_t off = 0;
        for (int i = data_start_idx + 1; i < ast_len; i++) {
            if (ast[i].type == AST_SECTION) break;
            if (ast[i].type == AST_LABEL) {
                ast[i].label.adress  = off;   /* section-relative offset */
            }
            if (ast[i].machine_code_size > 0 &&
                (ast[i].type == AST_U8  || ast[i].type == AST_U16 ||
                 ast[i].type == AST_U32 || ast[i].type == AST_U64)) {
                off += ast[i].machine_code_size;
            }
        }
    }
 
    /* Walk .text section: label offset = vadress - text_start_pc */
    if (text_start_idx >= 0) {
        for (int i = text_start_idx + 1; i < ast_len; i++) {
            if (ast[i].type == AST_SECTION) break;
            if (ast[i].type == AST_LABEL) {
                ast[i].label.adress  = ast[i].label.vadress - text_start_pc;
            }
        }
    }
     
    /*  3. Build symbol table (for GNU LD) */
    /*
     * Symbol order (required by ELF spec: all STB_LOCAL before STB_GLOBAL):
     *   [0] STT_FILE  (source filename)
     *   [1] STT_SECTION for .data  (shndx=1)
     *   [2] STT_SECTION for .text  (shndx=2)
     *   [3..N-1] local labels (STB_LOCAL)
     *   [N..]    global labels (STB_GLOBAL) – currently all are local
     *            (_start is allways global)
     *
     * We treat every label that is "_start" as STB_GLOBAL,
     * everything else as STB_LOCAL.
     * 
     * ex -> \0input.asm\0msg\0_start\0printf\0
     */
 
#define MAX_SYMS 256
    Elf64_Sym syms[MAX_SYMS];
    int       sym_count = 0;
 
    /* .strtab: byte string table for symbol names */
    uint8_t  strtab_buf[0x1000];
    uint32_t strtab_size = 0;
    strtab_buf[strtab_size++] = 0; /* index 0 = empty string */
 
    /*  add name to strtab, and return offset */
#define STRTAB_ADD(name) ({ \
    uint32_t _off = strtab_size; \
    uint32_t _len = strlen(name) + 1; \
    memcpy(strtab_buf + strtab_size, name, _len); \
    strtab_size += _len; \
    _off; \
})
 
    /* make st_info byte */
#define ST_INFO(bind, type) (((bind) << 4) | ((type) & 0xf))
 
    memset(syms, 0, sizeof(syms));
 
    /* sym[0]: FILE */
    syms[sym_count].st_name  = STRTAB_ADD(src_filename);
    syms[sym_count].st_info  = ST_INFO(STB_LOCAL, STT_FILE);
    syms[sym_count].st_shndx = SHN_ABS;
    sym_count++;
 
    /* sym[1]: section .data */
    syms[sym_count].st_name  = 0;
    syms[sym_count].st_info  = ST_INFO(STB_LOCAL, STT_SECTION);
    syms[sym_count].st_shndx = (data_start_idx >= 0) ? 1 : SHN_UNDEF;
    sym_count++;
    int data_section_sym_idx = sym_count - 1;
 
    /* sym[2]: section .text */
    syms[sym_count].st_name  = 0;
    syms[sym_count].st_info  = ST_INFO(STB_LOCAL, STT_SECTION);
    syms[sym_count].st_shndx = (text_start_idx >= 0) ? 2 : SHN_UNDEF;
    sym_count++;
    int text_section_sym_idx = sym_count - 1; 

    // we will add .bss, .rodata in future versions :)
 
    /* Collect labels that belong to .data section (between data_start_idx and next section) */
    /* Then collect labels belonging to .text section */
    /* First pass: LOCAL symbols */
    /* Second pass: GLOBAL symbols (_start, etc.) */
 
    for (int pass = 0; pass < 2; pass++) {
        int want_global = (pass == 1);
 
        /* extern symbols */
        if(pass == 1){
            for (int i = 0; i < ast_len; i++) {
                if (ast[i].type != AST_EXTERN)
                    continue;

                for (int j = 0; j < ast[i].externs.labels_len; j++) {
                    if (sym_count >= MAX_SYMS)
                        break;

                    syms[sym_count].st_name  = STRTAB_ADD(ast[i].externs.labels[j]);
                    syms[sym_count].st_info  = ST_INFO(STB_GLOBAL, STT_NOTYPE);
                    syms[sym_count].st_shndx = SHN_UNDEF;
                    syms[sym_count].st_value = 0;
                    sym_count++;
                }
            }
        }

        /* .data labels */
        if (data_start_idx >= 0) {
            for (int i = data_start_idx + 1; i < ast_len; i++) {
                if (ast[i].type == AST_SECTION) break;
                if (ast[i].type != AST_LABEL) continue;

                int is_global = ast[i].label.is_global;
                if (is_global != want_global) continue;
                if (sym_count >= MAX_SYMS) break;
    
                syms[sym_count].st_name  = STRTAB_ADD(ast[i].label.name);
                syms[sym_count].st_info  = ST_INFO(is_global ? STB_GLOBAL : STB_LOCAL, STT_OBJECT);
                syms[sym_count].st_shndx = 1; // .data 
                syms[sym_count].st_value = ast[i].label.adress;
                sym_count++;

            }
        }
 
        /* .text labels */
        if (text_start_idx >= 0) {
            for (int i = text_start_idx + 1; i < ast_len; i++) {
                if (ast[i].type == AST_SECTION) break;
                if (ast[i].type != AST_LABEL) continue;

                // Local/Global labels
                int is_global = ast[i].label.is_global; 
                if (is_global != want_global) continue;
                if (sym_count >= MAX_SYMS) break;
    
                syms[sym_count].st_name  = STRTAB_ADD(ast[i].label.name);
                syms[sym_count].st_info  = ST_INFO(is_global ? STB_GLOBAL : STB_LOCAL, STT_FUNC);
                syms[sym_count].st_shndx = 2; // .text 
                syms[sym_count].st_value = ast[i].label.adress;
                sym_count++;
            }
        }
    }
 
    /* first_global_sym: index of first STB_GLOBAL symbol (for sh_info of .symtab) */
    int first_global_sym = sym_count; /* default: all local */
    for (int i = 0; i < sym_count; i++) {
        if ((syms[i].st_info >> 4) == STB_GLOBAL) {
            first_global_sym = i;
            break;
        }
    }
 
    /* Build .rela.text 

     * For every INS node in .text that has a rip-relative memory
     * operand (is_rip_rel), emit one R_X86_64_PC32 relocation.
     * r_offset = instruction PC - text_start_pc + (inst_size - 4)
     *   (points at the 4-byte displacement field)
     * r_info   = sym_idx << 32 | R_X86_64_PC32
     *   where sym_idx is the .data section symbol (index 1 in our symtab)
     * r_addend = disp - 4  (standard PC32 addend)
     */

    Elf64_Rela relas[256];
    int        rela_count = 0;
 
    if (text_start_idx >= 0) {
        for (int i = text_start_idx + 1; i < ast_len; i++) {
            if (ast[i].type == AST_SECTION) break;
            if (ast[i].type != AST_INS)     continue;
            
            
            for (int op = 0; op < ast[i].ins.oper_count && rela_count < 256; op++) {
                Operand *oper = &ast[i].ins.operands[op];
                
                // resolving R_X86_64_PC32
                
                // mov/lea/... rax, [rel label] | mov/lea/... [rel label], <size> imm
                if (oper->type == O_MEM && oper->addr.is_rip_rel){
                    /* looking for label name in our symtab (trying to get index of symbol syms)*/
                    int sym_idx = data_section_sym_idx; /* default: .data section sym */
                    const uint8_t *lab = oper->addr.label;
                    if (*lab) {
                        for (int s = 0; s < sym_count; s++) {
                            if (syms[s].st_name == 0) continue; // '\0'
                            const uint8_t *sname = strtab_buf + syms[s].st_name; // geting name by offset
                            if (!astrcmp(sname, lab)) {
                                sym_idx = s;
                                break;
                            }
                        }
                    }

                    uint8_t op_imm_sz = ast[i].ins.operands[1].imm_sz;
                    uint8_t real_imm_sz = (op_imm_sz == 8) ? 4 : op_imm_sz;

                    uint64_t reloc_off;
                    if (!real_imm_sz) {
                        reloc_off = (ast[i].ins.pc - text_start_pc) + (ast[i].machine_code_size - 4);
                    } 
                    else {
                        reloc_off = (ast[i].ins.pc - text_start_pc) +(ast[i].machine_code_size - real_imm_sz - 4);
                    }

                    relas[rela_count].r_offset = reloc_off;
                    relas[rela_count].r_info   = ((uint64_t)sym_idx << 32) | R_X86_64_PC32;
                    relas[rela_count].r_addend = (int64_t)oper->addr.disp - 4 - real_imm_sz; // linker writes: S + A - P
                    rela_count++;

                    memset(text_buf + reloc_off, 0, 4);

                    // check for X86_64_32
                    // FOR inst [mem], label
                    if (op == 0 &&
                        ast[i].ins.oper_count >= 2 &&
                        ast[i].ins.operands[1].type == O_EXPR &&
                        expr_label_count(&ast[i].ins.operands[1].expr) == 1 &&
                        ast[i].ins.operands[1].expr.count == 1){

                        Expr *imm_expr = &ast[i].ins.operands[1].expr;
                        const uint8_t *lab2 = get_label_from_expr(*imm_expr);

                        if (lab2 && *lab2) {
                            uint8_t imm_sz2 = ast[i].ins.operands[1].imm_sz;
    
                            if (imm_sz2 != 4) {
                                fprintf(stderr,
                                    "AmmAsm:%d: warning: inst [mem], %s label: "
                                    "only \'dd\' (4-byte) supported for R_X86_64_32; "
                                    "skipping relocation for \'%s\'\n",
                                    ast[i].line,
                                    imm_sz2 == 1 ? "db" :
                                    imm_sz2 == 2 ? "dw" : "dq",
                                    lab2);
                            } else if (rela_count < 256) {
                                int sym_idx2 = data_section_sym_idx;
                                for (int s2 = 0; s2 < sym_count; s2++) {
                                    if (syms[s2].st_name == 0) continue;
                                    const uint8_t *sname = strtab_buf + syms[s2].st_name;
                                    if (!astrcmp(sname, lab2)) { sym_idx2 = s2; break; }
                                }
    
                                uint64_t imm_reloc_off =
                                    (ast[i].ins.pc - text_start_pc) +
                                    (ast[i].machine_code_size - 4);
    
                                relas[rela_count].r_offset = imm_reloc_off;
                                relas[rela_count].r_info   = ((uint64_t)sym_idx2 << 32) | R_X86_64_32;
                                relas[rela_count].r_addend = 0;
                                rela_count++;
    
                                memset(text_buf + imm_reloc_off, 0, 4);
                            }
                        }
                    }
                    break;
                }

                // jmp label
                if ((strcasecmp(ast[i].cmd, "jmp")  == 0 || 
                    strcasecmp(ast[i].cmd, "call") == 0 ||
                    is2arrin(JCC, ast[i].cmd)) &&
                    ast[i].ins.operands[0].type == O_EXPR){

                    /* looking for label name in our symtab (trying to get index of symbol syms)*/
                    int sym_idx = text_section_sym_idx; /* default: .text section sym */
                    uint64_t reloc_off = (ast[i].ins.pc - text_start_pc) + (ast[i].machine_code_size - 4);
                    const uint8_t *lab = get_label_from_expr(ast[i].ins.operands[0].expr);
                    if (!lab || !*lab) {fprintf(stderr, "AmmAsm:%d: branch relocation requires label\n", ast[i].line); exit(1);}

                    if (*lab) {
                        for (int s = 0; s < sym_count; s++) {
                            if (syms[s].st_name == 0) continue; // '\0'
                            const uint8_t *sname = strtab_buf + syms[s].st_name; // geting name by offset
                            if (!astrcmp(sname, lab)) {
                                sym_idx = s;
                                break;
                            }
                        }
                    }

                    uint64_t vaddr = find_lab_addr(lab);
                    uint64_t expr = resolve_expr(ast[i].ins.operands[0].expr, ast[i].ins.pc, ast[i].line);
                    uint64_t constev = (int64_t)expr - (int64_t)vaddr;

                    relas[rela_count].r_offset = reloc_off;
                    relas[rela_count].r_info   = ((uint64_t)sym_idx << 32) | R_X86_64_PC32; // symbol indx + disp32
                    relas[rela_count].r_addend =  constev -4;
                    rela_count++;
                    memset(text_buf + reloc_off, 0, 4);
                    break;
                }

                //R_X86_64_32
                // inst [non-rip-rel mem], dd label
                // inst eax, label
                else if 
                    (ast[i].ins.operands[1].type == O_EXPR &&
                    expr_label_count(&ast[i].ins.operands[1].expr) == 1 &&
                    ast[i].ins.operands[1].expr.count == 1 &&
                    ((ast[i].ins.operands[0].type == O_MEM && !ast[i].ins.operands[0].addr.is_rip_rel) ||
                     (ast[i].ins.operands[0].type == O_REG32))){

                    


                    const uint8_t *lab2 = get_label_from_expr(ast[i].ins.operands[1].expr);
                    if (lab2 && *lab2 && rela_count < 256) {
                        int sym_idx2 = data_section_sym_idx;
                        for (int s2 = 0; s2 < sym_count; s2++) {
                            if (syms[s2].st_name == 0) continue;
                            const uint8_t *sname = strtab_buf + syms[s2].st_name;
                            if (!astrcmp(sname, lab2)) { sym_idx2 = s2; break; }
                        }
                        uint64_t imm_reloc_off =
                            (ast[i].ins.pc - text_start_pc) +
                            (ast[i].machine_code_size - 4);
                        relas[rela_count].r_offset = imm_reloc_off;
                        relas[rela_count].r_info   = ((uint64_t)sym_idx2 << 32) | R_X86_64_32;
                        relas[rela_count].r_addend = 0;
                        rela_count++;
                        memset(text_buf + imm_reloc_off, 0, 4);
                    }
                    break;
                }
                
                // resolving R_X86_64_64
                else if (oper->type == O_EXPR ) {
                    int sym_idx = data_section_sym_idx;
                    uint8_t *lab = NULL;
                    for (int k = 0; k < oper->expr.count; k++) {
                        if (oper->expr.tokens[k].type == T_LAB) {
                            lab = oper->expr.tokens[k].value;
                            break;
                        }
                    }

                    if (!lab || !*lab) {
                        fprintf(stderr, "AmmAsm:%d: absolute relocation requires label\n", ast[i].line);
                        exit(1);
                    }

                    for (int s = 0; s < sym_count; s++) {
                        if (syms[s].st_name == 0) continue;

                        const uint8_t *sname = strtab_buf + syms[s].st_name;
                        if (!astrcmp(sname, lab)) {
                            sym_idx = s;
                            break;
                        }
                    }

                    uint64_t vaddr = find_lab_addr(lab);
                    uint64_t imm64 = *(uint64_t*)(ast[i].machine_code + ast[i].machine_code_size - 8);
                    uint64_t reloc_off = (ast[i].ins.pc - text_start_pc) + (ast[i].machine_code_size - 8);

                    relas[rela_count].r_offset = reloc_off;
                    relas[rela_count].r_info   = ((uint64_t)sym_idx << 32) | R_X86_64_64;
                    relas[rela_count].r_addend = (int64_t)imm64 - vaddr;
                    rela_count++;

                    memset(text_buf + reloc_off, 0, 8);
                    break;

                }

            }
        }
        // We will add more types of realocations in new versions
    }
    free_ast(ast, ast_len);


    /*  5. Build .shstrtab */

    // \0.data\0.text\0.shstrtab\0.symtab\0.strtab\0.rela.text\0
    uint8_t  shstrtab_buf[256];
    uint32_t shstrtab_size = 0;


    shstrtab_buf[shstrtab_size++] = 0; /* index 0 */
 
    uint32_t sh_name_null     = 0;
    uint32_t sh_name_data     = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".data",     6); shstrtab_size += 6;
    uint32_t sh_name_text     = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".text",     6); shstrtab_size += 6;
    uint32_t sh_name_shstrtab = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".shstrtab", 10); shstrtab_size += 10;
    uint32_t sh_name_symtab   = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".symtab",   8); shstrtab_size += 8;
    uint32_t sh_name_strtab   = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".strtab",   8); shstrtab_size += 8;
    uint32_t sh_name_rela     = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".rela.text", 11); shstrtab_size += 11;
    uint32_t sh_name_gnustack = shstrtab_size;
    memcpy(shstrtab_buf + shstrtab_size, ".note.GNU-stack", 16);
    shstrtab_size += 16;
 
    (void)sh_name_null; /* index 0 is implicitly null */
 
    /* ---- 6. Compute file layout ---- */
    /*
     * Offset 0x00: ELF header     (64 bytes)
     * Offset 0x40: .data          (data_size bytes)
     * Offset 0x40 + data_size     : .text  (text_size bytes, align 16)
     * then: .shstrtab, .symtab, .strtab, .rela.text
     * then: section header table  (8 headers * 64 bytes)
     */
 
// align to 16 bytes
#define ALIGN16(x) (((x) + 15) & ~15)
 
    uint64_t off_data     = 0x40; // start after ELF header
    uint64_t off_text     = ALIGN16(off_data + data_size);
    uint64_t off_shstrtab = ALIGN16(off_text + text_size);
    uint64_t off_symtab   = ALIGN16(off_shstrtab + shstrtab_size);
    uint64_t off_strtab   = ALIGN16(off_symtab + sym_count * sizeof(Elf64_Sym));
    uint64_t off_rela     = ALIGN16(off_strtab + strtab_size);
    uint64_t off_shdr     = ALIGN16(off_rela + rela_count * sizeof(Elf64_Rela));
 
    /* 8 section headers: NULL, .data, .text, .shstrtab, .symtab, .strtab, .rela.text, .note.GNU-stack */
    int shnum = 8; // will be added more in new version
 
    /*  Write ELF header  */
    uint8_t hdr[64];
    memset(hdr, 0, sizeof hdr);
    hdr[0] = 0x7f; hdr[1] = 'E'; hdr[2] = 'L'; hdr[3] = 'F';
    hdr[4] = 2;    // EI_CLASS  = ELFCLASS64  
    hdr[5] = 1;    // EI_DATA   = ELFDATA2LSB 
    hdr[6] = 1;    // EI_VERSION              
    *(uint16_t*)(hdr + 16) = 1;      // e_type    = ET_REL  
    *(uint16_t*)(hdr + 18) = 0x3e;   // e_machine = x86-64  
    *(uint32_t*)(hdr + 20) = 1;      // e_version           
    // e_entry = 0, e_phoff = 0, e_phnum = 0 
    *(uint64_t*)(hdr + 40) = off_shdr; // e_shoff            
    *(uint16_t*)(hdr + 52) = 64;     // e_ehsize            
    *(uint16_t*)(hdr + 54) = 56;    //  e_phentsize         
    *(uint16_t*)(hdr + 58) = 64;     // e_shentsize         
    *(uint16_t*)(hdr + 60) = shnum;  // e_shnum             
    *(uint16_t*)(hdr + 62) = 3;      // e_shstrndx = 3 (.shstrtab) 
    fwrite(hdr, 64, 1, fl);
 
    //  8. Write section data  
    /* Pad to off_data (should already be 0x40 = 64) */
    {
        long cur = ftell(fl);
        while (cur < (long)off_data) { fputc(0, fl); cur++; }
    }
    fwrite(data_buf, 1, data_size, fl);
    free(data_buf);
 
    /* Pad to off_text */
    {
        long cur = ftell(fl);
        while (cur < (long)off_text) { fputc(0, fl); cur++; }
    }
    fwrite(text_buf, 1, text_size, fl);
    free(text_buf);
 
    /* Pad to off_shstrtab */
    {
        long cur = ftell(fl);
        while (cur < (long)off_shstrtab) { fputc(0, fl); cur++; }
    }
    fwrite(shstrtab_buf, 1, shstrtab_size, fl);
 
    /* Pad to off_symtab */
    {
        long cur = ftell(fl);
        while (cur < (long)off_symtab) { fputc(0, fl); cur++; }
    }
    fwrite(syms, sizeof(Elf64_Sym), sym_count, fl);
 
    /* Pad to off_strtab */
    {
        long cur = ftell(fl);
        while (cur < (long)off_strtab) { fputc(0, fl); cur++; }
    }
    fwrite(strtab_buf, 1, strtab_size, fl);
 
    /* Pad to off_rela */
    {
        long cur = ftell(fl);
        while (cur < (long)off_rela) { fputc(0, fl); cur++; }
    }
    if (rela_count > 0)
        fwrite(relas, sizeof(Elf64_Rela), rela_count, fl);
 
    /* Pad to off_shdr */
    {
        long cur = ftell(fl);
        while (cur < (long)off_shdr) { fputc(0, fl); cur++; }
    }
 
    /* ---- 9. Write section header table ---- */
    Elf64_Shdr shdrs[8];
    memset(shdrs, 0, sizeof shdrs);
 
    /* [0] NULL */
 
    /* [1] .data */
    shdrs[1].sh_name      = sh_name_data;
    shdrs[1].sh_type      = SHT_PROGBITS;
    shdrs[1].sh_flags     = SHF_ALLOC | SHF_WRITE;
    shdrs[1].sh_offset    = off_data;
    shdrs[1].sh_size      = data_size;
    shdrs[1].sh_addralign = 4;
 
    /* [2] .text */
    shdrs[2].sh_name      = sh_name_text;
    shdrs[2].sh_type      = SHT_PROGBITS;
    shdrs[2].sh_flags     = SHF_ALLOC | SHF_EXECINSTR;
    shdrs[2].sh_offset    = off_text;
    shdrs[2].sh_size      = text_size;
    shdrs[2].sh_addralign = 16;
 
    /* [3] .shstrtab */
    shdrs[3].sh_name      = sh_name_shstrtab;
    shdrs[3].sh_type      = SHT_STRTAB;
    shdrs[3].sh_offset    = off_shstrtab;
    shdrs[3].sh_size      = shstrtab_size;
    shdrs[3].sh_addralign = 1;
 
    /* [4] .symtab */
    shdrs[4].sh_name      = sh_name_symtab;
    shdrs[4].sh_type      = SHT_SYMTAB;
    shdrs[4].sh_offset    = off_symtab;
    shdrs[4].sh_size      = sym_count * sizeof(Elf64_Sym);
    shdrs[4].sh_link      = 5;                  /* .strtab index */
    shdrs[4].sh_info      = first_global_sym;   /* first global  */
    shdrs[4].sh_addralign = 8;
    shdrs[4].sh_entsize   = sizeof(Elf64_Sym);
 
    /* [5] .strtab */
    shdrs[5].sh_name      = sh_name_strtab;
    shdrs[5].sh_type      = SHT_STRTAB;
    shdrs[5].sh_offset    = off_strtab;
    shdrs[5].sh_size      = strtab_size;
    shdrs[5].sh_addralign = 1;
 
    /* [6] .rela.text */
    shdrs[6].sh_name      = sh_name_rela;
    shdrs[6].sh_type      = SHT_RELA;
    shdrs[6].sh_flags     = 0;
    shdrs[6].sh_offset    = off_rela;
    shdrs[6].sh_size      = rela_count * sizeof(Elf64_Rela);
    shdrs[6].sh_link      = 4;   /* .symtab index          */
    shdrs[6].sh_info      = 2;   /* applies to .text (idx 2) */
    shdrs[6].sh_addralign = 8;
    shdrs[6].sh_entsize   = sizeof(Elf64_Rela);

    /* [7] .note.GNU-stack */
    shdrs[7].sh_name      = sh_name_gnustack;
    shdrs[7].sh_type      = SHT_PROGBITS;
    shdrs[7].sh_flags     = 0;
    shdrs[7].sh_offset    = off_shdr; 
    shdrs[7].sh_size      = 0;
    shdrs[7].sh_addralign = 1;
 
    fwrite(shdrs, sizeof(Elf64_Shdr), shnum, fl);
 
    long total = ftell(fl);
    return (int)total;
}
 
int ELFgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size, int pie_mode) {
    if (!fl) return 0;
 
    ELF64_Ehdr ehdr;
    ELF64_Phdr phdr;
    uint64_t text_offset = 0x78;
    uint64_t text_vaddr = pie_mode ? text_offset : 0x400078;
    
    // Init headers
    memset(&ehdr, 0, sizeof(ehdr));
    memset(&phdr, 0, sizeof(phdr));
    
    // ELF Header
    ehdr.e_ident[0] = 0x7F;
    ehdr.e_ident[1] = 'E';
    ehdr.e_ident[2] = 'L';
    ehdr.e_ident[3] = 'F';
    ehdr.e_ident[4] = 0x02;
    ehdr.e_ident[5] = 0x01;
    ehdr.e_ident[6] = 0x01;
    ehdr.e_type = pie_mode ? 0x03 : 0x02;
    ehdr.e_machine = 0x3E;
    ehdr.e_version = 0x01;
    ehdr.e_entry = e_entry;
    ehdr.e_phoff = 0x40;
    ehdr.e_ehsize = 0x40;
    ehdr.e_phentsize = sizeof(ELF64_Phdr);
    ehdr.e_phnum = 1;
    fwrite(&ehdr, sizeof(ehdr), 1, fl);
 
 
    uint64_t code_off = 0x78;
    uint64_t base = pie_mode ? 0 : 0x400000;
 
 
    // Program Header
    phdr.p_type   = 0x01;
    phdr.p_flags  = 0x07; // RWX
    phdr.p_offset = code_off;
    phdr.p_vaddr  = base + code_off;
    phdr.p_paddr  = base + code_off;
    phdr.p_filesz = text_size;
    phdr.p_memsz  = text_size;
    phdr.p_align  = 0x1000;
    
    fwrite(&phdr, sizeof(phdr), 1, fl);
    // .text
    fwrite(text_code, 1, text_size, fl);
    
    return 0x78 + text_size;
}