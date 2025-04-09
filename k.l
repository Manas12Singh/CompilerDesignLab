%{
#include <stdio.h>
%}
%%
[]
%%
int yywrap(){
    return 1;
}
int main(){
    yyin=fopen("k.txt","r");
    yylex();
    return 0;
}