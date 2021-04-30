HTML_TAG	[a-z][a-z]*
REACT_TAG	[A-Z][[:alnum:]]*

%%

"<"{HTML_TAG}	{
  char tagName[yyleng - 1]; 
  printf("tagName: %s, tagName length: %lu\n", tagName, strlen(tagName));
  //strndup(tagName, yytext + 1, yyleng - 1);
  //printf("An html tag { yytext: %s, yyleng: %zu, text: %s, len: %lu }\n", yytext, yyleng, tagName, strlen(tagName));
  printf("\n\n");
}

"<"{REACT_TAG}	{
					  printf("A react tag { text: %s, len: %zu }\n", yytext, yyleng);
					  printf("\n\n");
}

"</"{HTML_TAG}	{
					  printf("An closing html tag { text: %s, len: %zu }\n", yytext, yyleng);
					  printf("\n\n");
}

"</"{REACT_TAG}	{
					  printf("An closing react tag { text: %s, len: %zu }\n", yytext, yyleng);
					  printf("\n\n");
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
