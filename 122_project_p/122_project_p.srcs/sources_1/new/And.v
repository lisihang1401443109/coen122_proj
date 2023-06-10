`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2023 05:44:58 PM
// Design Name: 
// Module Name: And
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module And (
    inA, inB, out
);

// declare the inputs and outputs (1 bit each)
// return to out
    input inA;
    input inB;
    output out;
    
    // perform bitwise OR operation
    assign out = inA & inB;


endmodule