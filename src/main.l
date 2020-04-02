
%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}


%%

\"[[:alnum:][:space:][:cntrl:]]*\" {return STR;}
-?([[:digit:]])+(\.[[:digit:]]+)?((E|e)(\+|-)[[:digit:]]+)? {return NUM;}
["true""false""null"] {return BOOL;}
\[ {return BRACK_BEG;}
\] {return BRACK_END;}
\{ {return KEY_BEG;}
\} {return KEY_END;}
[,] {return COMA;}
[:] {return COLON;}
[[:space:]]+ ;
[;] ;

%%

int yywrap() {
  return 1;
}
