`timescale 1ns / 1ps
/*
Programer: Robert Christensen

clk   - input clock for the register
reset - reset the input to zero
inc   - if inc is set to 1 it will increase by the value of 'in'
din   - used to load the register with a value
wEnb  - if set to 1 the value of din will be loaded

PC    - the value of the program counter
*/
module program_counter(
    input clk,
    input reset,
    input inc,
	 input [7:0] in,
    input [15:0] din,
    input wEnb,
    output reg [15:0] PC
    );
	 
initial begin
	PC = 16'H0000;
end

always @(posedge clk, negedge reset)
begin
	if(~reset)
		begin
		PC <= 16'H0000;
		end
	else if(wEnb == 1'b1)
		begin
		PC <= din;
		end
	else if(inc == 1'b1)
		begin
		PC <= PC + in;
		end
	else
		begin
		PC <= 0;
		end
end


endmodule
