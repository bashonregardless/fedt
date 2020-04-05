%{
/* need this for the call to atof() below */
#include <math.h>
%}

DIGIT   	[0-9]
ID      	[a-z][a-z0-9]*
HTML_TAG	[a-z][a-z]*
REACT_TAG	[A-Z][[:alnum:]]*

%%

"<"{HTML_TAG}	{
  int yytextlen = yyleng;
  char tagName[yytextlen - 1]; 
  printf("tagName length: %lu, sizeof tagName: %lu\n", strlen(tagName), sizeof(tagName));
  strncpy(tagName, yytext + 1, yytextlen - 1);
  printf("An html tag { yytext: %s, yyleng: %zu, text: %s, len: %lu }\n", yytext, yyleng, tagName, strlen(tagName));
				}

"<"{REACT_TAG}		{
					  printf("A react tag { text: %s, len: %zu }\n", yytext, yyleng);
					}

"</"{HTML_TAG}	{
					  printf("An closing html tag { text: %s, len: %zu }\n", yytext, yyleng);
					}

"</"{REACT_TAG}	{
					  printf("An closing react tag { text: %s, len: %zu }\n", yytext, yyleng);
					}

[ \t\n]	/* eat up whitespace */

.	;

%%

int main(int argc, char **argv)
{
  ++argv, --argc; /* skip over program name */
  if (argc > 0)
	yyin = fopen(argv[0], "r");
  else
	yyin = stdin;

  yylex();
}
