#include "constants.h"

// definitions of special instructions
const char* LOAD_LBL   = "LOADLBL";
// what this ability does is hard coded into the assembler

// definitioins of assembly intertuctions
const char* AND_STR    = "AND";
const int   AND_OPCODE = 0x0;
const int   AND_OPEXT  = 0x1;

const char* OR_STR    = "OR";
const int   OR_OPCODE = 0x0;
const int   OR_OPEXT  = 0x2;

const char* XOR_STR    = "XOR";
const int   XOR_OPCODE = 0x0;
const int   XOR_OPEXT  = 0x3;

const char* NOT_STR    = "NOT";
const int   NOT_OPCODE = 0x0;
const int   NOT_OPEXT  = 0x4;

const char* ADDU_STR    = "ADDU";
const int   ADDU_OPCODE = 0x0;
const int   ADDU_OPEXT  = 0x6;

const char* ALSH_STR    = "ALSH";
const int   ALSH_OPCODE = 0x0;
const int   ALSH_OPEXT  = 0x7;

const char* ARSH_STR    = "ARSH";
const int   ARSH_OPCODE = 0x0;
const int   ARSH_OPEXT  = 0x8;

const char* SUB_STR    = "SUB";
const int   SUB_OPCODE = 0x0;
const int   SUB_OPEXT  = 0x9;

const char* ADD_STR    = "ADD";
const int   ADD_OPCODE = 0x0;
const int   ADD_OPEXT  = 0xA;

const char* CMP_STR    = "CMP";
const int   CMP_OPCODE = 0x3;
//const int   CMP_OPEXT  = 0xB;

const char* LSH_STR    = "LSH";
const int   LSH_OPCODE = 0x0;
const int   LSH_OPEXT  = 0xC;

const char* MOV_STR    = "MOV";
const int   MOV_OPCODE = 0x0;
const int   MOV_OPEXT  = 0xD;

const char* RSH_STR    = "RSH";
const int   RSH_OPCODE = 0x0;
const int   RSH_OPEXT  = 0xE;

//const char* CMPUI_STR  = "CMPUI";
//const int   CMPUI_OPCODE = 0x1;

const char* NOP_STR  = "NOP";
const int   NOP_OPCODE = 0x2;

const char* LOAD_STR    = "LOAD";
const int   LOAD_OPCODE = 0x4;
const int   LOAD_OPEXT  = 0x0;

const char* STORE_STR    = "STORE";
const int   STORE_OPCODE = 0x4;
const int   STORE_OPEXT  = 0x1;

const char* BCOND_STR    = "BCOND";
const int   BCOND_OPCODE = 0x4;
const int   BCOND_OPEXT  = 0x2;

const char* JCOND_STR    = "JCOND";
const int   JCOND_OPCODE = 0x4;
const int   JCOND_OPEXT  = 0x3;

const char* JUMP_STR    = "JUMP";
const int   JUMP_OPCODE = 0x4;
const int   JUMP_OPEXT  = 0x4;

const char* ADDI_STR  = "ADDI";
const int   ADDI_OPCODE = 0x5;

const char* ADDUI_STR  = "ADDUI";
const int   ADDUI_OPCODE = 0x6;

const char* MOVIU_STR  = "MOVIU";
const int   MOVIU_OPCODE = 0x7;

const char* MOVI_STR  = "MOVI";
const int   MOVI_OPCODE = 0x8;

const char* SUBI_STR  = "SUBI";
const int   SUBI_OPCODE = 0x9;

const char* CMPI_STR  = "CMPI";
const int   CMPI_OPCODE = 0xA;
