module EXWB (
    clk,
    NIn, ZIn, memToRegIn, RegWrtIn, BranchZIn, BranchNIn, JumpIn, JumpMemIn, memOutIn, ALUOutIn, rdIn, 
    // match the inputs with outputs, for example: NIn is matched with NOut, BranchZIn is matched with BranchZOut
    NOut, ZOut, memToRegOut, RegWrtOut, BranchZOut, BranchNOut, JumpOut, JumpMemOut, memOutOut, ALUOutOut, rdOut
);

input Nin, Zin, memToRegIn, RegWrtIn, BranchZIn, BranchNIn, JumpIn, JumpMemIn;

input [31:0] memOutIn, ALUOutIn;

input [5:0] rdIn;


output reg NOut, ZOut, memToRegOut, RegWrtOut, BranchZOut, BranchNOut, JumpOut, JumpMemOut,
output reg [31:0] memOutOut, ALUOutOut,
output reg [5:0] rdOut

// match the inputs with output reg

always@(negedge clk)
begin
    // assign the outputs to inputs
    NOut       = NOut;
    ZOut       = ZOut;
    memToRegOut= memToRegOut;
    RegWrtOut  = RegWrtOut;
    BranchZOut = BranchZOut;
    BranchNOut = BranchNOut;
    JumpOut    = JumpOut;
    JumpMemOut = JumpMemOut;
    memOutOut  = memOutOut;
    ALUOutOut  = ALUOutOut;
    rdOut      = rdOut;
end
    
endmodule