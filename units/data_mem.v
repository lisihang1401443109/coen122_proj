module data_mem (
    clk, read, write, addr, data_in, data_out
);

input clk, read, write;
input [31:0] addr, data_in
output reg [31:0] data_out;

reg [31:0] data [65535:0];

always @(posedge clk) begin
    if (read)
    begin
        data_out = data[addr[15:0]]
    end
    if (write)
    begin
        data[addr[15:0]] = data_in
    end
end
    
endmodule