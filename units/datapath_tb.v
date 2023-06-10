module tb_datapath;

reg clk;
wire [31:0] pc_out, id_rs1, id_rs2, id_imm, ex_ALU_out, ex_rd, ex_PctoReg, ex_MemtoReg, ex_regwrt, ex_BranchZ, ex_BranchN, ex_Jump, ex_JumpMem, ex_data_mem_out, ex_pc_y, ex_N, ex_Z, wb_data_mem_out, wb_ALU_out, wb_rd, wb_N, wb_Z, wb_MemtoReg, wb_regwrt, wb_BranchZ, wb_BranchN, wb_Jump, wb_JumpMem, wb_PctoReg;

datapath my_datapath(
    .clk(clk),
    .pc_out(pc_out),
    .id_rs1(id_rs1),
    .id_rs2(id_rs2),
    .id_imm(id_imm),
    .ex_ALU_out(ex_ALU_out),
    .ex_rd(ex_rd),
    .ex_PctoReg(ex_PctoReg),
    .ex_MemtoReg(ex_MemtoReg),
    .ex_regwrt(ex_regwrt),
    .ex_BranchZ(ex_BranchZ),
    .ex_BranchN(ex_BranchN),
    .ex_Jump(ex_Jump),
    .ex_JumpMem(ex_JumpMem),
    .ex_data_mem_out(ex_data_mem_out),
    .ex_pc_y(ex_pc_y),
    .ex_N(ex_N),
    .ex_Z(ex_Z),
    .wb_data_mem_out(wb_data_mem_out),
    .wb_ALU_out(wb_ALU_out),
    .wb_rd(wb_rd),
    .wb_N(wb_N),
    .wb_Z(wb_Z),
    .wb_MemtoReg(wb_MemtoReg),
    .wb_regwrt(wb_regwrt),
    .wb_BranchZ(wb_BranchZ),
    .wb_BranchN(wb_BranchN),
    .wb_Jump(wb_Jump),
    .wb_JumpMem(wb_JumpMem),
    .wb_PctoReg(wb_PctoReg)
);

initial begin
    clk = 0;
    #5;
    forever #5 clk = ~clk;
end

endmodule