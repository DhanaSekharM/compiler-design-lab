%{
#include<stdio.h>
int lineno = 1;
%}

letter [a-zA-z]
digit [0-9]


%%
\/\/(.*) {};					
\/\*(.*\n)*.*\*\/  {};
[\n]* {lineno++;
    fprintf(yyout, "%s", "\n");
    }
#include<{letter}+(\.{letter}*)?> fprintf(yyout, "%s", yytext);
return|main|while|for|if|else|printf fprintf(yyout, "%s", yytext);
char[ ]*\*|int[ ]*\*|float[ ]*\* fprintf(yyout, "%s", yytext);
char|int|float fprintf(yyout, "%s", yytext);
\( fprintf(yyout, "%s", yytext);
\{ fprintf(yyout, "%s", yytext);
\) fprintf(yyout, "%s", yytext);
\} fprintf(yyout, "%s", yytext);
; fprintf(yyout, "%s", yytext);
= fprintf(yyout, "%s", yytext);
{letter}({letter}|{digit})* fprintf(yyout, "%s", yytext);
{digit}* fprintf(yyout, "%s", yytext);
{digit}*\.{digit}* fprintf(yyout, "%s", yytext);
\"({letter}|{digit})*\" fprintf(yyout, "%s", yytext);
\'({letter}|{digit})?\' fprintf(yyout, "%s", yytext); 
[ ]=[ ] fprintf(yyout, "%s", "=");
[\t] {}
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
