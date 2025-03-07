%{
#include <stdio.h>
#include <stdlib.h>
int character=0, word=0, whitespace=0;
%}

%%
[a-zA-Z0-9]+ { word++; character+=yyleng; }
[ \t\n] { whitespace++;character++; }
. ;
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("Input.txt", "r");
    if (!yyin) {
        perror("Failed to open file");
        return 1;
    }
    yylex();
    fclose(yyin);
    printf("The number of total characters in the given input file is: %d\n", character);
    printf("The number of total words in the given input file is: %d\n", word);
    printf("The number of total whitespaces in the given input file is: %d\n", whitespace);
    return 0;
}