%{
#include <stdio.h>
int v=0,c=0;
%}
%%
[aeiouAEIOU] {v++;}
[b-zB-Z] {c++;}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    printf("Total number of Vowels are: %d\n",v);
    printf("Total number of Consonants are: %d\n",c);
    return 0;
}