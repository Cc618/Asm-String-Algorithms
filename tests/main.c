#include <stdio.h>


//////////////// stringLength ////////////////
#define stringLength stringLengthC

// Returns the length of a string
unsigned int stringLengthC(const char *STR)
{
	unsigned int length = 0U;

	while (STR[length] != '\0')
		length++;

	return length;
}

// Returns the length of a string
unsigned int stringLengthASM(const char *STR)
{
	unsigned int length = 0U;

	while (*((const char*)(unsigned int)STR + length) != '\0')
		length++;

	return length;
}

//////////////// stringEqual ////////////////
#define stringEqual stringEqualC

// Returns 1 if both strings are equal otherwise let 0
unsigned char stringEqualC(const char *FIRST, const char *SECOND)
{
	const unsigned int SIZE = stringLength(FIRST);

	// Different sizes, not equal
	if (SIZE != stringLength(SECOND))
		return 0;

	// Check for each char of FIRST whether it's the same
	// in SECOND
	for (unsigned int i = 0U; i < SIZE; i++)
		if (FIRST[i] != SECOND[i])
			return 0;

	return 1;
}

// Returns 1 if both strings are equal otherwise let 0
unsigned char stringEqualASM(const char *FIRST, const char *SECOND)
{
	const unsigned int SIZE = stringLength(FIRST);

	// Different sizes, not equal
	if (SIZE != stringLength(SECOND))
		return 0;

	// Check for each char of FIRST whether it's the same
	// in SECOND
	unsigned int i = 0U;

	stringEqual2_loopStart:;

		// Retrieve each chars from their adresses
		char first = *(char*)((unsigned int)FIRST + i),
			second = *(char*)((unsigned int)SECOND + i);

		// They aren't equal
		if (first != second)
			return 0;

		// They are equal
		if (i == SIZE)
			goto stringEqual2_loopEnd;

		// Increment de counter
		i++;

		goto stringEqual2_loopStart;

	stringEqual2_loopEnd:;

	return 1;
}







int main(void)
{
	const char *A = "This is a test string!",
		*B = "This is a test string!";

	printf("Result: %i\n", stringEqual(A, B));

	return 0;
}













