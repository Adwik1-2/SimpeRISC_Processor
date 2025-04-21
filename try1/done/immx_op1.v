module immx_op1(
    input [31:0] output2,
    input [31:0] op1,
    output [31:0] op1_out,
    input wire isRet
);

    MUX immx_op_mux (
        .ip0(op1),
        .ip1(output2),
        .sel(isRet),
        .op(op1_out)
    );

endmodule
