module PC_PLUS_4(
    input  wire [31:0] pc,
    output wire [31:0] pc_plus_4
);
    assign pc_plus_4 = pc + 4;
endmodule
