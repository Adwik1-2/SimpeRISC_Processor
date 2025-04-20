module PC_PLUS_4(

    input [31:0] pc,
    output reg [31:0] pc_plus_4
);
    assign pc_plus_4 = pc + 4;
endmodule
