`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:20:47 11/08/2011
// Design Name:   VGA_TOP_CNTRL
// Module Name:   C:/Users/user/Documents/levi/School/Fall2011/CS3710/Workspace/3710-Project/testing/VGA_TOP_CNTRL_TestFixture.v
// Project Name:  testing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA_TOP_CNTRL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_TOP_CNTRL_TestFixture;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire R;
	wire G;
	wire B;
	wire hSync;
	wire vSync;

	// Instantiate the Unit Under Test (UUT)
	VGA_TOP_CNTRL uut (
		.clk(clk), 
		.rst(rst), 
		.R(R), 
		.G(G), 
		.B(B), 
		.hSync(hSync), 
		.vSync(vSync)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 1;
		#250;
		rst = 0;
		#10;
		
		// Add stimulus here

	end
      always
		begin
		#10;
		clk = ~ clk;
		end
endmodule

