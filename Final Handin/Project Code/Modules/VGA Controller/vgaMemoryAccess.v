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
    //input clk,
	 input reset,
	 //input act,
    input [4:0] xSupPix,
    input [3:0] ySupPix,
 	 input [15:0] rowLength,//needed to know where to start each row	 
	 input [15:0] startAddress,//top left corner from CPU
	 input [15:0] memData,//pic number from MEMORY
	 output reg [15:0] FetchAddress,//Address to fetch
    output reg [8:0] PicNum//output pic Number to Bit Gen
    );


//imageLibrary
//reg [15:0] fetchLoc;//fetchLoc = startAddress + supPix

always @(*)
begin
			FetchAddress = startAddress + xSupPix + (ySupPix * rowLength);

// set all outputs to 0
	if(reset)
		begin
		FetchAddress = 1;
		PicNum = 0;
		end
	else//fetch data and set the input from data as the rgb worl
		begin
		
			PicNum = memData[8:0];
		end
	
	//findout the location in memory we need to access
	//done
	//set up so memory accesses tho location and returns the value
	
	
	//put value in rgbwordLocation
end




endmodule
