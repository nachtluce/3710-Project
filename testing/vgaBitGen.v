`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:00 11/05/2011 
// Design Name: 
// Module Name:    vgaBitGen 
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
module vgaBitGen(
    input [9:0] picNum,
    input [4:0] xSubCount,
    input [4:0] ySubCount,
    input act,
    input clk,
    output R,
    output G,
    output B
    );
	//memory
	
	parameter rowlength = 6;
//ok this starts are the picNum we have 16 columns per superpixel
// and those 16 columns are within 6 addresses

//we start at 0x00 for our picture values
//pic1 is 0x00 to 0x5F
//pic2 is 0x60 to 0xBF
//pic3 is 0xC0 to 0x11F
//pic4 is 0x120 to 0x17F
//...
	reg[3:0] xWord;
	reg [8:0] MemData;
	
	VGA_memory mem(clk,0,fetchAddress,0,MemData);
	//on the posEdge of the clock what ever is on the fetch address, the memory on that location the memory will return on MemData or the value
	//of memData will be valid at the same clock
	
	
	
reg [11:0] fetchAddress;//this is the location to fetch in vga memory
always @(posedge clk)
begin
		
		if(picNum == 0)
		begin
			//             picStartingAddress
			fetchAddress = 0x00 + xSubCount+(ySubCount * 6);//six words per row  ******************************CHANGE to SHIFT MULTIPLICATION*********
		end
		if(picNum == 1)
		begin
			fetchAddress = 0x60 + xSubCount+(ySubCount * 6);
		end
		
end


endmodule
