module MUX03(
    input [31:0] ip0,
    input [31:0] ip1,
    input [31:0] ip2,
    input sel1,
    input sel2,
    output reg [31:0] op
);

    always @(*) begin
        if (sel1 == 1'b1 && sel2 == 1'b0)
            op = ip2;
        else if (sel1 == 1'b0 && sel2 == 1'b1)
            op = ip1;
        else
            op = ip0;
    end

endmodule
