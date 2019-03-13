#include <stdio.h>


// Returns the length of a string
unsigned int stringLength(const char *STR)
{
	unsigned int length = 0U;

	while (STR[length] != '\0')
	// while (*((unsigned int)STR + length) != '\0')
		length++;

	return length;
}

void tst(const char *PARAM)
{
	printf("tst %s\n", PARAM);
}


int main(void)
{
	const char *STR = "This is a test string!";

	tst(STR);
	// printf("Result: %i\n", stringLength(STR));

	return 0;
}
