	NOP

INIT:	LOADLBL STACK, R15 	#initalize stack pointer
	
	LOADLBL VGA_L2_R0, R5
	LOADLBL VGA_L2_R1, R6
	SUB R5, R6	# calculate the row width
	#set VGA pointers
	SETBEGINVGA R5
	SETROWVGA R6

	# set player location
	LOADLBL VGA_L2_R1, R7
	ADDI 1, R7
	LOADLBL G_PLAYER1_LOCATION, R8
	STORE R8, R7	# set the player 1 location in the global constant data area
	
	LOADLBL G_PLAYER1_DOWN, R8 # put the player 1 tile at his location on the board
	LOAD R8, R8
	STORE R7, R8

	XOR R3, R3
	MOVI 1, R3
	# goto main loop to start the game
	
MAIN_LOOP:
	MOVI 0xF4, R11	
	MOVIU 0x01, R11
	LOADLBL WAIT_SETUP, R5
	LOADLBL MAIN_LOOP_R1, R14
	JUMP R5
	
MAIN_LOOP_R1:
	LOADLBL G_PLAYER1_LOCATION, R11
	LOADLBL G_PLAYER1_DOWN, R13
	MOV R1, R12
	LOADLBL MAIN_LOOP_R2, R14
	LOADLBL MOVE_PERSON, R5
	JUMP R5
	
MAIN_LOOP_R2:	
	LOADLBL WAIT_FINISH, R5
#	MOV R13, R1
	LOADLBL MAIN_LOOP_R3, R14
	JUMP R5
	
MAIN_LOOP_R3:	
	MOV R13, R1
	
	LOADLBL VGA_L2_R0, R10
	LOAD R10, R2
	ADD R3, R2
	STORE R10, R2

	XOR R4, R4
	SUB R3, R4
	MOV R4, R3
	
	JOFFSET MAIN_LOOP





############################## MOVE_PERSON ##############################
# This method is used to move a player square around the map.  Arguments
# given to the method are a pointer to the start of the memory blocks
# where the player tiles are stored, pointer to global of the location
# of the person being moved.
# (this will mostly be useful for multiplayer modes), and controller input
# This method will move the person, if possible, updating the memory location
# of where the person is now located


# Arguments:
# R11 - Pointer to global memory that states where the person is located
# R12 - Controller input
# R13 - Pointer to man tile (0: DOWN, 1: UP, 2: RIGHT, 3: LEFT)
# Returns: nothing.

# Variables used:
# R10 - temp register used to load values from memory
# R9 - current location of person
# R8 - potential next location of person
# R7 - Used for very short calculations (less than a few lines)
# R6 - next tile type for person (so the person looks to walking in
#        the direction)
# R5 - Used for short calculations (less than a few lines)
	
MOVE_PERSON:
	LOAD R11, R9	# put the current location of the man into R9
	MOV R9, R8	# put the currect location into R8, so adjustments
	                # be made directoy to R8

# Decode what button was pressed (order of presidence DOWN, UP, RIGHT, LEFT)
# check if down button was pressed
MOVE_PERSON_L1:	
	LOADLBL G_BUTTON_DOWN, R10
	LOAD R10, R7
	AND R12, R7
	CMPI 0, R7 # if it is zero the button was not pressed
	JEQ MOVE_PERSON_L2
	JOFFSET MOVE_PERSON_L6_DOWN
# check if up button was pressed
MOVE_PERSON_L2:
	LOADLBL G_BUTTON_UP, R10
	LOAD R10, R7
	AND R12, R7
	CMPI 0, R7
	JEQ MOVE_PERSON_L3
	JOFFSET MOVE_PERSON_L7_UP
# check if right button was pressed
MOVE_PERSON_L3:
	LOADLBL G_BUTTON_RIGHT, R10
	LOAD R10, R7
	AND R12, R7
	CMPI 0, R7
	JEQ MOVE_PERSON_L4
	JOFFSET MOVE_PERSON_L8_RIGHT
# check if left button was pressed
MOVE_PERSON_L4:
	LOADLBL G_BUTTON_LEFT, R10
	LOAD R10, R7
	AND R12, R7
	CMPI 0, R7
	JEQ MOVE_PERSON_L5
	JOFFSET MOVE_PERSON_L9_LEFT
# no buttons were pressed for a move, so just end function
MOVE_PERSON_L5:	
	JUMP R14

# process specific logic for directional move
# 1) find the next location the person may move
# 2) calculate the next tile to use for direction of person
MOVE_PERSON_L6_DOWN:
	# to move down, add vga row size to location
	LOADLBL G_VGA_ROW, R10
	LOAD R10, R7
	ADD R7, R8
	# man tile is already pointing to DOWN
	ADDI 0, R13
	JOFFSET MOVE_PERSON_L10
MOVE_PERSON_L7_UP:
	# to move up, subtract vga row size to location
	LOADLBL G_VGA_ROW, R10
	LOAD R10, R7
	SUB R7, R8
	# man tile for down is +1
	ADDI 1, R13
	JOFFSET MOVE_PERSON_L10
MOVE_PERSON_L8_RIGHT:
	# to move right, add 1 to currect location
	ADDI 1, R8
	# man tile for right is +2
	ADDI 2, R13
	JOFFSET MOVE_PERSON_L10
MOVE_PERSON_L9_LEFT:
	# to move left, subtract 1 from currenct location
	SUBI 1, R8
	# man tile for left if +3
	ADDI 3, R13
	JOFFSET MOVE_PERSON_L10
	
# end movement specific portion
# 1) check to see if won!
# 2) check to see if movable
#   -> if not movable R9->R8
# 3) set variables appropreatly for the move
MOVE_PERSON_L10:	
	LOAD R8, R5	# what is in the square trying to move to
	
#	LOADLBL G_WIN_SQUARE, R10
#	LOAD R10, R7	# load the winning square into R7
#	CMP R5, R7
#	JEQ #WIN#

	LOADLBL G_PASSABLE_SQUARE, R10
	LOAD R10, R7
	CMP R5, R7
	JEQ MOVE_PERSON_L12

# if trying to move to a box location, it will eventually move the box
#	LOADLBL G_BOX_SQUARE, R10
#	LOAD R10, R7
#	CMP R5, R7
#	JEQ MOVE_PERSON_L11_BOX

# otherwise, the square can not be moved to, so set so it does not move person
	MOV R9, R8
JOFFSET MOVE_PERSON_L12

MOVE_PERSON_L12:
	# store the passable square where the person 'used to be'
	LOADLBL G_PASSABLE_SQUARE, R10
	LOAD R10, R7
	STORE R9, R7
	# store the new tile where the person 'moved to'
	LOAD R13, R7
	STORE R8, R7
	# store the new location of the person in the global data area
	STORE R11, R8

MOVE_PERSON_END:
	JUMP R14
	

############################## WAIT_SETUP ##############################
# This method is used to setup the wait method.  The arument passed is
# how many millisecods from WAIT_SETUP being called, WAIT should finish
# This assumes that WAIT_FINISH is called before the time limmit is up.
# (because WAIT_FINISH tests for equals, because of integer overflow)

# THIS IS A SAFE FUNCTION (NO TEMPS ARE MODIFED), only R11, R12
# Argument: R11 - ms to wait
WAIT_SETUP:
	CLOCK R12
	ADD R12, R11
	LOADLBL G_WAIT_UNTIL, R12
	STORE R12, R11
	JUMP R14

############################## WAIT_FINISH ##############################
# Used to finish the time block defined by the WAIT_SETUP method.  No argumement
# is passed because the time to wait was already setup by WAIT_SETUP.
# The method returns the keys pressed by the user (OR of all keypress)

# THIS IS A SAFE FUNCTION (NO TEMPS ARE MODIFED), only R11, R12, R13
# Argument: None
# Return: R13 - OR of all user input entered during the wait

# R11 - keeps time to wait until
# R12 - temporary register used to store information for a little time
# Return:
# R13 - keeps OR of user input
WAIT_FINISH:
	LOADLBL G_WAIT_UNTIL, R12
	LOAD R12, R11	# load the time to wait until into R11
	XOR R13, R13	# zero R13

WAIT_FINISH_L1S:
	READGAMEPAD R12
	OR R12, R13	# get game pad data and or with existing
	CLOCK R12
	CMP R11, R12	
	JEQ WAIT_FINISH_L1E	# if time to wait equals finish time, exit, otherwise loop again
	JOFFSET WAIT_FINISH_L1S

WAIT_FINISH_L1E:
	JUMP R14
	
	
	
# allocated stack
STACK:	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000
	.fill 0x0000

	
# The G prefix defines that it is a global data field
DATA:

G_VGA_START:	.fill VGA_L2_R0
G_VGA_ROW:	.fill 0x0000	#must be set programatically

G_PLAYER1_LOCATION:	.fill 0x0000		# must be set programatically

# what bits will be set by the paddle when the move is taken
G_BUTTON_DOWN:	.fill 0x0010	
G_BUTTON_UP:	.fill 0x0020
G_BUTTON_RIGHT:	.fill 0x0040
G_BUTTON_LEFT:	.fill 0x0080

# what character will be used when the player moves in that direction
G_PLAYER1_DOWN:	.fill 0x0003
G_PLAYER1_UP:	.fill 0x0001
G_PLAYER1_RIGHT:	.fill 0x0000
G_PLAYER1_LEFT:	.fill 0x0002

# global used by timing method to know when to stop waiting
G_WAIT_UNTIL:	.fill 0x0000

# square information used by move methods
G_PASSABLE_SQUARE:	.fill 0x000C
G_WIN_SQUARE:	.fill 0x0006
G_BOX_SQUARE:	.fill 0x0005

# window information used by adjust screen method
G_WINDOW_POINTER_MIN:	.fill VGA_L2_R0
G_WINDOW_PTR_MAX:	.fill VGA_END

G_WINDOW_W_BOARDER:	.fill 5
G_WINDOW_H_BOARDER:	.fill 5




##################################################
	###### MAP DATA #######

VGA_L2_R0:
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
VGA_L2_R1:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
VGA_L2_R2:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R3:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R4:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0005
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R5:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R6:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
VGA_L2_R7:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x0006
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
VGA_L2_R8:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0004
	.fill 0x000C
	.fill 0x0004
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
VGA_L2_R9:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R10:
	.fill 0x0004
	.fill 0x000C
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R11:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0005
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R12:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x0005
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R13:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R14:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R15:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R16:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000B
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R17:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x0007
	.fill 0x000C
	.fill 0x0004
VGA_L2_R18:
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
	.fill 0x000C
	.fill 0x000C
	.fill 0x0007
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x000C
	.fill 0x0004
VGA_L2_R19:
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004
	.fill 0x0004	

VGA_END:
	.fill 0x0004
