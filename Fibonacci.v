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
	 reg [15:0] Immediate;
	 reg [7:0] OpCode;
	 reg [1:0] MuxSelect;
	 reg WriteEnable;
	 reg SlowClock; 
	 wire [15:0] Result;
	 reg [31:0] countUp;
	 reg [31:0] maxCount;  
	 reg [3:0]currentState;
	 wire [15:0] A;
	 wire [15:0] B; 
	 wire [15:0] MuxOut;
	 wire [4:0] PSR;
	 
	 initial begin
		SelectA <= 0;
		SelectB <= 0;
		SelectIn <= 0;
		Immediate <= 0;
		OpCode <= 0;
		MuxSelect <= 0;
		WriteEnable <= 0;
		SlowClock <= 0;
		countUp <= 0;
		maxCount <= 5;
		currentState <= 1;
	 end
	 
	 RegFile2 rf2(SlowClock, Reset, WriteEnable, SelectIn, SelectA, SelectB, Result, A, B); 
	 BusMux bm(MuxSelect, Immediate, A, B, MuxOut);
	 ALUmod alu(MuxOut, B, OpCode[7:4], Result, OpCode[3:0], PSR, Reset);
	 
	 assign Output = Result;
	 
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
			countUp <= 0;   //Set the count so a slow clock will be triggered at next posedge
			SelectIn <= 0;					//Set the input to go to register 0
			Immediate <= Switches;		//Store the value from dip switches
			MuxSelect <= 0;				//Select the immediate value
			OpCode <= 8'b0000_1101; 	//Move instruction to ALU
			WriteEnable <= 1;				//Set write enable to true
			currentState <= 0;				//Tells the state machine to start over when ready
		end
		
		else if (~SetB)
		begin
			countUp <= 0;	//Set the count so a slow clock will be triggered at next posedge
			SelectIn <= 1;					//Set the input to go to register 1
			Immediate <= Switches;		//Store the value from dip switches
			MuxSelect <= 0;				//Select the immediate value
			OpCode <= 8'b0000_1101; 	//Move instruction to ALU
			WriteEnable <= 1;				//Set write enable to true
			currentState <= 0;			//Tells the state machine to start over when ready
		end
		
		else
		begin
			countUp <= countUp + 1;
			if (countUp > maxCount)
			begin
				SlowClock <= 0; 
				countUp <= 0;
			end
			
			if (countUp == 3)
				SlowClock <= 1;
				
			if (countUp == 0)
			begin
				case (currentState) 
					0: 
					begin
						currentState <= currentState + 1;
					end
					
					1:
					begin
						currentState <= currentState + 1;
						SelectA <= 0;
						SelectB <= 1;
						OpCode <= 8'b0000_0110;
						SelectIn <= 2;
						WriteEnable <= 1;
						MuxSelect <= 1;
					end
					2:
					begin
						currentState <= currentState + 1;
						SelectA <= 1;
						SelectB <= 2;
						OpCode <= 8'b0000_0110;
						SelectIn = 3;
						WriteEnable <= 1;
					end
					3:
					begin
						currentState <= currentState + 1;
						SelectA <= 2;
						SelectB <= 3;
						OpCode <= 8'b0000_0110;
						SelectIn <= 4;
						WriteEnable <= 1;
					end
					4:
					begin
						currentState <= currentState + 1;
						SelectA <= 3;
						SelectB <= 4;
						OpCode <= 8'b0000_0110;
						SelectIn <= 5;
						WriteEnable <= 1;
					end					
					5:
					begin
						currentState <= currentState + 1;
						SelectA <= 4;
						SelectB <= 5;
						OpCode <= 8'b0000_0110;
						SelectIn <= 6;
						WriteEnable <= 1;
					end					
					6: 
					begin
						currentState <= currentState + 1;
						SelectA <= 5;
						SelectB <= 6;
						OpCode <= 8'b0000_0110;
						SelectIn <= 7;
						WriteEnable <= 1;
					end
					7: 
					begin
						currentState <= currentState + 1;
						SelectA <= 6;
						SelectB <= 7;
						OpCode <= 8'b0000_0110;
						SelectIn <= 8;
						WriteEnable <= 1;
					end
					8: 
					begin
						currentState <= currentState + 1;
						SelectA <= 7;
						SelectB <= 8;
						OpCode <= 8'b0000_0110;
						SelectIn <= 9;
						WriteEnable <= 1;
					end
					9: 
					begin
						currentState <= currentState + 1;
						SelectA <= 8;
						SelectB <= 9;
						OpCode <= 8'b0000_0110;
						SelectIn <= 10;
						WriteEnable <= 1;
					end
					10:
					begin
						currentState <= currentState + 1;
						SelectA <= 9;
						SelectB <= 10;
						OpCode <= 8'b0000_0110;
						SelectIn <= 11;
						WriteEnable <= 1;
					end
					11: 
					begin
						currentState <= currentState + 1;
						SelectA <= 10;
						SelectB <= 11;
						OpCode <= 8'b0000_0110;
						SelectIn <= 12;
						WriteEnable <= 1;
					end
					12: 
					begin
						currentState <= currentState + 1;
						SelectA <= 11;
						SelectB <= 12;
						OpCode <= 8'b0000_0110;
						SelectIn <= 13;
						WriteEnable <= 1;
					end
					13: 
					begin
						currentState <= currentState + 1;
						SelectA <= 12;
						SelectB <= 13;
						OpCode <= 8'b0000_0110;
						SelectIn <= 14;
						WriteEnable <= 1;
					end
					14: 
						begin
						currentState <= currentState + 1;
						SelectA <= 13;
						SelectB <= 14;
						OpCode <= 8'b0000_0110;
						SelectIn <= 15;
						WriteEnable <= 1;
					end
					15:
						begin
						SelectA <= 15;
						OpCode <= 8'b0000_1101; 	//Move instruction to ALU	
						end
				endcase
			end
		end
	 end

endmodule
