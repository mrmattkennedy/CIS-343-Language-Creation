%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
	
	
%}
%option noyywrap

%%
(END)|(end) 		return END; 		/*End of the file.*/
;			return EOL; 		/*End of the line.*/
(POINT)|(point)		return POINT;		/*Creates a point*/
(LINE)|(line)		return LINE; 		/*Creates a line.*/
(CIRCLE)|(circle)	return CIRCLE; 		/*Creates a circle.*/
(RECTANGLE)|(rectangle)	return RECTANGLE;	/*Creates a rectangle.*/
(SET_COLOR)|(set_color)	return SET_COLOR; 	/*Sets the color.*/
[+-]?([0-9]+)		return INT;		/*Parses integer input.*/
[ \t\n]+       	;				/*All other input that isn't whitespace.*/
.		{ printf("* Error: %s is invalid on line %d.\n", yytext, yylineno);}
%%

