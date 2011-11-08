/*
  Programer: Robert Christensen

  The functions in this file convert from a string type to an integer
  type to convert values to CPU commands
*/


#include <string.h>
#include <stdio.h>

#include "constants.h"
#include "command_converter.h"

using namespace std;

#define RETURN_OP_MATCH(X1, X2) if( strcmp(op, X1) == 0) return X2

// given a character string for a register, return the numeric value for that 
// register.  If it could not correctly be converted, return -1.
int GetRegisterValue(char *reg)
{
  int value;

  if( reg == NULL )
    return -1;

  // This supports using "r#" or just "#" for the value of a register
  // capital R is supported so codding can be done with CAPS-lock on
  if( reg[0] == 'r' || reg[0] == 'R')
    reg++;

  int chk = sscanf( reg, "%d", &value);

  if(chk == EOF)
    return -1;
  return value;
}


int GetOpCode(char *op)
{
  // perform a litteral translation.
  // This is written in a very verbose way so it should be easy
  // to come back in and add or modify the content
  //
  RETURN_OP_MATCH( AND_STR, AND_OPCODE );
  RETURN_OP_MATCH( OR_STR,  OR_OPCODE );
  RETURN_OP_MATCH( XOR_STR, XOR_OPCODE );
  RETURN_OP_MATCH( NOT_STR, NOT_OPCODE );
  RETURN_OP_MATCH( ADDU_STR, ADDU_OPCODE );
  RETURN_OP_MATCH( ALSH_STR, ALSH_OPCODE );
  RETURN_OP_MATCH( ARSH_STR, ARSH_OPCODE );
  RETURN_OP_MATCH( SUB_STR, SUB_OPCODE );
  RETURN_OP_MATCH( ADD_STR, ADD_OPCODE );
  RETURN_OP_MATCH( CMP_STR, CMP_OPCODE );
  RETURN_OP_MATCH( LSH_STR, LSH_OPCODE );
  RETURN_OP_MATCH( MOV_STR, MOV_OPCODE );
  RETURN_OP_MATCH( RSH_STR, RSH_OPCODE );

  //  RETURN_OP_MATCH( CMPUI_STR, CMPUI_OPCODE );
  RETURN_OP_MATCH( NOP_STR, NOP_OPCODE );
  RETURN_OP_MATCH( LOAD_STR, LOAD_OPCODE );
  RETURN_OP_MATCH( STORE_STR, STORE_OPCODE );
  RETURN_OP_MATCH( BCOND_STR, BCOND_OPCODE );
  RETURN_OP_MATCH( JCOND_STR, JCOND_OPCODE );
  RETURN_OP_MATCH( JUMP_STR, JUMP_OPCODE );
  RETURN_OP_MATCH( ADDI_STR, ADDI_OPCODE );
  RETURN_OP_MATCH( ADDUI_STR, ADDUI_OPCODE );  
  RETURN_OP_MATCH( MOVIU_STR, MOVIU_OPCODE );
  RETURN_OP_MATCH( MOVI_STR, MOVI_OPCODE );
  RETURN_OP_MATCH( SUBI_STR, SUBI_OPCODE );
  RETURN_OP_MATCH( CMPI_STR, CMPI_OPCODE );

  // if it can't find it return -1, for error
  return -1;
}

int GetOpExt(char *op)
{
  // perform a litteral translation.
  // This is written in a very verbose way so it should be easy
  // to come back in and add or modify the content
  //

  RETURN_OP_MATCH( AND_STR, AND_OPEXT );
  RETURN_OP_MATCH( OR_STR,  OR_OPEXT );
  RETURN_OP_MATCH( XOR_STR, XOR_OPEXT );
  RETURN_OP_MATCH( NOT_STR, NOT_OPEXT );
  RETURN_OP_MATCH( ADDU_STR, ADDU_OPEXT );
  RETURN_OP_MATCH( ALSH_STR, ALSH_OPEXT );
  RETURN_OP_MATCH( ARSH_STR, ARSH_OPEXT );
  RETURN_OP_MATCH( SUB_STR, SUB_OPEXT );
  RETURN_OP_MATCH( ADD_STR, ADD_OPEXT );
  //  RETURN_OP_MATCH( CMP_STR, CMP_OPEXT );
  RETURN_OP_MATCH( LSH_STR, LSH_OPEXT );
  RETURN_OP_MATCH( MOV_STR, MOV_OPEXT );
  RETURN_OP_MATCH( RSH_STR, RSH_OPEXT );

  RETURN_OP_MATCH( LOAD_STR, LOAD_OPEXT );
  RETURN_OP_MATCH( STORE_STR, STORE_OPEXT );
  RETURN_OP_MATCH( BCOND_STR, BCOND_OPEXT );
  RETURN_OP_MATCH( JCOND_STR, JCOND_OPEXT );
  RETURN_OP_MATCH( JUMP_STR, JUMP_OPEXT );

  // if no opext can be found, return -1 to signal no result
  return -1;
}
