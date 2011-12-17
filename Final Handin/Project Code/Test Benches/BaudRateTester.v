`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:30:25 11/29/2011
// Design Name:   BaudRateGen
// Module Name:   /home/nachtluce/Workspace/All/BaudRateTester.v
// Project Name:  All
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BaudRateGen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BaudRateTester;

	// Inputs
	reg Clock;

	// Outputs
	wire BaudTick;
	wire OverSampleTick;

	// Instantiate the Unit Under Test (UUT)
	BaudRateGen uut (
		.Clock(Clock), 
		.BaudTick(BaudTick), 
		.OversampleTick(OversampleTick)
	);
	
	integer i;	

	initial begin
		// Initialize Inputs
		Clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Clock = 1;

		// Add stimulus here
		for (i = 0; i < 1000; i = i + 1)
		begin
			Clock = ~Clock;
			#5;	
		end
	end
      
endmodule

