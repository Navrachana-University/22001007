#include <stdio.h>

extern int yyparse();

int main() {
    printf("Running parser...\n");
    yyparse();
    return 0;
}
