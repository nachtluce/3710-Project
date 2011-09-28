`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:59 09/27/2011 
// Design Name: 
// Module Name:    LCD_Fib 
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
module LCD_Fib(
    input clk,
    input reset,
    output SF_CEO,
    output [11:8] SF_D,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    input [3:0] switches,
    input SetA,
    input SetB
    );
	
	assign SF_CE0=1;	//disable flash (shares some pins with LCD)

	wire [15:0] tempOut;
	

	Fibonacci( clk, reset, SetA, SetB, switches, tempOut);
	
	lcd_ctrl(clk, reset, tempOut, SF_D, LCD_E, LCD_RS, LCD_RW);
endmodule
