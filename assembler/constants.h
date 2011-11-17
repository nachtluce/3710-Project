/*
  This file defines constants that are used throught the program.
  They are placed here so they can be easily changed
*/

#ifndef _GLOBAL_CONSTANTS_H__
#define _GLOBAL_CONSTANTS_H__

// definitions of special instructions
extern const char* LOAD_LBL;
// what this ability does is hard coded into the assembler



// definitioins of assembly intertuctions
extern const char* AND_STR;
extern const int   AND_OPCODE;
extern const int   AND_OPEXT;

extern const char* OR_STR;
extern const int   OR_OPCODE;
extern const int   OR_OPEXT;

extern const char* XOR_STR;
extern const int   XOR_OPCODE;
extern const int   XOR_OPEXT;

extern const char* NOT_STR;
extern const int   NOT_OPCODE;
extern const int   NOT_OPEXT;

extern const char* ADDU_STR;
extern const int   ADDU_OPCODE;
extern const int   ADDU_OPEXT;

extern const char* ALSH_STR;
extern const int   ALSH_OPCODE;
extern const int   ALSH_OPEXT;

extern const char* ARSH_STR;
extern const int   ARSH_OPCODE;
extern const int   ARSH_OPEXT;

extern const char* SUB_STR;
extern const int   SUB_OPCODE;
extern const int   SUB_OPEXT;

extern const char* ADD_STR;
extern const int   ADD_OPCODE;
extern const int   ADD_OPEXT;

extern const char* CMP_STR;
extern const int   CMP_OPCODE;
extern const int   CMP_OPEXT;

extern const char* LSH_STR;
extern const int   LSH_OPCODE;
extern const int   LSH_OPEXT;

extern const char* MOV_STR;
extern const int   MOV_OPCODE;
extern const int   MOV_OPEXT;

extern const char* RSH_STR;
extern const int   RSH_OPCODE;
extern const int   RSH_OPEXT;

extern const char* CMPUI_STR;
extern const int   CMPUI_OPCODE;

extern const char* NOP_STR;
extern const int   NOP_OPCODE;

extern const char* LOAD_STR;
extern const int   LOAD_OPCODE;
extern const int   LOAD_OPEXT;

extern const char* STORE_STR;
extern const int   STORE_OPCODE;
extern const int   STORE_OPEXT;

extern const char* JUMP_STR;
extern const int   JUMP_OPCODE;
extern const int   JUMP_OPEXT;

extern const char* ADDI_STR;
extern const int   ADDI_OPCODE;

extern const char* ADDUI_STR;
extern const int   ADDUI_OPCODE;

extern const char* MOVIU_STR;
extern const int   MOVIU_OPCODE;

extern const char* MOVI_STR;
extern const int   MOVI_OPCODE;

extern const char* SUBI_STR;
extern const int   SUBI_OPCODE;

extern const char* CMPI_STR;
extern const int   CMPI_OPCODE;

extern const char* JGE_STR;
extern const int   JGE_OPCODE;
extern const int   JGE_OPEXT;

extern const char* JHG_STR;
extern const int   JHG_OPCODE;
extern const int   JHG_OPEXT;

extern const char* JEQ_STR;
extern const int   JEQ_OPCODE;
extern const int   JEQ_OPEXT;

extern const char* JLT_STR;
extern const int   JLT_OPCODE;
extern const int   JLT_OPEXT;

extern const char* JLS_STR;
extern const int   JLS_OPCODE;
extern const int   JLS_OPEXT;

extern const char* BGE_STR;
extern const int   BGE_OPCODE;
extern const int   BGE_OPEXT;

extern const char* BHG_STR;
extern const int   BHG_OPCODE;
extern const int   BHG_OPEXT;

extern const char* BEQ_STR;
extern const int   BEQ_OPCODE;
extern const int   BEQ_OPEXT;

extern const char* BLT_STR;
extern const int   BLT_OPCODE;
extern const int   BLT_OPEXT;

extern const char* BLS_STR;
extern const int   BLS_OPCODE;
extern const int   BLS_OPEXT;

extern const char* STOREPC_STR;
extern const int   STOREPC_OPCODE;
extern const int   STOREPC_OPEXT;

const char* JOFFSET_STR;
const int   JOFFSET_OPCODE;
const int   JOFFSET_OPEXT;

const char* SETBEGINVGA_STR;
const int   SETBEGINVGA_OPCODE;
const int   SETBEGINVGA_OPEXT;

const char* SETROWVGA_STR;
const int   SETROWVGA_OPCODE;
const int   SETROWVGA_OPEXT;

const char* READSERIAL_STR;
const int   READSERIAL_OPCODE;
const int   READSERIAL_OPEXT;

const char* WRITESERIAL_STR;
const int   WRITESERIAL_OPCODE;
const int   WRITESERIAL_OPEXT;

const char* READGAMEPAD_STR;
const int   READGAMEPAD_OPCODE;
const int   READGAMEPAD_OPEXT;


#endif
