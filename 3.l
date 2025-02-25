%{
#include <stdio.h>
int i=1,isValid=0;
%}

%%
([a-zA-Z_][a-zA-Z0-9_]*) {isValid=1;}
\n {printf("%d) This is %sa Valid Identifier\n%d) Enter any identifier you want to check: ",i,(isValid?"":"not "),i+1);i++;}
. {isValid=0;}
%%
int yywrap(void){}
int main(){
    printf("%d) Enter any identifier you want to check: ",i);
    yylex();
    return 0;
}