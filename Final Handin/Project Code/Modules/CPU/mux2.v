/*
	mux with two inputs
*/

module Mux2(
    input [0:0] Select,
    input [15:0] InputA,
    input [15:0] InputB,
    output reg [15:0] Output
    );
	
	always @(*)
	begin
		case(Select)
			2'h0: Output = InputA;
			2'h1: Output = InputB;
		endcase
	end

endmodule
