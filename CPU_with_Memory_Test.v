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
//    input Reset,
	 input GamePadData,
	 input SerialRxD,
	 output SerialTxD,
	 output GPulse,
	 output GLatch,
	 output R,
	 output G,
	 output B,
	 output hSync,
	 output vSync,
	 output [7:0]debug
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
	 
	 reg c25Clk;
	 
	 assign debug = GamePad;
	 
	 initial begin
		c25Clk = 1'b0;
	 end
	
	 always@(negedge Clock)
	 begin
		c25Clk <= ~c25Clk;
	 end
	 
	 reg Reset = 1;
	 wire [15:0] SerialDataIn;
	 wire [15:0] SerialDataOut;
	 
	 // CPU
	 CPU c(c25Clk, Reset, data_out, SerialValid, SerialDataOut, GamePad, mem_addr, Memwrite, data_in,
				VGAS, VGAR, SerialSend, SerialRead, SerialDataIn);
	
    // Main Memory	
	 blk_mem_gen_v6_1 mem(~Clock, Memwrite, mem_addr[13:0], data_in, data_out, 
	                       Clock, 1'b0, VGAToMainMemAddress, 1'b0, MainMemToVGAData);
	 
	 // GamePad controller
	 Controller2 gameInput(c25Clk, /* ~Reset,*/ GamePadData, GamePad, GPulse, GLatch);
	 
	 // VGA Controller
	 VGA_TOP_CNTRL VGA(Clock, ~Reset, MainMemToVGAData, VGAS, VGAR, R, G, B, hSync, vSync, VGAToMainMemAddress);
	 
	 // Serial Controller
	 SerialController Serial(c25Clk, SerialSend, SerialRead, SerialDataIn, SerialRxD, SerialValid, SerialDataOut, SerialTxD);
endmodule
