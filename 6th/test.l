/*Lex program to take input from file and remove multiple spaces, newline and tab and write output in a separate file*/
%{
#include<stdio.h>
extern char *yytext;
%}

%%
abc {printf("%s", yytext);}
.*   {printf("%s", "heyy");}     
%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}