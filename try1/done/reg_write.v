module to_reg_file (
    input [3:0] rd,             // Destination register from instruction
    input [3:0] ra,             // Register 15 (return address register)
    input [31:0] aluResult,
    input [31:0] ldResult,
    input [31:0] pc,
    input isCall,
    input isLd,
    input isWb,

    output [3:0] reg1,          // Final register address to write to
    output [31:0] writeData,    // Final data to write
    output writeEnable          // Register write enable
);

    wire [31:0] pc_plus_4;
    assign pc_plus_4 = pc + 4;

    // 3-input result selection
    assign writeData = isCall     ? pc_plus_4 :
                       isLd       ? ldResult :aluResult;

    // Register address mux
    MUX_4_BIT mux_inst (
        .ip0(rd),
        .ip1(ra),
        .sel(isCall),
        .op(reg1)
    );

    // Enable is simply isWb
    assign writeEnable = isWb;

endmodule
