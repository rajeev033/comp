%{
    int c=0;
%}
%s A B C D E F DEAD
%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN DEAD;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL;{printf("not accepted");}

<A>b BEGIN B;
<A>a BEGIN F;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("not accepted");}

<B>a BEGIN C;
<B>b BEGIN DEAD;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN B; {printf("not Accepted");}

<C>a BEGIN C;
<C>b BEGIN D;
<C>\n BEGIN C; {printf("not accepted");}
<C>[^01\n] BEGIN DEAD;

<D>a BEGIN C;
<D>b BEGIN E;
<D>\n BEGIN D; {printf("not accepted");}
<D>[^ab\n] BEGIN DEAD;

<E>a BEGIN C;
<E>b BEGIN E;
<E>\n BEGIN E;{printf("accepted");}

<DEAD>\n BEGIN INITIAL;{printf("Not Accepted");} 
%%
int yywrap(){return 1;}
int main()
{
    printf("Enter String");
    yylex();
    return 0;
}