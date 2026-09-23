/*
    AmmAsm - Linux x86-64 Assembler 
    Copyright (C) 2025-2026 Ammar Najafli
*/

#include "main.h"
#define VERSION "3.0.0"

void compiler(uint8_t *text, int *textsize, int *textcap, uint64_t *e_entry) {
    if (!text) return;
 
    // of text
    uint64_t pc = pie_mode ? 0x1000 : 0x401000;
    check_cpu();
    for(int i = 0; i < ast_len; i++){
        if(ast[i].type == AST_INS) parseInst(&ast[i], &pc);
        else if(ast[i].type == AST_ALIGN) emit_align(&ast[i], &pc);
        else if(ast[i].type == AST_U8 || ast[i].type == AST_U16 || ast[i].type == AST_U32 || ast[i].type == AST_U64 || ast[i].type == AST_BSS_RES) parse_size_directives(&ast[i], &pc);
    }

    if(isnt_error)exit(2);

    expand_local_labels();
    *e_entry = collect_labels_sections();
    resolve_labels();
 
    for (int i = 0; i < ast_len; ++i) {
        switch (ast[i].type) {
            case AST_INS:
            case AST_U8:
            case AST_U16:
            case AST_U32:
            case AST_U64:
            case AST_BSS_RES:
            case AST_ALIGN:
                if (ast[i].type == AST_BSS_RES) {
                    if (!obj_file) {
                        char * zeros = calloc(ast[i].machine_code_len, 1);
                        text = appendARR(textsize, textcap, text, zeros, ast[i].machine_code_len);
                        free(zeros);
                    }
                    break;
                }
                
                text = appendARR(textsize, textcap, text, ast[i].machine_code, ast[i].machine_code_len);
                break;
        }
    }

}
 
void handl_pipeline(int argc, char **argv){ 
    char *prosesedfile = no_preprocess ? NULL : Preprocess(argv[0]);
    char *file_name = prosesedfile ? prosesedfile : argv[0];

    if(stop_compile){
        printf("AmmAsm: Preprocessed successfully! %s\n", prosesedfile);
        free(prosesedfile);
        exit(0);
    }

    uint8_t *text = malloc(256 * 1024);
    int textsize = 0; // len
    int textcap  = 256 * 1024; // cap

    int flsz = 0;
 

    uint64_t entry_point = (pie_mode) ? 0x1000 : 0x401000; 
 
    FILE *input = fopen(file_name, "r");
    LEXER(input);
    DEBUG_PRINT_TOKENS();
 
    fclose(input);

    if(!no_preprocess){remove(prosesedfile); free(prosesedfile);}
    
    PARSE();
    
    FILE *output = fopen(argv[1], "wb");
 
    compiler(text, &textsize, &textcap, &entry_point);
    DEBUG_PRINT_AST();
    // mini driver
    flsz += pe32plus ?  PEgenfile(output, entry_point, text, textsize, pie_mode)  : 
            obj_file ?  GenObjElfFile(output, argv[0]) : 
                        ELFgenfile(output, entry_point, text, textsize, pie_mode);
    free(text);
    
    chmod(argv[1], 0775); // +x
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
        if (!strcmp(argv[i], "-o")){ out = argv[i+1]; i++; continue; }
        if (!strcmp(argv[i], "-pie")){ pie_mode = 1;  continue; }
        if (!strcmp(argv[i], "-pe32+")){ pe32plus = 1;  continue; }
        if (!strcmp(argv[i], "-E")){ stop_compile = 1;  continue; }
        if (!strcmp(argv[i], "-c")){ out = argv[i+1]; i++; obj_file = 1; continue; }
        if (!strcmp(argv[i], "-v")){ printf("AASM version %s\n", VERSION); exit(0);}
        if (!strcmp(argv[i], "-d") || !strcmp(argv[i], "--debug")) { debug = 1; continue;}
        if (!strcmp(argv[i], "--no-preprocess")){no_preprocess = 1; continue;}
        if (!strcmp(argv[i], "-h") || !strcmp(argv[i], "--help")){ 
            puts("AASM - Amm Assembler\n");
            puts("Usage:");
            puts("  ./aasm [options] <input_file>\n");
            puts("Options:");
            puts("  -o <file.out>   Specify the output file name.");
            puts("  -c <file.out>   Compile to an object file instead of executable.");
            puts("  -pie            Enable Position Independent Executable mode.");
            puts("  -d, --debug     Display a debug information while compiling.");
            puts("  -v              Display the version of AASM and exit.");
            puts("  -h, --help      Display this help menu and exit.");
            puts("  -E              Run the preprocessor only and generate <input>.i");
            puts("  -pe32+          Compile to PE32+ file format");
            puts("  --no-preprocess Do not run the preprocessor to increase speed\n");
            puts("Report bugs to: https://github.com/LinuxCoder13/AmmAsm/issues");
            exit(0);
        }
        if (argv[i][0] != '-') input = argv[i];
    }
 
    if (!input) {
        fprintf(stderr, "AmmAsm: \033[5;41mFatal: No input file given\033[0m\n");
        return 1; 
    }
 
    if(!out) {
        fprintf(stderr, "AmmAsm: option `-o' and `-c' requires an argument\n");
        return 1;
    }

    if(pie_mode && obj_file){
        fprintf(stderr, "AmmAsm: can't combinate pie and obj file mode\n");
        return 1;
    }

    if(no_preprocess && stop_compile){
        fprintf(stderr, "AmmAsm: impossible combination of flags\n");
        return 1;
    }

    char* fake_argv[] = { (char*)input, (char*)out};
    handl_pipeline(2, fake_argv);
 
    return 0;
}