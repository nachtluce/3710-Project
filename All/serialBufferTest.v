`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:51:35 12/01/2011
// Design Name:   SerialController
// Module Name:   /home/nachtluce/Workspace/All/serialBufferTest.v
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

module serialBufferTest;

	// Inputs
	reg Clock;
	reg Send;
	reg [15:0] DataIn;
	reg Receive;
	reg Read;

	// Outputs
	wire Valid;
	wire [15:0] DataOut;
	wire Transmit;

	// Instantiate the Unit Under Test (UUT)
	SerialController uut (
		.Clock(Clock), 
		.Send(Send), 
		.Read(Read),
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
		Read = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
      
		DataIn = 685;
		#5
		Send = 1;
		#8;
		DataIn = 3;
		Send = 0;
		#20;
		DataIn = 345;
		#5;
		Send = 1;
		#8 ;
		Send = 0;
		#15000;
		Read = 1;
		#28;
		Read = 0;
		#14800;
		Read = 1;
		#8;
		Read = 0;
		
		// Add stimulus here

	end
      
endmodule

