`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:46 11/29/2011 
// Design Name: 
// Module Name:    SerialTransmit 
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
module SerialTransmit(
    input Clock,
    input BaudTick,
    input [15:0] DataIn,
	 input send,
    output reg Transmit,
	 output reg Busy
    );
	 
	 reg [15:0] sending;
	 reg [4:0] state;
	 // States: 0 = waiting; 1 = startingSend; 2 = sending start bit; 3-19 sending bits; 20 = sending stop bit  
	 
	 initial
	 begin
		sending <= 16'h0000;
		state <= 5'h00;
		Transmit <= 1;
		Busy <= 0;
	 end
	 
	 always@(posedge Clock)
	 begin
		case (state)
			0:
				begin
					if(send)
					begin
						state <= 1;
						sending <= DataIn;
					end
				end
			19:
				begin
					if(BaudTick)
						state <= 0;
				end
			default:
				begin
					if(BaudTick)
						state <= state + 1;
				end		
		endcase
	 end
	 
	 always@(state)
	 begin
		case(state)
			0:
				begin
					Busy <= 0;
					Transmit <= 1;
				end
			1:
				begin
					Busy <= 1;
					Transmit <= 1;
				end
			2:
				begin
					Transmit <= 0;
				end
			19:
				begin
					Transmit <= 1;
				end
			default:
				begin
					Transmit <= sending[state - 3];
				end
				
		endcase
	 end


endmodule
