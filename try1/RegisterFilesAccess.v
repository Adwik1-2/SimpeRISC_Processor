module RegisterFetch (
    input  wire [31:0] inst,
    input  wire isRet,
    input  wire isSt,
    input  wire [31:0] regFile [0:31],  // Register file as an input for simplicity
    output wire [31:0] op1,
    output wire [31:0] op2
);

    wire [4:0] rs1, rs2, rd;

    assign rd  = inst[23:26];
    assign rs1 = isRet ? 5'd15 : inst[19:22];  // Mux for rs1
    assign rs2 = isSt  ? rd     : inst[15:18]; // Mux for rs2

    assign op1 = regFile[rs1];
    assign op2 = regFile[rs2];

endmodule
