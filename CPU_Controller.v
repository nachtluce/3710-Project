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
    output reg [3:0] OpCode,
    output reg [3:0] OpExt,
    output reg RegWrite,
    output reg [3:0] RegIn,
    output reg [3:0] RegA,
    output reg [3:0] RegB,
    output reg [15:0] Immediate,
	 output reg [7:0] PCImmediate,
    output reg [1:0] SelALU,
    output reg SelMEM,
    output reg MemRW,
    output reg PCWrite,
    output reg PCIncrement,
    output reg PCReset,
    output reg IRReset,
    output reg IRWrite,
    output reg PSRReset
    );
	 
	 reg state;
	 
	initial begin
		state = 0;
	end
	
	always@(posedge Clock, negedge Reset)
	begin
		if (~Reset)
		begin
			state <= 0;
		end
		else
		begin
			state <= ~state;
		end
	end
	
	always@(*)
	begin
		if (~Reset)
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
			SelMEM = 0;
			MemRW = 0;
			PCWrite = 0; 
			PCIncrement = 0;
			PCReset = 0;
			IRReset = 0;
			IRWrite = 0;
			PSRReset = 0;
		end
		else // else don't reset
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
				16'b0000_xxxx_xxxx_xxxx:
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
						SelMEM = 1'b0; 
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
				16'b0001_0000_xxxx_xxxx:
				begin
					// BGE
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(PSR[3] || PSR[0])
							PCImmediate = 8'h01;
						else
							PCImmediate = 8'h02; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b0001_0001_xxxx_xxxx:
				begin
					// BHG
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(PSR[3] || PSR[2])
							PCImmediate = 8'h01;
						else
							PCImmediate = 8'h02; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b0001_0010_xxxx_xxxx:
				begin
					// BEQ
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(PSR[3])
							PCImmediate = 8'h01;
						else
							PCImmediate = 8'h02; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b0001_0011_xxxx_xxxx:
				begin
					// BLT
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(~PSR[3] && ~PSR[0])
							PCImmediate = 8'h01;
						else
							PCImmediate = 8'h02; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b0001_0100_xxxx_xxxx:
				begin
					// BLS
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(~PSR[2])
							PCImmediate = 8'h01;
						else
							PCImmediate = 8'h02; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b0011_xxxx_xxxx_xxxx:
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
						SelMEM = 1'b0; 
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
				16'b0101_xxxx_xxxx_xxxx:
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
						SelMEM = 1'b0; 
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
				16'b0110_xxxx_xxxx_xxxx:
				begin
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
						SelMEM = 1'b0; 
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
				16'b0111_xxxx_xxxx_xxxx:
				begin
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
						SelMEM = 1'b0; 
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
				16'b1000_xxxx_xxxx_xxxx:
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
						SelMEM = 1'b0; 
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
				16'b1001_xxxx_xxxx_xxxx:
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
						SelMEM = 1'b0; 
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

				16'b1010_0000_xxxx_xxxx:
				begin
					// JGE
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(PSR[3] || PSR[0])
							PCImmediate = 8'h01;
						else
							PCImmediate = INS[7:0]; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b1010_0001_xxxx_xxxx:
				begin
					// JHG
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(PSR[3] || PSR[2])
							PCImmediate = 8'h01;
						else
							PCImmediate = INS[7:0]; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b1010_0010_xxxx_xxxx:
				begin
					// JEQ
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(PSR[3])
							PCImmediate = 8'h01;
						else
							PCImmediate = INS[7:0]; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b1010_0011_xxxx_xxxx:
				begin
					// JLT
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(~PSR[3] && ~PSR[0])
							PCImmediate = 8'h01;
						else
							PCImmediate = INS[7:0]; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b1010_0100_xxxx_xxxx:
				begin
					// JLS
						OpCode = 4'h0;
						OpExt = 4'h0;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment by one  
						if(~PSR[2])
							PCImmediate = 8'h01;
						else
							PCImmediate = INS[7:0]; 
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b1100_0000_xxxx_xxxx:
				begin
					// JUMP
						OpCode = 4'b0000;
						OpExt = 4'b1101;
						// Disable Registers to write
						RegWrite = 1'b0; 
						// Set the write to register
						RegIn = 4'b0;
						// Set the operands
						RegA = INS[7:4];
						RegB = 4'b0;
						// The PC shouldn't increment 
						PCImmediate = 8'h00;
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select Registers A as ALU input
						SelALU = 2'b01; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
						// Don't write to memory
						MemRW = 1'b0;
						// Don't write to Instruction register
						IRWrite = 1'b0;
						// Don't write to Program Counter
						PCWrite = 1'b1;
						PCIncrement = 1'b0; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;
				end
				16'b1100_0001_xxxx_xxxx:
				begin
					// Store PC
						OpCode = 4'b0000;
						OpExt = 4'b1101;
						// Disable Registers to write
						RegWrite = 1'b1; 
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'b0;
						RegB = 4'b0;
						// The PC should increment 
						PCImmediate = 8'h01;
						// Don't care about the immediate
						Immediate = 16'h0000; 
						// Select PC Out as ALU input
						SelALU = 2'b11; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				
				16'b1011_xxxx_xxxx_xxxx:
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
						PCImmediate = 8'h01;
						// Set immediate value
						Immediate = {{8{1'b1}},INS[11:4]}; 
						// Select Immediate as ALU input
						SelALU = 2'b00; 
						// Don't care about the memory address
						SelMEM = 1'b0; 
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
				16'b0100_0000_XXXX_XXXX:
				begin
					// Load
						// Send instruction to ALU (Move)
						OpCode = 4'b0000;
						OpExt = 4'b1101;
						// Enable Registers to write
						RegWrite = 1'b1;
						// Set the write to register
						RegIn = INS[3:0];
						// Set the operands
						RegA = 4'h0;
						RegB = INS[7:4];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// Set immediate value
						Immediate = 16'h0000; 
						// Select Immediate as memory data out
						SelALU = 2'b10; 
						// Memory address coming from the B register
						SelMEM = 1'b0; 
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
				16'b0100_0001_XXXX_XXXX:
				begin
					// Store
						// Send instruction to ALU (Move)
						OpCode = 4'b0000;
						OpExt = 4'b1101;
						// Disable Register write
						RegWrite = 1'b0;
						// Set the write to register
						RegIn = 4'h0;
						// Set the operands
						RegA = INS[3:0];
						RegB = INS[7:4];
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// Set immediate value
						Immediate = 16'h0000; 
						// Select ALU input as reg A
						SelALU = 2'b01; 
						// Memory address coming from the B register
						SelMEM = 1'b0; 
						// Do write to memory
						MemRW = 1'b1;
						// Do write to Instruction register
						IRWrite = 1'b1;
						// Don't write to Program Counter
						PCWrite = 1'b0;
						PCIncrement = 1'b1; 
						// Don't reset anything
						PCReset = 1'b1;
						IRReset = 1'b1;
						PSRReset = 1'b1;					
				end
				16'bXXXX_XXXX_XXXX_XXXX:
				begin
					// Do nothing!
						// Send instruction to ALU
						OpCode = 0;
						OpExt = 0;
						// Disable Registers to write
						RegWrite = 1'b0;
						// Set the write to register
						RegIn = 0;
						// Set the operands
						RegA = 0;
						RegB = 0;
						// The PC should increment by one 
						PCImmediate = 8'h01;
						// Set immediate value
						Immediate = {{8{1'b1}},INS[11:4]}; 
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
			endcase
		end
	end
	


endmodule
