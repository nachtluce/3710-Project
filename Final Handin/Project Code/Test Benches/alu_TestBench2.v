`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	Levi Balling, Robert Christensen, James Lewis
//
// Create Date:   16:53:07 09/06/2011
// Design Name:   ALUmod
// Module Name:   C:/Users/user/Documents/levi/School/Fall2011/CS3710/Workspace/ALU/alu_TestBench.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUmod
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_TestBench;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] opcode;
	reg [3:0] opext;
	reg carry;

	// Outputs
	wire [15:0] S;
	wire [4:0] CLFZN;

	// Instantiate the Unit Under Test (UUT)
	ALUmod uut (
		.A(A), 
		.B(B), 
		.opcode(opcode), 
		.S(S), 
		.opext(opext), 
		.CLFZN(CLFZN),
		.carry(carry)
	);
	//Declare any integers and variables here
	integer i,j,k;
	initial 
	begin
		// Initialize Inputs and variables
		A = 0;
		B = 0;
		opcode = 0;
		opext = 0;
		carry = 0;
		i = 0;
		j = 0;
		k = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		/*	README PORTION
		*	This testbench will test every opcode, and only certain opcode extentions.
		*	This will be done using a for loop for the base opcode, and I will use a if statement for the extention
		* 	loop which will test all the ext for a particular opcode.
		*  we will test all the corner cases
		*	 A	 |	B
	*	   ____|____
	*		Max |	Max
	*		Max |	Min
	*		Min |	Max
	*		Min | Min
	*		A+B = Max
	*		... = max + 1
	*		A - B = Max -1
	*		min - 1
	*
		*	After we complete the corner case we will test the random values, we will probably complete 100 random for
		* each and it will only show errors
		*/
		//starting opcode for each corner case
		for(i = 0; i < 16; i = i+1)
		begin
			#100;
			//set the opcode for test each option.  
			//if alu doesn't support the opcode it needs to be ignored.
			opcode = i;
			//test max | Max
			if(i == 0)
				begin
					//test the different opcodes extentions for 0000 opext 0000-1111
						
						for(j = 0; j < 16; j = j +1)
						begin
						//testing opext
							opext = j;
							if(j == 0) //this is nop
							begin//*****************************************NOP********************************
								//test to see if all outputs are 0
								
								//A = 16'b1111111111111111;// max unsign
								//B = 16'b1111111111111111;// max unsign
								//only random is require if it doesn't return 0 for random
								//it won't return 0 for max min and all of them
								//loop through 10 different random numbers
								for(k = 0; k < 11; k = k +1)
								begin
									A = $random % (2^16);
									B = $random % (2^16);
									//may need delay **********************possible need to change the following line
									#50;
									if(S != 0)
									begin
										$display("ERROR0_INST:NOP A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									
									end// end S != 0
								
								end// end 1st k loop
							end // end nop j == 0 
							//nop is tested
							
							if(j == 1)
							begin//***************************************AND************************************
								//This needs an extentive test
								//we first test max
								A = 16'b1111111111111111;// max unsign
								B = 16'b1111111111111111;// max unsign
							   
								//result should be max
							
								#50;
								//test Max&Max
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR1_INST:AND A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									
								end//End test Max&Max
								//test Max& 0 expected result 0
								B = 0;
								#50;
								if(S != 0)
								begin
									$display("ERROR2_INST: AND A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max&0 
								//Test 3 swap order 0&max expect 0
								A = 0;
								B = 16'b1111111111111111;// max unsign
								#50;
								if(S != 0)
								begin
									$display("ERROR3_INST: AND A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test swap max and 0 0&max 
								// testing every other bit and expect 0
								A = 16'b1010101010101010;
								B = 16'b0101010101010101;
							
								#50
								if(S != 0)
								begin
									$display("ERROR4_INST: AND A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test 0&0 expect 0
								A = 0;
								B = 0;
							
								#50
								if(S != 0)
								begin
									$display("ERROR5_INST: AND A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0&0
								//This is the end of all the and tests
							end//end AND j == 1
							if(j == 2)
							begin//**************************************OR**************************************
								//Test max or max expect max
								A = 16'b1111111111111111;// max unsign
								B = 16'b1111111111111111;// max unsign
							   
								//result should be max
							
								#50;
								//test Max|Max
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR6_INST: OR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									
								end//End test Max|Max
								//test Max| 0 expected result MAX
								B = 0;
								#50;
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR7_INST: OR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max|0 
								//Test 3 swap order 0|max expect max
								A = 0;
								B = 16'b1111111111111111;// max unsign
								#50;
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR8_INST: OR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test swap max and 0 0|max 
								// testing every other bit and expect max
								A = 16'b1010101010101010;
								B = 16'b0101010101010101;
							
								#50
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR9_INST: OR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test 0|0 expect 0
								A = 0;
								B = 0;
							
								#50
								if(S != 0)
								begin
									$display("ERROR10_INST: OR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0|0
							
							
							end//end OR j == 2
							if(j == 3)
							begin//*************************************XOR**************************************
								//testing xor
								//Test max xor max expect max
								A = 16'b1111111111111111;// max unsign
								B = 16'b1111111111111111;// max unsign
							   
								//result should be 0
							
								#50;
								//test Max^Max
								if(S != 0)
								begin
									$display("ERROR11_INST: XOR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									
								end//End test Max^Max
								//test Max^ 0 expected result MAX
								B = 0;
								#50;
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR12_INST: XOR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max^0 
								//Test 3 swap order 0^max expect max
								A = 0;
								B = 16'b1111111111111111;// max unsign
								#50;
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR13_INST: XOR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test swap max and 0 0^max 
								// testing every other bit and expect max
								A = 16'b1010101010101010;
								B = 16'b0101010101010101;
							
								#50
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR14_INST: XOR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test 0^0 expect 0
								A = 0;
								B = 0;
							
								#50
								if(S != 0)
								begin
									$display("ERROR15_INST: XOR A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0^0
							
							
							end// end XOR j == 3
							//can ignore 0100(j == 4)the imediate values are taken already
							if(j == 5)
							begin//************************************ADD***************************************
								//Testing add values
								A = 16'b1111111111111111;// -1
								B = 16'b1111111111111111;// -1
							   //result should be 1111111111111110 with CLFZN = 10000
								#50;
								//test Max+Max
								if(S != 16'b1111111111111110 || CLFZN != 5'b10000)
								begin
									$display("ERROR16_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								//test Min+0 expected result -1 CLFZN = 0
								B = 0;
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR17_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max+0 
								//Test 3 swap order 0+-1 expect -1
								A = 0;
								B = 16'b1111111111111111;// -1
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR18_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test max+Min expect 0111111111111110 CLFZN= 10100
								A = 16'b1111111111111111;//-1
								B = 16'b0111111111111111;//MAX
							
								#50
								if(S != 16'b0111111111111110|| CLFZN != 5'b10000)
								begin
									$display("ERROR19_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test 0+0 expect 0
								A = 0;
								B = 0;
								#50
								if(S != 0|| CLFZN != 0)
								begin
									$display("ERROR20_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0+0
								//test Max + 1 expect Min and CLFZN = 00100
								A = 16'b0000000000000001;//1
								B = 16'b0111111111111111;//MAX
										  
								#50
								if(S != 16'b1000000000000000|| CLFZN != 5'b00100)
								begin
									$display("ERROR21_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test -1+1 expect 1 with carry flag
								A = 16'b0000000000000001;//1
								B = 16'b1111111111111111;//-1
										  
								#50
								if(S != 16'b0000000000000000|| CLFZN != 5'b10000)
								begin
									$display("ERROR22_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+B=Max expect 0 with carry flag
								A = 16'b0000000011111111;//random
								B = 16'b0111111100000000;//random
								#50
								if(S != 16'b0111111111111111|| CLFZN !=0)
								begin
									$display("ERROR23_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								
								//test random cases now
								for(k = 0; k < 11; k = k+1)
								begin
									A = $random % 2^14;
									B = $random % 2^14;
									#50;
									if(S != (A+B))
									begin
										$display("ERRORInLoop2_INST: ADD A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									end//end test every other
								end//end k loop for random cases								
							
							end// end ADD j == 5
							if(j == 6)
							begin//************************************ADDU**************************************
								//Testing the unsigned add
								A = 16'b1111111111111111;// Max
								B = 16'b1111111111111111;// Max
							   //result should be 1111111111111110 with CLFZN = 10100
								#50;
								//test Max+Max
								if(S != 16'b1111111111111110 || CLFZN != 5'b10100)
								begin
									$display("ERROR24_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test max+max
								//test Min+0 expected result -1 CLFZN = 0
								B = 0;
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR25_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max+0 
								//Test 3 swap order 0+Max expect Max
								A = 0;
								B = 16'b1111111111111111;// MAX
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR26_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test max+Min expect 0111111111111110 CLFZN= 10100
								
								//test 0+0 expect 0
								A = 0;
								B = 0;
								#50
								if(S != 0|| CLFZN != 0)
								begin
									$display("ERROR27_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0+0
								//test 1 + big number and CLFZN = 00000 result = 1000000000000000
								A = 16'b0000000000000001;//1
								B = 16'b0111111111111111;//MAX
										  
								#50
								if(S != 16'b1000000000000000|| CLFZN != 5'b00000)
								begin
									$display("ERROR28_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end sum to large number
								//test 1+max expect 0 with carry flag and overflow
								A = 16'b0000000000000001;//1
								B = 16'b1111111111111111;//-1
										  
								#50
								if(S != 16'b0000000000000000|| CLFZN != 5'b10100) // changed F flag to need to be 1 because this will overflow
								begin
									$display("ERROR29_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+B=Max expect 0 with carry flag
								A = 16'b0000000011111111;//random
								B = 16'b1111111100000000;//random
								#50
								if(S != 16'b1111111111111111|| CLFZN !=0)
								begin
									$display("ERROR30_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								
								//test random cases now
								for(k = 0; k < 11; k = k+1)
								begin
									A = $random % 2^14;
									B = $random % 2^14;
									#50;
									if(S != (A+B))
									begin
										$display("ERRORInLoop3_INST: ADDU A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									end//end test every other
								end//end k loop for random cases								
							
							
							end// end ADDU j == 6
							if(j == 7)
							begin//************************************ADDC**************************************
							//now we can check everything that is the same with ADD only now we add 2 more cases for Carry input
							
								//Testing add values
								A = 16'b1111111111111111;// -1
								B = 16'b1111111111111111;// -1
							   //result should be 1111111111111110 with CLFZN = 10100
								#50;
								//test Max+Max
								if(S != 16'b1111111111111110 || CLFZN != 5'b10000) // changed to not check that F==1
								begin
									$display("ERROR31_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								A = 16'b1111111111111111;// -1

								//test Min+0 expected result -1 CLFZN = 0
								B = 0;
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR32_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max+0 
								//Test 3 swap order 0+-1 expect -1
								A = 0;
								B = 16'b1111111111111111;// -1
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR33_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test max+Min expect 0111111111111110 CLFZN= 10100
								A = 16'b1111111111111111;//-1
								B = 16'b0111111111111111;//MAX
							
								#50
								if(S != 16'b0111111111111110|| CLFZN != 5'b10000) //changed so it was not signaling overflow occured
								begin
									$display("ERROR34_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test 0+0 expect 0
								
								A = 0;
								B = 0;
								#50
								if(S != 0|| CLFZN != 0)
								begin
									$display("ERROR35_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0+0
								//test Max + 1 expect Min and CLFZN = 00100
								A = 16'b0000000000000001;//1
								B = 16'b0111111111111111;//MAX
										  
								#50
								if(S != 16'b1000000000000000|| CLFZN != 5'b00100)
								begin
									$display("ERROR36_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test -1+1 expect 1 with carry flag
								A = 16'b0000000000000001;//1
								B = 16'b1111111111111111;//-1
										  
								#50
								if(S != 16'b0000000000000000|| CLFZN != 5'b10000)
								begin
									$display("ERROR37_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+B=Max expect 0 with carry flag
								A = 16'b0000000011111111;//random
								B = 16'b0111111100000000;//random
								#50
								if(S != 16'b0111111111111111|| CLFZN !=0)
								begin
									$display("ERROR38_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+1+Cin=expect 0 with carry flag
								A = 16'b1111111111111111;//random
								B = 16'b0000000000000000;
								carry = 1;
						//change flag
						
								#50
								if(S != 0|| CLFZN !=5'b10000)
								begin
									$display("ERROR39_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								carry = 0;
								
								//Test if 0+0+cflag = 1 and cflag =0
								A = 16'b0000000000000000;//random
								B = 16'b0000000000000000;//random
								carry = 1;
						//change flag
									
								#50
								if(S != 16'b0000000000000001|| CLFZN !=0)
								begin                       //
									$display("ERROR40_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								carry = 0;
								
								//test random cases now
								for(k = 0; k < 11; k = k+1)
								begin							
									A = $random % 2^14;
									B = $random % 2^14;
									#50;
									if(S != (A+B))
									begin
										$display("ERRORInLoop4_INST: ADDC A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									end//end test every other
								end//end k loop for random cases								
							
							end// end ADDC j == 7
							//can be ignored 1000(j == 8) the imediate values are taken later
							
							if(j == 9)//This is tested in the add function when you do an sub it changes it so you just add
							begin//*****************************sub************************************
							
							end// end SUB j == 9
							//can be ignored 1010(j == 10) the imediate values are taken later
							//can be ignored 1011(j == 11) the imediate values are taken later
							//can be ignored 1100(j == 12) This is an non-ALU instruction
							if(j == 13)//
							begin//**************************MOV***************************
							
							end// end MOV j == 13
							if(j == 14)
							begin//**************************RSH***********************************
								//shift right this isn't going to carry the first bit over
								//example a = 1111
								// a>>1
								// result = 0111
								A = 16'b1111111111111111;// -1
								
								#50;
								//test Max+Max
								if(S != 16'b0111111111111111)
								begin
									$display("ERROR41_INST: RSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								A = 16'b1010101010101010;
										
								#50;
								//test Max+Max
								//if(S != 16'b1010101010101010)
								if(S != 16'b0101010101010101)
								begin
									$display("ERROR42_INST: RSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								
							
							
							end// end RSH j == 14
							//may need to add another case if we add an instruction for 15(1111)
						end//end 1st j loop
				end // end if i == 0
				// WE can ignore 0001-0011
				// WE May also want to ignore 0100 and all of the sub opext with it 
					//This depends if any of the instructions deal with the ALU
				
				if(i == 5)
				begin//********************************ADDI*********************************************
						//Testing addi values
								A = 16'b1111111111111111;// -1
								B = 16'b1111111111111111;// -1
							   //result should be 1111111111111110 with CLFZN = 10100
								#50;
								//test Max+Max
								if(S != 16'b1111111111111110 || CLFZN != 5'b10100)
								begin
									$display("ERROR43_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								//test Min+0 expected result -1 CLFZN = 0
								B = 0;
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR44_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max+0 
								//Test 3 swap order 0+-1 expect -1
								A = 0;
								B = 16'b1111111111111111;// -1
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR45_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test max+Min expect 0111111111111110 CLFZN= 10100
								A = 16'b1111111111111111;//-1
								B = 16'b0111111111111111;//MAX
							
								#50
								if(S != 16'b0111111111111110|| CLFZN != 5'b10000)
								begin
									$display("ERROR46_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test 0+0 expect 0
								A = 0;
								B = 0;
								#50
								if(S != 0|| CLFZN != 0)
								begin
									$display("ERROR47_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0+0
								//test Max + 1 expect Min and CLFZN = 00100
								A = 16'b0000000000000001;//1
								B = 16'b0111111111111111;//MAX
										  
								#50
								if(S != 16'b1000000000000000|| CLFZN != 5'b00100)
								begin
									$display("ERROR48_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test -1+1 expect 1 with carry flag
								A = 16'b0000000000000001;//1
								B = 16'b1111111111111111;//-1
										  
								#50
								if(S != 16'b0000000000000000|| CLFZN != 5'b10000)
								begin
									$display("ERROR49_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+B=Max expect 0 with carry flag
								A = 16'b0000000011111111;//random
								B = 16'b0111111100000000;//random
								#50
								if(S != 16'b0111111111111111|| CLFZN !=0)
								begin
									$display("ERROR50_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								
								//test random cases now
								for(k = 0; k < 11; k = k+1)
								begin
									A = $random % 2^14;
									B = $random % 2^14;
									#50;
									if(S != (A+B))
									begin
										$display("ERRORInLoop5_INST: ADDI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									end//end test every other
								end//end k loop for random cases								
							
				end//end ADDI i == 5
				if(i == 6)
				begin//************************************ADDUI*********************************************
						//Testing the unsigned add
								A = 16'b1111111111111111;// Max
								B = 16'b1111111111111111;// Max
							   //result should be 1111111111111110 with CLFZN = 10100
								#50;
								//test Max+Max
								if(S != 16'b1111111111111110 || CLFZN != 5'b10100)
								begin
									$display("ERROR51_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test max+max
								//test Min+0 expected result -1 CLFZN = 0
								B = 0;
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR52_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max+0 
								//Test 3 swap order 0+Max expect Max
								A = 0;
								B = 16'b1111111111111111;// MAX
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR53_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test max+Min expect 0111111111111110 CLFZN= 10100
								
								//test 0+0 expect 0
								A = 0;
								B = 0;
								#50
								if(S != 0|| CLFZN != 0)
								begin
									$display("ERROR54_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0+0
								//test 1 + big number and CLFZN = 00000 result = 1000000000000000
								A = 16'b0000000000000001;//1
								B = 16'b0111_1111_1111_1111;//MAX
										  
								#50
								if(S != 16'b1000_0000_0000_0000|| CLFZN != 5'b00000)
								begin
									$display("ERROR55_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end sum to large number
								//test 1+max expect 0 with carry flag and overflow
								A = 16'b0000000000000001;//1
								B = 16'b1111111111111111;//-1
										  
								#50
								if(S != 16'b0000000000000000|| CLFZN != 5'b10100)
								begin
									$display("ERROR56_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+B=Max expect 0 with carry flag
								A = 16'b0000000011111111;//random
								B = 16'b1111111100000000;//random
								#50
								if(S != 16'b1111111111111111|| CLFZN !=0)
								begin
									$display("ERROR57_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								
								//test random cases now
								for(k = 0; k < 11; k = k+1)
								begin
									A = $random % 2^14;
									B = $random % 2^14;
									#50;
									if(S != (A+B))
									begin
										$display("ERRORInLoop6_INST: ADDUI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									end//end test every other
								end//end k loop for random cases								
							
							
				end//end ADDUI i == 6
				if(i == 7)
				begin//************************************ADDCI*******************************************
					//Testing add values
								A = 16'b1111111111111111;// -1
								B = 16'b1111111111111111;// -1
							   //result should be 1111111111111110 with CLFZN = 10100
								#50;
								//test Max+Max
								if(S != 16'b1111111111111110 || CLFZN != 5'b10000) // changed so it was not checking for F==1
								begin
									$display("ERROR58_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								//test Min+0 expected result -1 CLFZN = 0
								A = 16'b1111111111111111;// -1								
								B = 0;
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR59_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test Max+0 
								//Test 3 swap order 0+-1 expect -1
								A = 0;
								B = 16'b1111111111111111;// -1
								#50;
								if(S != 16'b1111111111111111 || CLFZN != 0)
								begin
									$display("ERROR60_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test max+Min expect 0111111111111110 CLFZN= 10100
								A = 16'b1111111111111111;//-1
								B = 16'b0111_1111_1111_1111;//MAX
							
								#50
								if(S != 16'b0111111111111110|| CLFZN != 5'b10000) // changed to not test for F=1
								begin
									$display("ERROR61_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other

								//test 0+0 expect 0								
								A = 0;
								B = 0;
								#50
								if(S != 0|| CLFZN != 0)
								begin
									$display("ERROR62_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test 0+0
								//test Max + 1 expect Min and CLFZN = 00100
								A = 16'b0000000000000001;//1
								B = 16'b0111_1111_1111_1111;//MAX
										  
								#50
								if(S != 16'b1000000000000000|| CLFZN != 5'b00100)
								begin
									$display("ERROR63_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test -1+1 expect 1 with carry flag
								A = 16'b0000000000000001;//1
								B = 16'b1111111111111111;//-1
										  
								#50
								if(S != 16'b0000000000000000|| CLFZN != 5'b10000)
								begin
									$display("ERROR64_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								//test A+B=Max expect 0 with carry flag
								A = 16'b0000_0000_1111_1111;//random
								B = 16'b0111_1111_0000_0000;//random
								#50
								if(S != 16'b0111_1111_1111_1111|| CLFZN !=0)
								begin
									$display("ERROR65_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								carry = 1;
								//test A+1+Cin=expect 1 with carry flag
								A = 16'b1111_1111_1111_1111;//random
								B = 16'b0000_0000_0000_0000;//random
						//change flage
							
								#50
								if(S != 0|| CLFZN !=5'b10000)
								begin
									$display("ERROR66_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								carry = 0;
								
								carry = 1;
								//Test if 0+0+cflag = 1 and cflag =0
								A = 16'b0000000000000000;//random
								B = 16'b0000000000000000;//random
						//Change flag
								#50
								if(S != 16'b0000000000000001|| CLFZN !=0)
								begin                       //
									$display("ERROR67_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//end test every other
								carry = 0;
								
								//test random cases now
								for(k = 0; k < 11; k = k+1)
								begin
									A = $random % 2^14;
									B = $random % 2^14;
									#50;
									if(S != (A+B))
									begin
										$display("ERRORInLoop7_INST: ADDCI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
									end//end test every other
								end//end k loop for random cases								
							
				end//end ADDCI i == 7
				if(i == 8)
				begin//****************************************LSHI***********************************************
					A = 16'b1111111111111111;// -1
						
					#50;
					//test Max+Max
					if(S != 16'b1111111111111110)
					begin
						$display("ERROR68_INST: LSHI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end//End test -1+-1
					A = 16'b1010101010101010;
							
					#50;
					//test Max+Max
					if(S != 16'b0101010101010100)
					begin
						$display("ERROR69_INST: LSHI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end//End test -1+-1
					A = 1;								
					#50;
					//test Max+Max
					if(S != 16'b0000000000000010)
					begin
						$display("ERROR70_INST: LSHI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end//End test -1+-1
						
				end// end LSHI i == 8
				if(i == 9)
				begin//****************************************SUBI***********************************************add test
					A =  16'b0000000000000001;//1-1 = 0
					B =  16'b0000000000000001;//should return 0
					#50;
					if(S != 0)
					begin
						$display("ERROR80_INST: SUBI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end
					
					A =  16'b1111111111111111;//1-1 = 0
					B =  16'b0000000000000000;//should return 0
					#50;
					if(S != 16'b1111111111111111)
					begin
						$display("ERROR81_INST: SUBI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end
					B =  16'b1111111111111111;//-1--1 = 0
					#50;
					if(S != 0)
					begin
						$display("ERROR82_INST: SUBI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end
					
				end// end SUBI i == 9
				if(i == 10)
				begin
					//test 1010 opext codes
					for(j = 0; j < 16; j = j+1)
					begin
						opext = j;
						//skipp j == 0 the instruction is still open
						if(j == 1)
						begin//********************************ALSH********************************************
							A = 16'b1111111111111111;// -1
							
							#50;
							//test Max+Max
							if(S != 16'b1111111111111111)
							begin
								$display("ERROR71_INST: ALSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
							end//End test -1+-1
							A = 16'b1010101010101010;
									
							#50;
							//test Max+Max
							if(S != 16'b0101010101010100)
							begin
								$display("ERROR72_INST: ALSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
							end//End test -1+-1
							A = 1;								
							#50;
							//test Max+Max
							if(S != 16'b0000000000000011)
							begin
								$display("ERROR73_INST: ALSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
							end//End test -1+-1
						
						end//end ALSH j == 1
						if(j == 2)
						begin//********************************CMPU/I*******************************************add test
						
						end//end CMPU/I j == 2
						if(j == 3)
						begin//**********************************NOT**********************************************
							A =  16'b1111111111111111;//should return 0
							#50;
							if(S != 0)
							begin
								$display("ERROR79_INST: NOT A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
							end
							A = 0;
							#50;
							if(S != 1)
							begin
								$display("ERROR80_INST: NOT A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
							end
							
						end//end NOT j == 3
						if(j == 4)
						begin//***********************************ARSH*********************************************
							A = 16'b1111111111111111;// -1
								
								#50;
								//test Max+Max
								if(S != 16'b1111111111111111)
								begin
									$display("ERROR74_INST: ARSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								A = 16'b1010101010101010;
										
								#50;
								//test Max+Max
								if(S != 16'b1101010101010101)
								begin
									$display("ERROR75_INST: ARSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								A = 1;								
								#50;
								//test Max+Max
								if(S != 0)
								begin
									$display("ERROR76_INST: ARSH A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
								end//End test -1+-1
								
							
						end// end ARSH j == 4
						if(j == 5)
						begin//***********************************ADDCU****************************************Add test
						
						end// end ADDCU j == 5
						if(j == 5)
						begin//************************************ADDCUI****************************************add test
						
						end// end ADDCUI j == 6
						//The rest are unused so we don't need to test them as well.
						
						
					end//end 2nd j loop that is testing 1010
				end// end 1010 i == 10
				if(i == 11)
				begin//********************************************CMPI*********************************************
					//different cases
						 // A-B = 1; Flags 
						 // A-B = 0; FLAGS set Z flag
						 // A-B = -1; FLAGS set L Flag, 
						 // 
					
				end// end CMPI 1011 i == 11
				//ignore 12 it is open and unused 1100
				if(i == 13)
				begin//**********************************************MOVI*******************************************
				//This doesn't use anything in the ALU it just passes the  value through
				
				end// end MOVI 1101
				if(i == 14)
				begin//**********************************************RSHI********************************************
					A = 16'b1111111111111111;// -1
					
					#50;
					//test Max+Max
					if(S != 16'b0111111111111111)
					begin
						$display("ERROR77_INST: RSHI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end//End test -1+-1
					A = 16'b1010101010101010;
					
					#50;
					//test Max+Max
					if(S != 16'b0101010101010101)
					begin
						$display("ERROR78_INST: RSHI A=%b,B=%B,CLFZN = %b,S = %b,Time",A,B,CLFZN,S,$time);
					end//End test -1+-1
					
					
				end// end RSHI 1110
				//skip 15 it is empty
		
		end // end i loop




	end // end initial 
      
endmodule

