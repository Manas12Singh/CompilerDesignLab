%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[\n]            { return '\n'; }
[ \t]           ;
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
.               { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() { return 1; }
