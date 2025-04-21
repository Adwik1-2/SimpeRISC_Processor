module ALU_Block (
    input  wire [31:0] op1,
    input  wire [31:0] op2,
    input  wire [31:0] immx,
    input  wire        isImmediate,
    input  wire [4:0]  aluSignals,
    output wire [31:0] aluResult
);

    wire [31:0] mux_out;

    MUX mux_inst (
        .ip0(op2),
        .ip1(immx),
        .sel(isImmediate),
        .op(mux_out)
    );

    ALU alu_inst (
        .a(op1),
        .b(mux_out),
        .d(32'd0),
        .alu_control(aluSignals),
        .sel(5'd0),
        .result(aluResult)
    );

endmodule
