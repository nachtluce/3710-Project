START:	NOP #0
	NOP #1
	NOP #2
	
TEST_PC_STORE:
	STOREPC R15     #3
	LOADLBL TEST_PC_STORE, R14 #4,5
	LOADLBL TEST_SUM, R13      #6,7
	CMP R14, R15    #8
	BEQ             #9
	JUMP R13	#A will excecute if true
	
	MOVI 0xAD, R0	#B will store values if test failed
	MOVIU 0xDE, R0  #C

TEST_SUM:
	MOVI 10, R15	#D counter used
	XOR  R14, R14	#E location to store total - zero here
	MOVI 0xAB, R6   #F add sentanal value
TEST_SUM1:
	XOR R6, R6      #10 Remove sentanal value
	CMPI 0, R15     #11
	JLT TEST_SUM2   #12
	
	ADD R15, R14    #13
	SUBI 1, R15     #14
	JEQ TEST_SUM1	#15 Will always jump to TEST_SUM1

TEST_SUM2:
	NOP
	JLS TEST_SUM2 #16 will always jump?