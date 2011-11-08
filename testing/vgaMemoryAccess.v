`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:56 11/01/2011 
// Design Name: 
// Module Name:    vgaMemoryAccess 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module is to take the current xSupPix, and ySupPix and compute the 
// memory location of it based on what we have and then output the value given from memory.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vgaMemoryAccess(
    input clk,
	 input reset,
	 //input act,
    input reg [4:0] xSupPix,
    input reg [3:0] ySupPix,
 	 input [15:0] rowLength,//needed to know where to start each row	 
	 input reg [15:0] startAddress,
	 output reg [15:0] memData,
    output [8:0] rgbwordLocation
    );

//this can be put into 3 steps
//first fetching the superpixel value which should be an address to the starting location of a
//super pixel image  
//notes::  this will have to be computed with a combination of arithmetic
//this will be a fetch the the start of memory.  the grid to display will be contained from
//address 0x0000 to 0x012B// in decimal 0 to 150  20 per row
//enacting with 3x3
// 0x09, 0x10, 0x11, 0x12,0x13,0x14
// 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A
// 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20
// 0x21, 0x22, 0x23, 0x24, 0x25, 0x26
//starting location = 0x16
//rowLength = 6
//xsupPix = 0, ysupPix = 0;
//            0x16 + 0 + (0 * 6)

//fetchLoc = startAddress + xSupPix + ySupPix*(rowLength);

//fetchlocation should be 0x16
//next example xsupPix = 1, and ysupPix = 1 which should be 0x1D
//fetchLoc = 0x16 + 1 + (1 * 0x6)=0x16 + 0x7 = 
//depending on the startAddress
//and rowLength we will compute what the location is we need to access memory
//00000
//00100
  //so add = start add + xsupPix + ySupPix

//imageLibrary
reg [15:0] fetchLoc;//fetchLoc = startAddress + supPix

always @(*)
begin
	assign fetchLoc = startAddress + xSupPix + (ySupPix * rowLength);
	if(reset)
		begin
		rgbwordLocation = 0;
		startAddress = 0;
		end
	
	//findout the location in memory we need to access
	//done
	//set up so memory accesses tho location and returns the value
	
	
	//put value in rgbwordLocation
end




endmodule
