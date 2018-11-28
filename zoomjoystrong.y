%{
	#include <stdio.h>
	#include <stdlib.h>
	//necessary to import t oaccess setup, parse, and finish functions.
	#include "zoomjoystrong.h"
	int yyerror(const char* err);
	int yylex();
%}

/* Creating tokens to use with grammar*/
%token INT
%token RECTANGLE
%token LINE
%token CIRCLE
%token POINT
%token SET_COLOR
%token END
%token EOL
%%

/* Creating the grammar to be parsed with bison.
 Entry point is program, which has an expression list.*/
program:		expression_list
	;

/* expression list is either an expr, or an expression list and an expr */
expression_list:	expr
	|		expression_list expr
	;

/* List of what an expression can be using the given tokens above. */
expr:		LINE  INT  INT  INT  INT EOL
    		{line($2, $3, $4, $5);}
    	|	POINT  INT INT EOL
		{point($2, $3);}
	|	CIRCLE  INT  INT  INT EOL
		{circle($2, $3, $4);}
	|	RECTANGLE INT INT INT INT EOL
		{rectangle($2, $3, $4, $5);}
	|	SET_COLOR INT INT INT EOL
		{set_color($2, $3, $4);}
	|	END EOL
	;

%%

//Not sure how to get program to pause before display, tried adding getc(), but
//does not freeze program. No errors being displayed, so not sure what the issue is.
int main(int argc, char** argv){
	setup();
	yyparse();
	getc(stdin);
	finish();
}

int yyerror(const char* err){
	printf("%s\n", err);
}
