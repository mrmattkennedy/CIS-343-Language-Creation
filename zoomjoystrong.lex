%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
	
%}
%option noyywrap

%%
(END)|(end) 		return END;
;			return EOL; 
(POINT)|(point)		return POINT;
(LINE)|(line)		return LINE; 
(CIRCLE)|(circle)	return CIRCLE; 
(RECTANGLE)|(rectangle)	return RECTANGLE;
(SET_COLOR)|(set_color)	return SET_COLOR; 
[+-]?([0-9]+)		return INT;
[ \t\n]+       	;
.		{ printf("* Error: %s is invalid on line %d.\n", yytext, yylineno);}
%%

