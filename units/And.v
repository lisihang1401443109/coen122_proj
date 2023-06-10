module And (
    inA, inB, out
);

// declare the inputs and outputs (1 bit each)
// return to out
    input inA;
    input inB;
    output out;
    
    // perform bitwise OR operation
    assign out = inA & inB;


endmodule