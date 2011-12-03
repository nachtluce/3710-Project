`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:01:50 11/29/2011
// Design Name:   SerialController
// Module Name:   /home/nachtluce/Workspace/All/SerialTester.v
// Project Name:  All
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SerialController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SerialTester;

	// Inputs
	reg Clock;
	reg Send;
	reg [15:0] DataIn;
	reg Receive;

	// Outputs
	wire Valid;
	wire [15:0] DataOut;
	wire Transmit;

	// Instantiate the Unit Under Test (UUT)
	SerialController uut (
		.Clock(Clock), 
		.Send(Send), 
		.DataIn(DataIn), 
		.Receive(Receive), 
		.Valid(Valid), 
		.DataOut(DataOut), 
		.Transmit(Transmit)
	);
	
	always
		begin
			Clock = ~Clock;
			Receive = Transmit;
			#5;
		end
		

	initial begin
		// Initialize Inputs
		Clock = 0;
		Send = 0;
		DataIn = 0;
		Receive = 0;

		// Wait 100 ns for global reset to finish
		#100;
		DataIn = 16'b0101010101010101;
		Send = 1;
		#10;
		Send = 0;
        
		// Add stimulus here

	end
      
endmodule

