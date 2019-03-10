#include <stdio.h>


// Returns the length of a string
unsigned int stringLength(const char *STR)
{
	unsigned int length = 0U;

	// while (STR[length] != '\0')
	while (*((unsigned int)STR + length) != '\0')
		length++;

	return length;
}


int main(void)
{
	const char *STR = "This is a test string!";

	printf("Result: %i\n", stringLength(STR));

	return 0;
}
