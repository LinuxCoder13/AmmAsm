#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "preprocessor.h"

// this code might look like shit


#define skips while(*buf == ' ' || *buf == '\t'){buf++;}
#define skipnl(line) \
    while (*buf == '\n') { \
        buf++; \
        (line)++; \
    }

typedef struct macro{
    uint8_t name[128];
    uint8_t **argv;
    int argv_len, argv_cap;
    uint8_t **content; // 1 line - 1 instruction
    int content_len, content_cap;
    int line;
    // int argc_count;
} macro;



static char* ParseArgs(char *buffer, macro* macros, int *line){
    char *buf = buffer;
    char arg_name[64] = {0};
    int i = 0;
    
    if(*buf == '('){
        buf++;
        skips;skipnl(*line);skips;
        while(*buf != ')' && *buf != '{'){
            for(i = 0; *buf && *buf != ')' && *buf != ',' && *buf != ' ' && *buf != '\n' && *buf != '{'; i++){
                if(!isin(LETEXT, *buf)){ fprintf(stderr, "AmmAsm:%d: Macro args can include only alpha letters\n", *line); exit(1);}
                arg_name[i] = *buf++;
            }

            if (*buf == ',') { buf++; skips; skipnl(*line);}

            skips;skipnl(*line);skips;
            arg_name[i] = '\0';
            if(macros) if(arg_name[0] != 0)macros->argv = TwoDappend(&macros->argv_len, &macros->argv_cap, macros->argv, arg_name);
        }
        if (*buf == ')') { buf++; skips;skipnl(*line);skips;}
        else { fprintf(stderr, "AmmAsm:%d: expected ')'\n", *line); exit(1);}
    }
    else {fprintf(stderr, "AmmAsm:%d: expected '('\n", *line); exit(1);}
    return buf;
}

static char *SkipComment(char *buf, int *line){
    skips;

    if (*buf == ';' || (*buf == '/' && *(buf + 1) == '/')) {
        while (*buf && *buf != '\n')buf++;
    }

    if (*buf == '/' && *(buf + 1) == '*') {
        buf += 2;

        while (*buf && !(*buf == '*' && *(buf + 1) == '/')) {
            if (*buf == '\n')(*line)++;
            buf++;
        }

        if (!*buf) {fprintf(stderr, "AmmAsm:%d: unterminated comment\n", *line); exit(1);}
        buf += 2;
    }

    return buf;
}

static char* ParseMacroBody(char *buffer, macro* macros, int *line){
    uint8_t in_char = 0, in_string = 0, in_comment = 0;
    uint8_t entry[64] = {0};
    int entry_len = 0;

    char *buf = buffer;
        if(*buf == '{'){
        buf++;
        while(*buf){ 
            skips;skipnl(*line);skips;
            if(*buf == '}') break;
            while(*buf && *buf != '\n') {
                // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                // warn: comments "//" and "/**/" are not supported in macro content!!!!
                // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                if (*buf == '\\' && in_string) {
                    entry[entry_len++] = *buf++;
                    if (*buf) entry[entry_len++] = *buf++;
                    continue;
                }

                if (*buf == '"' && !in_char && !in_comment) in_string = !in_string;
                if (*buf == '\'' && !in_string && !in_comment)in_char = !in_char;
                if(*buf == ';'){in_comment = 1; }

                if(*buf == '}' && !in_char && !in_comment && !in_string) break;
                if(*buf == '/' && !in_char && !in_comment && !in_string){ entry[++entry_len] = *buf++; break; }
                entry[entry_len++] = *buf++;
            }
            in_comment = 0;
            entry[entry_len] = 0;
            entry_len = 0;
            if(macros){
                if((!strncasecmp(entry, "macro", 5) && (entry[5] == ' ' || entry[5] == '\t'))){fprintf(stderr, "AmmAsm:%d: Can't define nested macro\n", *line); exit(1);}
                if(!strncmp(macros->name, entry, strlen(macros->name))){
                    char *p = entry;
                    p += strlen(macros->name);
                    while(*p == ' ' || *p == '\t')p++;
                    if(*p == '('){fprintf(stderr, "AmmAsm:%d: Can't call macro in it's self\n", *line); exit(1);}
                }
                macros->content = TwoDappend(&macros->content_len, &macros->content_cap, macros->content, entry);
            }
        }
         if (!*buf) {fprintf(stderr, "AmmAsm:%d: unterminated macro (expected '}')\n", *line); exit(1);}
    }
    else {fprintf(stderr, "AmmAsm:%d: expected '{'\n", *line); exit(1);}

    if(*buf == '}') buf++;
    return buf;
}


// only in declaration
static char* ParseMacroName(char *buffer, macro* macros, int *line){
    int i = 0;
    char *buf = buffer;
    for(i = 0; i < 63 && *buf && *buf != '(' && *buf != ' ' && *buf != '\n'; i++){
        skips;
        if(!isin(LETEXT, *buf)){
            fprintf(stderr, "AmmAsm:%d: Macro name can include only alpha letters\n", *line); exit(1);
        }
        if(macros)macros->name[i] = *buf;
        buf++;
    }
    if(macros){
        macros->name[i] = 0;
        if(!strcmp(macros->name, "")){ fprintf(stderr, "AmmAsm:%d: expected macro name\n", *line); exit(1);}
    }
    skips;skipnl(*line);skips
    return buf;
}

static void ParseMacro(char *buffer, macro** macros, int* macros_len, int* macros_cap){

    int line = 1;
    char *buf = buffer;

    // first pass is collecting all macro in file
    while (*buf) {
        skips;
        buf = SkipComment(buf, &line);

        if(!strncasecmp(buf, "macro", 5) && (buf[5] == ' ' || buf[5] == '\t')){ // expect this struct -> macro foo( arg1, arg2...)
            macro mc = {0};
            mc.line = line;
            buf+=5;
            skips; skipnl(line); skips;
            // copy name
            buf = ParseMacroName(buf, &mc, &line);

            // read args
            buf = ParseArgs(buf, &mc, &line);

            // collect body
            buf = ParseMacroBody(buf, &mc, &line);

            *macros = append(
                macros_len,
                macros_cap,
                *macros,
                &mc,
                sizeof(macro)
            );
        }
        buf++;
        
    }
    return;
}

static char* ParseArgsOfCalledMacro(char *buf, macro *macros, int *line){
    char arg[256] = {0};
    int arg_len = 0;

    int paren_depth = 0;
    int bracket_depth = 0;

    uint8_t in_string = 0;
    uint8_t in_char = 0;

    if (*buf != '(') {
        fprintf(stderr, "AmmAsm:%d: expected '('\n", *line);
        exit(1);
    }

    buf++;
    skips; skipnl(*line); skips;

    while (*buf) {

        if (*buf == ')' && !in_string && !in_char && paren_depth == 0)break;
        arg_len = 0;
        while (*buf) {
            if (*buf == '\\' && (in_string || in_char)) {
                arg[arg_len++] = *buf++;
                if (*buf) arg[arg_len++] = *buf++;
                continue;
            }

            if (*buf == '"' && !in_char) in_string = !in_string;
            else if (*buf == '\'' && !in_string)in_char = !in_char;
            if (!in_string && !in_char) {
                // you can write fucking `foo(bar(10))`
                if (*buf == '(') paren_depth++;
                else if (*buf == ')') {
                    if (paren_depth == 0) break;
                    paren_depth--;
                }
                else if (*buf == '[') bracket_depth++;
                else if (*buf == ']') bracket_depth--;
                if (*buf == ',' && paren_depth == 0 && bracket_depth == 0) break;
            }

            arg[arg_len++] = *buf++;
        }
        // if user typed fucking foo(10       ,        10) // fuck you user!
        while (arg_len > 0 &&
              (arg[arg_len-1] == ' ' ||
               arg[arg_len-1] == '\t' ||
               arg[arg_len-1] == '\n'))
            arg_len--;

        arg[arg_len] = 0;

        if (macros && arg_len) macros->argv = TwoDappend( &macros->argv_len, &macros->argv_cap, macros->argv, arg);

        if (*buf == ',') {
            buf++;
            skips;
            skipnl(*line);
            skips;
        }
    }

    if (*buf != ')') {
        fprintf(stderr, "AmmAsm:%d: expected ')'\n", *line);
        exit(1);
    }

    buf++;
    skips;
    skipnl(*line);
    skips;

    return buf;
}


#define MAX_MACRO_DEPTH 64
#define MAX_EXPAND_LINE 2048

// replace fucking args from fucking caller to your fucking macro body
static char* SubstituteArgs(macro *m, macro *call, const char *line, char *out, size_t outsz){
    const char *buf = line;
    size_t oi = 0;
    uint8_t in_string = 0, in_char = 0;

    while (*buf && oi + 1 < outsz) {
        if (*buf == '\\' && (in_string || in_char)) {
            out[oi++] = *buf++;
            if (*buf && oi + 1 < outsz) out[oi++] = *buf++;
            continue;
        }

        if (*buf == '"' && !in_char) in_string = !in_string;
        else if (*buf == '\'' && !in_string) in_char = !in_char;

        if (!in_string && !in_char && isin(LETEXT, *buf)) {
            const char *name = buf;
            while (*buf && isin(LETEXT, *buf)) buf++;
            int len = buf - name;

            int match = -1;
            for (int j = 0; j < m->argv_len; j++) {
                if ((int)strlen((char *)m->argv[j]) == len && !strncmp((char *)m->argv[j], name, len)) {
                    match = j;
                    break;
                }
            }

            // replace fucking args
            if (match != -1 && match < call->argv_len) {
                const char *rep = (char *)call->argv[match];
                while (*rep && oi + 1 < outsz) out[oi++] = *rep++;
            } 
            else {
                for (int k = 0; k < len && oi + 1 < outsz; k++) out[oi++] = name[k]; // if not arg, then just copy
            }
            continue;
        }

        out[oi++] = *buf++;
    }

    out[oi] = 0;
    return out;
}

static void FindCallOfMacro(char *buff, macro *macros, int macros_len, int *line, int *stack, int *stack_len, FILE *out);
static void ExpandMacroCall(macro *macros, int macros_len, int idx, macro *call, int *line, int *stack, int *stack_len, FILE *out){
    macro *m = &macros[idx];

    if (call->argv_len != m->argv_len) {
        fprintf(stderr, "AmmAsm:%d: macro '%s' expects %d argument(s), got %d\n", *line, m->name, m->argv_len, call->argv_len);
        exit(1);
    }


    // how this shit works (also writen in fucking manual) ->
    /*
        detect ex.
        [A -> B -> A]!
        [A -> B -> C -> A]!

        so my fucking preprosses kick you if he detects two or more times same index of macro
        so idx is index of last called macro 
    
    */
    for (int i = 0; i < *stack_len; i++) {
        if (stack[i] == idx) {
            fprintf(stderr, "AmmAsm:%d: recursive expansion of macro '%s'\n", *line, m->name);
            exit(1);
        }
    }

    if (*stack_len >= MAX_MACRO_DEPTH) {
        fprintf(stderr, "AmmAsm:%d: macro expansion tooooo deep (max possible recursion is %d)\n", *line, MAX_MACRO_DEPTH);
        exit(1);
    }

    stack[(*stack_len)++] = idx;

    char expanded[MAX_EXPAND_LINE];
    for (int i = 0; i < m->content_len; i++) {
        SubstituteArgs(m, call, (char *)m->content[i], expanded, sizeof(expanded));
        // this time, trying to find called macro in macro (nested)
        FindCallOfMacro(expanded, macros, macros_len, line, stack, stack_len, out);


        fputc('\n', out);
    }

    (*stack_len)--;
}


static void FindCallOfMacro(char *buff, macro *macros, int macros_len, int *line, int *stack, int *stack_len, FILE *out){

    char *buf = buff;
    uint8_t in_string = 0, in_char = 0;

    while (*buf) {

        if (in_string || in_char) {
            if (*buf == '\\') {
                fputc(*buf, out);
                buf++;
                if (*buf) { fputc(*buf, out); buf++; }
                continue;
            }
            if (*buf == '"' && !in_char) in_string = 0;
            else if (*buf == '\'' && !in_string) in_char = 0;
            if (*buf == '\n') (*line)++;
            fputc(*buf, out);
            buf++;
            continue;
        }


        char *before_skip = buf;
        buf = SkipComment(buf, line);
       
        for (char *c = before_skip; c < buf && (*c == ' ' || *c == '\t'); c++) {
            fputc(*c, out);
        }
        if (!*buf) break;

        if (*buf == '"' || *buf == '\'') {
            if (*buf == '"') in_string = 1; else in_char = 1;
            fputc(*buf, out);
            buf++;
            continue;
        }


        if (!strncasecmp(buf, "macro", 5) && (buf[5] == ' ' || buf[5] == '\t')) {

            buf += 5;
            skips;
            skipnl(*line);
            skips;
            // skip declaration of fuking macro
            buf = ParseMacroName(buf, NULL, line);
            buf = ParseArgs(buf, NULL, line);
            buf = ParseMacroBody(buf, NULL, line);

            continue;
        }

        // copy of unknow fucking char
        if (!isin(LETEXT, *buf)) {
            if (*buf == '\n'){ (*line)++;} // skip fucking \n
            fputc(*buf, out);
            buf++;
            continue;
        }

        char *name = buf;

        while (isin(LETEXT, *buf))
            buf++;

        int len = buf - name;

        int idx = -1;

        // is macro name?
        for (int i = 0; i < macros_len; i++) {

            if ((int)strlen(macros[i].name) != len)
                continue;

            if (!strncmp(name, macros[i].name, len)) {
                idx = i;
                break;
            }
        }

        // if not then copy
        if (idx == -1) {
            fwrite(name, 1, len, out);
            continue;
        }

        char *p = buf;
        char *ws_start = buf;

        skips;

        // call of macro?
        if (*p != '(') {
            fwrite(name, 1, len, out);
            for (char *c = ws_start; c < buf; c++) {
                if (*c == ' ' || *c == '\t') fputc(*c, out);
            }
            continue;
        }

        macro call = {0};
        p = ParseArgsOfCalledMacro(p, &call, line);

        ExpandMacroCall(macros, macros_len, idx, &call, line, stack, stack_len, out);

        buf = p;
    }
}

char* Preprocess(const uint8_t* flname){
    FILE* fl = fopen((char*)flname, "r");
    
    if (!fl) {
        fprintf(stderr, "AmmAsm:\033[;31m Fatal: no such file or dir\033[0m\n");
        exit(1);
    }    

    if (fseek(fl, 0, SEEK_END) != 0) { fprintf(stderr, "AmmAsm: Can't read file '%s'\n", flname); exit(1); }
    int size = ftell(fl);
    
    rewind(fl); // go back to start
    
    char* buff = malloc(size + 1);
    fread(buff, 1, size, fl);
    buff[size] = 0;

    macro *macros = NULL;
    int macros_len = 0, macros_cap = 0;


    ParseMacro(buff, &macros, &macros_len, &macros_cap);

    // "<flname>.i" output path
    // input.asm -> input.asm.i
    size_t namelen = strlen((char*)flname);
    char *outname = malloc(namelen + 3); // 3 = . + i + \0
    memcpy(outname, flname, namelen);
    outname[namelen] = '.';
    outname[namelen + 1] = 'i';
    outname[namelen + 2] = 0;

    FILE *out = fopen(outname, "w");
    if(!out){
        fprintf(stderr, "AmmAsm: Could not open file '%s'\n", outname);
        exit(1);
    }

    int line = 1;
    int stack[MAX_MACRO_DEPTH];
    int stack_len = 0;

    FindCallOfMacro(buff, macros, macros_len, &line, stack, &stack_len, out);

    fclose(out);
    fclose(fl);
    return outname;
}

