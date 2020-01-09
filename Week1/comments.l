%{
#include<stdio.h>
%}

key [main|int|return|]

%%
[\t]+ {};
\/\/(.*) {};					
\/\*(.*\n)*.*\*\/  {};
%%

int yywrap()
{
return 1;
}


int main()
{
yyin=fopen("input.c","r");
yyout=fopen("out.c","w");
/*call the yylex function.*/
yylex();
return 0;
}
