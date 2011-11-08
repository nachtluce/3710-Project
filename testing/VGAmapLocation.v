`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:00 11/03/2011 
// Design Name: 
// Module Name:    VGAmapLocation 
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
module VGAmapLocation(
    input [15:0] LevelAddress,
    input [15:0] RowLength,
    input [15:0] Xoffset,
    input [15:0] Yoffset,
    output [15:0] DisplayStartLocation
    );


assign DisplayStartLocation = LevelAddress + Xoffset + (Yoffset * RowLength);//compute start address

endmodule
