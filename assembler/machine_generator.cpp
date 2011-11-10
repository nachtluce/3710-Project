
#include <map>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

#include "constants.h"
#include "command_converter.h"
#include "machine_generator.h"

using namespace std;


extern map<string, int> LABEL_LOCATIONS;

char getImm(char *imm)
{
  char data;
  unsigned t;
  t = strtol(imm, NULL, 10);
  data = (char) t;
  if((int) data != t)
  {
      printf("WARNING: Constant %s may have been truckated", imm);
      return data;
  }
  if(data == 0)
  {
    t = strtol(imm, NULL, 16);
    data = (char) t;
    if((int) data != t)
    {
      printf("WARNING: Constant %s may have been trunkated", imm);
      return data;
    }
  }
  return data;
}

int getEncodedInstruction(char **instruction, char **arg0, char **arg1, int CodeLine)
{
  int opcode = GetOpCode(*instruction);
  int opext  = GetOpExt(*instruction);
  int data = -1;

  // register instructions
  if(
    (opcode == AND_OPCODE && opext == AND_OPEXT)
  ||(opcode == OR_OPCODE  && opext == OR_OPEXT)
  ||(opcode == XOR_OPCODE && opext == XOR_OPEXT)
  ||(opcode == NOT_OPCODE && opext == NOT_OPEXT)
  ||(opcode == ADDU_OPCODE && opext== ADDU_OPEXT)
  ||(opcode == ALSH_OPCODE && opext== ALSH_OPEXT)
  ||(opcode == ARSH_OPCODE && opext== ARSH_OPEXT)
  ||(opcode == SUB_OPCODE  && opext== SUB_OPEXT)
  ||(opcode == ADD_OPCODE  && opext== ADD_OPEXT)
  ||(opcode == LSH_OPCODE  && opext== LSH_OPEXT)
  ||(opcode == MOV_OPCODE  && opext== MOV_OPEXT)
  ||(opcode == RSH_OPCODE  && opext== RSH_OPEXT)
  ||(opcode == LOAD_OPCODE && opext== LOAD_OPEXT)
  ||(opcode ==STORE_OPCODE && opext==STORE_OPEXT)
     ){
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
  }
  // immediate
  else if( 
     (opcode == ADDUI_OPCODE)
     ||(opcode == ADDI_OPCODE)
     ||(opcode == MOVIU_OPCODE)
     ||(opcode == MOVI_OPCODE)
     ||(opcode == SUBI_OPCODE)
     ||(opcode == CMPI_OPCODE)
      ){
    int immediate = getImm(*arg0) & 0xFF;
    int  dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | (immediate << 4) | dst;
  }
  else if(
    (opcode == BGE_OPCODE && opext == BGE_OPEXT)
  ||(opcode == BGEU_OPCODE && opext == BGEU_OPEXT)
  ||(opcode == BEQ_OPCODE && opext == BEQ_OPEXT)
  ||(opcode == BL_OPCODE  && opext == BL_OPEXT)
    ||(opcode == BLU_OPCODE && opext == BLU_OPEXT)
  ){
    // for branch, nothing else is needed
    data = (opcode << 12) | (opext << 8);
  }
  // jumpBI / JumpF1
  else if(
     (opcode == JGE_OPCODE)
     ||(opcode == JGEU_OPCODE)
     ||(opcode == JEQ_OPCODE)
     ||(opcode == JL_OPCODE)
     ||(opcode == JLU_OPCODE)
     )
  {
    //we have current location in Codeline
    int to_location;
    int offset;
    if( LABEL_LOCATIONS.count(*arg0) == 0)
    {
      offset = getImm(*arg0) & (0xFF); // only take the lower character, should be signed
    }
    else
    {
      to_location = LABEL_LOCATIONS.find(*arg0)->second;
      // warning:  I did not add any check to see if it is jumping too far.
      offset = (LABEL_LOCATIONS.find(*arg0)->second - CodeLine) & 0xFF;
    }
    data = (opcode << 12) | (opext << 8) | (offset);
  }
  else if(
    (opcode == JUMP_OPCODE)
    ||(opcode == CMP_OPCODE)
  )
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (srcReg << 4) | dstReg;
    return data;
  }

  return data;
}
