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
    output reg [3:0] ySupPix,
	 output reg [4:0] xSubCount,
	 output reg [4:0] ySubCount	 
    );
always @(*)
begin 

		xSupPix = 0;
		 ySupPix = 0;
	if(col < 32)// && act)
	begin	
		xSupPix = 0; 
		 xSubCount = col;
	end
	else if( col >31 && col < 64)// && act)//pixels 32 - 63
	begin
		 xSupPix = 1;
		 xSubCount = col - 32;
	end
	else if( col >63 && col < 96)//&& act)//pixels 32 - 63
	begin
		 xSupPix = 2;
		 xSubCount = col - 64;
	end
	else if( col >95 && col < 128)// && act)//pixels 32 - 63
	begin
		 xSupPix = 3;
		 xSubCount = col - 96;
	end
	else if( col >127 && col < 160)// && act)//pixels 32 - 63
	begin
		 xSupPix = 4;
		 xSubCount = col - 128;
	end
	else if( col >159 && col < 192)// && act)//pixels 32 - 63
	begin
		 xSupPix = 5;
		 xSubCount = col - 160;
	end
	else if( col >191 && col < 224)// && act)//pixels 32 - 63
	begin	
		 xSupPix = 6;
		 xSubCount = col - 192;
	end
	else if( col >223 && col < 256)// && act)//pixels 32 - 63
	begin
		 xSupPix = 7;
		 xSubCount = col - 224;
	end
	else if( col >255 && col < 288)// && act)//pixels 32 - 63
	begin
		 xSupPix = 8;
		 xSubCount = col - 256;
	end
	else if( col > 287 && col < 320)// && act)//pixels 32 - 63   ERROR fixed
	begin
		 xSupPix = 9;
		 xSubCount = col - 288;
	end
	else if( col >319 && col < 352)// && act)//pixels 32 - 63   ERROR fixed
	begin
		 xSupPix = 10;
		 xSubCount = col - 320;
	end
	else if( col >351 && col < 384)// && act)//pixels 32 - 63   ERROR fixed
	begin
		 xSupPix = 11;
		 xSubCount = col - 352;
	end
	else if( col >383 && col < 416)// && act)//pixels 32 - 63
	begin
		 xSupPix = 12;
		 xSubCount = col - 384;
	end
	else if( col >415 && col < 448)// && act)//pixels 32 - 63
	begin
		 xSupPix = 13;
		 xSubCount = col - 416;
	end
	else if( col >447 && col < 480)// && act)//pixels 32 - 63
	begin
		 xSupPix = 14;
		 xSubCount = col - 448;
	end
	else if( col >479 && col < 512)// && act)//pixels 32 - 63
	begin
		 xSupPix = 15;
		 xSubCount = col - 480;
	end
	else if( col >511 && col < 544)// && act)//pixels 32 - 63
	begin
		 xSupPix = 16;
		 xSubCount = col - 512;
	end
	else if( col >543 && col < 576)// && act)//pixels 32 - 63
	begin
		 xSupPix = 17;
		 xSubCount = col - 544;
	end
	else if( col >575 && col < 608 )//&& act)//pixels 32 - 63
	begin
		 xSupPix = 18;
		 xSubCount = col - 576;
	end
	else if( col >607 && col < 640)// && act)//pixels 32 - 63
	begin
		 xSupPix = 19;
		 xSubCount = col - 608;
	end
	else
	begin
		 xSupPix = 5'bxxxxx;
		 xSubCount = 5'bxxxxx;
	end

	//handle ROWS
	if(row < 32)// && act)
	begin
		 ySupPix = 0;//still in the first row of superpixels
		 ySubCount = row;
	end
	else if( row > 31 && row < 64)// && act)// second row of super pixels
	begin
		 ySupPix = 1;
		 ySubCount = row - 32;
	end
	else if( row > 63 && row < 96)// && act)
	begin
		 ySupPix = 2;
		 ySubCount = row - 64;
	end
	else if( row > 95 && row < 128)// && act)
	begin
		 ySupPix = 3;
		 ySubCount = row - 96;
	end
	else if( row > 127 && row < 160)// && act)
	begin
		 ySupPix = 4;
		 ySubCount = row - 128;
	end
	else if( row > 159 && row < 192)// && act)
	begin
		 ySupPix = 5;
		 ySubCount = row - 160;
	end
	else if( row > 191 && row < 224)// && act)
	begin
		 ySupPix = 6;
		 ySubCount = row - 192;
	end
	else if( row > 223 && row < 256)// && act)
	begin
		 ySupPix = 7;
		 ySubCount = row - 224;
	end
	else if( row > 255 && row < 288)// && act)
	begin
		 ySupPix = 8;
		 ySubCount = row - 256;
	end
	else if( row > 287 && row < 320)// && act)
	begin
		 ySupPix = 9;
		 ySubCount = row - 288;
	end
	else if( row > 319 && row < 352)// && act)
	begin
		 ySupPix = 10;
		 ySubCount = row - 320;
	end
	else if( row > 351 && row < 384)// && act)
	begin
		 ySupPix = 11;
		 ySubCount = row - 352;
	end
	else if( row > 383 && row < 416)// && act)
	begin
		 ySupPix = 12;
		 ySubCount = row - 384;
	end
	else if( row > 415 && row < 448)// && act)
	begin
		 ySupPix = 13;
		 ySubCount = row - 416;
	end
	else if( row > 447 && row < 480)// && act)
	begin
		 ySupPix = 14;
		 ySubCount = row - 448;
	end
	else
	begin
		 ySupPix = 5'bxxxxx;
		 ySubCount = 5'bxxxxx;
	end
	 
end
endmodule
