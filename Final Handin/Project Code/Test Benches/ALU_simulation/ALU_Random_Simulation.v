`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:00:52 09/22/2011
// Design Name:   ALUmod
// Module Name:   C:/Users/robertc/Documents/school/CS3710/ALUSimulation/ALU_Random_Simulation.v
// Project Name:  ALUSimulation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUmod
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Random_Simulation;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] opcode;
	reg [3:0] opext;
	reg carry;

	// Outputs
	wire [15:0] S1;
	wire [4:0] CLFZN1;
	
	wire [15:0] S2;
	wire [4:0] CLFZN2;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	ALUmod uut (
		.A(A), 
		.B(B), 
		.opcode(opcode), 
		.S(S1), 
		.opext(opext), 
		.CLFZN(CLFZN1), 
		.carry(carry)
	);
	
	ALUmodSynth uut2 (
	    .A(A),
		 .B(B),
		 .opcode(opcode),
		 .S(S2),
		 .opext(opext),
		 .CLFZN(CLFZN2),
		 .carry(carry)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		opcode = 0;
		opext = 0;
		carry = 0;
		
		i = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		for(i = 0; i < 1_000_000; i = i + 1)
		begin
			A = $random;
			B = $random;
			opcode = $random;
			opext = $random;
			carry = $random;
		
			#10;
			if(CLFZN1 != CLFZN2 || S1 != S2)
			begin
			$display("Not equal when: Opcode=%b%b A=%b,B=%B,Time", opcode, opext, A,B,$time);
			$display("               Original S=%b  CLFZN=%b  Sythisized S=%b CLFZN=%b",S1, CLFZN1, S2, CLFZN2);
			end
			
		end
		  
		// Add stimulus here

	end
      
endmodule

