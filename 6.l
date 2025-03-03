%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int character=0, word=0, whitespace=0;
%}

%%
[a-zA-Z]+ { word++; character+=strlen(yytext); }
[ \t\n] { whitespace++;character++; }
. { character++; }
%%

int yywrap() {
    return 1;
}

int main() {
    FILE *fp = fopen("Input.txt", "r");
    if (!fp) {
        perror("Failed to open file");
        return 1;
    }
    yyin = fp;
    yylex();
    fclose(fp);
    printf("The number of total characters in the given input file is: %d\n", character);
    printf("The number of total words in the given input file is: %d\n", word);
    printf("The number of total whitespaces in the given input file is: %d\n", whitespace);
    return 0;
}