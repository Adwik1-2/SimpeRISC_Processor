module immx_op1(
    input [31:0] output2,
    input [31:0] op1,
    output [31:0] op1_out,
    input wire isRet,
);

    MUX immx_op2(
        .ip0(op1),
        .ip1(output2), //output of immmediate_branch.v
        .sel(isRet), // select immx
        .op(op1_out)
    )
    

endmodule