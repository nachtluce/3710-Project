CC = g++
CXXFLAGS += -g -Wall

asmC16: asmC16.cpp command_converter.o constants.o machine_generator.o

command_converter.o: constants.o

constants.o:

machine_generator.o:

clean:
	rm -f asmC16.exe *.o