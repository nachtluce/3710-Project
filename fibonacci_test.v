`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:15:56 09/27/2011
// Design Name:   Fibonacci
// Module Name:   /home/nachtluce/Workspace//fibonacci_test.v
// Project Name:  All
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fibonacci
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fibonacci_test;

	// Inputs
	reg Clock;
	reg Reset;
	reg SetA;
	reg SetB;
	reg [3:0] Switches;

	// Outputs
	wire [15:0] Output;

	// Instantiate the Unit Under Test (UUT)
	Fibonacci uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.SetA(SetA), 
		.SetB(SetB), 
		.Switches(Switches), 
		.Output(Output)
	);
	
	integer i;

	initial begin
		// Initialize Inputs
		Clock = 0;
		Reset = 1;
		SetA = 1;
		SetB = 1;
		Switches = 1;

		// Wait 100 ns for global reset to finish
		#100;
      for (i = 0; i < 200; i = i + 1)  
		begin 
			Clock = ~Clock;
			if(i==1)
				Reset = 0;
			if(i==2)
				Reset = 1;
			if(i==15)
				SetA=0;
			if(i==17)
				SetA=1;
			if(i==18)
				SetB=0;
			if(i==20)
				SetB=1;
			#5;
		end

	end
      
endmodule

