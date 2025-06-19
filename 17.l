%{
#include "y.tab.h"
%}

digit   [0-9]
%%
{digit}+    { return NUMBER; }
[\+\-\*\/]         { return *yytext; }
[ ]     ;
\n      { return '\n'; }

%%

int yywrap() {
    return 1;
}
