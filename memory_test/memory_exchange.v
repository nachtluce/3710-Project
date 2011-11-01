`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:41 11/01/2011 
// Design Name: 
// Module Name:    memory_exchange 
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
module memory_exchange(
    input clk,
//    input SF_CEO,
    output [11:8] SF_D,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    input [4:0] switches,
    input Read_Select,
    input write
    );

//	assign SF_CE0=1;	//disable flash (shares some pins with LCD)
//	reg [15 : 0] write_val = 1;
	wire [15 : 0] data_out_a;
	wire [15 : 0] data_out_b;
	//reg write = 0;
	
	wire [15 : 0] display;
	
	Mux2 T1(Read_Select, data_out_a, data_out_b, display);
	
	VGA_memory mem2(.clka(clk),
					.wea(write),
					.addra({10'b0000_0000  ,switches}),
					.douta(data_out_b),
					.dina(data_out_a)
				);
		
		
	blk_mem_gen_v6_1 mem1(.clka(clk),
						.wea(1'b0), 
						.addra({10'b0000_0000  ,switches}),
						.dina(16'H0000),
						.douta(data_out_a),
						.clkb(1'b0),
						.web(1'b0),
						.addrb(14'b00_0000_0000),
						.dinb(16'b0000_0000_0000_0000)
						);
	
	lcd_ctrl l(clk, 1'b0, display, SF_D, LCD_E, LCD_RS, LCD_RW);

endmodule
