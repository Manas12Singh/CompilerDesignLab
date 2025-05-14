%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char* s);
int yylex();
%}

%token NUMBER
%left '+' '-'
%left '+' '/'
%%
start
expr '\n' {printf("Result= %d\n",$1);}