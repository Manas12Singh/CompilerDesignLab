%{
#include "y.tab.h"
%}

digit   [0-9]
%%
{digit}+    { yylval = atoi(yytext); return NUMBER; }
[\+\-\*\/\(\)]         { return *yytext; }
[ \t\n]     ;
%%

int yywrap() {
    return 1;
}
