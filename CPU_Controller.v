`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:11 10/27/2011 
// Design Name: 
// Module Name:    CPU_Controller 
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
module CPU_Controller(
    input Clock,
    input Reset,
    input [15:0] INS,
    input [4:0] PSR,
    output [3:0] OpCode,
    output [3:0] OpExt,
    output RegWrite,
    output [3:0] RegIn,
    output [3:0] RegA,
    output [3:0] RegB,
    output [15:0] Immediate,
    output [1:0] SelALU,
    output SelMEM,
    output MemRW,
    output PCWrite,
    output PCIncrement,
    output PCReset,
    output IRReset,
    output IRWrite,
    output PSRReset
    );


endmodule
