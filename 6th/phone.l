%{
    #include<stdio.h>
    extern char *yytext;
%}

%%
^98[0-9]{8}$ {fprintf(yyout, "valid phone number");}
.* {fprintf(yyout, "invalid phone number");}

%%

int yywrap()
{
    return 1;
}
int main()
{
    extern FILE *yyout, *yyin;
    yyin=fopen("input.txt", "r");
    yyout=fopen("output.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}