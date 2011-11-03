`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:33 11/03/2011 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
    input Clock,
    input Reset,
    input [15:0] Mem_Data,
    output [15:0] Mem_Addr,
    output Mem_Write,
    output [15:0] Data_Out
    );
	 
	 wire [15:0] INS_TO_CPU;
	 wire [4:0] PSR_TO_CPU;
	 wire [3:0] OpCode;
	 wire [3:0] OpExt;
	 wire [3:0] RegIn;
	 wire [3:0] RegA;
	 wire [3:0] RegB;
	 wire [15:0] Immediate;
	 wire [7:0] PCImmediate;
	 wire [1:0] SelALU;
	 wire [15:0] A_to_mux;
	 wire [15:0] A_to_ALU;
	 wire [15:0] B;
	 wire [15:0] S;
	 wire [15:0] PC_OUT;
	 wire [4:0] ALU_TO_PSR;
	 
	 CPU_Controller CPU_Control(Clock, Reset, INS_TO_CPU, PSR_TO_CPU, 
											OpCode, OpExt, RegWrite, RegIn, RegA, RegB, 
											Immediate, PCImmediate, SelALU, SelMEM, 
											Mem_Write, PCWrite, PCIncrement, 
											PCReset, IRReset, IRWrite, PSRReset);
	 RegFile2 rf(Clock, Reset, RegWrite, RegIn, RegA, RegB, S, A_to_Mux, B);
	 ALUmod brain(A_to_ALU, B, OpCode, S, OpExt, ALU_TO_PSR);
	 BusMux alu_mux(SelALU, Immediate, A_to_mux, Mem_Data, A_to_ALU);
	 Mux2 mem_mux(SelMEM, B, PC_OUT, Mem_Addr);
	 program_counter pc(Clock, PCReset, PCIncrement, PCImmediate, S, PCWrite, PC_OUT);
	 Processor_Status_Register psr( Clock, PSRReset, ALU_TO_PSR, PSR_TO_ALU);
	 Reg16 InstructionRegister( Clock, IRReset, Mem_Data, INS_TO_CPU);

	 assign Mem_Data = S;
	 
endmodule
