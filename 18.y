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
    term { printf("Result = %d\n",$1); } 
    ;

term:
    term '+' term { $$ = $1 + $3; }
    | term '-' term { $$ = $1 - $3; }
    | term '*' term { $$ = $1 * $3; }
    | term '/' term { if( $3 != 0 ) $$ = $1 / $3; else yyerror("Division by zero.") , $$=0 ; }
    | NUMBER { $$ = $1; }
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