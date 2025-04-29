%{
#include<stdio.h>
%}

%%
^[a-zA-Z0-9_][a-zA-Z0-9\-._]*"@"[a-zA-Z]+(\.[a-zA-Z]+)+$ {printf("%s is a valid email.",yytext);}
.* {printf("%s is not a valid email",yytext);}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}