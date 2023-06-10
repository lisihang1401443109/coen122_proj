module control (
    clk, opcode, regWrite, imme, PCtoReg, memToReg, branchN, branchZ, Jump, jumpMem, ALUop, memRead, memWrite
);

input clk;
input [3:0] opcode;
output reg regWrite, imme, PCtoReg, memToReg, branchN, branchZ, Jump, jumpMem, memRead, memWrite;
output reg [1:0] ALUop;

// bunch of if's
  always @(posedge clk)
  begin
    case (opcode)
      4'b0000: // opcode is 0000
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b00;
        end

      4'b1111: // opcode is 1111
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b01;
        end

      4'b1110: // opcode is 1110
        begin
          regWrite  = 1;
          memToReg  = 1;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 1;
          imme      = 0;
          ALUop     = 2'b00;
        end

      4'b0011: // opcode is 0011
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 1;
          imme      = 0;
          ALUop     = 2'b00;
        end

      4'b0100: // opcode is 0100
        begin
          regWrite  = 1;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b01;
        end

      4'b0101: // opcode is 0101
        begin
          regWrite  = 1;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b01;
        end

      4'b0110: // opcode is 0110
  begin
          regWrite  = 1;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b10;
        end

      4'b0111: // opcode is 0111
        begin
          regWrite  = 1;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b11;
        end

      4'b1000: // opcode is 1000
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 1;
          memRead   = 1;
          memWrite  = 0;
          imme      = 1;
          ALUop     = 2'b00;
        end

      4'b1001: // opcode is 1001
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 1 ;
          Jump      = 1;
          jumpMem   = 1;
          memRead   = 1;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b00;
        end

      4'b1010: // opcode is 1010
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 1;
          memWrite  = 1;
          imme      = 1;
          ALUop     = 2'b10;
        end

      4'b1011: // opcode is 1011
        begin
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 1;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 1;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b00;
        end

      default: // for any other opcode
        begin
          // Assign default values here
          regWrite  = 0;
          memToReg  = 0;
          PCtoReg   = 0;
          branchN   = 0;
          branchZ   = 0;
          Jump      = 0;
          jumpMem   = 0;
          memRead   = 0;
          memWrite  = 0;
          imme      = 0;
          ALUop     = 2'b00;
        end
    endcase
  end
    
endmodule