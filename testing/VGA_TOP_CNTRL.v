`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:19 11/08/2011 
// Design Name: 
// Module Name:    VGA_TOP_CNTRL 
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
module VGA_TOP_CNTRL(
    input clk,
    input rst,
    output reg R,
    output reg G,
    output reg B,
    output reg hSync,
    output reg vSync
    );

wire hSync0;
wire vSync0;



wire pxlclk;
wire[9:0] col;// 10 bits for 640
wire[8:0] row;//is a value from 0 to 480 9 bits
wire col0;
wire row0;//this signal pulses at the start of the grid
wire act;
wire R0;
wire G0;
wire B0;

wire[4:0] xSupPix;
wire[3:0] ySupPix;
wire[4:0] xSubCount;
wire[4:0] ySubCount;
wire[8:0] PicNum;
wire[15:0] rowLength = 15;
wire[15:0] startAddress = 1;
wire[15:0] memData;
wire[15:0] fetchAddress;
//this will generate all the singals neccessary for the displaying anything
VGA_CTRL vgaSigGen( .Reset(rst),.HSync(hSync0), .VSync(vSync0), .Clk50(clk), .PClk(pxlclk), 
	 .Col(col), .Row(row), .Col0(col0), .Row0(row0), .Active(act) );
//convert it into 20x15 superpixels.
VGASuperPixConverter supPixConvert(col, row, xSupPix, ySupPix, xSubCount, ySubCount);
//send the command to access main memory the starting address should contain
vgaMemoryAccess AccessMainMem(/* clk,*/ rst, xSupPix, ySupPix, rowLength, startAddress, memData,fetchAddress, PicNum);


vgaBitGen bitGen(PicNum, xSubCount, ySubCount, clk, R0, G0,B0);


	blk_mem_gen_v6_1 MainMem(clk,0,fetchAddress,0, memData,clk,0,0,0);

always @(posedge clk) 
begin
    hSync <= ~hSync0;
    vSync <= ~vSync0;
	 R <= R0;
	 G <= G0;
	 B <= B0;
	 if(rst)
	 begin
		//assign pxlclk = 0;
		hSync <= 0;
		vSync <= 0;
		R <= 0;
		G <= 0;
		B <= 0;
		//act = 0;
	 end
	 
//    if( act ) begin
//	 	 if(reset)
//		begin
//		xPixCounter <= 0;
//		xSuperPixCounter <= 0;
//		yPixCounter <= 0;
//		ySuperPixCounter <= 0; 
//		
//		end
//
//	end
end
endmodule
