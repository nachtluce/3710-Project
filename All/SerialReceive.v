`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:10 11/29/2011 
// Design Name: 
// Module Name:    SerialReceive 
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
module SerialReceive(
    input Clock,
    input Receive,
    output reg Valid,
    output reg [15:0] DataOut
    );
	 
	 reg [4:0] counter;
	 reg [5:0] state;	
	 
	 initial
	 begin
		DataOut <= 16'h0000;
		state <= 5'h00;
		Valid <= 0;
		counter <= 0;
	 end
	 
	 always@(posedge Clock)
	 begin
		case (state)
			0:
				begin
					Valid <= 0;
					if(Receive == 0)
						state <= 1;
				end
			1:
				begin
					if(counter == 10)
						begin
							state <= 2;
							counter <= 0;
						end
					else
						counter <= counter + 1;
				end
			18:
				begin
					state <= 0;
					Valid <= 1;
				end
			default:
				begin
					if (counter == 0)
						begin
							DataOut[state - 2] <= Receive;
							counter = counter + 1;
						end
					else
						begin
							if (counter == 7)
								begin
									counter <= 0;
									state <= state + 1;
								end
							else
								counter <= counter + 1;
						end
				end		
		endcase
	 end

endmodule
