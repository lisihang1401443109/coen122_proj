module datapath (

);

reg clk;
wire [7:0] pc_in, pc_out;

wire [31:0] inst_out;

PC(pc_in, pc_out);

inst_mem(clk, pc_out, inst_out);

IFID(clk, inst_out, inst_ifid_out, pc_out, pc_ifid_out);

control(inst_ifid_out, id_regwrt, id_imme, id_PCtoReg, id_MemtoReg, id_BranchN, id_BranchZ, id_Jump, id_JumpMem, id_ALUop, id_MemRead, id_MemWrt);
    
endmodule