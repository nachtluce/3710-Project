`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:41 09/19/2011
// Design Name:   RegFile2
// Module Name:   /home/nachtluce/Workspace//RegisterFileTest2.v
// Project Name:  All
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterFileTest2;

	// Inputs
	reg Clock;
	reg Reset;
	reg WriteEnable;
	reg [3:0] SelectInput;
	reg [3:0] SelectA;
	reg [3:0] SelectB;
	reg [15:0] In;

	// Outputs
	wire [15:0] A;
	wire [15:0] B;
	
		// Temps
	integer i;

	// Instantiate the Unit Under Test (UUT)
	RegFile2 uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.WriteEnable(WriteEnable), 
		.SelectInput(SelectInput), 
		.SelectA(SelectA), 
		.SelectB(SelectB), 
		.In(In), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		Clock = 0;
		Reset = 1;
		WriteEnable = 0;
		SelectInput = 0;
		SelectA = 0;
		SelectB = 0;
		In = 0;
		i = 0;

		// Wait 100 ns for global reset to finish
		#100; 	
		WriteEnable = 1;
		SelectInput = 0;
		#5; 
		SelectA = 1;
		SelectB = 1;
		Clock = 1;
		#5;
		SelectInput = 1;
		In = 1; 
		SelectA = 0;
		SelectB = 0;
		#5;
		Clock = 0;
		#5;
		Clock = 1;
		#5;
		Clock = 0;
		#5;
		Clock = 1;
		#5;
		WriteEnable = 1;
		Clock = 0;
		#5;
		Clock = 1;
		#5;
		
		
		for(i=0; i<14; i=i+1)
		begin
		Clock = 0; 
		WriteEnable = 1;
		SelectInput = i +2;
		SelectA = i;
		SelectB = i+1;
		#4;
		In = A + B;
		#1;
		Clock = 1;
		#5;
		end
		
        
		/* Add stimulus here
		for(i=0; i<1000; i=i+1)
		begin
			Clock = ~Clock;
			if(i==20)
			begin
				WriteEnable = 1;
				In = 37;
				SelectInput = 5;
			end	
			if(i==24)
			begin
				WriteEnable = 0;
				In = 42;
				SelectInput = 5;
			end
			if(i==24)
			begin
				SelectA = 5;
			end
			
			if(i==26)
				SelectA = 12;

			#5;
		end*/

	end
      
endmodule

