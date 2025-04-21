module MUX (
    input [31:0] ip0,
    input [31:0] ip1,
    input sel,
    output [31:0] op
);
    assign op = sel ? ip1 : ip0;
endmodule
