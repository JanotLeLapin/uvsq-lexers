%{
unsigned int upper=0, lower=0, line_count=0;
%}

lower [a-z]
upper [A-Z]

%%

{lower} {lower++;}
{upper} {upper++;}
\n {line_count++;}
. {}

%%

int main() {
	unsigned int total_chars = upper + lower;
	float upper_freq, lower_freq;

	yylex();
	upper_freq = ((float) upper) / ((float) total);
	lower_freq = ((float) lower) / ((float) total);
	printf("lower_freq: %f, lower_count: %f, upper_freq: %f, upper_count: %d, total: %d, line_count: %d\n", lower_freq, lower, upper_freq, upper, total, line_count);
	return 0;
}
