all: lex-analyzer.out

lex-analyzer.out: lex.out
	gcc lex.yy.c -ll -g

lex.out: htmlLex.l
	flex htmlLex.l
