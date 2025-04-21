module aftermux(
    input [31:0] aluResult,
    input [31:0] ldResult,
    input [31:0] pc,
    output [31:0] data,
    input isLd,
    input isCall
);

    wire [31:0] pc_plus_4;
    assign pc_plus_4 = pc + 4;

    MUX03 m1 (
        .ip0(aluResult),
        .ip1(ldResult),
        .ip2(pc_plus_4),
        .sel1(isLd),
        .sel2(isCall),
        .op(data)
    );

endmodule
