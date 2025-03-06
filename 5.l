%{
#include <stdio.h>

void print_token(char *token, char *type) {
    printf("%s is %s.\n", token, type);
}

%}

%%
auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|inline|int|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while { print_token(yytext, "keyword"); }
"+"|"-"|"*"|"/"|"="|"%" { print_token(yytext, "an operator"); }
[\,\;\(\)\{\}] { print_token(yytext, "a separator"); }
[a-zA-Z_][a-zA-Z0-9_]* { print_token(yytext, "an identifier"); }
[ \t\n] {}
. { printf("Unknown character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}