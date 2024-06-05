%{
#include<stdio.h>
extern char *yytext;
int lineCount=0;
int spaceCount=0;
int tabCount=0;
int wordCount=0;
%}

%%

\n {lineCount++;}
[\t] {tabCount++;}
" " {spaceCount++;}
[a-zA-Z]* {wordCount++;}
%%
int yywrap()
{
    return 1;
}
int main(){
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
   
    fprintf(yyout,"number of lines=%d\n", lineCount);
    fprintf(yyout,"number of space=%d\n", spaceCount);
    fprintf(yyout,"number of tabs=%d\n", tabCount);
    fprintf(yyout,"number of words=%d\n", wordCount);
    fclose(yyin);
    fclose(yyout);
    return 0;
}