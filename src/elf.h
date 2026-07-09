#pragma once

#include "enum.h"
#include "struct.h"
#include <stdio.h>
#include "parse.h"
#include "linker.h"
#include "utality.h"
#include "instructions.h"
#include <string.h>
#include <stdlib.h>

/* == ELF writer == */

typedef struct {
    // e_ident[16]
    unsigned char e_ident[16];
    
    // ELF Header fields
    uint16_t e_type;
    uint16_t e_machine;
    uint32_t e_version;
    uint64_t e_entry;
    uint64_t e_phoff;
    uint64_t e_shoff;
    uint32_t e_flags;
    uint16_t e_ehsize;
    uint16_t e_phentsize;
    uint16_t e_phnum;
    uint16_t e_shentsize;
    uint16_t e_shnum;
    uint16_t e_shstrndx;
} __attribute__((packed)) ELF64_Ehdr;

typedef struct {
    uint32_t p_type;
    uint32_t p_flags;
    uint64_t p_offset;
    uint64_t p_vaddr;
    uint64_t p_paddr;
    uint64_t p_filesz;
    uint64_t p_memsz;
    uint64_t p_align;
} __attribute__((packed)) ELF64_Phdr;

// ======= for obj files =======
typedef struct {
    uint64_t r_offset; // offset(from start of text to disp32) of rip rel instruction
    uint64_t r_info; // symbol index [high 32 bits] + relocation type [low 32 bits]
    int64_t  r_addend; // 
} __attribute__((packed)) Elf64_Rela;
 
typedef struct {
    uint32_t st_name; // offset name in .strtab
    uint8_t  st_info; // bind[4 bits] + type[4 bits]
    uint8_t  st_other; 
    uint16_t st_shndx; // in which section is symbol
    uint64_t st_value; // offset in section
    uint64_t st_size;  // size (mainly 0)
} __attribute__((packed)) Elf64_Sym;
 
typedef struct {
    uint32_t sh_name;
    uint32_t sh_type;
    uint64_t sh_flags;
    uint64_t sh_addr;
    uint64_t sh_offset;
    uint64_t sh_size;
    uint32_t sh_link;
    uint32_t sh_info;
    uint64_t sh_addralign;
    uint64_t sh_entsize;
} __attribute__((packed)) Elf64_Shdr;

extern int GenObjElfFile(FILE *fl, const char *src_filename);
extern int ELFgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size, int pie_mode);