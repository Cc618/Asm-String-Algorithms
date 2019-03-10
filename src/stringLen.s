.text

#		Renvoie la taille d'une chaîne de caractères
#	Paramètres:
# - string : 4 -> la chaîne de caractères se terminant par un 0 (dans 12(%ebp))
.globl stringLen
stringLen:		
	# Début d'une subroutine, préparation de la mémoire
	pushl   %ebp				# Ebp -> Stack; Attention décremente automatiquement %esp
	movl    %esp, %ebp			# %esp va dans %ebp; Attention c'est le contraire en masm
	subl    $16, %esp			# On reserve de la place sur le stack

	#	Variables
	# - string : 4,			12(%ebp) -> pointeur de la chaîne de caractères
	# - l : 4,				-4(%ebp) -> compteur de caractère
	# - currentCharPtr : 4, -8(%ebp) -> pointeur du caractère actuel a tester
	# Init de l et chr #
	# l = 0
	movl $0, -4(%ebp)	

	# chr = str
	movl 8(%ebp), %eax
	movl %eax, -8(%ebp)	


	# Début de la boucle #
	stringLen_loopStart:
		# call printEax

		# Test du caractère #
		# *chr == 0 ?
		movl -8(%ebp), %eax	
		cmpb $0, (%eax)
		je stringLen_loopEnd

		# Modif des variables #
		incl -4(%ebp)
		incl -8(%ebp)

		# Retour au début de la boucle #
		jmp stringLen_loopStart

	stringLen_loopEnd:

	# Retour #
	# return l
	movl -4(%ebp), %eax

	leave										
	ret


