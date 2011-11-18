`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:23 11/10/2011 
// Design Name: 
// Module Name:    testVGAOutput1 
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
module testVGAOutput1(
    input clk,
    input reset,
    input sw0,
    input sw1,
    input sw2,
    output reg R,
    output reg G,
    output reg B,
    output reg HSync,
    output reg VSync
    );

wire HSync0;
wire VSync0;				 
wire [9:0] Col;
wire [8:0] Row;
wire Col0;
wire Row0;
wire screen_active;
wire PixelClock;


wire[4:0] xSupPix;
wire[3:0] ySupPix;
wire[4:0] xSubCount;
wire[4:0] ySubCount;
wire R0;
wire G0;
wire B0;
reg[8:0] rgbWordLoc;// = 1;

VGA_CTRL vga( .Reset(reset), 
	 .HSync(HSync0), 
	 .VSync(VSync0), 
	 .Clk50(clk), 
	 .PClk(PixelClock), 
	 .Col(Col), 
	 .Row(Row), 
	 .Col0(Col0), 
	 .Row0(Row0), 
	 .Active(screen_active) );

VGASuperPixConverter supPixConvert(Col, Row, xSupPix, ySupPix, xSubCount, ySubCount);
vgaBitGen bitGen(rgbWordLoc, xSubCount, ySubCount, clk, R0, G0, B0);

always @(posedge clk)
begin
	rgbWordLoc = ySupPix;
	
		
		
		
end

/*
 * output HSync/VSync and RGB data
 */
always @(posedge clk) begin
    HSync <= HSync0;
    VSync <= VSync0;
    if( screen_active ) begin
		begin
			R <= R0;
			G <= G0;
			B <= B0;
		end
    end else begin 
	B <= 0;
	G <= 0;
	R <= 0;
    end
end


endmodule
