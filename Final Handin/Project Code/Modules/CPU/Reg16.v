`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:00 11/03/2011 
// Design Name: 
// Module Name:    Reg16 
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
module Reg16(
    input Clock,
    input Reset,
    input Write,
    input [15:0] In,
    output reg [15:0] Out
    );
	 
	always @(posedge Clock, negedge Reset)
	begin
		if (~Reset)
			Out <= 0;
		else if (Write)
			Out <= In;
	end

endmodule
