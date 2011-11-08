`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:10 11/01/2011 
// Design Name: 
// Module Name:    VGASuperPixConverter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module is to convert the col and row into a 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGASuperPixConverter(
    input [9:0] col,
    input [8:0] row,
    output reg [4:0] xSupPix,
    output reg [3:0]  ySupPix,
	 output reg [4:0] xSubCount,
	 output reg [4:0] ySubCount	 
    );
always @(*)
begin 

		assign xSupPix = 0;
		assign ySupPix = 0;
	if(col < 32)// && act)
	begin	
		assign xSupPix = 0;
		assign xSubCount = col;
	end
	else if( col >31 && col < 64)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 1;
		assign xSubCount = col - 32;
	end
	else if( col >63 && col < 96)//&& act)//pixels 32 - 63
	begin
		assign xSupPix = 2;
		assign xSubCount = col - 64;
	end
	else if( col >95 && col < 128)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 3;
		assign xSubCount = col - 96;
	end
	else if( col >127 && col < 160)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 4;
		assign xSubCount = col - 128;
	end
	else if( col >159 && col < 192)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 5;
		assign xSubCount = col - 160;
	end
	else if( col >191 && col < 224)// && act)//pixels 32 - 63
	begin	
		assign xSupPix = 6;
		assign xSubCount = col - 192;
	end
	else if( col >223 && col < 256)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 7;
		assign xSubCount = col - 224;
	end
	else if( col >255 && col < 288)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 8;
		assign xSubCount = col - 256;
	end
	else if( col > 287 && col < 320)// && act)//pixels 32 - 63   ERROR fixed
	begin
		assign xSupPix = 9;
		assign xSubCount = col - 288;
	end
	else if( col >319 && col < 352)// && act)//pixels 32 - 63   ERROR fixed
	begin
		assign xSupPix = 10;
		assign xSubCount = col - 320;
	end
	else if( col >351 && col < 384)// && act)//pixels 32 - 63   ERROR fixed
	begin
		assign xSupPix = 11;
		assign xSubCount = col - 352;
	end
	else if( col >383 && col < 416)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 12;
		assign xSubCount = col - 384;
	end
	else if( col >415 && col < 448)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 13;
		assign xSubCount = col - 416;
	end
	else if( col >447 && col < 480)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 14;
		assign xSubCount = col - 448;
	end
	else if( col >479 && col < 512)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 15;
		assign xSubCount = col - 480;
	end
	else if( col >511 && col < 544)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 16;
		assign xSubCount = col - 512;
	end
	else if( col >543 && col < 576)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 17;
		assign xSubCount = col - 544;
	end
	else if( col >575 && col < 608 )//&& act)//pixels 32 - 63
	begin
		assign xSupPix = 18;
		assign xSubCount = col - 576;
	end
	else if( col >607 && col < 640)// && act)//pixels 32 - 63
	begin
		assign xSupPix = 19;
		assign xSubCount = col - 608;
	end

	//handle ROWS
	if(row < 32)// && act)
	begin
		assign ySupPix = 0;//still in the first row of superpixels
		assign ySubCount = row;
	end
	else if( row > 31 && row < 64)// && act)// second row of super pixels
	begin
		assign ySupPix = 1;
		assign ySubCount = row - 32;
	end
	else if( row > 63 && row < 96)// && act)
	begin
		assign ySupPix = 2;
		assign ySubCount = row - 64;
	end
	else if( row > 95 && row < 128)// && act)
	begin
		assign ySupPix = 3;
		assign ySubCount = row - 96;
	end
	else if( row > 127 && row < 160)// && act)
	begin
		assign ySupPix = 4;
		assign ySubCount = row - 128;
	end
	else if( row > 159 && row < 192)// && act)
	begin
		assign ySupPix = 5;
		assign ySubCount = row - 160;
	end
	else if( row > 191 && row < 224)// && act)
	begin
		assign ySupPix = 6;
		assign ySubCount = row - 192;
	end
	else if( row > 223 && row < 256)// && act)
	begin
		assign ySupPix = 7;
		assign ySubCount = row - 224;
	end
	else if( row > 255 && row < 288)// && act)
	begin
		assign ySupPix = 8;
		assign ySubCount = row - 256;
	end
	else if( row > 287 && row < 320)// && act)
	begin
		assign ySupPix = 9;
		assign ySubCount = row - 288;
	end
	else if( row > 319 && row < 352)// && act)
	begin
		assign ySupPix = 10;
		assign ySubCount = row - 320;
	end
	else if( row > 351 && row < 384)// && act)
	begin
		assign ySupPix = 11;
		assign ySubCount = row - 352;
	end
	else if( row > 383 && row < 416)// && act)
	begin
		assign ySupPix = 12;
		assign ySubCount = row - 384;
	end
	else if( row > 415 && row < 448)// && act)
	begin
		assign ySupPix = 13;
		assign ySubCount = row - 416;
	end
	else if( row > 447 && row < 480)// && act)
	begin
		assign ySupPix = 14;
		assign ySubCount = row - 448;
	end
	 
end
endmodule
