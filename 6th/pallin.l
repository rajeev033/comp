%{
    #include<stdio.h>
    extern char *yytext;
%}

%%
[a-zA-Z0-9]+ {
                    int isPallindrome =1;
                    for(int i=0;i<yyleng;i++){
                    if(yytext[i]!=yytext[yyleng-i-1])
                    {
                        printf("not a pallindrome");
                        isPallindrome=0;
                        break;
                        
                    }
                                           
                }
                if(isPallindrome==1)
                {
                    printf("string is pallindrome"); 
                }
                
            }
%%

int yywrap()
{
    return 1;
}
int main()
{
    yylex();
    return 0;
}