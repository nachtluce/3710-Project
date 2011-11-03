`timescale 1ns / 1ps
/*
Programer: Robert Christensen

Clock   - input clock for the register
Reset - Reset the input to zero
increment   - if increment is set to 1 it will increase by the value of 'in'
ImmIn   - used to load the register with a value
WriteEnable  - if set to 1 the value of ImmIn will be loaded

PC    - the value of the program counter
*/
module program_counter(
    input Clock,
    input Reset,
    input increment,
	 input [7:0] In,
    input [15:0] ImmIn,
    input WriteEnable,
    output reg [15:0] PC
    );
	 
initial begin
	PC = 16'H0000;
end

always @(posedge Clock, negedge Reset)
begin
	if(~Reset)
		begin
		PC <= 16'H0000;
		end
	else if(WriteEnable == 1'b1)
		begin
		PC <= ImmIn;
		end
	else if(increment == 1'b1)
		begin
		PC <= PC + In;
		end
	else
		begin
		PC <= 0;
		end
end


endmodule
