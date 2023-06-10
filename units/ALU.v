`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 02:39:14 PM
// Design Name: 
// Module Name: ALU
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


module ALU(A, B, aluop, out, Z, N);

    input [31:0] A, B;
    // input add, inc, neg, sub;
    input [3:0] aluop;
    output [31:0] out;
    output Z, N;

    wire add = aluop[3];
    wire inc = aluop[2];
    wire neg = aluop[1];
    wire sub = aluop[0];

    wire logic_0;
    wire [31:0] bout, aout, Acomp;
    wire [1:0] logic_1;
    wire [1:0] intermediate;
    
    assign logic_0 = (neg);
//    assign logic_1 = ( (add == 1'b1) ? 2'b00 : ((inc == 1'b1) ? 2'b01 : 2'b10));
    assign intermediate = ((inc == 1'b1) ? 2'b01 : 2'b10);
    assign logic_1 = ( (add == 1'b1) ? 2'b00 : intermediate); // for debug purposes
    
    mux_2to1 mux1(B, 0, logic_0, bout);
    negate neg1(A, Acomp);
    mux_3to1 mux2(A, 1, Acomp, logic_1, aout);
    adder_32bit addr1(.A(aout), .B(bout), .c(1'b0), .S(out));
    
    assign Z = ~(out[0] | out[1] | out[2] | out[3] | out[4] | out[5] | out[6] | out[7] | out[8] | out[9] | out[10] | out[11] | out[12] | out[13] | out[14] | out[15] | out[16] | out[17] | out[18] | out[19] | out[20] | out[21] | out[22] | out[23] | out[24] | out[25] | out[26] | out[27] | out[28] | out[29] | out[30] | out[31]);
    assign N = out[31];

endmodule

// inA and inB are 32-bit inputs, if sel=0, out = A, vice versa
module mux_2to1(inA, inB, sel, out);
    input [31:0] inA, inB;
    input sel;
    output [31:0] out;
    
    assign out = (sel == 1'b0) ? inA : inB;
endmodule

// inA and inB and inC are 32-bit inputs, and sel is 2-bit selectors
module mux_3to1(inA, inB, inC, sel, out);
    
    input [31:0] inA, inB, inC;
    input [1:0] sel;
    output [31:0] out;
    
    wire [31:0] temp;
    
    assign temp = (sel[0] == 1) ? inB : inA;
    assign out = (sel[1] == 1) ? inC : temp;

//    assign out = (sel == 2'b00) ? inA : (sel == 2'b01) ? inB : inC;
    
endmodule

// takes in, which is 32-bit, and negate it using 2's complement
module negate(in, out);
    
    input [31:0] in;
    output [31:0] out;

    assign out = ~in + 32'b1;
endmodule

// implement a 1-bit adder, A and B are 1 bit inputs, c is the carry-in, S is the sum and cout is the carryout
module adder_1bit(A, B, c, S, cout);
    
    input A, B, c;
    output S, cout;

    wire temp;
    assign temp = A ^ B;
    assign S = c ^ temp;
    assign cout = (A & B) | (c & temp);
endmodule

// ripple-carry adder using adders, but A and B and S are 32-bit
module adder_32bit(A, B, c, S, cout);
    
    input [31:0] A, B;
    input c;
    output cout;
    output [31:0] S;

    wire [31:0] temp_c;
    adder_1bit addr1(.A(A[0]), .B(B[0]), .c(c), .S(S[0]), .cout(temp_c[0]));
    adder_1bit addr2(.A(A[1]), .B(B[1]), .c(temp_c[0]), .S(S[1]), .cout(temp_c[1]));
    adder_1bit addr3(.A(A[2]), .B(B[2]), .c(temp_c[1]), .S(S[2]), .cout(temp_c[2]));
    adder_1bit addr4(.A(A[3]), .B(B[3]), .c(temp_c[2]), .S(S[3]), .cout(temp_c[3]));
    adder_1bit addr5(.A(A[4]), .B(B[4]), .c(temp_c[3]), .S(S[4]), .cout(temp_c[4]));
    adder_1bit addr6(.A(A[5]), .B(B[5]), .c(temp_c[4]), .S(S[5]), .cout(temp_c[5]));
    adder_1bit addr7(.A(A[6]), .B(B[6]), .c(temp_c[5]), .S(S[6]), .cout(temp_c[6]));
    adder_1bit addr8(.A(A[7]), .B(B[7]), .c(temp_c[6]), .S(S[7]), .cout(temp_c[7]));
    adder_1bit addr9(.A(A[8]), .B(B[8]), .c(temp_c[7]), .S(S[8]), .cout(temp_c[8]));
    adder_1bit addr10(.A(A[9]), .B(B[9]), .c(temp_c[8]), .S(S[9]), .cout(temp_c[9]));
    adder_1bit addr11(.A(A[10]), .B(B[10]), .c(temp_c[9]), .S(S[10]), .cout(temp_c[10]));
    adder_1bit addr12(.A(A[11]), .B(B[11]), .c(temp_c[10]), .S(S[11]), .cout(temp_c[11]));
    adder_1bit addr13(.A(A[12]), .B(B[12]), .c(temp_c[11]), .S(S[12]), .cout(temp_c[12]));
    adder_1bit addr14(.A(A[13]), .B(B[13]), .c(temp_c[12]), .S(S[13]), .cout(temp_c[13]));
    adder_1bit addr15(.A(A[14]), .B(B[14]), .c(temp_c[13]), .S(S[14]), .cout(temp_c[14]));
    adder_1bit addr16(.A(A[15]), .B(B[15]), .c(temp_c[14]), .S(S[15]), .cout(temp_c[15]));
    adder_1bit addr17(.A(A[16]), .B(B[16]), .c(temp_c[15]), .S(S[16]), .cout(temp_c[16]));
    adder_1bit addr18(.A(A[17]), .B(B[17]), .c(temp_c[16]), .S(S[17]), .cout(temp_c[17]));
    adder_1bit addr19(.A(A[18]), .B(B[18]), .c(temp_c[17]), .S(S[18]), .cout(temp_c[18]));
    adder_1bit addr20(.A(A[19]), .B(B[19]), .c(temp_c[18]), .S(S[19]), .cout(temp_c[19]));
    adder_1bit addr21(.A(A[20]), .B(B[20]), .c(temp_c[19]), .S(S[20]), .cout(temp_c[20]));
    adder_1bit addr22(.A(A[21]), .B(B[21]), .c(temp_c[20]), .S(S[21]), .cout(temp_c[21]));
    adder_1bit addr23(.A(A[22]), .B(B[22]), .c(temp_c[21]), .S(S[22]), .cout(temp_c[22]));
    adder_1bit addr24(.A(A[23]), .B(B[23]), .c(temp_c[22]), .S(S[23]), .cout(temp_c[23]));
    adder_1bit addr25(.A(A[24]), .B(B[24]), .c(temp_c[23]), .S(S[24]), .cout(temp_c[24]));
    adder_1bit addr26(.A(A[25]), .B(B[25]), .c(temp_c[24]), .S(S[25]), .cout(temp_c[25]));
    adder_1bit addr27(.A(A[26]), .B(B[26]), .c(temp_c[25]), .S(S[26]), .cout(temp_c[26]));
    adder_1bit addr28(.A(A[27]), .B(B[27]), .c(temp_c[26]), .S(S[27]), .cout(temp_c[27]));
    adder_1bit addr29(.A(A[28]), .B(B[28]), .c(temp_c[27]), .S(S[28]), .cout(temp_c[28]));
    adder_1bit addr30(.A(A[29]), .B(B[29]), .c(temp_c[28]), .S(S[29]), .cout(temp_c[29]));
    adder_1bit addr31(.A(A[30]), .B(B[30]), .c(temp_c[29]), .S(S[30]), .cout(temp_c[30]));
    adder_1bit addr32(.A(A[31]), .B(B[31]), .c(temp_c[30]), .S(S[31]), .cout(cout));
endmodule


