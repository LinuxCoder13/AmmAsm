#pragma once
#include "struct.h"
#include "stdio.h"
#include "Charset.h"
#include "flags.h"
#include "registers.h"
#include "instructions.h"
#include <string.h>
#include "utality.h"
#include <stdlib.h>

extern Token *toks;
extern int toks_len;
extern int toks_cap;

extern void add_token(int type, char* value, int line);
extern void del_all_toks(void);
extern char *read_string(char *buff, char *dest, int line);
extern int LEXER(FILE* fl);