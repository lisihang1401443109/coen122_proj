module datapath ();

reg clk;

// the IF stage
wire [31:0] pc_in, if_pc_out;

wire [31:0] if_inst_out;

wire id_regwrt, id_imme, id_PCtoReg, id_MemtoReg, id_BranchN, id_BranchZ, id_Jump, id_JumpMem, id_MemRead, id_MemWrt;
wire [3:0] id_ALUop;

PC my_pc(pc_in, if_pc_out);

inst_mem my_inst_mem(clk, if_pc_out, if_inst_out);

wire [31:0] id_pc, id_inst;

IFID my_ifid(clk, if_inst_out, if_pc_out, id_inst, id_pc);

// the ID stage

wire [3:0] opcode;
assign opcode = id_inst[31:28];

control my_control(clk, id_inst, id_regwrt, id_imme, id_PCtoReg, id_MemtoReg, id_BranchN, id_BranchZ, id_Jump, id_JumpMem, id_ALUop, id_MemRead, id_MemWrt);


wire [5:0] rs, rt, id_rd;
assign rs = id_inst[21:16];
assign rt = id_inst[15:10];
assign id_rd = id_inst[27:22];
wire [31:0] rf_data_in;

wire [31:0] id_xrs, id_xrt, id_Y, id_pc_y;

register_file my_rf(clk, rs, rt, wb_rd, rf_data_in, id_regwrt, id_xrs, id_xrt);

sign_extender my_sign_ext(clk, id_inst[21:0], id_Y);

adder_32bit adder_id(.A(pc_ifid_out), .B(id_Y), .S(id_pc_y));

wire ex_regwrt, ex_MemtoReg, ex_PctoReg, ex_BranchN, ex_BranchZ, ex_Jump, ex_JumpMem, ex_MemRead, ex_MemWrt, ex_imme, ex_rd;
wire [3:0] ex_ALUop;
wire [31:0] ex_xrs, ex_xrt, ex_Y, ex_pc_y;

IDEX my_idex(clk, 
            id_regwrt, ex_regwrt,
            id_MemtoReg, ex_MemtoReg,
            id_PCtoReg, ex_PctoReg,
            id_BranchN, ex_BranchN,
            id_BranchZ, ex_BranchZ,
            id_Jump, ex_Jump,
            id_JumpMem, ex_JumpMem,
            id_MemRead, ex_MemRead,
            id_MemWrt, ex_MemWrt,
            id_ALUop, ex_ALUop,
            id_xrs, ex_xrs,
            id_xrt, ex_xrt,
            id_Y, ex_Y,
            id_pc_y, ex_pc_y,
            id_imme, ex_imme,
            id_rd, ex_rd
);

// the EX stage

wire [31:0] ex_data_mem_out, ex_mux_out, ex_ALU_out;
wire ex_Z, ex_N;

data_mem my_data_mem(clk, ex_MemRead, ex_MemWrt, ex_xrs, ex_xrt, ex_data_mem_out);

mux_2to1 alu_in2_mux(.inA(xrt), .inB(Y), .sel(ex_imme), .out(ex_mux_out));

ALU ex_ALU(ex_xrs, ex_mux_out, ex_ALUop, ex_ALU_out, ex_Z, ex_N);
// make change to ALU module to comromise

wire wb_N, wb_Z, wb_MemtoReg, wb_regwrt, wb_BranchZ, wb_BranchN, wb_Jump, wb_JumpMem, wb_PctoReg;

wire [31:0] wb_data_mem_out, wb_ALU_out, wb_pc_y;
wire [5:0] wb_rd;

wire and_1_out, and_2_out, or_out;
And and_1(.inA(ex_Z), .inB(ex_BranchZ), .out(and_1_out));
And and_2(.inA(ex_N), .inB(ex_BranchN), .out(and_2_out));
Or or_1(.inA(and_1_out), .inB(and_2_out), .out(or_out));

EXWB my_exwb(clk, 
            ex_N, ex_Z, ex_MemtoReg, ex_regwrt, ex_BranchZ, ex_BranchN, ex_Jump, ex_JumpMem, ex_data_mem_out, ex_ALU_out, ex_rd, ex_pc_y, ex_PctoReg,
            // match the inputs by replacing 'ex' with 'wb'
            wb_N, wb_Z, wb_MemtoReg, wb_regwrt, wb_BranchZ, wb_BranchN, wb_Jump, wb_JumpMem, wb_data_mem_out, wb_ALU_out, wb_rd, wb_pc_y, wb_PctoReg
            );


// the WB stage

mux_3to1 wb_mux(.inA(wb_data_mem_out), .inB(wb_ALU_out), .inC(wb_pc_y), .sel({wb_PctoReg, wb_MemtoReg}), .out(rf_data_in));

// back to PC and regFile
mux_3to1 mux_pc(.inA(pc_out+32'b01), .inB(id_xrs), .inC(ex_data_mem_out), .sel({jumpMem, or_out}), .out(pc_in));

initial 
begin
    clk = 1;
    forever #5 clk = ~clk;
end
    
endmodule