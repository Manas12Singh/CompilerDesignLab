%{
#include<stdio.h>
void print_token(char *token, char *type) {
    printf("%s is %s.\n", token, type);
}
%}
%%
^\".*\"$ {print_token(yytext,"string");}
^auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while$ { print_token(yytext, "keyword"); }
^[+-]?[0-9]*(\.[0-9]*)?$ {print_token(yytext, "constants");}
^[a-zA-Z_][a-zA-Z0-9_]*$ {print_token(yytext, "identifiers");}
^\'.*\'$ {print_token(yytext, "literals");}
.* {print_token(yytext, "invalid token");}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}