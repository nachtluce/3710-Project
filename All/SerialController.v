`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:19 11/29/2011 
// Design Name: 
// Module Name:    SerialController 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SerialController(
    input Clock,
    input Send,
	 input Read,
    input [15:0] DataIn,
	 input Receive,
    output reg Valid,
    output reg [15:0] DataOut,
	 output Transmit
    );
	 
	 
	reg [15:0] inputBuffer [31:0];
	reg [15:0] outputBuffer [31:0];
	reg [4:0] inputStart;
	reg [4:0] inputEnd;
	reg [4:0] outputStart;
	reg [4:0] outputEnd;
	wire [15:0] rDataOut;
	reg [15:0] rDataIn;
	reg rSend;
	reg readAlready;
	
	BaudRateGen baud(Clock, BaudTick, OverSampleTick);
	SerialTransmit transmit(Clock, BaudTick, rDataIn, rSend, Transmit, busy); 
	SerialReceive receive(OverSampleTick, Receive, rValid, rDataOut);
	 
	initial
	begin
		inputStart <= 0;
		inputEnd <= 0;
		outputStart <= 0;
		outputEnd <= 0;
		Valid <= 0;
		readAlready <= 0;
	end
	 
   always@(posedge Clock)
	begin
		DataOut <= outputBuffer[outputStart];
		rDataIn <= inputBuffer[inputStart];
		Valid <= outputStart != outputEnd;
		
		// If send is asserted add data input to buffer:
		if (Send)
			begin
				inputEnd <= inputEnd + 1;
				inputBuffer[inputEnd] <= DataIn;
			end
			
		// If receive is asserted adjust output buffer pointer
		if (Read)
			begin
				if (Valid && outputStart != outputEnd)
					begin
						outputStart <= outputStart + 1;
					end
			end
		
		// Checking if there is new data to push on the buffer
		if (rValid && ~readAlready)
			begin
				outputBuffer[outputEnd] <= rDataOut;
				readAlready <= 1;
				outputEnd <= outputEnd + 1;
			end
			
		// If there isn't a valid read showing shut off read flag	
		if (~rValid)
			readAlready <= 0;
		
		// Checking if there is data to send and sending:
		if (inputStart != inputEnd)
			begin
				if (~busy)
					begin
						rDataIn <= inputBuffer[inputStart];
						inputStart <= inputStart + 1;
						rSend <= 1;
					end
			end
		else
			rSend <= 0;
	end


endmodule
