`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:54 11/03/2011
// Design Name:   CPU_with_Memory_Test
// Module Name:   /home/nachtluce/Workspace/CPU_MEM_Tester.v
// Project Name:  All
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_with_Memory_Test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_MEM_Tester;

	// Inputs
	reg Clock;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	CPU_with_Memory_Test uut (
		.Clock(Clock), 
		.Reset(Reset)
	);
	
	integer i = 0;

	initial begin
		// Initialize Inputs
		Clock = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		Reset = 0;
		#5
		Reset = 1;
        
		// Add stimulus here
		for (i = 0; i < 100; i = i + 1)
		begin
			Clock = ~Clock;
			#5;	
		end
	end
      
endmodule

