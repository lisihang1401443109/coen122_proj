module EXWB (
    clk,
    NIn, ZIn, memToRegIn, RegWrtIn, BranchZIn, BranchNIn, JumpIn, JumpMemIn, memOutIn, ALUOutIn, rdIn, pc_y_in,pcToRegIn,
    // match the inputs with outputs, for example: NIn is matched with NOut, BranchZIn is matched with BranchZOut
    NOut, ZOut, memToRegOut, RegWrtOut, BranchZOut, BranchNOut, JumpOut, JumpMemOut, memOutOut, ALUOutOut, rdOut, pc_y_out, pcToRegOut
);
input clk;
input Nin, Zin, memToRegIn, RegWrtIn, BranchZIn, BranchNIn, JumpIn, JumpMemIn, pcToRegIn;

input [31:0] memOutIn, ALUOutIn, pc_y_in;

input [5:0] rdIn;


output reg NOut, ZOut, memToRegOut, RegWrtOut, BranchZOut, BranchNOut, JumpOut, JumpMemOut, pcToRegOut;
output reg [31:0] memOutOut, ALUOutOut, pc_y_out,
output reg [5:0] rdOut

// match the inputs with output reg

always@(negedge clk)
begin
    // assign the outputs to inputs
   NOut       = NIn;
    ZOut       = ZIn;
    memToRegOut= memToRegIn;
    RegWrtOut  = RegWrtIn;
    BranchZOut = BranchZIn;
    BranchNOut = BranchNIn;‰
    JumpOut    = JumpIn;
    JumpMemOut = JumpMemIn;
    memOutOut  = memOutIn;
    ALUOutOut  = ALUOutIn;
    rdOut      = rdIn;
    pc_y_out    = pc_y_in;
    pcToRegOut = pcToRegIn;
end
    
endmodule