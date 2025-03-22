%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
%}

%%
[ \t]+   { fputs(" ", yyout); }
. { fputs(yytext, yyout); }
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("Input.txt", "r");
    if (!yyin) {
        perror("Error opening Input.txt");
        return 1;
    }
    
    yyout = fopen("Output.txt", "w");
    if (!yyout) {
        perror("Error opening Output.txt");
        fclose(yyin);
        return 1;
    }
    yylex();
    
    fclose(yyin);
    fclose(yyout);
    
    return 0;
}
