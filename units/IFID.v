module IFID (
    clk, instIn, pcIn, instOut, pcOut
);

input clk;
input [31:0] instIn;
input [7:0] pcIn;

output reg [31:0] instOut;
output reg [7:0] pcOut;

always @(negedge clk)
begin

    instOut = instIn;
    pcOut = pcIn;

end
    
endmodule