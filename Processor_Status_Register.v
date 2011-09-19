`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	Levi Balling, Robert Christensen, James Lewis
// 
// Create Date:    15:07:38 09/19/2011 
// Design Name: 
// Module Name:    Processor_Status_Register 
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
module Processor_Status_Register(
	 input clock,
    input [4:0] CZLFM_in,
    output reg[4:0] CZLFN_out 
    );

always@(posedge clock)
begin
  CZLFN_out <= CZLFM_in;
end

endmodule
