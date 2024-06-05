%{
#include<stdio.h>
%}
%s A B D
%%
<INITIAL>0 BEGIN INITIAL;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\n] BEGIN D;
<INITIAL>\n BEGIN INITIAL;{printf("not accepted");}
<A>0 BEGIN INITIAL;
<A>1 BEGIN B;
<A>[^01\n] BEGIN D;
<A>\n BEGIN INITIAL;{printf("not accepted");}
<B>0 BEGIN INITIAL;
<B>1 BEGIN B;
<B>[^01\n] BEGIN D;
<B>\n BEGIN B;{printf("Accepted");}
%%
int yywrap(){return 1;}
int main()
{
    printf("Enter String");
    yylex();
    return 0;
}