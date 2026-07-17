#pragma once

#include <stdint.h>
#include "flags.h"
#include "enum.h"
#include "struct.h"
#include <stdio.h>
#include "parse.h"
#include <string.h>
#include <stdlib.h>
#include "linker.h"
#include "instruction_parse.h"
#include "parse.h"
#include "lexer.h"
#include "elf.h"
#include "debug.h"
#include "preprocessor.h"
#include <sys/stat.h>

extern void compiler(uint8_t *text, int *textsize, uint64_t *e_entry);
extern void handl_pipeline(int argc, char **argv);