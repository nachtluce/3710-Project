`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:14 09/18/2011 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
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
	 
	 reg [15:0] r0; 
	 reg [15:0] r1;
	 reg [15:0] r2;
	 reg [15:0] r3;
	 reg [15:0] r4;
	 reg [15:0] r5;
	 reg [15:0] r6;
	 reg [15:0] r7;
	 reg [15:0] r8;
	 reg [15:0] r9;
	 reg [15:0] rA;
	 reg [15:0] rB;
	 reg [15:0] rC;
	 reg [15:0] rD;
	 reg [15:0] rE;
	 reg [15:0] rF;
	 
	 // Initialize registers to zero:
	 initial begin 
		r0 = 16'h0000;
		r1 = 16'h0000;
		r2 = 16'h0000;
		r3 = 16'h0000;
		r4 = 16'h0000;
		r5 = 16'h0000;
		r6 = 16'h0000;
		r7 = 16'h0000;
		r8 = 16'h0000;
		r9 = 16'h0000;
		rA = 16'h0000;
		rB = 16'h0000;
		rC = 16'h0000;
		rD = 16'h0000;
		rE = 16'h0000;
		rF = 16'h0000;
		A = 16'h0000;
		B = 16'h0000;
	 end 
	 
	 // Main always block:
	 always @(posedge Clock, negedge Reset)
	 begin
		// If we are resetting set all reg to zero
		if (~Reset)
		begin
			r0 <= 16'h0000;
			r1 <= 16'h0000;
			r2 <= 16'h0000;
			r3 <= 16'h0000;
			r4 <= 16'h0000;
			r5 <= 16'h0000;
			r6 <= 16'h0000;
			r7 <= 16'h0000;
			r8 <= 16'h0000;
			r9 <= 16'h0000;
			rA <= 16'h0000;
			rB <= 16'h0000;
			rC <= 16'h0000;
			rD <= 16'h0000;
			rE <= 16'h0000;
			rF <= 16'h0000;
			A <= 16'h0000;
			B <= 16'h0000;
		end
		
		// Otherwise set outputs and reg
		else
		begin
			// If write is enabled store input value in file:
			case (SelectInput)
				4'h0: r0 <= In;
				4'h1: r1 <= In;
				4'h2: r2 <= In;
				4'h3: r3 <= In;
				4'h4: r4 <= In;
				4'h5: r5 <= In;
				4'h6: r6 <= In;
				4'h7: r7 <= In;
				4'h8: r8 <= In;
				4'h9: r9 <= In;
				4'hA: rA <= In;
				4'hB: rB <= In;
				4'hC: rC <= In;
				4'hD: rD <= In;
				4'hE: rE <= In;
				4'hF: rF <= In;
			endcase
		end
	end
	
	always@(SelectA, SelectB)
	begin
		// Set the A output:
		case (SelectA) 
			4'h0: A = r0;
			4'h1: A = r1;
			4'h2: A = r2;
			4'h3: A = r3;
			4'h4: A = r4;
			4'h5: A = r5;
			4'h6: A = r6;
			4'h7: A = r7;
			4'h8: A = r8;
			4'h9: A = r9;
			4'hA: A = rA;
			4'hB: A = rB;
			4'hC: A = rC;
			4'hD: A = rD;
			4'hE: A = rE;
			4'hF: A = rF;
		endcase
			
		// Set the B output:
		case (SelectA) 
			4'h0: B = r0;
			4'h1: B = r1;
			4'h2: B = r2;
			4'h3: B = r3;
			4'h4: B = r4;
			4'h5: B = r5;
			4'h6: B = r6;
			4'h7: B = r7;
			4'h8: B = r8;
			4'h9: B = r9;
			4'hA: B = rA;
			4'hB: B = rB;
			4'hC: B = rC;
			4'hD: B = rD;
			4'hE: B = rE;
			4'hF: B = rF;
		endcase		
	 end
	 
	 
endmodule
