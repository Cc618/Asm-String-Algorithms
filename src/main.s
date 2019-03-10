.text							
STR_HW:							
	.ascii "Hello, world!\12\0"	

STR_PRINT_PTR:
	.ascii "StrA: %s, StrB: %s\nLength of a: %i\0"

STR_A:
	.ascii "Hello World!\0"

STR_B:
	.ascii "Hello World!\0"

STR_DBG:
	.ascii "Debug: %i\n\0"

STR_DBG_C:
	.ascii "Debug: %c\n\0"

STR_TRACE:
	.ascii "---\n\0"



STR_PRINT_EAX:
	.ascii "Eax: %i\n\0"

.globl _main					
_main:
	pushl   %ebp		
	movl    %esp, %ebp	
	subl    $8, %esp	

	andl    $-16, %esp	

	movl    $0, %eax
	movl    %eax, -4(%ebp)
	movl    -4(%ebp), %eax		

	call    __alloca
	call    ___main

	
	movl $STR_A, (%esp)
	call stringLen

	############ Affichage ##############
	movl %eax, 12(%esp)
	movl $STR_B, 8(%esp)
	movl $STR_A, 4(%esp)
	movl $STR_PRINT_PTR, (%esp)
	call _printf


	movl    $0, %eax		

	leave				
	ret
