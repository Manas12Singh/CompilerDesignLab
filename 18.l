%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[\n]            { return '\n'; }
[ \t]           ;  // Ignore whitespace
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }

.               { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() { return 1; }
