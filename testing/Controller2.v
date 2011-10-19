`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:22:52 10/18/2011 
// Design Name: 
// Module Name:    Controller2 
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
module Controller2(
    input reset,
    input clock,
    input data,
    output [7:0] plyr_input,
    output reg pulse,
    output reg latch
    );
	reg latch1, pulse1, data1;
	reg left, right, up, down, A, B, select, start;
	reg left1, right1, up1, down1, A1, B1, select1, start1;
	assign plyr_input = {left, right, up, down, A, B, select, start};


   reg [3:0] state, nextstate, returnstate, nextreturnstate;
       reg [11:0] count, nextcount; 

       parameter INIT = 0;
       parameter LATCH = 1;
       parameter WAIT = 2;
       parameter PULSE = 3;
       parameter READ_A = 4;
       parameter READ_B = 5;
       parameter READ_SEL = 6;
       parameter READ_STRT = 7;
       parameter READ_UP = 8;
       parameter READ_DOWN = 9;
       parameter READ_LEFT = 10;
       parameter READ_RIGHT = 11;

       parameter TWELVE_US = 12'h258;   //1770;    //count for 12 us on a 27 MHz clock
       parameter SIX_US = 12'h12C;//BB8; //count for 6 us on a 27 MHz clock
 
       always @ (posedge clock)
       begin
              if (!reset) begin
                     state <= INIT;
                     returnstate <= INIT;
                     count <= 0;
              end    
              else   begin
                     state <= nextstate;
                     returnstate <= nextreturnstate;
                     count <= nextcount;
              end

              data1 <= data;
              latch <= latch1;
              pulse <= pulse1;
              left <= left1;
              right <= right1;
              up <= up1;
              down <= down1;
              A <= A1;
              B <= B1;
              select <= select1;
              start <= start1;
       end
 
       always @ (state or returnstate or count or data1)
       begin
              //defaults
              nextstate = state;
              nextreturnstate = returnstate;
              nextcount = count;
              latch1 = latch;
              pulse1 = pulse;
              left1 = left;
              right1 = right;
              up1 = up;
              down1 = down;
              A1 = A;
              B1 = B;
              select1 = select;
              start1 = start;

              case (state)
              INIT:
              begin
                     nextstate = LATCH;
                     nextcount = 0;
							
              end
              LATCH:
              begin
                     //latch 12 us, then go to read A
                     latch1 = 1;
                     if (count == TWELVE_US) begin
                           nextcount = 0;
                           latch1 = 0;
                           nextstate = READ_A;
                     end
                     else   nextcount = count + 1;
              end
              WAIT:
              begin
                     //wait 6 us, then go to pulse
                     if (count == SIX_US) begin
                           nextcount = 0;
                           nextstate = PULSE;

                     end
                     else   nextcount = count + 1;
              end
              PULSE:

              begin
                     //pulse 6 us, then go to returnstate and read data
                     pulse1 = 1;
                     if (count == SIX_US) begin
                           nextcount = 0;
                           pulse1 = 0;

                           nextstate = returnstate;

                     end

                     else   nextcount = count + 1;

              end

              READ_A:

              begin

                     A1 = ~data1;

                     nextreturnstate = READ_B;

                     nextstate = WAIT;

              end

              READ_B:

              begin

                     B1 = ~data1;

                     nextreturnstate = READ_SEL;

                     nextstate = WAIT;

              end

              READ_SEL:

              begin

                     select1 = ~data1;

                     nextreturnstate = READ_STRT;

                     nextstate = WAIT;

              end

              READ_STRT:

              begin

                     start1 = ~data1;

                     nextreturnstate = READ_UP;

                     nextstate = WAIT;

              end

              READ_UP:

              begin

                     up1 = ~data1;

                     nextreturnstate = READ_DOWN;

                     nextstate = WAIT;

              end

              READ_DOWN:

              begin

                     down1 = ~data1;

                     nextreturnstate = READ_LEFT;

                     nextstate = WAIT;

              end

              READ_LEFT:
              begin
                     left1 = ~data1;
                     nextreturnstate = READ_RIGHT;
                     nextstate = WAIT;
              end
              READ_RIGHT:
              begin
                     right1 = ~data1;
                     nextstate = INIT;
              end
              endcase
       end

endmodule
