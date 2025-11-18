
%{
unsigned int lupins=0, lupins_upper=0, lupins_any=0, weird_ahh_lupins=0, nbcar=0, nbmots=0, nblignes=0;
%}

lupin_any [lL][uU][pP][iI][nN]
weird_ahh_lupin lu.*in
mot [^ \t\n]+
fdl \n

%%

Lupin {lupins++; lupins_any++; nbmots++; nbcar += 5;}
LUPIN {lupins_upper++; lupins_any++; nbmots++; nbcar += 5;}
{lupin_any} {lupins++; nbmots++; nbcar += 5;}
{weird_ahh_lupin} {weird_ahh_lupins++; nbcar += yyleng;}

{mot} {nbmots++; nbcar += yyleng; }
{fdl} {nblignes++; nbcar++;}
. {nbcar++;}

%%

int main() {
	yylex();
	printf("lupins=%d, lupins_upper=%d, lupin_any=%d, weird_ahh_lupins=%d, %d %d %d\n", lupins, lupins_upper, lupins_any, weird_ahh_lupins, nblignes, nbmots, nbcar);
	return 0;
}
