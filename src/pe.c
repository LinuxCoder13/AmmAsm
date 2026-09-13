#include "pe.h"

/* This file was mainly writen by AI. */

static inline uint64_t align_up(uint64_t value, uint64_t alignment) {
    return (value + alignment - 1) & ~(alignment - 1);
}


int PEgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size, int pie_mode) {
    if (!fl || !text_code || text_size == 0) return 0;

    const uint32_t section_alignment = 0x1000;
    const uint32_t file_alignment = 0x200;
    const uint32_t size_of_headers = 0x200;
    
    const uint32_t text_rva = 0x1000;
    const uint32_t text_offset = size_of_headers;
    
    // 
    uint32_t text_raw_size = align_up(text_size, file_alignment);
    
    //  DOS Header 
    uint8_t dos_header[64] = {0};
    dos_header[0] = 0x4D;  // 'M'
    dos_header[1] = 0x5A;  // 'Z'
    dos_header[2] = 0x80;  // e_cblp
    dos_header[3] = 0x00;
    dos_header[4] = 0x01;  // e_cp
    dos_header[5] = 0x00;
    dos_header[8] = 0x04;  // e_cparhdr
    dos_header[9] = 0x00;
    dos_header[10] = 0x10; // e_minalloc
    dos_header[11] = 0x00;
    dos_header[12] = 0xFF; // e_maxalloc
    dos_header[13] = 0xFF;
    dos_header[16] = 0x40; // e_sp 
    dos_header[17] = 0x01; // e_sp 
    dos_header[24] = 0x40; // e_lfarlc
    dos_header[25] = 0x00;
    dos_header[0x3C] = 0x80; // e_lfanew
    dos_header[0x3D] = 0x00;
    dos_header[0x3E] = 0x00;
    dos_header[0x3F] = 0x00;

    //  DOS Stub 
    uint8_t dos_stub[64] = {
        0x0E, 0x1F, 0xBA, 0x0E, 0x00, 0xB4, 0x09, 0xCD,
        0x21, 0xB8, 0x01, 0x4C, 0xCD, 0x21,
        'T','h','i','s',' ','p','r','o','g','r','a','m',' ','c','a','n','n','o','t',' ',
        'b','e',' ','r','u','n',' ','i','n',' ','D','O','S',' ','m','o','d','e','.',
        0x0D, 0x0A, '$'
    };

    for (int i = sizeof(dos_stub) - 1; i < 64; i++) {
        dos_stub[i] = 0;
    }

    // ============ PE Header ============
    uint32_t pe_signature = 0x00004550; // "PE\0\0"
    uint16_t machine = 0x8664;           // AMD64
    uint16_t num_sections = 1;
    uint32_t timestamp = 0;
    uint32_t ptr_symbols = 0;
    uint32_t num_symbols = 0;
    uint16_t size_optional = 0xF0;       // 240 bytes
    uint16_t characteristics = 0x002F;   // RELOCS_STRIPPED | EXECUTABLE_IMAGE | LINE_NUMS_STRIPPED | LOCAL_SYMS_STRIPPED | LARGE_ADDRESS_AWARE

    // ============ Optional Header ============
    uint16_t magic = 0x020B;             // PE32+
    uint8_t major_linker = 1;
    uint8_t minor_linker = 0x49;
    uint32_t size_code = text_raw_size;
    uint32_t size_init_data = 0;
    uint32_t size_uninit_data = 0;
    uint32_t entry_point = (uint32_t)e_entry - 0x400000;  // RVA!
    uint32_t base_code = text_rva;             // RVA!
    uint64_t image_base = pie_mode ? 0x140000000 : 0x400000;
    uint32_t sect_align = section_alignment;
    uint32_t file_align = file_alignment;
    
    uint16_t major_os = 1;
    uint16_t minor_os = 0;
    uint16_t major_image = 0;
    uint16_t minor_image = 0;
    uint16_t major_subsys = 5;
    uint16_t minor_subsys = 0;
    
    uint32_t win32_version = 0;
    uint32_t size_image = align_up(text_rva + text_size, section_alignment);
    uint32_t size_headers = size_of_headers;
    uint32_t checksum = 0;
    
    uint16_t subsystem = 3;              // CUI
    uint16_t dll_chars = 0;
    
    uint64_t stack_reserve = 0x100000;   // 1 MB
    uint64_t stack_commit = 0x1000;      // 4 KB
    uint64_t heap_reserve = 0x10000;     // 64 KB
    uint64_t heap_commit = 0;
    
    uint32_t loader_flags = 0;
    uint32_t num_rva_sizes = 16;

    // ============ Section Header ============
    uint8_t section_name[8] = ".text\0\0\0";
    uint32_t sect_vsize = (uint32_t)text_size;
    uint32_t sect_vaddr = text_rva;
    uint32_t sect_raw_size = text_raw_size;
    uint32_t sect_raw_ptr = text_offset;
    uint32_t sect_relocs = 0;
    uint32_t sect_linenums = 0;
    uint16_t sect_num_relocs = 0;
    uint16_t sect_num_linenums = 0;
    uint32_t sect_chars = 0x60000020;    // CNT_CODE | MEM_EXECUTE | MEM_READ

    // DOS Header + Stub
    fwrite(dos_header, 1, 64, fl);
    fwrite(dos_stub, 1, 64, fl);
    
    // PE Signature + File Header
    fwrite(&pe_signature, 4, 1, fl);
    fwrite(&machine, 2, 1, fl);
    fwrite(&num_sections, 2, 1, fl);
    fwrite(&timestamp, 4, 1, fl);
    fwrite(&ptr_symbols, 4, 1, fl);
    fwrite(&num_symbols, 4, 1, fl);
    fwrite(&size_optional, 2, 1, fl);
    fwrite(&characteristics, 2, 1, fl);
    
    // Optional Header
    fwrite(&magic, 2, 1, fl);
    fwrite(&major_linker, 1, 1, fl);
    fwrite(&minor_linker, 1, 1, fl);
    fwrite(&size_code, 4, 1, fl);
    fwrite(&size_init_data, 4, 1, fl);
    fwrite(&size_uninit_data, 4, 1, fl);
    fwrite(&entry_point, 4, 1, fl);       // RVA!
    fwrite(&base_code, 4, 1, fl);         // RVA!
    fwrite(&image_base, 8, 1, fl);
    fwrite(&sect_align, 4, 1, fl);
    fwrite(&file_align, 4, 1, fl);
    fwrite(&major_os, 2, 1, fl);
    fwrite(&minor_os, 2, 1, fl);
    fwrite(&major_image, 2, 1, fl);
    fwrite(&minor_image, 2, 1, fl);
    fwrite(&major_subsys, 2, 1, fl);
    fwrite(&minor_subsys, 2, 1, fl);
    fwrite(&win32_version, 4, 1, fl);
    fwrite(&size_image, 4, 1, fl);
    fwrite(&size_headers, 4, 1, fl);
    fwrite(&checksum, 4, 1, fl);
    fwrite(&subsystem, 2, 1, fl);
    fwrite(&dll_chars, 2, 1, fl);
    fwrite(&stack_reserve, 8, 1, fl);
    fwrite(&stack_commit, 8, 1, fl);
    fwrite(&heap_reserve, 8, 1, fl);
    fwrite(&heap_commit, 8, 1, fl);
    fwrite(&loader_flags, 4, 1, fl);
    fwrite(&num_rva_sizes, 4, 1, fl);
    
    uint8_t data_dirs[128] = {0};
    fwrite(data_dirs, 1, 128, fl);

    fwrite(section_name, 1, 8, fl);
    fwrite(&sect_vsize, 4, 1, fl);
    fwrite(&sect_vaddr, 4, 1, fl);
    fwrite(&sect_raw_size, 4, 1, fl);
    fwrite(&sect_raw_ptr, 4, 1, fl);
    fwrite(&sect_relocs, 4, 1, fl);
    fwrite(&sect_linenums, 4, 1, fl);
    fwrite(&sect_num_relocs, 2, 1, fl);
    fwrite(&sect_num_linenums, 2, 1, fl);
    fwrite(&sect_chars, 4, 1, fl);

    fseek(fl, size_of_headers, SEEK_SET);
    fwrite(text_code, 1, text_size, fl);

    for (uint32_t i = text_size; i < text_raw_size; i++) {
        fputc(0, fl);
    }
    
    return size_of_headers + text_raw_size;
}