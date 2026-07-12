/*
    AmmAsm - Linux x86-64 Assembler 
    Copyright (C) 2025-2026 Ammar Najafli
*/


#include "main.h"
#define VERSION "2.1.10"

void compiler(uint8_t *text, int *textsize, uint64_t *e_entry) {
    if (!text) return;
    int pos = 0;
 
    // of text
    uint64_t pc = pie_mode ? 0x78 : 0x400078;
 
    for(int i = 0; i < ast_len; i++){
        if(ast[i].type == AST_INS) parseInst(&ast[i], &pc);
        else if(ast[i].type == AST_U8 || ast[i].type == AST_U16 || ast[i].type == AST_U32 || ast[i].type == AST_U64) parse_size_directives(&ast[i], &pc);
    }
 
    expand_local_labels();
    *e_entry = collect_labels_sections();
    resolve_labels();
 
    for (int i = 0; i < ast_len; ++i) {
        if(ast[i].type == AST_INS && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U8 
        else if(ast[i].type == AST_U8 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U16
        else if(ast[i].type == AST_U16 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U32
        else if(ast[i].type == AST_U32 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
        // U64
        else if(ast[i].type == AST_U64 && ast[i].machine_code_size > 0){
            memcpy(&text[pos], ast[i].machine_code, ast[i].machine_code_size);
            pos += ast[i].machine_code_size;
        }
    }
 
    *textsize = pos;
}
 
void handl_pipeline(int argc, char **argv){ 
    uint8_t text[1024 * 128];
    int textsize = 0;
    int flsz = 0;
 

    uint64_t entry_point = (pie_mode) ? 0x78 : 0x400078; 
 
    FILE *input = fopen(argv[0], "r");
    LEXER(input);
    DEBUG_PRINT_TOKENS();
 
    fclose(input);
    
    PARSE();
    
    FILE *output = fopen(argv[1], "wb");
 
    compiler(text, &textsize, &entry_point);
    DEBUG_PRINT_AST();
    flsz += obj_file ? GenObjElfFile(output, argv[0]) : ELFgenfile(output, entry_point, text, textsize, pie_mode);
 
    fclose(output);
    printf("AmmAsm: Compiled successfully! %s (%d bytes)\n", argv[1], flsz);
 
    exit(0);
}
 
int main(int argc, char **argv){
    if (argc < 2) {
        printf("AmmAsm %s: \033[5;41mFatal: No file given\033[0m\n", VERSION);
        return 1;
    }
 
    const char* input = NULL;
    const char* out = "a.out";
 
    for (int i = 1; i < argc; ++i){
        if (!astrcmp(argv[i], "-o")){ out = argv[i+1]; i++; continue; }
        if (!astrcmp(argv[i], "-pie")){ pie_mode = 1;  continue; }
        if (!astrcmp(argv[i], "-c")){ out = argv[i+1]; i++; obj_file = 1; continue; }
        if (!astrcmp(argv[i], "-v")){ printf("AASM version %s\n", VERSION); exit(0);}
        if (!astrcmp(argv[i], "-d") || !astrcmp(argv[i], "--debug")) { debug = 1; continue;}
        if (!astrcmp(argv[i], "-h") || !astrcmp(argv[i], "--help")){ 
            puts("AASM - Amm Assembler\n");
            puts("Usage:");
            puts("  ./aasm [options] <input_file>\n");
            puts("Options:");
            puts("  -o <file.out>  Specify the output file name.");
            puts("  -c <file.out>  Compile to an object file instead of executable.");
            puts("  -pie           Enable Position Independent Executable mode.");
            puts("  -d, --debug    Display a debug information while compiling.");
            puts("  -v             Display the version of AASM and exit.");
            puts("  -h, --help     Display this help menu and exit.\n");
            puts("Examples:");
            puts("  ./aasm main.asm -o main.bin");
            puts("  ./aasm -c obj.o source.asm");
            exit(0);
        }
        if (argv[i][0] != '-') input = argv[i];
    }
 
    if (!input) {
        fprintf(stderr, "AmmAsm %s: \033[5;41mFatal: No input file given\033[0m\n", VERSION);
        return 1; 
    }
 
    if(!out) {
        fprintf(stderr, "AmmAsm: %s: option `-o' and `-c' requires an argument\n", VERSION);
        return 1;
    }
 
    char* fake_argv[] = { (char*)input, (char*)out};
    handl_pipeline(2, fake_argv);
 
    return 0;
}