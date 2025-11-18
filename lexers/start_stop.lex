any (.|\n)

%%

start {return 1;}
stop {return 2;}
{any} {}

%%

int main() {
	int res = yylex();
	switch (res) {
	case 1:
		printf("Start command received\n");
		break;
	case 2:
		printf("Stop command received\n");
		break;
	default:
		break;
	}
	return 0;
}
