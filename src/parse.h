#pragma once
#include "lexer.h"
#include "enum.h"
#include "struct.h"
#include "encoder.h"
#include <stdlib.h>
#include <string.h> 


extern AST *ast;
extern int ast_len;
extern int ast_cap;

extern AST* PARSE();