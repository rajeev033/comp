%{
    #include<stdio.h>
%}

%%

[0-9]+ {printf("integer");}
[0-9]+[\.][0-9]+ {printf("float");}

%%
int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter number=");
    yylex();
    return 0;
}
