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
    expr '\n' input 
    |
    ;

expr:
    term { printf("Valid expression\n"); } 
    ;

term:
    term sign term
    | NUMBER
    ;

sign:
    '+'
    | '-'
    | '*'
    | '/'
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
