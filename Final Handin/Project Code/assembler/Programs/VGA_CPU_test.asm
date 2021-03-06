	NOP


	# R0 - VGA START LOCATION
	# R1 - VGA ROW LENTH (UNTIL LOOP)
	# R2 - ADD VARIABLE
	# R3
	# R4 - LOOP COUNTER
BEGIN:	LOADLBL VGA_DATA1, R0
	LOADLBL VGA_DATA2, R1
	LOADLBL STACK, R15
	SUB R0, R1
	SETBEGINVGA R0	#initilize pointer to vga location
	SETROWVGA R1

	MOVI 1, R2

#LOOP:	JOFFSET LOOP	# forever loop

	MOVI 8, R4
LOOP:	MOVI 2, R11
	LOADLBL LOOP_R1, R14
	LOADLBL WAIT, R5
	JUMP R5
	
LOOP_R1:
	CMPI 0, R4
	JEQ LOOP_L1
	JOFFSET LOOP_L2
LOOP_L1:
	XOR R4, R4
	MOVI 8, R4	# RESET COUNTER
	XOR R5, R5	# NEGATE ADD VARIABLE
	SUB R2, R5
	MOV R5, R2

LOOP_L2:
	ADD R2, R0
	SUBI 1, R4
	SETBEGINVGA R0
	JOFFSET LOOP




# R11 - number of loops before returning
WAIT:	CMPI 0, R11
	BEQ
	JUMP R14
	STORE R15, R14
	ADDI 1, R15
	XOR R10, R10
#	SUBI 1, R10
	MOVIU 0xF, R10
	MOVI 255, R10
WAIT_L1S:
	STORE R15, R10
	ADDI 1, R15
	STORE R15, R11
	ADDI 1, R15
	SUBI 1, R11
	LOADLBL WAIT_R1, R14
	LOADLBL WAIT, R9
	JUMP R9
WAIT_R1:
	SUBI 1, R15
	LOAD R15, R11
	SUBI 1, R15
	LOAD R15, R10
	SUBI 1, R10
	CMPI 0, R10
	JEQ WAIT_L1E
	JOFFSET WAIT_L1S
WAIT_L1E:
	SUBI 1, R15
	LOAD R15, R14
	JUMP R14
	

STACK:	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000
	.fill 0x000

VGA_DATA1:
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003	
	
VGA_DATA2:
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

		.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003

			.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	.fill 0x0001
	.fill 0x0002
	.fill 0x0003
	