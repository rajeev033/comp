%{
    int c=0;
%}

%s A B C D E DEAD

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("NOT Accepted");}
<INITIAL>[^ab\n] BEGIN DEAD;

<A>b BEGIN B;
<A>a BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("not accepted");}
<A>[^ab\n] BEGIN DEAD; 

<B>a BEGIN C;
<B>b BEGIN DEAD;
<B>\n BEGIN INITIAL;  {printf("not accepted");}
<B>[^ab\n] BEGIN DEAD;

<C>b BEGIN D;
<C>a BEGIN C;
<C>\n BEGIN INITIAL; {printf("not accepted");}
<C>[^ab\n] BEGIN DEAD;

<D>a BEGIN C;
<D>b BEGIN E;
<D>\n BEGIN INITIAL; {printf("not accepted");}
<D>[^ab\n] BEGIN DEAD;

<E>a BEGIN C;
<E>b BEGIN E;
<E>\n BEGIN INITIAL; {printf("accepted");}
<E>[^ab\n] DEAD;

<DEAD>\n BEGIN INITIAL; {printf("not accepted");}
<DEAD>[^ab] BEGIN DEAD;

%%

int yywrap(){return 1;}
int main()
{
    printf("Enter String");
    yylex();
    return 0;
}