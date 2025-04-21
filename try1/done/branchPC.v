module branchPC(
    input wire isBeq,
    input wire isBgt,
    input wire flagsE,
    input wire flagsGT,
    input wire [31:0] branchTarget,
    input wire [31:0] op1,
    input wire isRet,
    input wire isUBranch,
    output wire [31:0] branchPC,
    output wire isBranchTaken
);

    wire f1, f2, f3, f4;

    and d1(f1, isBeq, flagsE);
    and d2(f2, isBgt, flagsGT);
    or d3(f3, f1, f2);
    or d4(f4, isUBranch, f3);

    assign isBranchTaken = f4;

    MUX m1 (
        .ip0(branchTarget),
        .ip1(op1),
        .sel(isRet),
        .op(branchPC)
    );

endmodule
