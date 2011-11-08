CC = g++
CXXFLAGS += -g -Wall

all: asmC16 coe

asmC16: asmC16.cpp command_converter.o constants.o machine_generator.o

coe: coe.c

command_converter.o: constants.o

constants.o:

machine_generator.o:

clean:
	rm -f asmC16.exe *.o