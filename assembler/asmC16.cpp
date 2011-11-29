 /*

 */

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <map>

#include <iostream>

#include "constants.h"
#include "command_converter.h"
#include "machine_generator.h"

using namespace std;

// arbitrary maximum length of a single line
#define MAXLINELENGTH 10000
#define WRITEBUFFLENGTH 16

map<string, int> LABEL_LOCATIONS;

// from ENEE 646 handout
/* reads a line from the file passed.  It will return

 */
char * readAndParse(FILE *inFilePtr, char *lineString,
		    char **labelPtr, char **opcodePtr, 
                    char **arg0Ptr,  char **arg1Ptr)
{
  char *statusString, *firsttoken;

  statusString = fgets(lineString, MAXLINELENGTH, inFilePtr);

  if (statusString != NULL) {
    firsttoken = strtok(lineString, " \t\n");
    if (firsttoken == NULL || firsttoken[0] == '#') {
      return readAndParse(inFilePtr, lineString, 
                          labelPtr, opcodePtr, 
                          arg0Ptr, arg1Ptr);
    } else if (firsttoken[strlen(firsttoken) - 1] == ':') {
      *labelPtr = firsttoken;
      *opcodePtr = strtok(NULL, "  \n");
      firsttoken[strlen(firsttoken) - 1] = '\0';
    } else {
      *labelPtr = NULL;
      *opcodePtr = firsttoken;
    }
    
    *arg0Ptr = strtok(NULL, ", \t\n");
    *arg1Ptr = strtok(NULL, ", \t\n");
  }

  return(statusString);
}

// returns true if the string is a number in decimal format
bool isNumber(char *string) {
  int i;
  return( (sscanf(string, "%d", &i)) == 1);
}

void LocateLabels(FILE *inFilePtr, char *lineString,
                  char **labelPtr, char **opcodePtr,
                  char **arg0Ptr, char **arg1Ptr)
{
  int currentLine = 0;
  rewind(inFilePtr);

  while(readAndParse(inFilePtr, lineString, labelPtr, opcodePtr, arg0Ptr, arg1Ptr)
         != NULL)
  {
    if(*labelPtr != NULL) // record label at location
    {
      string temp = *labelPtr;
      pair<string, int> value(temp, currentLine);
      LABEL_LOCATIONS.insert(value);
    }

    if(*opcodePtr != NULL) // an opcode is on the line, so increase line number
    {
      // this is a psudo instruction that takes two instructions to create.
      if(strcmp(*opcodePtr, LOAD_LBL) == 0)
	currentLine += 2;
      else 
       currentLine++;
    }
  }
}

int main(int argc, char *argv[])
{
  char *inFileString, *outFileString;
  FILE *inFilePtr, *outFilePtr;
  char *label, *opcode, *arg0, *arg1;
  char lineString[MAXLINELENGTH + 1];
  char writeBuff[WRITEBUFFLENGTH];

  if (argc != 3) {
    printf("error: usage: %s <assembly-code-file> <output-file>\n", argv[0]);
    return 1; // exit
  }

  inFileString = argv[1];
  outFileString = argv[2];
  inFilePtr = fopen(inFileString, "r");
  if (inFilePtr == NULL) {
    printf("error in opening %s\n", inFileString);
    return 1; // exit
  }
  
  outFilePtr = fopen(outFileString, "w");
  if (outFilePtr == NULL) {
    printf("error in opening %s\n", outFileString);
    return 1; // exit
  }

  // find all labels and add them to the label table
  LocateLabels(inFilePtr, lineString, &label, &opcode, &arg0, &arg1);
  rewind(inFilePtr);

#ifdef DEBUG
  printf("PRINTING LABEL INFORMATION:\n");
  map<string, int>::iterator it = LABEL_LOCATIONS.begin();
  for( ; it != LABEL_LOCATIONS.end(); it++)
    printf("%s => 0x%x\n", (*it).first.data(), (*it).second);
#endif
  

  int lineNumber = 1;
  int codeLine   = 0;
  while(readAndParse(inFilePtr, lineString, &label, &opcode, &arg0, &arg1)
         != NULL)
  { 
    
    unsigned data = 0;

    // will only enter if there is an opcode
    if(opcode != NULL)
    {
      if(strcmp(opcode, ".fill") == 0)
      {
	// if it is not the end location, that means this is referencing a label
       	if(LABEL_LOCATIONS.count(arg0) > 0)
	{// if it can be found in the table, this means it will be in the table
	  data = (LABEL_LOCATIONS.find(arg0))->second;
#ifdef DEBUG
	  printf(".fill data on line 0x%x referenced label, filled with 0x%x\n", lineNumber, data);
#endif
	}
        else
	{
	 // try to read it has hex first, if that does not work, try again with dec
	  long t = strtol(arg0, NULL, 10);
	  data = (short) t;
	  if(data == 0)
	  {
	    t = strtol(arg0, NULL, 16);
            data = (short) t;
	    if(data == 0)
	      {
		//	printf("WARNING: on line %d a reference was made that was resolved to 0", lineNumber);
	      }
	  }
	}
      }
      else if(strcmp(opcode, LOAD_LBL) == 0)
      {
	int reg = GetRegisterValue(arg1);
	if( LABEL_LOCATIONS.count(arg0) == 0)
	{
	  printf("ERROR: UNKNOWN REFERENCE %s ON LINE %d\n", arg0, lineNumber);
	  exit(-1);
	}
	if( reg == -1 )
	{
	  printf("ERROR: UNKNOWN REGISTER %s ON LINE %d\n", arg1, lineNumber);
	  exit(-1);
	}
	unsigned int label = LABEL_LOCATIONS.find(arg0)->second;
	  // the way the code is organized, this will do a 'pre push' and at the end of the block the other data will be written.  Funny, but it words.

/* NOTE: The CPU is setup so the lower bits MUST be placed into the register first.  A movi instruction
will eliminate the upper bits and set them to 00h, so the movui must be done after.
*/

      // do movi to put upper bits of address in the reg
      unsigned short tempData = (MOVI_OPCODE << 12) | ( (label << 4) & 0x0FF0) | reg;
      sprintf(writeBuff, "%04x\n", tempData);
      fputs(writeBuff, outFilePtr);
      codeLine++;  // codeline increased when data is written
	 
      // now set data to write the upper bits
      data = (MOVIU_OPCODE << 12) | ( (label >> 4) & 0x0FF0) | reg;
      }
      ////////////////////////
      else{
      	int instruction = getEncodedInstruction(&opcode, &arg0, &arg1, codeLine);
	if(instruction == -1)
	  {
	    printf("ERROR: unable to parse line %d\n%d: %s", lineNumber, lineNumber, lineString);
	    exit(-1);
	  }
	data = instruction;
      }  
      
      // write the information to the file.  Each entry seperated by newline
      data <<= 16;
      data >>= 16;
      sprintf(writeBuff, "%04x\n", data);
      fputs(writeBuff, outFilePtr);
      codeLine++; // codeline increased if data is written
    }
    lineNumber++;
  }
  
  return 0;
}
