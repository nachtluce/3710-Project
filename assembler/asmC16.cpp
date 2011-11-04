/*

 */

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <map>

#include <iostream>

#include "constants.h"
#include "command_converter.hpp"

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
  

  int lineNumber = 0;
  while(readAndParse(inFilePtr, lineString, &label, &opcode, &arg0, &arg1)
         != NULL)
  { 
    
    unsigned data = 0;

    // will only enter if there is an opcode
    if(opcode != NULL)
    {
      if(strcmp(opcode, ".fill") == 0)
      {
	// try to read it has hex first, if that does not work, try again with dec
	long t = strtol(arg0, NULL, 10);
	data = (short) t;
	//	if((long) data != t)
	//	{
	//	  printf("ERROR: UNABLE TO PARSE CONSTANT ON LINE: %d, is it under 16 bits?\n%d: %s", 
	//                 lineNumber, lineNumber, lineString);
	//	  exit(0);
	//	}
	if(data == 0)
	{
	  t = strtol(arg0, NULL, 16);
          data = (short) t;
	  //          if((long) data != t)
	  //          {
	  //	    printf("ERROR: UNABLE TO PARSE CONSTANT ON LINE: %d, is it under 16 bits?\n%d: %s", 
	  //                 lineNumber, lineNumber, lineString);
	  //            exit(0);
	  //	  }
	}
      }
      ////////////////////////
      else{
	//	int instruction = getEncodedInstruction(
	printf("%s not supported yet\n", opcode);
      }  
      


      // write the information to the file.  Each entry seperated by newline
      data <<= 16;
      data >>= 16;
      sprintf(writeBuff, "%x\n", data);
	//      itoa (data, writeBuff, 16);
      fputs(writeBuff, outFilePtr);
      //      fputs("\n", outFilePtr);

    }

    lineNumber++;
  }
  
  return 0;
}
