L1:	MOVI 0, R0
	MOVI 1, R1
	MOVI 2, R2
	# set R1 and R2 to prepare to calculate fib sequence
START:	MOV R1, R3
	ADD R2, R3

	MOV R2, R4
	ADD R3, R4

	MOV R3, R5
	ADD R4, R5

	MOV R4, R6
	ADD R5, R6

	MOV R5, R7
	ADD R6, R7
	
	# and so on, but we will finish here