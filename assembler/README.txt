This should give a short tutorial on how to use this program.  Keep in mind that this program and its use could change if I see the need for something to change.

LABELS:

Labels are created by having ANY string on the left hand side ended with a ':' character.  The location of the label will be tracked.  Whenever the label is used in the program the value of the label will be placed in the location.

For branching (which has not been fully defined as of this writing), the difference between the current location and where to branch will be used.

COMMENTS:
Comments are created using '#'.  All characters following a '#' are consitered a comment.

INSTRUCTION SET:

The instructions used came directly from the OP_CODE spreadsheet found in the documentation folder.  The register and constant values come in the order they are placed in the instruction.  Here is a template for the different instructions:

Register,
 INSTRUCTION SrcReg, DstReg
Immediate,
 INSTRUCTION Immediate, DstReg
Branch,
 (HAS NOT YET BEEN FULLY DEFINED AS OF THIS WRITING)
JAL,
 JUMP RegWithAddressToJump, RegToStorePC

I have added a psudo instruction that will take a label and load it into a register.  This is done because a value of a label is more than 8 bits, thus requiring two instruction.  The use of this command is as follows:

LOADLBL LabelName, DstReg

DATA SECTION:

In order to allocate a section of memory with data, use the '.fill' option.  The number defined will be placed directly into the assembled program.

Example,
DATA1:   .fill 0x0001
         .fill 0x0010
         .fill 0x0100
DATA2:   .fill 0x1000

CALLING THE PROGRAM:

To call the program, the first argument is the assembly file to assemble.  The second argument is the file to write the converted program to.  Right now it will write the program out in ASCII, each line in an instruction in hex.  This makes it trivial to have it converted into a coe file, which is done by using the coe command.

coe <asm file> <output coe file>
