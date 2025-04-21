module sub1(
    input [31:0] a, b,     // 32-bit inputs
    input b_in,             // Single borrow-in input
    output [31:0] diff,     // 32-bit output difference
    output b_out            // Single borrow-out
);
    wire [31:0] borrow;     // Wire to hold borrow values for each bit

    // First bit subtractor
    subtractor s_1(a[0], b[0], diff[0], b_in, borrow[0]);

    // Second to thirty-first bit subtractors (borrow passed sequentially)
    subtractor s_2(a[1], b[1], diff[1], borrow[0], borrow[1]);
    subtractor s_3(a[2], b[2], diff[2], borrow[1], borrow[2]);
    subtractor s_4(a[3], b[3], diff[3], borrow[2], borrow[3]);
    subtractor s_5(a[4], b[4], diff[4], borrow[3], borrow[4]);
    subtractor s_6(a[5], b[5], diff[5], borrow[4], borrow[5]);
    subtractor s_7(a[6], b[6], diff[6], borrow[5], borrow[6]);
    subtractor s_8(a[7], b[7], diff[7], borrow[6], borrow[7]);
    subtractor s_9(a[8], b[8], diff[8], borrow[7], borrow[8]);
    subtractor s_10(a[9], b[9], diff[9], borrow[8], borrow[9]);
    subtractor s_11(a[10], b[10], diff[10], borrow[9], borrow[10]);
    subtractor s_12(a[11], b[11], diff[11], borrow[10], borrow[11]);
    subtractor s_13(a[12], b[12], diff[12], borrow[11], borrow[12]);
    subtractor s_14(a[13], b[13], diff[13], borrow[12], borrow[13]);
    subtractor s_15(a[14], b[14], diff[14], borrow[13], borrow[14]);
    subtractor s_16(a[15], b[15], diff[15], borrow[14], borrow[15]);
    subtractor s_17(a[16], b[16], diff[16], borrow[15], borrow[16]);
    subtractor s_18(a[17], b[17], diff[17], borrow[16], borrow[17]);
    subtractor s_19(a[18], b[18], diff[18], borrow[17], borrow[18]);
    subtractor s_20(a[19], b[19], diff[19], borrow[18], borrow[19]);
    subtractor s_21(a[20], b[20], diff[20], borrow[19], borrow[20]);
    subtractor s_22(a[21], b[21], diff[21], borrow[20], borrow[21]);
    subtractor s_23(a[22], b[22], diff[22], borrow[21], borrow[22]);
    subtractor s_24(a[23], b[23], diff[23], borrow[22], borrow[23]);
    subtractor s_25(a[24], b[24], diff[24], borrow[23], borrow[24]);
    subtractor s_26(a[25], b[25], diff[25], borrow[24], borrow[25]);
    subtractor s_27(a[26], b[26], diff[26], borrow[25], borrow[26]);
    subtractor s_28(a[27], b[27], diff[27], borrow[26], borrow[27]);
    subtractor s_29(a[28], b[28], diff[28], borrow[27], borrow[28]);
    subtractor s_30(a[29], b[29], diff[29], borrow[28], borrow[29]);
    subtractor s_31(a[30], b[30], diff[30], borrow[29], borrow[30]);
    subtractor s_32(a[31], b[31], diff[31], borrow[30], borrow[31]);

    // The final borrow-out is from the last subtractor
    assign b_out = borrow[31:0];
endmodule
