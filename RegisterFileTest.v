`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:45:57 09/18/2011
// Design Name:   RegFile
// Module Name:   /home/nachtluce/Workspace/RegisterFileTest.v
// Project Name:  All
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterFileTest;

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
	RegFile uut (
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
        
		// Add stimulus here
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
		end

	end
      
endmodule

