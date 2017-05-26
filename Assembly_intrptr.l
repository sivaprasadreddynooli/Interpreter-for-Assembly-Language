%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

\t|"("|")"|"," {fprintf(yyout,"it is a symbol from the code");}
[r][0-7] {fprintf(yyout,"it is a register %s ", yytext);}
"load" {fprintf(yyout,"it helps in laoding the values:load ");}
".alloc" {fprintf(yyout,"its a memory allocation keyword: .alloc ");}
"loada" {fprintf(yyout,"its a keyword to load from the address: loada ");}
"move" {fprintf(yyout,"it helps in moving between the registers");}
"add" {fprintf(yyout,"it is a key word to add two elements");}
"cmp" {fprintf(yyout,"it is a keyword for comaprision operation");}
"bge" {fprintf(yyout,"it helps in branch looping");}
"read" {fprintf(yyout,"it helps in reading the values");}
"store" {fprintf(yyout,"it helps in storing the values");}
"sub" {fprintf(yyout,"it helps in substracting the values");}
"write" {fprintf(yyout,"it helps in writing the values to stdout");}
$([_a-zA-Z0-9]+)[:] {fprintf(yyout,"it is a label : %s", yytext);}
[a-zA-Z]+ {fprintf(yyout,"its a label from the code: %s",yytext);}
[0-9]+ {fprintf(yyout," constant : %d",atoi(yytext));}

%%
int main(int argc,char * argv[] ){

yyin = fopen(argv[1],"r");
yylex();
return 0;
}

