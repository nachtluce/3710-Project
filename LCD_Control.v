module S3Etest(CLK_50MHZ, ROT_CENTER, SF_CE0, SF_D, LCD_E, LCD_RS, LCD_RW);
	input CLK_50MHZ;
	input ROT_CENTER;
	output SF_CE0;
	output [11:8] SF_D;
	output LCD_E;
	output LCD_RS;
	output LCD_RW;

	assign SF_CE0=1;	//disable flash (shares some pins with LCD)

	wire clk=CLK_50MHZ;
	wire reset=ROT_CENTER;

	reg [31:0] count;	//something to display
	always@(posedge clk)
		count<=count+1;
	
	lcd_ctrl lcd0(clk, reset, count[31:16], SF_D, LCD_E, LCD_RS, LCD_RW);

endmodule

//Simple LCD controller - display a 16-bit hex value
module lcd_ctrl(clk, reset, hex16, SF_D, LCD_E, LCD_RS, LCD_RW);
	input clk, reset;
	input [15:0] hex16;	//16-bit hex value to display
	output [11:8] SF_D;	//LCD controls...
	output LCD_E;
	output LCD_RS;
	output LCD_RW;
	assign LCD_RW=0;	//always writing to LCD

	wire busy, done;
	wire write;
	wire mode4;
	wire rs;
	reg [7:0] lcd_dat;

	reg [3:0] state;
	wire [3:0] nextstate;
	reg [15:0] tmp16;	//shift reg for hex output

	wire [7:0] ascii;	//translate to ascii code
	wire [7:0] add;
	assign add=(tmp16[15:12]<10) ? 8'h30 : 8'h37;
	assign ascii={4'h0, tmp16[15:12]} + add;

	lcd_write wr(clk, reset, write, mode4, rs, lcd_dat, SF_D, LCD_E, LCD_RS, busy, done);

	always@(posedge clk, posedge reset) begin
		if(reset) begin
			state<=0;
		end else begin
			if(done) begin
				state<=nextstate;
				if(state==8)	tmp16<=hex16;			//reload input
				else		tmp16<={tmp16[12:0],4'h0};	//shift digits out
			end
		end
	end

	assign mode4=(state>3);
	assign write=!busy;
	assign rs=(state>8);
	assign nextstate=(state==12) ? 8 : state+1;
	always@* begin
		case(state)
			0: lcd_dat=8'h33;	//LCD initialization sequence...
			1: lcd_dat=8'h33;
			2: lcd_dat=8'h33;
			3: lcd_dat=8'h28;
			4: lcd_dat=8'h28;
			5: lcd_dat=8'h06;
			6: lcd_dat=8'h0C;
			7: lcd_dat=8'h01;
			8: lcd_dat=8'h80;	//set DD RAM address=0
			9: lcd_dat=ascii;
			10: lcd_dat=ascii;
			11: lcd_dat=ascii;
			12: lcd_dat=ascii;	//loops back to 8:
			default: lcd_dat=8'hXX;
		endcase
	end

endmodule

//State machine for writing command/data to LCD
module lcd_write(clk, reset, start, mode4, rs, d, SF_D, LCD_E, LCD_RS, busy, done);

	input clk, reset;
	input start;			//begin writing to LCD (wait for busy=0)
	input mode4;			//1=4-bit mode, 0=8-bit mode (only used during initialization)
	input rs;			//lcd_rs output: 0=write command, 1=write data
	input [7:0] d;			//data to send

	output reg [11:8] SF_D;		//LCD controls
	output reg LCD_RS;
	output reg LCD_E;
	output reg busy;		//high while writing
	output done;			//write complete - high for 1 clock
	
	reg [16:0] count;

	assign done=(count==82089);	//wait ~1.6ms for command to complete
					//(most commands take less time, but this simplifies things)
	always@(posedge clk, posedge reset) begin
		if(reset) begin
			LCD_E <= 0;
			busy <= 0;
		end else begin
			if(start) begin
				LCD_RS <= rs;
				count <= 0;
				busy <= 1;
				SF_D <= d[7:4];
			end else begin
				if(busy) count<=count+1;
				if(count==4 | (mode4 & count==70)) LCD_E<=1;
				else if(count==20 || count==90) LCD_E<=0;
				if(count==60) SF_D<=d[3:0];
				if(done) busy<=0;
			end
		end
	end
endmodule
