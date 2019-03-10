######### TODO: The length is increased at the start even if the char is null (length must be != 0)

.text

STR_DEBUG:
	.ascii "-> %c\n\0"

#		Returns the length of a string
#	Params:
# - string, 4 bytes : The pointer to the first char of the target string.
.globl stringLength
stringLength:		
	#### Prolog ####
	pushl	%ebp
	movl    %esp, %ebp
	####### TODO: Change
	subl    $32, %esp


	#### Algorithm ####
	#	Local variables: (you can see more easily in tests/tests.c/stringLength)
	# - length, 4(%ebp), unsigned int : The length of the string

	# length = 0
	movl	$0, -4(%ebp)

	stringLength_loopStart:
		# Increase the length of the string
		incl	-4(%ebp)

		# Check if the char at length index is null #
		# Move to %eax the adress of the char at length index
		movl	4(%ebp), %eax
		addl	%eax, -4(%ebp)

## DEBUG
movl	-4(%ebp), %eax
movl	%eax, 4(%esp)
movl	$STR_DEBUG, (%esp)
call	_printf

# if (length > 99) break;
cmpl	$99, -4(%ebp)
jg		stringLength_loopEnd
## End DEBUG

		# Test if the char is null
		cmpl	$0, (%eax)

		# If not null, return to the loop's start
		jne 		stringLength_loopStart



	stringLength_loopEnd:


	#### Epilog ####
	# Return the length of the string
	movl	-4(%ebp), %eax

	leave										
	ret


