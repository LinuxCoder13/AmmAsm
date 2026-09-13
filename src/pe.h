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

int PEgenfile(FILE *fl, uint64_t e_entry, uint8_t *text_code, uint64_t text_size, int pie_mode);