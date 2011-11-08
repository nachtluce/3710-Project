
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

int getEncodedInstruction(char **instruction, char **arg0, char **arg1)
{
  int opcode = GetOpCode(*instruction);
  int opext  = GetOpExt(*instruction);
  int data = 0;

  // AND instruction (Register)
  if( opcode == AND_OPCODE
      && opext == AND_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // OR instruction (Register)
  else if( opcode == OR_OPCODE
      && opext == OR_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // XOR instruction (Register)
  else if( opcode == XOR_OPCODE
      && opext == XOR_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // NOT instruction (Register)
  else if( opcode == NOT_OPCODE
      && opext == NOT_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // ADDU instruction (Register)
  else if( opcode == ADDU_OPCODE
      && opext == ADDU_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // ALSH instruction (Register)
  else if( opcode == ALSH_OPCODE
      && opext == ALSH_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // ARSH instruction (Register)
  else if( opcode == ARSH_OPCODE
      && opext == ARSH_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // SUB instruction (Register)
  else if( opcode == SUB_OPCODE
      && opext == SUB_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // ADD instruction (Register)
  else if( opcode == ADD_OPCODE
      && opext == ADD_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // LSH instruction (Register)
  else if( opcode == LSH_OPCODE
      && opext == LSH_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // MOV instruction (Register)
  else if( opcode == MOV_OPCODE
      && opext == MOV_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // RSH instruction (Register)
  else if( opcode == RSH_OPCODE
      && opext == RSH_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // NOP instruction (???)
  else if( opcode == NOP_OPCODE )
  {
      data = (opcode << 12);
      return data;
  }
  // CMP instruction (??)
  else if( opcode == CMP_OPCODE)
//      && opext == CMP_OPEXT)
  {
    printf("ERROR: CMP instruction must be clarified in implementation\nExiting");
    exit(0);
    /*
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
    */
  }
  // LOAD instruction (Register?)
  else if( opcode == LOAD_OPCODE
      && opext == LOAD_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // STORE instruction (Register?)
  else if( opcode == STORE_OPCODE
      && opext == STORE_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // BCOND instruction (Register?)
  else if( opcode == STORE_OPCODE
      && opext == STORE_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // JCOND instruction (Register?)
  else if( opcode == STORE_OPCODE
      && opext == STORE_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // JUMP instruction (JAL)
  else  if( opcode == JUMP_OPCODE
      && opext == JUMP_OPEXT)
  {
    int srcReg = GetRegisterValue(*arg0);
    int dstReg = GetRegisterValue(*arg1);
    if(srcReg == -1 || dstReg == -1)
      return -1;

    data = (opcode << 12) | (opext << 8) | (srcReg << 4) | dstReg;
    return data;
  }
  // ADDi instruction (immediate)
  else if( opcode == ADDI_OPCODE )
  {
    char immediate = (char) getImm(*arg0);
    int  dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | (immediate << 4) | dst;
  } 
  // ADDUI instruction (immediate)
  else if( opcode == ADDUI_OPCODE )
  {
    char immediate = (char) getImm(*arg0);
    int  dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | (immediate << 4) | dst;
  } 
  // MOVIU instruction (immediate)
  else if( opcode == MOVIU_OPCODE )
  {
    char immediate = (char) getImm(*arg0);
    int  dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | (immediate << 4) | dst;
  } 
  // MOVI instruction (immediate)
  else if( opcode == MOVI_OPCODE )
  {
    char immediate = (char) getImm(*arg0);
    int dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | ( (immediate) << 4) | dst;
  }
  // SUBI instruction (immediate)
  else if( opcode == SUBI_OPCODE )
  {
    char immediate = (char) getImm(*arg0);
    int  dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | (immediate << 4) | dst;
  }
  // CMPI instruction (immediate)
  else if( opcode == CMPI_OPCODE )
  {
    char immediate = (char) getImm(*arg0);
    int  dst = GetRegisterValue(*arg1);

    data = (opcode << 12) | (immediate << 4) | dst;
  }
  else
    data = -1;

  return data;
}
