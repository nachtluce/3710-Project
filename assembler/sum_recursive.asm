START:	NOP
	LOADLBL SUM, R0
	MOVI 100, R11
	LOADLBL START_RET1, R14
	JUMP R0
START_RET1:
	MOVI 0, R5
	CMPI 0, R5
	JGE START_RET1	#infinate loop

###
#  Calculate sum from N -> 0 Recursivly
#  R11 - N
#  R13 - Result of sum
	
SUM:	CMPI 0, R11  # base case, if N=0 # A
	JEQ SUM_L1

	STORE R15, R14  # place return address on stack
	ADDI 1, R15
	STORE R15, R11	# place N on the stack
	ADDI 1, R15
	SUBI 1, R11	# N = N-1 to pass to itself recursivly
	LOADLBL SUM_RET1, R14 # load return address
	LOADLBL SUM, R0	#load address of sum, to jump there.
	JUMP R0
SUM_RET1:
	SUBI 1, R15
	LOAD R15, R6
	ADD R6, R13
	SUBI 1, R15
	LOAD R15, R14
	JUMP R14
SUM_L1:
	MOVI 0, R13
	JUMP R14

STACK:	.fill 0x0000