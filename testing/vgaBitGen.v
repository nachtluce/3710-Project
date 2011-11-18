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
	wire [8:0] MemData;
	reg [11:0] fetchAddress;//this is the location to fetch in vga memory

	VGA_memory mem(clk,0,fetchAddress,0,MemData);
	//on the posEdge of the clock what ever is on the fetch address, the memory on that location the memory will return on MemData or the value
	//of memData will be valid at the same clock
	
	
	

always @(*)
begin
	if(xSubCount < 6 || xSubCount == 35)
		 xWord = 0;
	else if(xSubCount > 5 && xSubCount < 11)
		 xWord = 1;
	else if(xSubCount > 10 && xSubCount < 18)
		 xWord = 2;
	else if(xSubCount > 17 && xSubCount < 23)
		 xWord = 3;//this section might still be off
	else if(xSubCount > 22 && xSubCount < 29)
		 xWord = 4;
	else if(xSubCount > 28  && xSubCount < 35)
		 xWord = 5;
end

always @(*)//this use to be posegde clk
begin
		
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
		else if(picNum == 4)
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

		else if(picNum == 5)
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
				fetchAddress = xWord + 560;//
			else
				fetchAddress = 10'b0000_0000_00;
		end
		else if(picNum == 6)
		begin
			if(ySubCount < 2)//row 0 of 16
				fetchAddress = xWord + 566;
			else if(ySubCount > 1 && ySubCount < 4) //row 1
				fetchAddress = xWord + 572;//
			else if(ySubCount > 3 && ySubCount < 6) //row 2
				fetchAddress = xWord + 578;//
			else if(ySubCount > 5 && ySubCount < 8) //row 3
				fetchAddress = xWord + 584;//
			else if(ySubCount > 7 && ySubCount < 10) //row 4
				fetchAddress = xWord + 590;//
			else if(ySubCount > 9 && ySubCount < 12) //row 5
				fetchAddress = xWord + 596;//
			else if(ySubCount > 11 && ySubCount < 14) //row 6
				fetchAddress = xWord + 602;//
			else if(ySubCount > 13 && ySubCount < 16) //row 7
				fetchAddress = xWord + 608;//
			else if(ySubCount > 15 && ySubCount < 18) //row 8
				fetchAddress = xWord + 614;//
			else if(ySubCount > 17 && ySubCount < 20) //row 9
				fetchAddress = xWord + 620;//
			else if(ySubCount > 19 && ySubCount < 22) //row 10
				fetchAddress = xWord + 626;//
			else if(ySubCount > 21 && ySubCount < 24) //row 11
				fetchAddress = xWord + 632;//
			else if(ySubCount > 23 && ySubCount < 26) //row 12
				fetchAddress = xWord + 638;//
			else if(ySubCount > 25 && ySubCount < 28) //row 13
				fetchAddress = xWord + 644;//
			else if(ySubCount > 27 && ySubCount < 30) //row 14
				fetchAddress = xWord + 650;//
			else if(ySubCount > 29 && ySubCount < 32) //row 14
				fetchAddress = xWord + 656;//
			else
				fetchAddress = 10'b0000_0000_00;
		end
		else if(picNum == 7)
		begin
			if(ySubCount < 2)//row 0 of 16
				fetchAddress = xWord + 662;
			else if(ySubCount > 1 && ySubCount < 4) //row 1
				fetchAddress = xWord + 668;//
			else if(ySubCount > 3 && ySubCount < 6) //row 2
				fetchAddress = xWord + 674;//
			else if(ySubCount > 5 && ySubCount < 8) //row 3
				fetchAddress = xWord + 680;//
			else if(ySubCount > 7 && ySubCount < 10) //row 4
				fetchAddress = xWord + 686;//
			else if(ySubCount > 9 && ySubCount < 12) //row 5
				fetchAddress = xWord + 692;//
			else if(ySubCount > 11 && ySubCount < 14) //row 6
				fetchAddress = xWord + 698;//
			else if(ySubCount > 13 && ySubCount < 16) //row 7
				fetchAddress = xWord + 704;//
			else if(ySubCount > 15 && ySubCount < 18) //row 8
				fetchAddress = xWord + 710;//
			else if(ySubCount > 17 && ySubCount < 20) //row 9
				fetchAddress = xWord + 716;//
			else if(ySubCount > 19 && ySubCount < 22) //row 10
				fetchAddress = xWord + 722;//
			else if(ySubCount > 21 && ySubCount < 24) //row 11
				fetchAddress = xWord + 728;//
			else if(ySubCount > 23 && ySubCount < 26) //row 12
				fetchAddress = xWord + 734;//
			else if(ySubCount > 25 && ySubCount < 28) //row 13
				fetchAddress = xWord + 740;//
			else if(ySubCount > 27 && ySubCount < 30) //row 14
				fetchAddress = xWord + 746;//
			else if(ySubCount > 29 && ySubCount < 32) //row 14
				fetchAddress = xWord + 752;//
			else
				fetchAddress = 10'b0000_0000_00;
		end
		else if(picNum == 8)
		begin
			if(ySubCount < 2)//row 0 of 16
				fetchAddress = xWord + 758;
			else if(ySubCount > 1 && ySubCount < 4) //row 1
				fetchAddress = xWord + 764;//
			else if(ySubCount > 3 && ySubCount < 6) //row 2
				fetchAddress = xWord + 770;//
			else if(ySubCount > 5 && ySubCount < 8) //row 3
				fetchAddress = xWord + 776;//
			else if(ySubCount > 7 && ySubCount < 10) //row 4
				fetchAddress = xWord + 782;//
			else if(ySubCount > 9 && ySubCount < 12) //row 5
				fetchAddress = xWord + 788;//
			else if(ySubCount > 11 && ySubCount < 14) //row 6
				fetchAddress = xWord + 794;//
			else if(ySubCount > 13 && ySubCount < 16) //row 7
				fetchAddress = xWord + 800;//
			else if(ySubCount > 15 && ySubCount < 18) //row 8
				fetchAddress = xWord + 806;//
			else if(ySubCount > 17 && ySubCount < 20) //row 9
				fetchAddress = xWord + 812;//
			else if(ySubCount > 19 && ySubCount < 22) //row 10
				fetchAddress = xWord + 818;//
			else if(ySubCount > 21 && ySubCount < 24) //row 11
				fetchAddress = xWord + 824;//
			else if(ySubCount > 23 && ySubCount < 26) //row 12
				fetchAddress = xWord + 830;//
			else if(ySubCount > 25 && ySubCount < 28) //row 13
				fetchAddress = xWord + 836;//
			else if(ySubCount > 27 && ySubCount < 30) //row 14
				fetchAddress = xWord + 842;//
			else if(ySubCount > 29 && ySubCount < 32) //row 14
				fetchAddress = xWord + 848;//
			else
				fetchAddress = 10'b0000_0000_00;
		end
		else if(picNum == 9)
		begin
			if(ySubCount < 2)//row 0 of 16
				fetchAddress = xWord + 854;
			else if(ySubCount > 1 && ySubCount < 4) //row 1
				fetchAddress = xWord + 860;//
			else if(ySubCount > 3 && ySubCount < 6) //row 2
				fetchAddress = xWord + 866;//
			else if(ySubCount > 5 && ySubCount < 8) //row 3
				fetchAddress = xWord + 872;//
			else if(ySubCount > 7 && ySubCount < 10) //row 4
				fetchAddress = xWord + 878;//
			else if(ySubCount > 9 && ySubCount < 12) //row 5
				fetchAddress = xWord + 884;//
			else if(ySubCount > 11 && ySubCount < 14) //row 6
				fetchAddress = xWord + 890;//
			else if(ySubCount > 13 && ySubCount < 16) //row 7
				fetchAddress = xWord + 896;//
			else if(ySubCount > 15 && ySubCount < 18) //row 8
				fetchAddress = xWord + 902;//
			else if(ySubCount > 17 && ySubCount < 20) //row 9
				fetchAddress = xWord + 908;//
			else if(ySubCount > 19 && ySubCount < 22) //row 10
				fetchAddress = xWord + 914;//
			else if(ySubCount > 21 && ySubCount < 24) //row 11
				fetchAddress = xWord + 920;//
			else if(ySubCount > 23 && ySubCount < 26) //row 12
				fetchAddress = xWord + 926;//
			else if(ySubCount > 25 && ySubCount < 28) //row 13
				fetchAddress = xWord + 932;//
			else if(ySubCount > 27 && ySubCount < 30) //row 14
				fetchAddress = xWord + 938;//
			else if(ySubCount > 29 && ySubCount < 32) //row 14
				fetchAddress = xWord + 944;//
			else
				fetchAddress = 10'b0000_0000_00;
		end
		else
				fetchAddress = 10'b0000_0000_00;

		
end


always @(posedge clk)
begin
		
		//need to send the first pixel in advance
		if(xSubCount < 2)
		begin
		//	{R,B,G} = 3'b100;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB           pixel 1
//			R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];
		end
		else if(xSubCount < 4 && xSubCount > 1 )
		begin
		
//			{R,B,G} = 3'b100;//Set Red for all of the pixels
			{R,B,G} = MemData[5:3];//set the RGB		pixel 2
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 6 && xSubCount > 3 )
		begin

	//		{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[2:0];//set the RGB		pixel 3
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 8 && xSubCount > 5 )
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[8:6];//set the RGB		pixel 4
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 10 && xSubCount > 7 )
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[5:3];//set the RGB		pixel 5
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 12 && xSubCount > 9 )
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels	
	{R,B,G} = MemData[2:0];//set the RGB		pixel 6
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 14 && xSubCount > 11 )
		begin
			
	//		{R,B,G} = 3'b100;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB		pixel 7
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 16 && xSubCount > 13 )
		begin

//			{R,B,G} = 3'b100;//Set Red for all of the pixels		
		{R,B,G} = MemData[5:3];//set the RGB		pixel 8
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 18 && xSubCount > 15 )
		begin
	
	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[2:0];//set the RGB		pixel 9
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 20 && xSubCount > 17 )
		begin
		
//			{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB		pixel 10
//R = MemData[8];
//			G = MemData[7];
//			B = MemData[6];

		end
		else if(xSubCount < 22 && xSubCount > 19 )
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[5:3];//set the RGB		pixel 11
		end
		else if(xSubCount < 24 && xSubCount > 21 )
		begin
		
	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[2:0];//set the RGB		pixel 12
		end
		else if(xSubCount < 26 && xSubCount > 23 )
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels		
		{R,B,G} = MemData[8:6];//set the RGB		pixel 13
		end
		else if(xSubCount < 28 && xSubCount > 25 )
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels	
	{R,B,G} = MemData[5:3];//set the RGB		pixel 14
		end
		else if(xSubCount < 30 && xSubCount > 27 )
		begin

//			{R,B,G} = 3'b110;//Set Red for all of the pixels	
	{R,B,G} = MemData[2:0];//set the RGB		pixel 15
		end
		else if(xSubCount < 32 && xSubCount > 29 )
		begin
	
	//		{R,B,G} = 3'b110;//Set Red for all of the pixels
			{R,B,G} = MemData[8:6];//set the RGB		pixel 16
		end//000000000, we want the first 2 locations set
		//100001010;0x10A
		else
			{R,B,G} = 0;
		
		
end


endmodule
