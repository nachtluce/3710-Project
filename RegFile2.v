`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:33 09/19/2011 
// Design Name: 
// Module Name:    RegFile2 
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
module RegFile2(
    input Clock,
    input Reset,
    input WriteEnable,
    input [3:0] SelectInput,
    input [3:0] SelectA,
    input [3:0] SelectB,
    input [15:0] In,
    output reg [15:0] A,
    output reg [15:0] B
    ); 
	 
	 reg [15:0] registers [15:0];
	 
	 	 // Initialize registers to zero:
	 initial begin 
		registers[0] <= 16'h0000;
		registers[1] <= 16'h0000;
		registers[2] <= 16'h0000;
		registers[3] <= 16'h0000;
		registers[4] <= 16'h0000;
		registers[5] <= 16'h0000;
		registers[6] <= 16'h0000;
		registers[7] <= 16'h0000;
		registers[8] <= 16'h0000;
		registers[9] <= 16'h0000;
		registers[10] <= 16'h0000;
		registers[11] <= 16'h0000;
		registers[12] <= 16'h0000;
		registers[13] <= 16'h0000;
		registers[14] <= 16'h0000;
		registers[15] <= 16'h0000;
	 end 
	 
	 	 // Main always block:
	 always @(posedge Clock, negedge Reset)
	 begin
		// If we are resetting set all reg to zero
		if (~Reset)
		begin
		registers[0] <= 16'h0000;
		registers[1] <= 16'h0000;
		registers[2] <= 16'h0000;
		registers[3] <= 16'h0000;
		registers[4] <= 16'h0000;
		registers[5] <= 16'h0000;
		registers[6] <= 16'h0000;
		registers[7] <= 16'h0000;
		registers[8] <= 16'h0000;
		registers[9] <= 16'h0000;
		registers[10] <= 16'h0000;
		registers[11] <= 16'h0000;
		registers[12] <= 16'h0000;
		registers[13] <= 16'h0000;
		registers[14] <= 16'h0000;
		registers[15] <= 16'h0000;
		end
		
		// Otherwise set outputs and reg
		else
		begin
			// If write is enabled store input value in file:
			if (WriteEnable)
				registers[SelectInput] <= In;
			A <= registers[SelectA];
			B <= registers[SelectB];
		end
	end
endmodule
