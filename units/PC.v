module PC (
    clk, PC_in, PC_out
);

input clk;
input [31:0] PC_in;
output reg [31:0] PC_out;

always@(negedge clk)
begin
    PC_out = PC_in;
end
    
endmodule