module ALU (
    input [31:0] a, b, d,
    input [4:0] alu_control, sel,
    output reg [31:0] result
);
    wire [31:0] sum, diff;
    wire c_out, b_out;

    reg flag;
    reg flagsE, flagsGT;

    // Adder
    add1 adder (
        .a(a),
        .b(b),
        .c_in(1'b0),
        .sum(sum),
        .c_out(c_out)
    );

    // Subtractor
    sub1 sub (
        .a(a),
        .b(b),
        .b_in(1'b0),
        .diff(diff),
        .b_out(b_out)
    );

    always @(*) begin
        flagsE = 0;
        flagsGT = 0;

        case (alu_control)
            5'b00000: result = sum;
            5'b00001: result = diff;
            5'b00010: result = a * b;
            5'b00011: result = (b != 0) ? (a / b) : 32'd0;
            5'b00100: result = (b != 0) ? (a % b) : 32'd0;
            5'b00101: result = (a == b) ? 32'd0 : ((a < b) ? -32'd1 : 32'd1);
            5'b00110: result = a & b;
            5'b00111: result = a | b;
            5'b01000: result = ~a;
            5'b01001: result = a << b;
            5'b01010: result = a >> b;
            5'b01011: result = a >>> b;
            default: result = 32'd0;
        endcase

        if (a == b)
            flag = 1;
        else if (a > b)
            flag = 0;

        if (flag == 1)
            flagsE = 1;
        else
            flagsGT = 1;
    end
endmodule
