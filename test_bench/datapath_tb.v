`timescale 1ns / 1ps

module datapath_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [31:0] input1;
  reg [31:0] input2;

  // Outputs
  wire [31:0] output;

  // Instantiate the Unit Under Test (UUT)
  datapath dut (
    .clk(clk),
    .reset(reset),
    .input1(input1),
    .input2(input2),
    .output(output)
  );

  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 0;
    input1 = 0;
    input2 = 0;

    // Wait 100 ns for global reset to finish
    #100 reset = 1;

    // Test Stage 1
    input1 = 1;
    input2 = 2;
    #10;
    if (output !== 3) $error("Stage 1 failed");

    // Test Stage 2
    input1 = 3;
    input2 = 4;
    #10;
    if (output !== 7) $error("Stage 2 failed");

    // Test Stage 3
    input1 = 5;
    input2 = 6;
    #10;
    if (output !== 11) $error("Stage 3 failed");

    // Test Stage 4
    input1 = 7;
    input2 = 8;
    #10;
    if (output !== 15) $error("Stage 4 failed");

    $display("All tests passed");
    $finish;
  end

  always #5 clk = ~clk;

endmodule