%{
#include <stdio.h>
%}

%%
^98[0-9]{8}$  { printf("Valid phone number"); }
[0-9]+         {printf("invalid");}  

%%
int yywrap()
{
    return 0;
}

int main() {
    yylex();
    return 0;
}
