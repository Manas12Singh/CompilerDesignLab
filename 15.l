%{
#include <stdio.h>
%}
%s A B C D DEAD
%%
<INITIAL>[^a-zA-Z0-9+-_\n] BEGIN DEAD;
<INITIAL>[a-zA-Z_] BEGIN A;
<INITIAL>[+-] BEGIN B;
<INITIAL>[0-9] BEGIN C;
<INITIAL>\n printf("Empty\n");BEGIN INITIAL;
<A>[^a-zA-Z0-9_\n] BEGIN DEAD;
<A>[a-zA-Z0-9_]+ ;
<A>\n printf("Identifier!\n");BEGIN INITIAL;
<B>[^0-9] BEGIN DEAD;
<B>[0-9] BEGIN C;
<C>[^0-9\.\n] BEGIN DEAD;
<C>[0-9]+ ;
<C>\. BEGIN D;
<C>\n printf("Integer!\n");BEGIN INITIAL;
<D>[^0-9\n] BEGIN DEAD;
<D>[0-9]+ ;
<D>\n printf("Float!\n");BEGIN INITIAL;
<DEAD>\n printf("Invalid\n");BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD;
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
}