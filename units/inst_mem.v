module inst_mem (
    clk, addr, inst
);

// input: clk, addr
// output: inst
// @posedge clk: return the inst[31:0] at addr

input clk;
input [31:0] addr;
output reg[31:0] inst;

reg [31:0] instructions [65535:0]

always@(posedge clk)
begin
    inst = instructions[addr];
end
    
endmodule