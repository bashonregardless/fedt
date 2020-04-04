%{
/* need this for the call to atof() below */
#include <math.h>
%}

DIGIT   	[0-9]
ID      	[a-z][a-z0-9]*
HTML_TAG	[a-z][^_\WA-Z]*
REACT_TAG	[A-Z][^_\W]*

%%

\<({HTML_TAG})	{
				  printf("An html tag { text: %s, len: %zu }\n", yytext, yyleng);
				}

\<({REACT_TAG})		{
					  printf("A react tag { text: %s, len: %zu }\n", yytext, yyleng);
					}

\<(\/{HTML_TAG})	{
					  printf("An closing html tag { text: %s, len: %zu }\n", yytext, yyleng);
					}

\<(\/{REACT_TAG})	{
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
