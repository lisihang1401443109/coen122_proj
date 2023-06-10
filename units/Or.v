module Or (
    inA, inB, out
);

// declare the inputs and outputs and assign out = inA | inB
    input inA;
    input inB;
    output out;
    
    // perform bitwise OR operation
    assign out = inA | inB;

    
endmodule