/*Definition Section*/ 
%{ 
%}
  

  
/*Rule Section*/ 
%% 
  
"<"[^>]*> {printf("%s", yytext);}
. {}
  
%% 

int yywrap()
{
    return 0;
}
int main()
{
    /*extern FILE *yyout, *yyin;
    yyin=fopen("codein.txt", "r");
    yyout=fopen("output.txt", "w");
    yylex();
    fclose(yyout);
    fclose(yyin);*/
    yylex();
    return 0;
}
