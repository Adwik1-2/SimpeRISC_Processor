module Register_f_access(
    input wire [31:0] inst,
    output wire [31:0] op1,op2,    
    input wire isSt,
    input wire isRet
);
    wire [3:0] rs1,rs2,rd,ra;
    wire [3:0] mux_out1,mux_out2;
    assign ra=4'b1111; // ra is the register address
    assign rs1 = inst[19:22]; // rs1 is the first source register
    assign rd = inst[23:26]; // rd is the destination register
    assign rs2 = inst[15:18]; // rs2 is the second source register
    
    MUX_4_BIT mux_inst (
        .ip0(rs2),
        .ip1(rd),
        .sel(isSt),
        .op(mux_out1)
    );
    
    MUX_4_BIT mux_inst1 (
        .ip0(rs1),
        .ip1(ra),
        .sel(isRet),
        .op(mux_out1)
    );

    reg [31:0] registers [0:15]; // 16 registers of 32 bits each

    assign op1 = registers[mux_out1]; // output of the first source register
    assign op2 = registers[mux_out2]; // output of the second source register
    
endmodule