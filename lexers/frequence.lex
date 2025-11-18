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
	unsigned int total_chars;
	float upper_freq, lower_freq;

	yylex();
	total_chars = upper + lower;
	upper_freq = ((float) upper) / ((float) total_chars);
	lower_freq = ((float) lower) / ((float) total_chars);
	printf("lower freq: %f\%, lower count: %d, upper freq: %f\%, upper count: %d, total: %d, line count: %d\n", lower_freq * 100, lower, upper_freq * 100, upper, total_chars, line_count);
	return 0;
}
