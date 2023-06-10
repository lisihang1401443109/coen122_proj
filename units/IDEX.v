module IDEX (
    clk, RegWrtIn, RegWrtOut, 
    memToRegIn, MemtoRegOut, 
    PCtoRegIn, PCtoRegOut, 
    BranchNIn, BranchNOut, 
    BranchZIn, BranchZOut, 
    JumpIn, JumpOut, 
    JumpMemIn, JumpMemOut, 
    memReadIn, memReadOut, 
    memWriteIn, memWriteOut, 
    ALUopIn, ALUopOut,
    XrsIn, XrsOut,
    XrtIn, XrtOut,
    Yin, Yout,
    PC_YIn, PC_YOut,
    immeIn, immeOut,
    rdIn, rdOut
);

input clk, RegWrtIn, memToRegIn, PCtoRegIn, BranchNIn, BranchZIn,
    JumpIn, JumpMemIn, memReadIn, memWriteIn, immeIn;
input [1:0] ALUopIn;

input [31:0] XrsIn, XrtIn, Yin, PC_YIn;

output reg RegWrtOut, memToRegOut, PCtoRegOut, BranchNOut, BranchZOut,
    JumpOut, JumpMemOut, memReadOut, memWriteOut, immeOut;
output [1:0] ALUopOut;
output [31:0] XrsIn, XrtIn, Yin, PC_YIn


always @(negedge clk)
begin
    // assign each in to the out
        RegWrtOut   = RegWrtIn;
        memToRegOut = memToRegIn;
        PCtoRegOut  = PCtoRegIn;
        BranchNOut  = BranchNIn;
        BranchZOut  = BranchZIn;
        JumpOut     = JumpIn;
        JumpMemOut  = JumpMemIn;
        memReadOut  = memReadIn;
        memWriteOut = memWriteIn;
        ALUopOut    = ALUopIn;
        XrsOut      = XrsIn;
        XrtOut      = XrtIn;
        Yout        = Yin;
        PC_YOut     = PC_YIn;
        immeOut     = immeIn;
        rdOut       = rdIn;
end
    
endmodule