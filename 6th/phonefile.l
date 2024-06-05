%{
#include <stdio.h>
extern FILE *yyin;
%}

%%
^98[0-9]{8}$          { printf("Valid phone number: %s\n", yytext); }
.*                    {    printf("Invalid phone number: %s\n", yytext);}
%%
int yywrap()
{
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s filename\n", argv[0]);
        return 1;
    }
    
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }
    
    // Set the file as input stream
    yyin = file;

    // Start scanning
    yylex();

    fclose(file); // Close the file when done
    return 0;
}