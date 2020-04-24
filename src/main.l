
%{
#include <stdio.h>
int i;
%}
r [[:punct:]_-]+
usuario [[:alnum:]._-]+
dominio [[:alnum:]._-]+

%%
{r}{usuario}{r}@{r}{dominio}{r}((\.([[:alnum:]]+))*)?
{r}{usuario}{r}@{r}{dominio}((\.([[:alnum:]]+))*)?
{r}{usuario}{r}@{dominio}{r}((\.([[:alnum:]]+))*)?
{r}{usuario}{r}@{dominio}((\.([[:alnum:]]+))*)?
{r}{usuario}@{r}{dominio}{r}((\.([[:alnum:]]+))*)?
{r}{usuario}@{r}{dominio}((\.([[:alnum:]]+))*)?
{r}{usuario}@{dominio}{r}((\.([[:alnum:]]+))*)?
{r}{usuario}@{dominio}((\.([[:alnum:]]+))*)?
{usuario}{r}@{r}{dominio}{r}((\.([[:alnum:]]+))*)?
{usuario}{r}@{r}{dominio}((\.([[:alnum:]]+))*)?
{usuario}{r}@{dominio}{r}((\.([[:alnum:]]+))*)?
{usuario}{r}@{dominio}((\.([[:alnum:]]+))*)?
{usuario}@{r}{dominio}{r}((\.([[:alnum:]]+))*)?
{usuario}@{r}{dominio}((\.([[:alnum:]]+))*)?
{usuario}@{dominio}[-!@#$%ˆ&*()_]((\.([[:alnum:]]+))*)?

{usuario}@{dominio}((\.([[:alnum:]]+))*)?(\.) {for(i=0;i<strlen(yytext)-1;i++) printf("%c",yytext[i]); printf("\n") ;}
{usuario}@{dominio}((\.([[:alnum:]]+))*)? {printf("%s\n", yytext);}

[[:space:]]+ ;
[[:alnum:][:punct:]_-]+ ;
%%

int main(){
  yylex();
  return 0;
}
