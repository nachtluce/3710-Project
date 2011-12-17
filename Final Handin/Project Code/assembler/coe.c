/*
 converts a assembled file into a coe file
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 100

int main(int argc, char *argv[])
{
  char *inFileString, *outFileString;
  FILE *inFilePtr, *outFilePtr;
  char Rbuff[BUFFER_SIZE + 1];
  char Wbuff[BUFFER_SIZE + 1];

  if (argc != 3) {
    printf("error: usage: %s <input-file> <coe-file>", argv[0]);
    return 1;
  }

  inFileString = argv[1];
  outFileString = argv[2];
  inFilePtr = fopen(inFileString, "r");

  if (inFilePtr == NULL) {
    printf("error in opening %s\n", inFileString);
    return 1;
  }

  outFilePtr = fopen(outFileString, "w");
  if (outFilePtr == NULL) {
    printf("error is opening %s\n", outFileString);
    return 1;
  }

  fputs ("memory_initialization_radix=16;\nmemory_initialization_vector= ", outFilePtr);

 
  while( fgets(Rbuff, BUFFER_SIZE, inFilePtr) != NULL )
  {
    Rbuff[strlen(Rbuff)-1] = '\0';
    sprintf(Wbuff, "%s, ", Rbuff);
    fputs(Wbuff, outFilePtr);
  }
 

  // place a value at the end of 0.  I think this 
  //  makes it so the memory is initialized to zeros
  //  after this location.  Also make this more easy
  //  to program
  fputs("0000;", outFilePtr);

  fclose(inFilePtr);
  fclose(outFilePtr);

  return 0;
}
