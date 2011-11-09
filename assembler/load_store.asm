START:	LOADLBL DATA, r1
	LOAD r1, r2
	ADDI 1, r1
	LOAD r1, r3
	ADDI 1, r1
	LOAD r1, r4
	#finished loading registers will locations in memory

	ADDI 1, r1
	STORE r1, r2	
	ADDI 1, r1
	STORE r1, r4
	ADDI 1, r1
	STORE r1, r3
	ADDI 1, r1

DATA:	.fill 0x1111
	.fill 0x1122
	.fill 0x1333
	.fill 0xbeef
	.fill 0xdead
	.fill 0xbeef
	.fill 0xdead