/*
	* Copyright (c) 2013 Group 9 Chirag, Pulkit, Sanchit, Ujjwal
	* All rights reserved.

	* Created in CS335 course C++ lexical analyzer

*/



%{
#include <ctype.h>
#include <stdio.h>


int line_num;

static int yywrap(void);
static void skip_until_eol(void);
static void skip_comment(void);
static int check_identifier(const char *);
%}

intsuffix				([uU][lL]?)|([lL][uU]?)
fracconst				([0-9]*\.[0-9]+)|([0-9]+\.)
exppart					[eE][-+]?[0-9]+
floatsuffix				[fFlL]
chartext				([^'])|(\\.)
stringtext				([^"])|(\\.)

%%

"int"	 				{ printf("Datatypes: int");				 }
"long"	 				{ printf("Datatypes: long");				 }
"float"	 				{ printf("Datatypes: float");				 }
"double"				{ printf("Datatypes: double");				 }
"char"	 				{ printf("Datatypes: char");				 }
"void"	 				{ printf("Datatypes: void");				 }
"short"	 				{ printf("Datatypes: short");				 }
"signed"	 			{ printf("Datatypes: signed");				 }
"unsigned"	 			{ printf("Datatypes: unsigned");			 }
"bool"	 				{ printf("Datatypes: bool");				 }
"true"	 				{ printf("Datatypes: true");				 }
"false"	 				{ printf("Datatypes: false");				 }


"+"					{ printf("Arithmetic Operators: +");			 }
"-"					{ printf("Arithmetic Operators: -");			 }
"*"					{ printf("Arithmetic Operators: *");			 }
"/"					{ printf("Arithmetic Operators: /");			 }
"%"					{ printf("Arithmetic Operators: %");			 }
"++"					{ printf("Arithmetic Operators: ++");			 }
"--"					{ printf("Arithmetic Operators: --");			 }


"!"					{ printf("Logical Operators: !");			 }
"&&"					{ printf("Logical Operators: &&");			 }
"||"					{ printf("Logical Operators: ||");			 }
"and"					{ printf("Logical Operators: and");			 }
"not"					{ printf("Logical Operators: not");			 }
"or"					{ printf("Logical Operators: or");			 }



"=="					{ printf("Relational Operators: ==");			}
"!="					{ printf("Relational Operators: !=");		 	}
"not_eq"				{ printf("Relational Operators: not_eq");	 	}
"<="					{ printf("Relational Operators: <=");		 	}
">="					{ printf("Relational Operators: >=");			}
"<"					{ printf("Relational Operators: <");			 }
">"					{ printf("Relational Operators: >");			 }


"&"	 				{ printf("Bitwise Operators: &");			 }
"bitand"	 			{ printf("Bitwise Operators: bitand");		         }
"|"	 				{ printf("Bitwise Operators: |");			 }
"bitor"	 				{ printf("Bitwise Operators: bitor");		 	 }
"<<"	 				{ printf("Bitwise Operators: <<");			 }
">>"	 				{ printf("Bitwise Operators: >>");			 }
"~"	 				{ printf("Bitwise Operators: ~");			 }
"compl"	 				{ printf("Bitwise Operators: compl");			 }
"^"					{ printf("Bitwise Operators: ^");			 }
"xor"					{ printf("Bitwise Operators: xor");			 }


"="	 				{ printf("Assignment Operators: =");		 }
"+="	 				{ printf("Assignment Operators: +=");		 }
"-="	 				{ printf("Assignment Operators: -=");		 }
"*="	 				{ printf("Assignment Operators: *=");		 }
"/="					{ printf("Assignment Operators: /=");		 }
"%="	 				{ printf("Assignment Operators: %=");		 }
"xor_eq"	 			{ printf("Assignment Operators: xor_eq");	 }
"&="	 				{ printf("Assignment Operators: &=");		 }
"and_eq"	 			{ printf("Assignment Operators: and_eq");	 }
"|="	 				{ printf("Assignment Operators: |=");		 }
"or_eq"	 				{ printf("Assignment Operators: or_eq");	 }
"^="	 				{ printf("Assignment Operators: ^=");		 }
"<<="	 				{ printf("Assignment Operators: <<=");		 }
">>="	 				{ printf("Assignment Operators: >>=");		 }

%%

static int
yywrap(void)
{
	return 1;
}


static void
skip_comment(void)
{
	int c1, c2;

	c1 = input();
	c2 = input();

	while (c2 != EOF && !(c1 == '*' && c2 == '/')) {
		if (c1 == '\n')
			++line_num;
		c1 = c2;
		c2 = input();
	}
}


static void
skip_until_eol(void)
{
	int c;

	while ((c = input()) != EOF && c != '\n')
		;
	++line_num;
}

int main(int argc, char *argv[]) {
yyin = fopen(argv[1], "r");
yylex();
printf("I love you");
fclose(yyin);
}

