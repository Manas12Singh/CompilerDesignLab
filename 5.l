%{
#include <stdio.h>
#include <string.h>

void print_token(char *token, char *type) {
    printf("%s is %s.\n", token, type);
}

%}

%%
"int"|"float"|"char"|"double"|"return"|"if"|"else"|"while"|"for"|"do"|"break"|"continue"|"void"|"switch"|"case"|"default"|"goto" { print_token(yytext, "keyword"); }
"+"|"-"|"*"|"/"|"=" { print_token(yytext, "an operator"); }
\,|\;|\(|\)|\{|\} { print_token(yytext, "a separator"); }
[0-9]+ { print_token(yytext, "a constant"); }
[a-zA-Z_][a-zA-Z0-9_]* { print_token(yytext, "an identifier"); }
[ \t\n] {}
. { printf("Unknown character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main(int argc, char **argv) {
    yylex();
    return 0;
}