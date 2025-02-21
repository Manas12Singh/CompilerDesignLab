%{
#include <stdio.h>
int lines=0,space=0,tab=0,rest=0;
%}
%%
\n {lines++;}
\t {tab++;}
[ ] {space++;}
. {rest++;}
%%
int yywrap(void){	}

int main(){
    yylex();
	printf("The number of lines are: %d\n",lines);
	printf("The number of spaces are: %d\n",space);
	printf("The number of tab-meta characters are: %d\n",tab);
	printf("The rest of characters are: %d\n",rest);
	return 0;
}