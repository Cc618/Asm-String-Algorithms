# In this program, all strings are terminated by a null char ('\0')

.text

STR_A:
	.ascii "Hello World!\0"

STR_PRINT_RESULT:
	.ascii "Result: %u\n\0"


.globl _main					
_main:
	#### Prolog ####
	pushl   %ebp
	movl    %esp, %ebp
	subl    $8, %esp

	# Alignement
	andl    $-16, %esp	

	# -4(%ebp) = 0
	xorl    %eax, %eax
	movl    %eax, -4(%ebp)

	# Standard library init
	call    __alloca
	call    ___main


	#### Algorithm ####
	# %eax = The string length of STR_A
	movl $STR_A, (%esp)
	call stringLength


	#### Display ####
	movl %eax, 4(%esp)
	movl $STR_PRINT_RESULT, (%esp)
	call _printf


	##### Epilog ####
	# Return 0
	xorl	%eax, %eax		

	leave			
	ret
