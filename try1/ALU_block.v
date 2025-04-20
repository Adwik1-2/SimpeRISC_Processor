module ALU_Block (
    input  wire [31:0] op1,
    input  wire [31:0] op2,
    input  wire [31:0] immx,
    input  wire        isImmediate,     // control signal to select op2 or immx
    input  wire [4:0]  aluSignals,     // select operation
    output wire [31:0] aluResult
);

    wire [31:0] mux_out;

    // MUX between op2 and immx
    MUX mux_inst (
        .ip0(op2),
        .ip1(immx),
        .sel(isImmediate),
        .op(mux_out)
    );

    // ALU instance
    ALU alu_inst (
        .a(op1),
        .b(mux_out),
        .d(32'd0),               // not used in your ALU, but needs to be connected
        .alu_control(aluSignals), // control signals for ALU operation
        .sel(5'd0),              // not used in your ALU, but required due to port
        .result(aluResult)
    );

endmodule
