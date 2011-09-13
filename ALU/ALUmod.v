`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:41 08/31/2011 
// Design Name: 
// Module Name:    ALUmod 
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
module ALUmod(
    input wire [15:0] A,
    input wire [15:0] B,
    input wire [3:0] opcode,
    output reg [15:0] S,
    input wire [3:0] opext,
    output reg [4:0] CLFZN
    );


//start always block and add all the different executions
always@(A,B,opcode,opext)
	begin
	  casex({opcode, opext})
	    8'b0000_0101: // ADD
		 begin
		   S = A + B;
			CLFZN = 0;
			if( S == 0 ) CLFZN[1] = 1'b1;
			else         CLFZN[1] = 1'b0;
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&S[15]);
		 end
		 
		 8'b0101_xxxx: // ADDI
		 begin
		   S = A + B;
			CLFZN = 0;
			if( S == 0 ) CLFZN[1] = 1'b1;
			else         CLFZN[1] = 1'b0;
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&S[15]);
		 end
		 
		 8'b0000_0110: // ADDU
		 begin
			CLFZN = 0;		 
		   {CLFZN[4],S} = A + B;			// set carry bit and sum
			if( S == 0 ) CLFZN[1] = 1'b1; // set zero bit
			else         CLFZN[1] = 1'b0;
		 end
		 
		 8'b0110_xxxx: // ADDUI
		 begin
			CLFZN = 0;		 
		   {CLFZN[4],S} = A + B;			// set carry bit and sum
			if( S == 0 ) CLFZN[1] = 1'b1; // set zero bit
			else         CLFZN[1] = 1'b0;		 
		 end
		 
		 8'b0000_0111: // ADDC (Add with carry)
		 begin
		   CLFZN = 0;
			{CLFZN[4], S} = A + B + CLFZN[4];  // set the carry bit and sum
			if( S == 0 ) CLFZN[1] = 1'b1; // set Z bit
			else         CLFZN[1] = 1'b0;
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&S[15]); // set overflow (signed)
		 end
		 
		 8'b0111_xxxx: // ADDCi (Add with carry immediate)
		 begin
		   CLFZN = 0;
			{CLFZN[4], S} = A + B + CLFZN[4];  // set the carry bit and sum
			if( S == 0 ) CLFZN[1] = 1'b1; // set Z bit
			else         CLFZN[1] = 1'b0;
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&S[15]); // set overflow (signed)
       end			
		
		8'b1010_0101: // ADDCU (Add with carry unsigned?)
		begin
		   CLFZN = 0;
			{CLFZN[4], S} = A + B + CLFZN[4];
			if( S == 0 ) CLFZN[1] = 1'b1;
			else         CLFZN[1] = 1'b0;
		end
		
		8'b1010_0110: // ADDCUI (Add with carry unsigned immediate)
		begin
		   CLFZN = 0;
			{CLFZN[4], S} = A + B + CLFZN[4];
			if( S == 0 ) CLFZN[1] = 1'b1;
			else         CLFZN[1] = 1'b0;
		end
		
		8'b0000_0001: // AND
		begin
		   CLFZN = 0; // flags are all set to zero, see CR16 programmers manual
			S = A & B;
		end
		
		8'b0000_0010: // OR
		begin
			CLFZN = 0; 
			S = A | B;
		end
		
		8'b0000_0011: // XOR
		begin
			CLFZN = 0;
			S = A ^ B;
		end
		
		8'b1010_0011: // NOT (reverse the bits in A)
		begin
			CLFZN = 0;
			S = ~A;
		end
		
		8'b1000_0100: // LSH (left logical shift)
		begin
			CLFZN = 0;
			S = A << 1;
		end
		
		8'b1000_xxxx: // LSHI (left logical shift immediate)
		begin
			CLFZN = 0;
			S = A << 1;
		end
		
		8'b0000_1110: // RSH (Right logical shift)
		begin
			CLFZN = 0;
			S = A >> 1;
		end
		
		default:
		begin
			CLFZN = 0;
			S = 0;
		end
	  endcase
	
	end


endmodule
