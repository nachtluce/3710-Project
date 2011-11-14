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
//	 input wire carry
    );


//start always block and add all the different executions
always@(A,B,opcode,opext)//,carry)
	begin
	  casex({opcode, opext})
	    8'b0000_0101: // ADD
		 begin
		   CLFZN = 0;
		   {CLFZN[4], S} = A + B;
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&~S[15]);
		 end
		 
		 8'b0101_xxxx: // ADDI
		 begin
			CLFZN = 0;		 
		   {CLFZN[4], S} = A + B;
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&S[15]);
		 end
		 
		 8'b0000_0110: // ADDU
		 begin
			CLFZN = 0;		 
		   {CLFZN[4], S} = A + B;			// set carry bit and sum
			CLFZN[2] = CLFZN[4];
		 end
		 
		 8'b0110_xxxx: // ADDUI
		 begin
			CLFZN = 0;
		   {CLFZN[4],S} = A + B;			// set carry bit and sum
			CLFZN[2] = CLFZN[4];	 
		 end
/* ADDC, ADDCU ADDCUI, and ADCI are depricated
    But not removed 
		 8'b0000_0111: // ADDC (Add with carry)
		 begin
			CLFZN[4:0] = 0;		 
			{CLFZN[4], S} = A + B + carry;  // set the carry bit and sum
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&~S[15]); // set overflow (signed)
		 end
		 
		 8'b0111_xxxx: // ADDCi (Add with carry immediate)
		 begin
			CLFZN[3:0] = 0;		 
			{CLFZN[4], S} = A + B + carry;  // set the carry bit and sum
			CLFZN[2] = (~A[15]&~B[15]&S[15]) | (A[15]&B[15]&~S[15]); // set overflow (signed)
       end			
		
		8'b1010_0101: // ADDCU (Add with carry unsigned?)
		begin
			CLFZN[4:0] = 0;		
			{CLFZN[4], S} = A + B + carry;
		end
		
		8'b1010_0110: // ADDCUI (Add with carry unsigned immediate)
		begin
			CLFZN[4:0] = 0;		
			{CLFZN[4], S} = A + B + carry;
			CLFZN[2] = CLFZN[4];
		end
*/
		8'b0000_1001: // SUB
		begin
			CLFZN = 0;
			// Overflow if neg - pos = pos or pos - neg = neg
			S = B - A;			
			if( A[15] != B[15] && B[15] == S[15]) CLFZN[2] = 1'b1;  
		end
		
		8'b1001_xxxx: // SUBI
		begin
			CLFZN = 0;
			// Overflow if neg - pos = pos or pos - neg = neg
			S = B - A;			
			if( A[15] != B[15] && B[15] == S[15]) CLFZN[2] = 1'b1;  
		end 
		
		8'b0011_xxxx: // CMP
		begin
			CLFZN = {1'b0,
				A > B,
				1'b0,
				A == B,
				$signed(A) > $signed(B)};
			//CLFZN = {A[15] & B[15],
			//			A == B,
			//			A > B,
			//			1'b0,
			//			$signed(A) > $signed(B)};
			S = 0;
		end 
		
		8'b1011_xxxx: // CMPI
		begin
			CLFZN = {1'b0,
						A > B,
						1'b0,
						A == B,
						$signed(A) > $signed(B)};
						
			//CLFZN = {A[15] & B[15],
			//			A == B,
			//			A > B,
			//			1'b0,
			//			$signed(A) > $signed(B)};						
		   S = 0;
		end 		
		
/*		8'b1010_0010: // CMPU/I
		begin
			CLFZN = 
				{1'b0,
				A > B,
				1'b0,
				A == B,
				$signed(A) > $signed(B)};
		   S = 0;
		end 		
*/		
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
		
		8'b0000_0100: // NOT (logical not?  The the test bench says it is a logical not)
		begin
			CLFZN = 0;
			S = !A;
		end
		
		8'b0000_1100: // LSH (left logical shift)
		begin
			CLFZN = 0;
			S = A << 1;
		end
/*		 LSHI is depricated
		8'b1000_xxxx: // LSHI (left logical shift immediate)
		begin
			CLFZN = 0;
			S = A << 1;
		end
*/	
		8'b0000_1110: // RSH (Right logical shift)
		begin
			CLFZN = 0;
			S = A >> 1;
		end
		
		8'b1110_xxxx: // RSHI (Right logical shift immediate)
		begin
			CLFZN = 0;
			S = A >> 1;
		end
		
		8'b0000_0111: // ALSH (Arithmedic left shift)
		begin
			CLFZN = 0;
			//S = A <<< 1;
			S = {A[14:0], A[0]};
		end
		
		8'b0000_1000: // ARSH (Arithmedic right shift)
		begin
			CLFZN = 0;
			//S = A >>> 1; // this statment did not work in the test bench for some reason.
			S = {A[15], A[15:1]};
		end
		
		// the value of the A register passes though
		8'b0000_1101: // MOV
		begin
			CLFZN = 0;
			S = A;
		end
		
		// the value of the A register passes though
		8'b1000_xxxx: // MOVi
		begin
			CLFZN = 0;
			S = A;
		end
		
		// The upper bits of A are concatanated with the lower bits of B
		8'b0111_xxxx: // MOVIU
		begin
			S = {A[15:8],B[7:0]};
		end
		
		// NOP falls to the default case
		default:
		begin
			CLFZN = 0;
			S = 0;
		end
	  endcase
	
	end


endmodule
