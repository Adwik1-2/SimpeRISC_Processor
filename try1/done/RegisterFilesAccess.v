module RegisterFilesAccess (
    input [31:0] inst,
    input isRet,
    input isSt,
    input [31:0] reg_data1,
    input [31:0] reg_data2,
    input [31:0] reg_data15,
    output [31:0] op1,
    output [31:0] op2
);

    wire [4:0] rd, rs1, rs2;

    assign rd  = inst[26:22];
    assign rs1 = isRet ? 5'd15 : inst[21:17];
    assign rs2 = isSt  ? rd     : inst[16:12];

    assign op1 = isRet ? reg_data15 : reg_data1;
    assign op2 = isSt  ? reg_data1  : reg_data2;

endmodule
