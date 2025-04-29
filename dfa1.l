%{
#include <stdio.h>
%}
%s A DEAD
%%
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN INITIAL;
<INITIAL>\n printf("Accepted!\n");BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;
<A>a BEGIN INITIAL;
<A>b BEGIN A;
<A>\n printf("Not Accepted!\n");BEGIN INITIAL;
<DEAD>\n printf("Invalid\n");BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD; 
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
}