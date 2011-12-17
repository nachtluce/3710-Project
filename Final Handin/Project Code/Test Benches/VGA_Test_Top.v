`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:35 10/22/2011 
// Design Name: 
// Module Name:    VGA_Test_Top 
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
module VGA_Test_Top(
    input CLK,
    input clr,
    output hSync,
    output vSync,
    input  sw1,
	 input  sw2,
	 input  sw3,
	 input  bright,
	 input  en,
	 output Red,
    output Blue,
    output Green
    );
	 wire[9:0] hCount, vCount;
	 	VGA_Test3 uut (
		.clk50MHz(CLK), 
		.clr(clr), 
		.en(en), 
		.hSync(hSync), 
		.vSync(vSync), 
		.bright(bright), 
		.hCount(hCount), 
		.vCount(vCount)
	);
	 
	 // VGA_Test3 VGACNTL(CLK, clr, 0, hSync, vSync, 1, hcount, vCount);
    assign Red = sw1;
	 assign Blue = sw2;
	 assign Green = sw3;

endmodule
