%{
#include<stdio.h>
int countt[256]={0};
int count=0;
%}

%%
[a-zA-Z] {countt[*yytext]++;}
[0-9]+ {count++;}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("%d\n", count);
    for(int i=0;i<26;i++){
        if (countt[i]!=0)
        printf("%c: %d\n",i,countt[i]);
    }
    return 0;
}