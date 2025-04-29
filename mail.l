%{
#include <stdio.h>
%}

%%
^[a-z0-9_+]([a-z0-9_+-]*.[a-zA-Z_+-]+)*@gmail\.com$ {printf("Valid Email\n");}
.* {printf("Invalid email\n");}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}