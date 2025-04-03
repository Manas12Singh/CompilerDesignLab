%{
#include <stdio.h>
void print(char *a,char* b){
    printf("%s is %s.\n",a,b);
}
%}
%%
^[+-]?[0-9]*[24680]$ {print(yytext,"an even number");}
^[+-]?[0-9]+$ {print(yytext,"an odd number");}
.* {print(yytext,"not a valid number");}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}