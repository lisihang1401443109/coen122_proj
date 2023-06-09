module datapath (

);

reg clk;
wire [7:0] pc_in, pc_out;

wire [31:0] inst_out;

wire id_regwrt, id_imme, id_PCtoReg, id_MemtoReg, id_BranchN, id_BranchZ, id_Jump, id_JumpMem, id_ALUop, id_MemRead, id_MemWrt

PC my_pc(pc_in, pc_out);

inst_mem my_inst_mem(clk, pc_out, inst_out);

IFID my_ifid(clk, inst_out, inst_ifid_out, pc_out, pc_ifid_out);

wire [3:0] opcode;
assign opcode = inst_ifid_out[31:28];

control my_control(clk, inst_ifid_out, id_regwrt, id_imme, id_PCtoReg, id_MemtoReg, id_BranchN, id_BranchZ, id_Jump, id_JumpMem, id_ALUop, id_MemRead, id_MemWrt);


wire [5:0] rs, rt, rd;
assign rs = inst_ifid_out[21:16];
assign rt = inst_ifid_out[15:10];

wire [31:0] id_xrs, id_xrt, Y;

register_file(clk, rs, rt, rd, data_in, id_regwrt, id_xrs, id_xrt);

sign_extender(clk, inst_ifid_out[21:0], Y);

adder_32bit adder_id(.A(pc_ifid_out), .B(Y), .S(pc_y));

IDEX my_idex()






    
endmodule