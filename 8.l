%{
#include <stdio.h>
int t=0;
%}

%%
"//".* ;
"/*"([^*]|\*+[^*/])*\*+"/" ;
%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE *yyout;
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