module RegisterFetch (
    input  wire [31:0] inst,
    input  wire        isRet,
    input  wire        isSt,
    input  wire [31:0] reg_data1,
    input  wire [31:0] reg_data2,
    input  wire [31:0] reg_data15,
    output wire [31:0] op1,
    output wire [31:0] op2
);
    wire [4:0] rs1, rs2, rd;

    assign rd  = inst[26:22];
    assign rs1 = isRet ? 5'd15 : inst[21:17];
    assign rs2 = isSt  ? rd     : inst[16:12];

    assign op1 = isRet ? reg_data15 : reg_data1;
    assign op2 = isSt  ? reg_data1  : reg_data2;

endmodule
