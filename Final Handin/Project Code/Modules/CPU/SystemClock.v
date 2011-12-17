`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:39 11/22/2011 
// Design Name: 
// Module Name:    SystemClock 
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
module SystemClock(
    input Clock,
    input Reset,
    output reg [15:0] Time
    );
	
	reg [15:0] count;
	
	initial begin
		count = 0;
		Time  = 0;
	end

	always @(posedge Clock, negedge Reset)
	begin
		if (~Reset)
			begin
				Time <= 0;
				count <= 0;
			end
		else
			begin
				if (count > 16'h61a8)
					begin
						Time <= Time + 16'h0001;
						count <= 16'h0000;
					end
				else
					count <= count + 16'h0001;
			end
	end

endmodule
