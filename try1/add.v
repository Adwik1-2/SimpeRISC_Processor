module add1 (
    input [31:0] a, b,
    input c_in,
    output [31:0] sum,
    output c_out
);

    wire [31:0] s1, s2, s3;
    adder add_0(a[0], b[0],s1[0], c_in, s2[0]);
    adder add_1(a[1], b[1],s1[1], s2[0], s2[1]);
    adder add_2(a[2], b[2],s1[2], s2[1], s2[2]);
    adder add_3(a[3], b[3],s1[3], s2[2], s2[3]);
    adder add_4(a[4], b[4],s1[4], s2[3], s2[4]);
    adder add_5(a[5], b[5],s1[5], s2[4], s2[5]);
    adder add_6(a[6], b[6],s1[6], s2[5], s2[6]);
    adder add_7(a[7], b[7],s1[7], s2[6], s2[7]);
    adder add_8(a[8], b[8],s1[8], s2[7], s2[8]);
    adder add_9(a[9], b[9],s1[9], s2[8], s2[9]);
    adder add_10(a[10], b[10],s1[10], s2[9], s2[10]);
    adder add_11(a[11], b[11],s1[11], s2[10], s2[11]);
    adder add_12(a[12], b[12],s1[12], s2[11], s2[12]);
    adder add_13(a[13], b[13],s1[13], s2[12], s2[13]);
    adder add_14(a[14], b[14],s1[14], s2[13], s2[14]);
    adder add_15(a[15], b[15],s1[15], s2[14], s2[15]);
    adder add_16(a[16], b[16],s1[16], s2[15], s2[16]);
    adder add_17(a[17], b[17],s1[17], s2[16], s2[17]);
    adder add_18(a[18], b[18],s1[18], s2[17], s2[18]);
    adder add_19(a[19], b[19],s1[19], s2[18], s2[19]);
    adder add_20(a[20], b[20],s1[20], s2[19], s2[20]);
    adder add_21(a[21], b[21],s1[21], s2[20], s2[21]);
    adder add_22(a[22], b[22],s1[22], s2[21], s2[22]);
    adder add_23(a[23], b[23],s1[23], s2[22], s2[23]);
    adder add_24(a[24], b[24],s1[24], s2[23], s2[24]);
    adder add_25(a[25], b[25],s1[25], s2[24], s2[25]);
    adder add_26(a[26], b[26],s1[26], s2[25], s2[26]);
    adder add_27(a[27], b[27],s1[27], s2[26], s2[27]);
    adder add_28(a[28], b[28],s1[28], s2[27], s2[28]);
    adder add_29(a[29], b[29],s1[29], s2[28], s2[29]);
    adder add_30(a[30], b[30],s1[30], s2[29], s2[30]);
    adder add_31(a[31], b[31],s1[31], s2[30], c_out);
    assign sum = s1[31:0];
endmodule