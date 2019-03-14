.text
#		Returns the length of a string
#	Params:
# - string, 4 bytes : The pointer to the first char of the target string.
.globl stringLength
stringLength:		
	#### Prolog ####
	pushl	%ebp
	movl    %esp, %ebp
	subl    $4, %esp


	#### Algorithm ####
	#	Local variables: (you can see more easily in tests/tests.c/stringLengthASM)
	# - length, 4(%ebp), unsigned int : The length of the string

	# length = 0
	movl	$0, -4(%ebp)

	# To avoid increasing the length for the first time without
	# testing whether the string is empty
	jmp stringLength_0

	stringLength_loopStart:
		# Increase the length of the string
		incl	-4(%ebp)
		
	stringLength_0:
		# Check if the char at length index is null #
		# Get the char's address
		movl	8(%ebp), %eax
		addl	-4(%ebp), %eax

		# Load the char value in al
		movb	(%eax), %al

		# Test if the char is null
		cmpb	$0, %al

		# If not null, return to the loop's start
		jne 		stringLength_loopStart

	stringLength_loopEnd:


	#### Epilog ####
	# Return the length of the string
	movl	-4(%ebp), %eax

	leave										
	ret


