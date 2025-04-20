module immx_op2(
    input [31:0] immx,
    input [31:0] op2,
    output [31:0] op2_out,
    
    input wire isImmediate
);

    MUX immx_op2(
        .ip0(op2),
        .ip1(immx), //output of immmediate_branch.v
        .sel(isImmediate), // select immx
        .op(op2_out)
    )
    

endmodule


