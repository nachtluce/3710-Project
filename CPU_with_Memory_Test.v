`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:54 11/03/2011 
// Design Name: 
// Module Name:    CPU_with_Memory_Test 
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
module CPU_with_Memory_Test(
    input Clock,
    input Reset,
	 input GamePadData,
	 input serialValid,
	 input [15:0] serialRead,
	 output [15:0] VGAS,
	 output [15:0] VGAR,
	 output SerialWrite,
	 output [15:0] SerialData,
	 output GPulse,
	 output GLatch
    );
	 
	 wire [15:0] mem_addr;
	 wire [15:0] data_out;
	 wire [15:0] data_in;
	 wire [7:0] GamePad;
	 
	 wire Memwrite;
	 
	 CPU c(Clock, Reset, data_out, serialValid, serialRead, GamePad, mem_addr, Memwrite, data_in,
				VGAS, VGAR, SerialWrite, SerialData);
	 blk_mem_gen_v6_1 mem(~Clock, Memwrite, mem_addr[13:0], data_in, data_out);
	 controller2 gameInput(Clock, Reset, GamePadData, GamePad, GPulse, GLatch);

endmodule
