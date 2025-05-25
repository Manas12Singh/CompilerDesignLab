%{
#include <stdio.h>
%}
%s A B C DEAD
%%
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>\n printf("Empty!\n");BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;
<A>a+ ;
<A>b BEGIN C;
<A>\n printf("Not Accepted!\n");BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;
<B>[ab] BEGIN B;
<B>\n printf("Not Accepted!\n");BEGIN INITIAL;
<C>[^ab\n] BEGIN DEAD;
<C>a BEGIN A;
<C>b BEGIN C;
<C>\n printf("Accepted!\n");BEGIN INITIAL;
<DEAD>\n printf("Invalid\n");BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD;
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
}