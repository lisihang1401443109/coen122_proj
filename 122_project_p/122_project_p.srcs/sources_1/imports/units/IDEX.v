module IDEX (
    clk, RegWrtIn, RegWrtOut, 
    memToRegIn, memToRegOut, 
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
input [5:0] rdIn;
input [31:0] XrsIn, XrtIn, Yin, PC_YIn;

output reg RegWrtOut, memToRegOut, PCtoRegOut, BranchNOut, BranchZOut,
    JumpOut, JumpMemOut, memReadOut, memWriteOut, immeOut;
output reg [1:0] ALUopOut;
output reg [5:0] rdOut;
output reg [31:0] XrsOut, XrtOut, Yout, PC_YOut;

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