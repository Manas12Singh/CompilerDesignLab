%{
#include <stdio.h>
%}

%%
"//".*\n ;
"/*"(.*\n)*"*/" ;
%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("in.c", "r");
    if (!yyin) {
        perror("Failed to open file");
        return 1;
    }
    yyout = fopen("out.c", "w");
    if (!yyout) {
        perror("Failed to open file");
        fclose(yyin);
        return 1;
    }
    yylex();
    fclose(yyout);
    return 0;
}