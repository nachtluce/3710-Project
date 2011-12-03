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
    input [8:0] picNum,
    input [4:0] xSubCount,
    input [4:0] ySubCount,
    input clk,
	 input act,
    output reg R,
    output reg B,
    output reg G
    );
	//memory
	
//ok this starts are the picNum we have 16 columns per superpixel
// and those 16 columns are within 6 addresses
//we start at 0x00 for our picture values
//pic1 is 0x00 to 0x5F
//pic2 is 0x60 to 0xBF
//pic3 is 0xC0 to 0x11F
//pic4 is 0x120 to 0x17F
//...
	reg[3:0] xWord;
	reg[10:0] yWord;
	wire [8:0] MemData;
	reg [11:0] fetchAddress;//this is the location to fetch in vga memory

	VGA_memory mem(~clk, 1'b0, fetchAddress, 9'b0_0000_0000, MemData);
	//on the posEdge of the clock what ever is on the fetch address, the memory on that location the memory will return on MemData or the value
	//of memData will be valid at the same clock
	
	
	

//always @(*)
//begin
//	if(xSubCount < 5 || xSubCount == 31)//first 6 pixels
//		 xWord = 0;
//	else if(xSubCount > 4 && xSubCount < 11)//6 to 12
//		 xWord = 1;
//	else if(xSubCount > 10 && xSubCount < 17)//12 to 18
//		 xWord = 2;
//	else if(xSubCount > 16 && xSubCount < 23)//18 to 24
//		 xWord = 3;//this section might still be off
//	else if(xSubCount > 22 && xSubCount < 29)//24 to 30
//		 xWord = 4;
//	else if(xSubCount > 28  && xSubCount < 31)//30 to 32
//		 xWord = 5;
//end
always @(*)
begin
	if(xSubCount < 6 || xSubCount == 31)//first 6 pixels
		 xWord = 0;
	else if(xSubCount > 5 && xSubCount < 12)//6 to 12
		 xWord = 1;
	else if(xSubCount > 11 && xSubCount < 18)//12 to 18
		 xWord = 2;
	else if(xSubCount > 12 && xSubCount < 24)//18 to 24
		 xWord = 3;//this section might still be off
	else if(xSubCount > 23 && xSubCount < 30)//24 to 30
		 xWord = 4;
	else if(xSubCount > 29  && xSubCount < 32)//30 to 32
		 xWord = 5;
end


//always @(*)
//	begin
//			if(ySubCount < 2)//row 0 of 16
//				 fetchAddress = xWord + (95 * picNum);
//			 else if(ySubCount > 1 && ySubCount < 4) //row 1
//				 fetchAddress = xWord + 6+ (95 * picNum);//
//			 else if(ySubCount > 3 && ySubCount < 6) //row 2
//				 fetchAddress = xWord + 12+ (95 * picNum);//
//			 else if(ySubCount > 5 && ySubCount < 8) //row 3
//				 fetchAddress = xWord + 18+ (95 * picNum);//
//			 else if(ySubCount > 7 && ySubCount < 10) //row 4
//				 fetchAddress = xWord + 24+ (95 * picNum);//
//			 else if(ySubCount > 9 && ySubCount < 12) //row 5
//				 fetchAddress = xWord + 30+ (95 * picNum);//
//			 else if(ySubCount > 11 && ySubCount < 14) //row 6
//				 fetchAddress = xWord + 36+ (95 * picNum);//
//			 else if(ySubCount > 13 && ySubCount < 16) //row 7
//				 fetchAddress = xWord + 42+ (95 * picNum);//
//			 else if(ySubCount > 15 && ySubCount < 18) //row 8
//				 fetchAddress = xWord + 48+ (95 * picNum);//
//			 else if(ySubCount > 17 && ySubCount < 20) //row 9
//				 fetchAddress = xWord + 54+ (95 * picNum);//
//			 else if(ySubCount > 19 && ySubCount < 22) //row 10
//				 fetchAddress = xWord + 60+ (95 * picNum);//
//			 else if(ySubCount > 21 && ySubCount < 24) //row 11
//				 fetchAddress = xWord + 66+ (95 * picNum);//
//			 else if(ySubCount > 23 && ySubCount < 26) //row 12
//				 fetchAddress = xWord + 72+ (95 * picNum);//
//			 else if(ySubCount > 25 && ySubCount < 28) //row 13
//				 fetchAddress = xWord + 78+ (95 * picNum);//
//			 else if(ySubCount > 27 && ySubCount < 30) //row 14
//				 fetchAddress = xWord + 84+ (95 * picNum);//
//			 else if(ySubCount > 29 && ySubCount < 32) //row 14
//				 fetchAddress = xWord + 90+ (95 * picNum);//
//			 else
//				 fetchAddress = 10'b0000_0000_00;
//			
//		 //end
////	
////		if(ySubCount < 2)
////			yWord = 0;
////		else if(ySubCount > 1 && ySubCount < 4)
////			yWord = 1;
////		else if(ySubCount > 3 && ySubCount < 6)
////			yWord = 2;
////		else if(ySubCount > 5 && ySubCount < 8)
////			yWord = 3;
////		else if(ySubCount > 7 && ySubCount < 10)
////			yWord = 4;
////		else if(ySubCount > 9 && ySubCount < 12)
////			yWord = 5;
////		else if(ySubCount > 11 && ySubCount < 14)
////			yWord = 6;
////		else if(ySubCount > 13 && ySubCount < 16)
////			yWord = 7;
////		else if(ySubCount > 15 && ySubCount < 18)
////			yWord = 8;
////		else if(ySubCount > 17 && ySubCount < 20)
////			yWord = 9;
////		else if(ySubCount > 19 && ySubCount < 22)
////			yWord = 10;
////		else if(ySubCount > 21 && ySubCount < 24)
////			yWord = 11;
////		else if(ySubCount > 23 && ySubCount < 26)
////			yWord = 12;
////		else if(ySubCount > 25 && ySubCount < 28)
////			yWord = 13;
////		else if(ySubCount > 27 && ySubCount < 30)
////			yWord = 14;
////		else if(ySubCount > 29 && ySubCount < 32)
////			yWord = 15;
////		else
////			yWord = 0;
//		
//	
//	end

//always @(*)
//begin												
//	fetchAddress = ((picNum * 95) +(yWord * 6)+(xWord ));
//end
//
always @(*)//this use to be posegde clk
begin
		//we need a multiplier to advance the image address based on 
		//fetchAddress = (picNum * 95) +(xWord + yWord);
		//example 0 * 95 = 0 + (0 +0); = 0
		//example 2  1 * 95 +
		 if(picNum == 0)//Dude Right
		 begin
		
			
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 0;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 6;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 12;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 18;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 24;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 30;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 36;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 42;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 48;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 54;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 60;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 66;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 72;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 78;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 84;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 90;//
			 else
				 fetchAddress = 10'b0000_0000_00;
			
		 end
		 else if(picNum == 1)//Dude Up
		 begin
		
			
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 96;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 102;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 108;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 114;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 120;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 126;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 132;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 138;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 144;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 150;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 156;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 162;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 168;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 174;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 180;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 15
				 fetchAddress = xWord + 186;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 2)//Dude Left
		 begin
		
			
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 192;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 198;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 204;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 210;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 216;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 222;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 228;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 234;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 240;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 246;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 252;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 258;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 264;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 270;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 276;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 282;//
			 else
				 fetchAddress = 10'b0000_0000_00;				
		 end
		 else if(picNum == 3)//Dude Down
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 288;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 294;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 300;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 306;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 312;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 318;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 324;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 330;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 336;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 342;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 348;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 354;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 360;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 366;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 372;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 378;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 4)//BRICK
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 384;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 390;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 396;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 402;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 408;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 414;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 420;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 426;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 432;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 438;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 444;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 450;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 456;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 462;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 468;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 474;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end

		 else if(picNum == 5)// Box
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 480;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 486;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 492;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 498;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 504;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 510;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 516;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 522;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 528;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 534;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 540;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 546;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 552;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 558;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 564;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 570;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 6)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 576;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 582;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 588;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 594;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 600;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 606;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 612;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 618;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 624;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 630;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 636;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 642;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 648;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 654;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 660;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 666;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 7)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 672;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 678;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 684;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 690;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 696;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 702;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 708;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 714;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 720;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 726;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 732;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 738;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 744;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 750;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 756;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 762;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 8)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 768;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 774;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 780;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 786;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 792;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 798;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 804;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 810;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 816;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 822;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 828;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 834;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 840;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 846;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 852;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 858;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 9)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 864;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 870;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 876;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 882;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 888;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 894;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 900;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 906;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 912;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 918;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 924;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 930;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 936;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 942;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 948;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 954;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 10)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 960;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 966;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 972;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 978;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 984;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 990;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 996;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1002;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1008;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1014;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1020;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1026;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1032;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1038;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1044;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1050;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 11)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1056;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1062;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1068;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1074;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1080;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1086;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1092;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1098;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1104;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1110;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1116;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1122;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1128;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1134;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1140;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1146;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 12)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1152;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1158;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1164;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1170;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1176;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1182;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1188;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1194;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1200;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1206;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1212;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1218;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1224;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1230;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1236;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1242;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 13)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1248;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1254;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1260;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1266;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1272;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1278;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1284;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1290;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1296;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1302;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1308;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1314;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1320;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1326;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1332;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1338;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 14)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1344;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1350;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1356;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1362;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1368;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1374;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1380;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1386;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1392;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1398;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1404;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1410;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1416;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1422;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1428;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1434;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 15)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1440;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1446;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1452;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1458;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1464;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1470;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1476;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1482;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1488;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1494;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1500;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1506;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1512;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1518;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1524;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1530;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 16)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1536;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1542;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1548;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1554;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1560;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1566;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1572;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1578;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1584;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1590;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1596;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1602;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1608;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1614;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1620;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1626;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 17)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1632;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1638;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1644;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1650;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1656;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1662;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1668;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1674;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1680;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1686;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1692;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1698;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1704;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1710;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1716;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1722;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 18)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1728;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1734;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1740;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1746;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1752;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1758;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1764;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1770;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1776;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1782;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1788;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1794;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1800;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1806;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1812;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1818;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else if(picNum == 19)
		 begin
			 if(ySubCount < 2)//row 0 of 16
				 fetchAddress = xWord + 1824;
			 else if(ySubCount > 1 && ySubCount < 4) //row 1
				 fetchAddress = xWord + 1830;//
			 else if(ySubCount > 3 && ySubCount < 6) //row 2
				 fetchAddress = xWord + 1836;//
			 else if(ySubCount > 5 && ySubCount < 8) //row 3
				 fetchAddress = xWord + 1842;//
			 else if(ySubCount > 7 && ySubCount < 10) //row 4
				 fetchAddress = xWord + 1848;//
			 else if(ySubCount > 9 && ySubCount < 12) //row 5
				 fetchAddress = xWord + 1854;//
			 else if(ySubCount > 11 && ySubCount < 14) //row 6
				 fetchAddress = xWord + 1860;//
			 else if(ySubCount > 13 && ySubCount < 16) //row 7
				 fetchAddress = xWord + 1866;//
			 else if(ySubCount > 15 && ySubCount < 18) //row 8
				 fetchAddress = xWord + 1872;//
			 else if(ySubCount > 17 && ySubCount < 20) //row 9
				 fetchAddress = xWord + 1878;//
			 else if(ySubCount > 19 && ySubCount < 22) //row 10
				 fetchAddress = xWord + 1884;//
			 else if(ySubCount > 21 && ySubCount < 24) //row 11
				 fetchAddress = xWord + 1890;//
			 else if(ySubCount > 23 && ySubCount < 26) //row 12
				 fetchAddress = xWord + 1896;//
			 else if(ySubCount > 25 && ySubCount < 28) //row 13
				 fetchAddress = xWord + 1902;//
			 else if(ySubCount > 27 && ySubCount < 30) //row 14
				 fetchAddress = xWord + 1908;//
			 else if(ySubCount > 29 && ySubCount < 32) //row 14
				 fetchAddress = xWord + 1914;//
			 else
				 fetchAddress = 10'b0000_0000_00;
		 end
		 else
				 fetchAddress = 10'b0000_0000_00;

		
end
//
//
//always @(posedge clk)
//begin
//		
//		//need to send the first pixel in advance
//		if(xSubCount < 2)
//		begin
//		//	{R,B,G} = 3'b100;//Set Red for all of the pixels
//			{R,B,G} = MemData[8:6];//set the RGB           pixel 1
////			R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//		end
//		else if(xSubCount < 4 && xSubCount > 1 && act)
//		begin
//		
////			{R,B,G} = 3'b100;//Set Red for all of the pixels
//			{R,B,G} = MemData[5:3];//set the RGB		pixel 2
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 6 && xSubCount > 3 && act)
//		begin
//
//	//		{R,B,G} = 3'b100;//Set Red for all of the pixels	
//	{R,B,G} = MemData[2:0];//set the RGB		pixel 3
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 8 && xSubCount > 5 && act)
//		begin
//
////			{R,B,G} = 3'b100;//Set Red for all of the pixels	
//	{R,B,G} = MemData[8:6];//set the RGB		pixel 4
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 10 && xSubCount > 7 && act)
//		begin
//
////			{R,B,G} = 3'b100;//Set Red for all of the pixels	
//	{R,B,G} = MemData[5:3];//set the RGB		pixel 5
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 12 && xSubCount > 9 && act)
//		begin
//
////			{R,B,G} = 3'b100;//Set Red for all of the pixels	
//	{R,B,G} = MemData[2:0];//set the RGB		pixel 6
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 14 && xSubCount > 11 && act)
//		begin
//			
//	//		{R,B,G} = 3'b100;//Set Red for all of the pixels
//			{R,B,G} = MemData[8:6];//set the RGB		pixel 7
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 16 && xSubCount > 13 && act)
//		begin
//
////			{R,B,G} = 3'b100;//Set Red for all of the pixels		
//		{R,B,G} = MemData[5:3];//set the RGB		pixel 8
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 18 && xSubCount > 15 && act)
//		begin
//	
//	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
//			{R,B,G} = MemData[2:0];//set the RGB		pixel 9
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 20 && xSubCount > 17 && act)
//		begin
//		
////			{R,B,G} = 3'b110;//Set Red for all of the pixels
//			{R,B,G} = MemData[8:6];//set the RGB		pixel 10
////R = MemData[8];
////			G = MemData[7];
////			B = MemData[6];
//
//		end
//		else if(xSubCount < 22 && xSubCount > 19 && act)
//		begin
//
////			{R,B,G} = 3'b110;//Set Red for all of the pixels
//			{R,B,G} = MemData[5:3];//set the RGB		pixel 11
//		end
//		else if(xSubCount < 24 && xSubCount > 21 && act)
//		begin
//		
//	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
//			{R,B,G} = MemData[2:0];//set the RGB		pixel 12
//		end
//		else if(xSubCount < 26 && xSubCount > 23 && act)
//		begin
//
////			{R,B,G} = 3'b110;//Set Red for all of the pixels		
//		{R,B,G} = MemData[8:6];//set the RGB		pixel 13
//		end
//		else if(xSubCount < 28 && xSubCount > 25 && act)
//		begin
//
////			{R,B,G} = 3'b110;//Set Red for all of the pixels	
//	{R,B,G} = MemData[5:3];//set the RGB		pixel 14
//		end
//		else if(xSubCount < 30 && xSubCount > 27 && act)
//		begin
//
////			{R,B,G} = 3'b110;//Set Red for all of the pixels	
//	{R,B,G} = MemData[2:0];//set the RGB		pixel 15
//		end
//		else if(xSubCount < 32 && xSubCount > 29 && act)
//		begin
//	
//	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
//			{R,B,G} = MemData[8:6];//set the RGB		pixel 16
//		end//000000000, we want the first 2 locations set
//		//100001010;0x10A
//		else
//			{R,B,G} = 0;
//		
//		
//end
//
//
//endmodule

always @(posedge clk)
begin
		
		//need to send the first pixel in advance
		if(xSubCount < 2 && act)
		begin
		//	{R,B,G} = 3'b100;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB           pixel 1
//			R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];
		end
		else if(xSubCount < 4 && xSubCount > 1 && act)
		begin
		
//			{R,B,G} = 3'b100;//Set Red for all of the pixels
			{R,B,G} = MemData[5:3];//set the RGB		pixel 2
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 6 && xSubCount > 3 && act)
		begin

	//		{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[2:0];//set the RGB		pixel 3
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 8 && xSubCount > 5 && act)
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[8:6];//set the RGB		pixel 4
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 10 && xSubCount > 7 && act)
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[5:3];//set the RGB		pixel 5
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 12 && xSubCount > 9 && act)
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[2:0];//set the RGB		pixel 6
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 14 && xSubCount > 11 && act)
		begin
			
	//		{R,B,G} = 3'b100;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB		pixel 7
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 16 && xSubCount > 13 && act)
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels		
		{R,B,G} = MemData[5:3];//set the RGB		pixel 8
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 18 && xSubCount > 15 && act)
		begin
	
	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[2:0];//set the RGB		pixel 9
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 20 && xSubCount > 17 && act)
		begin
		
//			{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB		pixel 10
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 22 && xSubCount > 19 && act)
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[5:3];//set the RGB		pixel 11
		end
		else if(xSubCount < 24 && xSubCount > 21 && act)
		begin
		
	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[2:0];//set the RGB		pixel 12
		end
		else if(xSubCount < 26 && xSubCount > 23 && act)
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels		
		{R,B,G} = MemData[8:6];//set the RGB		pixel 13
		end
		else if(xSubCount < 28 && xSubCount > 25 && act)
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels	
	{R,B,G} = MemData[5:3];//set the RGB		pixel 14
		end
		else if(xSubCount < 30 && xSubCount > 27 && act)
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels	
	{R,B,G} = MemData[2:0];//set the RGB		pixel 15
		end
		else if(xSubCount < 32 && xSubCount > 29 && act)
		begin
	
	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB		pixel 16
		end//000000000, we want the first 2 locations set
		//100001010;0x10A
		else
			{R,B,G} = 0;
		
		
end


endmodule
