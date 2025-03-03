%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *out;
%}

%%
\/\/[^\n]* {}
\n { fprintf(out, "\n"); }
.* { fprintf(out, "%s", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    out = fopen("out.c", "w");
    if (!out) {
        perror("Failed to open file");
        return 1;
    }
    yylex();
    fclose(out);
    return 0;
}