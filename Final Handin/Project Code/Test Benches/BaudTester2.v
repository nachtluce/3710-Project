`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:46:28 11/29/2011
// Design Name:   BaudRateGen
// Module Name:   /home/nachtluce/Workspace/All/BaudTester2.v
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

module BaudTester2;

	// Inputs
	reg Clock;

	// Outputs
	wire BaudTick;
	wire OversampleTick;

	// Instantiate the Unit Under Test (UUT)
	BaudRateGen uut (
		.Clock(Clock), 
		.BaudTick(BaudTick), 
		.OversampleTick(OversampleTick)
	);
	
	always
	begin
		Clock = ~Clock;
		#5;
	end

	initial begin
		// Initialize Inputs
		Clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

