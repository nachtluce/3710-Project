
TEST_PC_STORE:
	STOREPC R15
	LOADLBL TEST_PC_STORE, R14
	LOADLBL TEST_SUM, R13
	CMP R14, R15
	BEQ
	JUMP R13	# will excecute if true
	
	MOVI 0xAD, R0	# will store values if test failed
	MOVIU 0xDE, R0

TEST_SUM:
	MOVI 100, R15	# counter used
	XOR  R14, R14	# location to store total - zero here
TEST_SUM1:
	CMPI 0, R15
	JGE TEST_SUM2
	
	ADD R15, R14
	SUBI 1, R15
	JEQ TEST_SUM1	# Will always jump to TEST_SUM1

TEST_SUM2:
	JLS TEST_SUM2 # will always jump?