%{
#include "babylang.tab.h"
#include <string.h>
#include <stdlib.h>

#ifndef _MSC_VER
  // strdup available
#else
  char* strdup(const char* s) {
      char* d = malloc(strlen(s) + 1);
      if (d == NULL) return NULL;
      strcpy(d, s);
      return d;
  }
#endif
%}

%%
"while"                 { return WHILE; }
[0-9]+                  { yylval.str = strdup(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = strdup(yytext); return ID; }
"="                     { return ASSIGN; }
":"                     { return COLON; }
"<"                     { return LT; }
">"                     { return GT; }
"=="                    { return EQ; }
"!="                    { return NE; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MUL; }
"/"                     { return DIV; }
[\n]                    { return '\n'; }
[ \t]                   ;       // ignore spaces/tabs
.                       ;       // ignore unmatched characters
%%

int yywrap() {
    return 1;
}
