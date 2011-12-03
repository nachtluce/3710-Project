`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:12:18 11/29/2011 
// Design Name: 
// Module Name:    BaudRateGen 
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
module BaudRateGen(
    input Clock,
    output reg BaudTick,
    output reg OversampleTick
    );
	reg [31:0] OversampleCounter;
	reg [31:0] BaudCounter;
	
	initial
	begin
		OversampleCounter = 0;
		BaudCounter = 0;
		BaudTick = 0;
		OversampleTick = 0;
	end
	
	always @(posedge Clock)
	begin
		if (OversampleCounter == 27)
			begin
				OversampleCounter = 0;
				OversampleTick = 1;
				if (BaudCounter == 7)
					begin
						BaudCounter = 0;
						BaudTick = 1;
					end
				else
					begin
						BaudCounter = BaudCounter + 1;
						BaudTick = 0;
					end
			end
		else
			begin
				OversampleCounter = OversampleCounter + 1;
				OversampleTick = 0;
				BaudTick = 0;
			end
	end
endmodule
