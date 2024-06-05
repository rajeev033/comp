%{
    #include<stdio.h>

%}


%% 

^[a-z A-Z _]+[a-z A-Z 0-9 _]* {printf("valid identifier");}
.* {printf("invalid identifier");}

%%
int yywrap()
{
    return 0;
}
int main()
{
    printf("enter a c identifier=");
    yylex();
    return 0;
}