module sign_extender (
    clk, in, out
);

input [21:0] in;
output reg [31:0] out;

always@(negedge clk)
begin
    out[31:0] = in;
    if (in[21] == 0)
    begin
        out[31:22] = 0'b0000000000;
    end
    if (in[21] == 1)
    begin
        out[31:22] = 0'b1111111111;
    end
end
    
endmodule