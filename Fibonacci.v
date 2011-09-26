`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:32 09/22/2011 
// Design Name: 
// Module Name:    Fibonacci 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Fibonacci(
    input Clock,
    input Reset,
    input SetA,
    input SetB,
    input [3:0] Switches,
    output [15:0] Output
    );
	 
	 reg [3:0] SelectA;
	 reg [3:0] SelectB;
	 reg [3:0] SelectIn;
	 reg [16:0] Immediate;
	 reg [7:0] OpCode;
	 reg [1:0] MuxSelect;
	 reg WriteEnable;
	 reg SlowClock; 
	 wire [15:0] Result;
	 reg [31:0] countUp;
	 reg [31:0] maxCount; 
	 reg restart;
	 
	 RegFile2(SlowClock, Reset, WriteEnable, SelectIn, SelectA, SelectB, Result, A, B); 
	 BusMux(MuxSelect, Immediate, A, B, MuxOut);
	 ALUmod(MuxOut, B, OpCode[7:4], Result, OpCode[3:0], PSR);
	 
	 always @(posedge Clock, negedge Reset, negedge SetA, negedge SetB)
	 begin 
		if (~Reset)
		begin 
			SelectA <= 0;
			SelectB <= 0;
			SelectIn <= 0;
			Immediate <= 0;
			OpCode <= 0;
			MuxSelect <= 0;
			WriteEnable <= 0;
			SlowClock <= 0;
			countUp <= 0;
		end
		
		else if (~SetA)
		begin
			countUp <= maxCount;			//Set the count so a slow clock will be triggered at next posedge
			SelectIn <= 0;					//Set the input to go to register 0
			Immediate <= Switches;		//Store the value from dip switches
			MuxSelect <= 0;				//Select the immediate value
			OpCode <= 8'b0000_1101; 	//Move instruction to ALU
			WriteEnable <= 0;				//Set write enable to true
			restart = 1;					//Tells the state machine to start over when ready
		end
		
		else if (~SetB)
		begin
			countUp <= maxCount;			//Set the count so a slow clock will be triggered at next posedge
			SelectIn <= 1;					//Set the input to go to register 1
			Immediate <= Switches;		//Store the value from dip switches
			MuxSelect <= 0;				//Select the immediate value
			OpCode <= 8'b0000_1101; 	//Move instruction to ALU
			WriteEnable <= 0;				//Set write enable to true
			restart = 1;					//Tells the state machine to start over when ready
		end
		
		else
		begin
			countUp <= countUp + 1;
			if (countUp > maxCount)
			begin
				
			end
		end
	 end

endmodule
