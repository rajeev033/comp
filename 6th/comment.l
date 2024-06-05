/*Definition Section*/ 
%{ 
%}
  
/*Starting character sequence for multiline comment*/ 
start ^\/* 
/*Ending character sequence for multiline comment*/ 
end  \*\/ 
  
/*Rule Section*/ 
%% 
  
\/\/.* ; 

^"/*"[.\n]* "*/" ; 
  
%% 

int yywrap()
{
    return 1;
}
int main()
{
    extern FILE *yyout, *yyin;
    yyin=fopen("codein.txt", "r");
    yyout=fopen("output.txt", "w");
    yylex();
    fclose(yyout);
    fclose(yyin);
    return 0;
}
