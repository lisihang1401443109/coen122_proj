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
    ALUopIn, ALUopOut
);

input clk, RegWrtIn, memToRegIn, PCtoRegIn, BranchNIn, BranchZIn,
    JumpIn, JumpMemIn, memReadIn, memWriteIn;
input [1:0] ALUopIn;

output RegWrtOut, memToRegOut, PCtoRegOut, BranchNOut, BranchZOut,
    JumpOut, JumpMemOut, memReadOut, memWriteOut;
out [1:0] ALUopOut;


always @(negedge clk)
begin
    // assign each in to the out
end
    
endmodule