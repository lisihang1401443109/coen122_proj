module register_file (
    clk, rs, rt, rd, data_in, write, xrs, xrt
);

input clk, write;
input [5:0] rs, rt, rd;
input [31:0] data_in;

output reg [31:0] xrs, xrt;

reg [31:0] registers [63:0];

always@(posedge clk)
begin
    if (~write)
    begin
        xrs = registers[rs];
        xrt = registers[rt];
    end
    if (write)
    begin
        registers[rd] = data_in;
    end
end
    
endmodule