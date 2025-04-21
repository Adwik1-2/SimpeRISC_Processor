module immx_op2(
    input [31:0] immx,
    input [31:0] op2,
    output [31:0] op2_out,
    input wire isImmediate
);

    MUX immx_mux (
        .ip0(op2),
        .ip1(immx),
        .sel(isImmediate),
        .op(op2_out)
    );

endmodule
