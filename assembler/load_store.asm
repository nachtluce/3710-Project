START:	LOADLBL DATA, r1
	LOAD r1, r2
	ADDI 1, r1
	LOAD r1, r3
	ADDI 1, r1
	LOAD r1, r4

DATA:	.fill 0x1111
	.fill 0x1122
	.fill 0x1333