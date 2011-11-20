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
	 output SerialWrite,
	 output [15:0] SerialData,
	 output GPulse,
	 output GLatch,
	 output R,
	 output G,
	 output B,
	 output hSync,
	 output vSync
//	 output [15:0] fetchAddress
    );
	 
	 wire [15:0] mem_addr;
	 wire [15:0] data_out;
	 wire [15:0] data_in;
	 wire [7:0] GamePad;
	 wire Memwrite;
	 wire [15:0] MainMemToVGAData;
	 wire [15:0] VGAToMainMemAddress;
	 wire [15:0] VGAS;
	 wire [15:0] VGAR;
	 
	 // CPU
	 CPU c(Clock, Reset, data_out, serialValid, serialRead, GamePad, mem_addr, Memwrite, data_in,
				VGAS, VGAR, SerialWrite, SerialData);
	
    // Main Memory	
	 blk_mem_gen_v6_1 mem(~Clock, Memwrite, mem_addr[13:0], data_in, data_out, 
	                       Clock, 1'b0, VGAToMainMemAddress, 1'b0, MainMemToVGAData);
	 
	 // GamePad controller
	 Controller2 gameInput(Clock, Reset, GamePadData, GamePad, GPulse, GLatch);
	 
	 // VGA Controller
	 VGA_TOP_CNTRL VGA(Clock, ~Reset, MainMemToVGAData, VGAS, VGAR, R, G, B, hSync, vSync, VGAToMainMemAddress);
endmodule
