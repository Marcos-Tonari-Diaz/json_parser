
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int valido=0;
%}

%token STR NUM BOOL BRACK_BEG BRACK_END KEY_BEG KEY_END COMA COLON

%%

/*simbolo final*/

JSON: STRUCTURE {printf("VALIDO\n"); valido=1;}
    ; 

STRUCTURE: OBJECT 
	 | ARRAY 
	 | STRUCTURE STRUCTURE
	 ;

OBJECT: KEY_BEG KEY_END
      | KEY_BEG OBJECT_NOTATION KEY_END
      ;

OBJECT_NOTATION: STR COLON VALUE
	       | OBJECT_NOTATION COMA OBJECT_NOTATION
	       ;

ARRAY: BRACK_BEG BRACK_END 
     | BRACK_BEG ARRAY_NOTATION BRACK_END 
     ;

ARRAY_NOTATION: VALUE
	      | ARRAY_NOTATION COMA ARRAY_NOTATION 
	      ;

VALUE: STR
     | NUM
     | OBJECT
     | ARRAY
     | BOOL
     ;

%%

void yyerror(char *s) {
}

int main() {
    yyparse();
    if (valido==0)
	printf("INVALIDO\n");
    return 0;
}
