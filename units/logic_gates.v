module or (
    in1, in2, out
);

input in1, in2;
output out;

assign out = in1|in2;
    
endmodule

module and (
    in1, in2, out
);

input in1, in2;
output out;

assign out = in1&in2;

endmodule

module not (
    in, out
);

input in;
output out;

assign out = ~in;
    
endmodule