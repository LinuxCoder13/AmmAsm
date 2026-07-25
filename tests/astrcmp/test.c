#include <stdio.h>
#include <stdint.h>

uint8_t *foo = "start_start_start_start_start";
char* bar = "start_start_start_!start_start";

extern int astrcmp(const char *a, const char *b);

int main(void) {
    printf("%d\n", astrcmp("hello", "hello"));
    printf("%d\n", astrcmp("abc", "abd"));
    printf("%d\n", astrcmp("xyz", "abc"));
    printf("%d\n", astrcmp(foo, bar));

    return 0;
}