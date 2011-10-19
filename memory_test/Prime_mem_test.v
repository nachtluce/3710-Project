`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// This module is ment to test the memory controller.  The file prime.coe will
// initialize the memory to contain all 16 bit prime numbers.  This module will
// let the user read the memory elements saved to the ram.  Since writing to
// memory also needs to be tested a write button.  This deletes the currently selected
// element and write a value to that location in memory.
//
// Keep in mind that only a limited number of elements can be selected because
// only 4 switches will be used to select the memory element.  
//
// Programmer: Robert Christensen
//////////////////////////////////////////////////////////////////////////////////
module Prime_mem_test(
    input clk,
//    input SF_CEO,
    output [11:8] SF_D,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    input [3:0] switches,
	 input write
    );
	
//	assign SF_CE0=1;	//disable flash (shares some pins with LCD)
	reg [15 : 0] write_val = 1;
	wire [15 : 0] data_out;
	//reg write = 0;
	
	always @(posedge clk)
	begin
		write_val <= write_val + 1;
	end 
	
	blk_mem_gen_v6_1 mem(.clka(clk),
						.wea(write), 
						.addra({10'b0000_0000  ,switches}),
						.dina(write_val),
						.douta(data_out),
						.clkb(1'b0),
						.web(1'b0),
						.addrb(14'b00_0000_0000),
						.dinb(16'b0000_0000_0000_0000)
						);
	
	lcd_ctrl l(clk, 1'b0, data_out, SF_D, LCD_E, LCD_RS, LCD_RW);
endmodule

