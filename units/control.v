module control (
    opcode, RegWrt, imme, PCtoReg, MemtoReg, BranchNeg, sum, BranchZero, Jump, JumpMem, ALUop, MemRead, MemWrt
);

input [3:0] opcode;
output RegWrt, imme, PCtoReg, MemtoReg, BranchNeg, sum, BranchZero, Jump, JumpMem, ALUop, MemRead, MemWrt

// bunch of if's
    
endmodule