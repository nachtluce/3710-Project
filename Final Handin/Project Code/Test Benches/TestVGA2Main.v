`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:32 10/25/2011 
// Design Name: 
// Module Name:    TestVGA2Main 
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
module TestVGA2Main(
    input sw0,
    input sw1,
    input sw2,
    input reset,
	 input clk,
    output reg R,
    output reg G,
    output reg B,
    output reg hSync,
    output reg vSync
    );

//VARIABLES

//vga


wire pxlclk;
wire[9:0] col;// 10 bits for 640
wire[8:0] row;//is a value from 0 to 480 9 bits
wire col0;
wire row0;
wire act;

wire hSync0;
wire vSync0;

reg [16:0] xPixCounter;//this is to count the inner pixels of the 
reg [5:0] yPixCounter;//32x32
reg [5:0] xSuperPixCounter;//count up to 20
reg [4:0] ySuperPixCounter;//count up to 15

/** I did comment the following i'm not sure if it is needed I'll test first before continuing.
//always @(posedge hSync)
//begin
//if(reset)
//begin 
//	xPixCounter <= 0;
//end
//else if(vSync)
//	xPixCounter <= 0;
//else
//xPixCounter <= xPixCounter +1; 
//
//end



VGA_CTRL vga( .Reset(reset), 
	 .HSync(hSync0), 
	 .VSync(vSync0), 
	 .Clk50(clk), 
	 .PClk(pxlclk), 
	 .Col(col), 
	 .Row(row), 
	 .Col0(col0), 
	 .Row0(row0), 
	 .Active(act) );
//a counter that goes up to 
//reg [11:0] readAddress;
//reg [8:0] memOutput;
//VGA_memory mem( clk, 0, readAddress, 0, memOutput);
wire [4:0] xSupPix;
wire [3:0] ySupPix;

VGASuperPixConverter superConverter(act, col, row,xSupPix, ySupPix);

/*
 * output HSync/VSync and RGB data
 */
always @(posedge clk) 
begin
    hSync <= hSync0;
    vSync <= vSync0;
	 
	 
    if( act ) begin
	 //active region
		R<= sw0;
		B<= sw1;
		G<= sw2;
		
	 //old code to test if the super pixels were working
//		if((xSuperPixCounter%2) == 1&&((ySuperPixCounter%2) == 1))
//		begin
//			//set the inter pixel values
//			
//			
//			R <= sw0;
//			B <= sw2;
//			G <= 1;
//		end
//		else if((ySuperPixCounter%2) == 0 && (xSuperPixCounter%2) == 0)
//		begin
//			R <= 0;
//			B <= 0;
//			G <= sw1;
//		end
//		else
//		begin//specific pattern to odd things
//			R <= 1;
//			B <= 1;
//			G <= 0;
//		end
			
	 end
	 else 
	 begin 
		B <= 0;
		G <= 0;
		R <= 0;
    end
	 
	 if(reset)
		begin
		xPixCounter <= 0;
		xSuperPixCounter <= 0;
		yPixCounter <= 0;
		ySuperPixCounter <= 0;
		
		end
	//handle COLUMNS
//	if(col < 32 && act)
//		xSuperPixCounter <= 0;
//	else if( col >31 && col < 64 && act)//pixels 32 - 63
//		xSuperPixCounter <= 1;
//	else if( col >63 && col < 96&& act)//pixels 32 - 63
//		xSuperPixCounter <= 2;
//	else if( col >95 && col < 128 && act)//pixels 32 - 63
//		xSuperPixCounter <= 3;
//	else if( col >127 && col < 160 && act)//pixels 32 - 63
//		xSuperPixCounter <= 4;
//	else if( col >159 && col < 192 && act)//pixels 32 - 63
//		xSuperPixCounter <= 5;
//	else if( col >191 && col < 224 && act)//pixels 32 - 63
//		xSuperPixCounter <= 6;
//	else if( col >223 && col < 256 && act)//pixels 32 - 63
//		xSuperPixCounter <= 7;
//	else if( col >255 && col < 288 && act)//pixels 32 - 63
//		xSuperPixCounter <= 8;
//	else if( col > 287 && col < 320 && act)//pixels 32 - 63   ERROR
//		xSuperPixCounter <= 9;
//	else if( col >319 && col < 352 && act)//pixels 32 - 63   ERROR
//		xSuperPixCounter <= 10;
//	else if( col >351 && col < 384 && act)//pixels 32 - 63   ERROR
//		xSuperPixCounter <= 11;
//	else if( col >383 && col < 416 && act)//pixels 32 - 63
//		xSuperPixCounter <= 12;
//	else if( col >415 && col < 448 && act)//pixels 32 - 63
//		xSuperPixCounter <= 13;
//	else if( col >447 && col < 480 && act)//pixels 32 - 63
//		xSuperPixCounter <= 14;
//	else if( col >479 && col < 512 && act)//pixels 32 - 63
//		xSuperPixCounter <= 15;
//	else if( col >511 && col < 544 && act)//pixels 32 - 63
//		xSuperPixCounter <= 16;
//	else if( col >543 && col < 576 && act)//pixels 32 - 63
//		xSuperPixCounter <= 17;
//	else if( col >575 && col < 608 && act)//pixels 32 - 63
//		xSuperPixCounter <= 18;
//	else if( col >607 && col < 640 && act)//pixels 32 - 63
//		xSuperPixCounter <= 19;
//
//	//handle ROWS
//	if(row < 32 && act)
//		ySuperPixCounter <= 0;//still in the first row of superpixels
//	else if( row > 31 && row < 64 && act)// second row of super pixels
//		ySuperPixCounter <= 1;
//	else if( row > 63 && row < 96 && act)
//		ySuperPixCounter <= 2;
//	else if( row > 95 && row < 128 && act)
//		ySuperPixCounter <= 3;
//	else if( row > 127 && row < 160 && act)
//		ySuperPixCounter <= 4;
//	else if( row > 159 && row < 192 && act)
//		ySuperPixCounter <= 5;
//	else if( row > 191 && row < 224 && act)
//		ySuperPixCounter <= 6;
//	else if( row > 223 && row < 256 && act)
//		ySuperPixCounter <= 7;
//	else if( row > 255 && row < 288 && act)
//		ySuperPixCounter <= 8;
//	else if( row > 287 && row < 320 && act)
//		ySuperPixCounter <= 9;
//	else if( row > 319 && row < 352 && act)
//		ySuperPixCounter <= 10;
//	else if( row > 351 && row < 384 && act)
//		ySuperPixCounter <= 11;
//	else if( row > 383 && row < 416 && act)
//		ySuperPixCounter <= 12;
//	else if( row > 415 && row < 448 && act)
//		ySuperPixCounter <= 13;
//	else if( row > 447 && row < 480 && act)
//		ySuperPixCounter <= 14;
	 
end

endmodule
//note for helpful thing during the creation of this document
	//calculations for intervals from 0 to 640 by 32
	/*			superPix value
*	32 		1
	64
	96
	128
	160
	192
	224
	256
	288
	320
	352
	384
	416
	448
	480
	512
	544
	576
	608
	640//The end 
*/	