%{
#include <stdio.h>
%}
%s A B C DEAD
%%
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>\n printf("Accepted!\n");BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;
<A>a BEGIN INITIAL;
<A>b BEGIN C;
<A>\n printf("Not Accepted!\n");BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;
<B>a BEGIN C;
<B>b BEGIN INITIAL;
<B>\n printf("Not Accepted!\n");BEGIN INITIAL;
<C>[^ab\n] BEGIN DEAD;
<C>a BEGIN B;
<C>b BEGIN B;
<C>\n printf("Not Accepted!\n");BEGIN INITIAL;
<DEAD>\n printf("Invalid\n");BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD;
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
}