#pragma once

#include <stdint.h>
#include "enum.h"
#include "instructions.h"
#include "struct.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "linker.h"
#include "utality.h"
#include "encoder.h"

extern uint8_t parseInst(AST* node, uint64_t *pc);
extern void parse_size_directives(AST* node, uint64_t *pc);