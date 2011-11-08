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

//parameter rowMax = 1 ;//need to set rowmax so I can reset the 
//step one display a 9 bit value over and over and over and over
wire [8:0] r0c0 = 9'b111111111;//row0 cols 0-2
wire [8:0] r0c1 = 9'b111111111;//row0 cols 3-5
wire [8:0] r0c2 = 9'b111111111;//row0 cols 6-8
wire [8:0] r0c3 = 9'b111111111;//row0 cols 9-11
wire [8:0] r0c4 = 9'b111111111;//row0 cols 12-14
wire [8:0] r0c5 = 9'b111000000;//row0 cols 15  last 6 bits don't matter
//row1
wire [8:0] r1c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r1c1 = 9'b111111000;//row1 cols 3-5
wire [8:0] r1c2 = 9'b000000000;//row1 cols 6-8
wire [8:0] r1c3 = 9'b000111111;//row1 cols 9-11
wire [8:0] r1c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r1c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row 2
wire [8:0] r2c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r2c1 = 9'b111000000;//row1 cols 3-5
wire [8:0] r2c2 = 9'b000000000;//row1 cols 6-8
wire [8:0] r2c3 = 9'b000000111;//row1 cols 9-11
wire [8:0] r2c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r2c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row 3
wire [8:0] r3c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r3c1 = 9'b000000000;//row1 cols 3-5
wire [8:0] r3c2 = 9'b000000000;//row1 cols 6-8
wire [8:0] r3c3 = 9'b000000000;//row1 cols 9-11
wire [8:0] r3c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r3c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row4
wire [8:0] r4c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r4c1 = 9'b111001110;//row1 cols 3-5
wire [8:0] r4c2 = 9'b110110011;//row1 cols 6-8
wire [8:0] r4c3 = 9'b011011111;//row1 cols 9-11
wire [8:0] r4c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r4c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row5
wire [8:0] r5c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r5c1 = 9'b111110110;//row1 cols 3-5
wire [8:0] r5c2 = 9'b110110110;//row1 cols 6-8
wire [8:0] r5c3 = 9'b011011111;//row1 cols 9-11
wire [8:0] r5c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r5c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row6
wire [8:0] r6c0 = 9'b111111111;//row1 cols 0-2 0x1ff
wire [8:0] r6c1 = 9'b111111100;//row1 cols 3-5
wire [8:0] r6c2 = 9'b110110110;//row1 cols 6-8
wire [8:0] r6c3 = 9'b011111111;//row1 cols 9-11
wire [8:0] r6c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r6c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row7
wire [8:0] r7c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r7c1 = 9'b111111110;//row1 cols 3-5
wire [8:0] r7c2 = 9'b110110110;//row1 cols 6-8
wire [8:0] r7c3 = 9'b111111111;//row1 cols 9-11
wire [8:0] r7c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r7c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row8
wire [8:0] r8c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r8c1 = 9'b111111001;//row1 cols 3-5
wire [8:0] r8c2 = 9'b001001001;//row1 cols 6-8
wire [8:0] r8c3 = 9'b001001111;//row1 cols 9-11
wire [8:0] r8c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r8c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row9
wire [8:0] r9c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r9c1 = 9'b111001001;//row1 cols 3-5
wire [8:0] r9c2 = 9'b001001001;//row1 cols 6-8
wire [8:0] r9c3 = 9'b001001001;//row1 cols 9-11
wire [8:0] r9c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r9c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row10
wire [8:0] r10c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r10c1 = 9'b001001001;//row1 cols 3-5
wire [8:0] r10c2 = 9'b001001001;//row1 cols 6-8
wire [8:0] r10c3 = 9'b001001001;//row1 cols 9-11
wire [8:0] r10c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r10c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row11
wire [8:0] r11c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r11c1 = 9'b110110001;//row1 cols 3-5
wire [8:0] r11c2 = 9'b001001001;//row1 cols 6-8
wire [8:0] r11c3 = 9'b001110110;//row1 cols 9-11
wire [8:0] r11c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r11c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row12
wire [8:0] r12c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r12c1 = 9'b111111101;//row1 cols 3-5
wire [8:0] r12c2 = 9'b101101101;//row1 cols 6-8
wire [8:0] r12c3 = 9'b101111111;//row1 cols 9-11
wire [8:0] r12c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r12c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row13
wire [8:0] r13c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r13c1 = 9'b111111101;//row1 cols 3-5
wire [8:0] r13c2 = 9'b101101101;//row1 cols 6-8
wire [8:0] r13c3 = 9'b101111111;//row1 cols 9-11
wire [8:0] r13c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r13c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row14
wire [8:0] r14c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r14c1 = 9'b111111101;//row1 cols 3-5
wire [8:0] r14c2 = 9'b101111101;//row1 cols 6-8
wire [8:0] r14c3 = 9'b101111111;//row1 cols 9-11
wire [8:0] r14c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r14c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter
//row15
wire [8:0] r15c0 = 9'b111111111;//row1 cols 0-2
wire [8:0] r15c1 = 9'b111111000;//row1 cols 3-5
wire [8:0] r15c2 = 9'b000111000;//row1 cols 6-8
wire [8:0] r15c3 = 9'b000111111;//row1 cols 9-11
wire [8:0] r15c4 = 9'b111111111;//row1 cols 12-14
wire [8:0] r15c5 = 9'b111000000;//row1 cols 15  last 6 bits don't matter








//** I did comment the following i'm not sure if it is needed I'll test first before continuing.
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