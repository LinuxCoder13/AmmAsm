#pragma once

#include "enum.h"
#include "struct.h"
#include "flags.h"
#include "instructions.h"
#include "Charset.h"
#include "parse.h"
#include <stdio.h>

#define IS_EXPR_OR_PC(operand) \
    (operand.type == O_PC || operand.type == O_EXPR)

#define IS_EXPR_OR_IMM_OR_PC(operand) \
    ((operand).type == O_PC || (operand).type == O_EXPR || (operand).type == O_IMM)

// collect labels with sections and find e_entry 
extern uint64_t collect_labels_sections();

// Ammlinker
extern void resolve_labels();

extern void expand_local_labels();

extern uint64_t resolve_expr(Expr expr, uint64_t pc, int line);
