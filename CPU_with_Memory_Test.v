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
    input Reset
    );
	 
	 wire [15:0] mem_addr;
	 wire [15:0] data_out;
	 wire [15:0] data_in;
	 
	 wire Memwrite;
	 
	 CPU c(Clock, Reset, data_out, mem_addr, Memwrite, data_in);
	 blk_mem_gen_v6_1 mem(~Clock, Memwrite, mem_addr[13:0], data_in, data_out);


endmodule
