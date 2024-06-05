%{
#include <stdio.h>
%}

%%
98[0-9]{8}      { printf("Valid phone number: %s\n", yytext); }

.               { printf("Invalid phone number: %s\n", yytext); }
%%
int yywrap() {
    return 1; 
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error opening file: %s\n", argv[1]);
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}
