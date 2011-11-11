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

const char* ADD_STR    = "ADD";
const int   ADD_OPCODE = 0x0;
const int   ADD_OPEXT  = 0x5;

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

const char* BGE_STR     = "BGE";
const int   BGE_OPCODE  = 0x1;
const int   BGE_OPEXT   = 0x0;

const char* BHG_STR     = "BHG";
const int   BHG_OPCODE  = 0x1;
const int   BHG_OPEXT   = 0x1;

const char* BEQ_STR     = "BEQ";
const int   BEQ_OPCODE  = 0x1;
const int   BEQ_OPEXT   = 0x2;

const char* BLT_STR     = "BLT";
const int   BLT_OPCODE  = 0x1;
const int   BLT_OPEXT   = 0x3;

const char* BLS_STR     = "BLS";
const int   BLS_OPCODE  = 0x1;
const int   BLS_OPEXT   = 0x4;

const char* NOP_STR    = "NOP";
const int   NOP_OPCODE = 0x2;

const char* LOAD_STR    = "LOAD";
const int   LOAD_OPCODE = 0x4;
const int   LOAD_OPEXT  = 0x0;

const char* STORE_STR    = "STORE";
const int   STORE_OPCODE = 0x4;
const int   STORE_OPEXT  = 0x1;

const char* JGE_STR    = "JGE";
const int   JGE_OPCODE = 0xA;
const int   JGE_OPEXT  = 0x3;

const char* JHG_STR    = "JHG";
const int   JHG_OPCODE = 0xA;
const int   JHG_OPEXT  = 0x3;

const char* JEQ_STR    = "JEQ";
const int   JEQ_OPCODE = 0xA;
const int   JEQ_OPEXT  = 0x3;

const char* JLT_STR    = "JL";
const int   JLT_OPCODE = 0xA;
const int   JLT_OPEXT  = 0x3;

const char* JLS_STR    = "JLS";
const int   JLS_OPCODE = 0xA;
const int   JLS_OPEXT  = 0x3;

const char* JUMP_STR    = "JUMP";
const int   JUMP_OPCODE = 0xC;
//const int   JUMP_OPEXT  = 0x4;

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
