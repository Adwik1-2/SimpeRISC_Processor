module asr(
    input  [31:0] d,       // Input data
    input  [4:0]  sel,     // Shift amount (0–31)
    output [31:0] x        // Output after arithmetic right shift
);
    wire [31:0] stage1, stage2, stage3, stage4, stage5;

    // Get sign bit (MSB of input)
    wire sign = d[31];

    // Stage 1: shift by 1 if sel[0] is set
    assign stage1[31] = sel[0] ? sign : d[31];
    genvar i1;
    generate
        for (i1 = 0; i1 < 31; i1 = i1 + 1) begin : gen_stage1
            assign stage1[i1] = sel[0] ? d[i1+1] : d[i1];
        end
    endgenerate

    // Stage 2: shift by 2 if sel[1] is set
    assign stage2[31] = sel[1] ? sign : stage1[31];
    assign stage2[30] = sel[1] ? sign : stage1[30];
    genvar i2;
    generate
        for (i2 = 0; i2 < 30; i2 = i2 + 1) begin : gen_stage2
            assign stage2[i2] = sel[1] ? stage1[i2+2] : stage1[i2];
        end
    endgenerate

    // Stage 3: shift by 4 if sel[2] is set
    genvar i3;
    generate
        for (i3 = 0; i3 < 28; i3 = i3 + 1) begin : gen_stage3
            assign stage3[i3] = sel[2] ? stage2[i3+4] : stage2[i3];
        end
    endgenerate
    assign stage3[28] = sel[2] ? sign : stage2[28];
    assign stage3[29] = sel[2] ? sign : stage2[29];
    assign stage3[30] = sel[2] ? sign : stage2[30];
    assign stage3[31] = sel[2] ? sign : stage2[31];

    // Stage 4: shift by 8 if sel[3] is set
    genvar i4;
    generate
        for (i4 = 0; i4 < 24; i4 = i4 + 1) begin : gen_stage4
            assign stage4[i4] = sel[3] ? stage3[i4+8] : stage3[i4];
        end
    endgenerate
    assign stage4[24] = sel[3] ? sign : stage3[24];
    assign stage4[25] = sel[3] ? sign : stage3[25];
    assign stage4[26] = sel[3] ? sign : stage3[26];
    assign stage4[27] = sel[3] ? sign : stage3[27];
    assign stage4[28] = sel[3] ? sign : stage3[28];
    assign stage4[29] = sel[3] ? sign : stage3[29];
    assign stage4[30] = sel[3] ? sign : stage3[30];
    assign stage4[31] = sel[3] ? sign : stage3[31];

    // Stage 5: shift by 16 if sel[4] is set
    genvar i5;
    generate
        for (i5 = 0; i5 < 16; i5 = i5 + 1) begin : gen_stage5
            assign stage5[i5] = sel[4] ? stage4[i5+16] : stage4[i5];
        end
    endgenerate
    assign stage5[16] = sel[4] ? sign : stage4[16];
    assign stage5[17] = sel[4] ? sign : stage4[17];
    assign stage5[18] = sel[4] ? sign : stage4[18];
    assign stage5[19] = sel[4] ? sign : stage4[19];
    assign stage5[20] = sel[4] ? sign : stage4[20];
    assign stage5[21] = sel[4] ? sign : stage4[21];
    assign stage5[22] = sel[4] ? sign : stage4[22];
    assign stage5[23] = sel[4] ? sign : stage4[23];
    assign stage5[24] = sel[4] ? sign : stage4[24];
    assign stage5[25] = sel[4] ? sign : stage4[25];
    assign stage5[26] = sel[4] ? sign : stage4[26];
    assign stage5[27] = sel[4] ? sign : stage4[27];
    assign stage5[28] = sel[4] ? sign : stage4[28];
    assign stage5[29] = sel[4] ? sign : stage4[29];
    assign stage5[30] = sel[4] ? sign : stage4[30];
    assign stage5[31] = sel[4] ? sign : stage4[31];

    assign x = stage5;
endmodule
