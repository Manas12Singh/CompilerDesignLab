%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%start input

%token NUMBER

%%

input:
    expr    { printf("Valid expression\n"); }
    | input expr    { printf("Valid expression\n"); }
    ;

expr:
    expr '+' term
    | expr '-' term
    | term
    ;

term:
    term '*' factor
    | term '/' factor
    | factor
    ;

factor:
    NUMBER
    | '(' expr ')'
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main() {
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}
