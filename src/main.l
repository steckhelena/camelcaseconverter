%{
#include <stdio.h>

#include "ccc_lib.h"

%}

underline ([_]*[a-z]+[_]+[a-z]*[_]*)+
camelcase ([A-Z]+[a-z]*)+([A-Z][a-z]*)

%s no_error
%%
<INITIAL>(.*{underline}{camelcase}.*)|(.*{camelcase}{underline}.*) { printf("ERRO\n"); return 1; }
<no_error>{underline} { char *temp = malloc(sizeof(char)*yyleng); underline_to_camelcase(yytext, temp); printf("%s", temp); free(temp); }
<no_error>{camelcase} { char *temp = malloc(sizeof(char)*yyleng*2); camelcase_to_underline(yytext, temp); printf("%s", temp); free(temp); }
<no_error>\n { ECHO; BEGIN(INITIAL); }
<INITIAL>.* { yyless(0); BEGIN(no_error); }
%%

int main() {
	yylex();
	
	return 0;
}


