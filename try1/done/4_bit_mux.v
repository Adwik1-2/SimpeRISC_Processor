module MUX_4_BIT(
    input [3:0] ip0,
    input [3:0] ip1,
    input sel,
    output [3:0] op
);
    assign op = (sel) ? ip1 : ip0;
endmodule
