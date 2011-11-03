/*

 */

#include <stdio.h>
#include <string>
#include <string.h>
#include <map>

using namespace std;

// arbitrary maximum length of a single line
#define MAXLINELENGTH 10000

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

// returns true if the string is a number
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

  while(readAndParse(inFilePtr, lineString, &labelPtr, &opcodePtr, &arg0Ptr, &arg1Ptr)
         != NULL)
  {
    if(labelPtr != NULL) // record label at location
    {
      string temp(labelPtr);
      temp.erase(temp.size() - 1); // remove the trailing :
      pair<string, int> value(temp, currentLine);
      LABEL_LOCATIONS.insert(value);
    }

    if(opcode != NULL) // an opcode is on the line, so increase line number
    {
      currentLine++;
    }
  }
}

int main(int argc, char *argv[])
{
  char *inFileString, *outFileString;
  FILE *inFilePtr, *outFilePtr;
  char *label, *opcode, *arg0, *arg1, *arg2;
  char lineString[MAXLINELENGTH + 1];

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

  int currentLocation = 0;
  while( readAndParse(inFilePtr, lineString, &label,
                      &opcode, &arg0, &arg1) != NULL )
  {
    

  }

  
  return 0;
}
