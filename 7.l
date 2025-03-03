%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

FILE *infile, *outfile;
%}

%%
[ ]+   { fputc(' ', outfile); }
\n    { fputc('\n', outfile); }
.        { fputc(yytext[0], outfile); }
%%

int yywrap() {
    return 1;
}

int main() {
    infile = fopen("Input.txt", "r");
    if (!infile) {
        perror("Error opening Input.txt");
        return 1;
    }
    
    outfile = fopen("Output.txt", "w");
    if (!outfile) {
        perror("Error opening Output.txt");
        fclose(infile);
        return 1;
    }
    
    yyin = infile;
    yylex();
    
    fclose(infile);
    fclose(outfile);
    
    return 0;
}
