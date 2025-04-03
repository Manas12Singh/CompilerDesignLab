%{
#include <stdio.h>
extern FILE *yyin,*yyout;
%}

%%
"<"[!/]?[a-zA-Z][^>]*">" {fprintf(yyout,"%s",yytext);}
. ;
%%

int yywrap(){
    return 1;
}

int main(){
    yyout = fopen("out.txt","w");
    yylex();
    return 0;
}