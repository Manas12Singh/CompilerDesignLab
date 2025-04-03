%{
#include <stdio.h>
extern FILE *yyin,*yyout;
%}

%%
"<"[a-zA-Z0-9/!][^>]*">" {fprintf(yyout,"%s",yytext);}
. ;
%%

int main(){
    yyout = fopen("out.txt","w");
    yylex();
    return 0;
}