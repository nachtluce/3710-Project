`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:11 10/27/2011 
// Design Name: 
// Module Name:    CPU_Controller 
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
module CPU_Controller(
    input Clock,
    input Reset,
    input [15:0] INS,
    input [4:0] PSR,
    output [3:0] OpCode,
    output [3:0] OpExt,
    output RegWrite,
    output [3:0] RegIn,
    output [3:0] RegA,
    output [3:0] RegB,
    output [15:0] Immediate,
	 output [7:0] PCImmediate,
    output [1:0] SelALU,
    output SelMEM,
    output MemRW,
    output PCWrite,
    output PCIncrement,
    output PCReset,
    output IRReset,
    output IRWrite,
    output PSRReset
    );
	 
	 reg state;
	 
	initial begin
		state = 0;
	end
	
	always@(posedge clock, negedge reset)
	begin
		if (~reset)
		begin
			state = 0;
			OpCode = 0;
			OpExt = 0;
			RegWrite = 0;
			RegA = 0;
			RegB = 0; 
			RegIn = 0;
			Immediate = 0; 
			PCImmediate = 0;
			SelALU = 0;
			SelMEM = 0;
			MemRW = 0;
			PCWrite = 0; 
			PCIncrement = 0;
			PCReset = 0;
			IRReset = 0;
			IRWrite = 0;
			PSRReset = 0;
		end
		else
		begin
			state = ~state;
		end
	end
	
	always@(*)
	begin
		// State 0 -- Fetch
		if (~state)
		begin
			OpCode = 0;
			OpExt = 0;
			RegWrite = 0;
			RegA = 0;
			RegB = 0; 
			RegIn = 0;
			Immediate = 0; 
			PCImmediate = 0;
			SelALU = 0;
			SelMEM = 1;
			MemRW = 0;
			IRWrite = 1;
			PCWrite = 0;
			PCIncrement = 0;
			PCReset = 1;
			IRReset = 1;
			PSRReset = 1;
		end
			
		// State 1 -- Execute
		else
			casex (INS[15:0])
				// Register to Register ALU instructions
				4'b0000:
					begin
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Enable Registers to write
						RegWrite = 1'b1; 
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = INS[7:4];
						RegB = INS[3:0];
						// The PC should increment by one
						PCImmediate = 8'h01; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;							
					end
				4'b0011:
				begin 
					// CMP
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Disable Registers to write
						RegWrite = 1'b0;
						// Set the write to register
						RegIn = 4'h0;
						// Set the operands
						RegA = INS[7:4];
						RegB = INS[3:0];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// Don't care about immediate value
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;						
				end
				4'b0101:
				begin
					//ADDI
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Enable Registers to write
						RegWrite = 1'b1;
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'h0;
						RegB = INS[3:0];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// The Immediate value from the instruction:
						Immediate = {{8{INS[11]}},INS[11:4]}; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						// 
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;
				end
				4'b0110: 
					//ADDUI
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Enable Registers to write
						RegWrite = 1'b1;
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'h0;
						RegB = INS[3:0];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// The Immediate value from the instruction:
						Immediate = {{8{1'b0}},INS[11:4]}; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						// Do increment the program counter
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;
				4'b0111:
					//MOVIU
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Enable Registers to write
						RegWrite = 1'b1;
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'h0;
						RegB = INS[3:0];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// The Immediate value from the instruction:
						Immediate = {INS[11:4],{8{1'b0}}}; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						// Do increment the program counter
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;			
				4'b1000:
				begin
					//MOVI
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Enable Registers to write
						RegWrite = 1'b1;
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'h0;
						RegB = INS[3:0];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// The Immediate value from the instruction:
						Immediate = {{8{1'b0}},INS[11:4]}; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						// Do increment the program counter
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;
				end
				4'b1001:
				begin
					//SUBI
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Enable Registers to write
						RegWrite = 1'b1;
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'h0;
						RegB = INS[3:0];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// The Immediate value from the instruction:
						Immediate = {{8{INS[11]}},INS[11:4]}; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						// 
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;
				end				
				4'b1011:
				begin 
					// CMPI
						// Send instruction to ALU
						OpCode = INS[15:12];
						OpExt = INS[11:8];
						// Disable Registers to write
						RegWrite = 1'b0;
						// Set the write to register
						RegIn = 4'h0;
						// Set the operands
						RegA = INS[7:4];
						RegB = INS[3:0];
						// The PC should increment by one 
						Immediate = {{8{1'b1}},INS[11:4]};
						// Set immediate value
						Immediate = 16'h0000; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 2'b00; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;						
				end
				4'b1100:
				4'b1101:
				4'b1110:
				4'b1111:
			endcase
		begin
		end
	end
	


endmodule
