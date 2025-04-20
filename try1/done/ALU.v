module ALU (
    input [31:0] a, b,d,
    input [4:0] alu_control,sel,
    output reg [31:0] result
);
    wire [31:0] sum, diff, y, z, x;
    wire c_out, b_out;
    wire flag;
    wire flagsE,flagsGT;
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
        case (alu_control)
            5'b00000: result = sum;
            5'b00001: result = diff;
            5'b00010: result = a * b;
            5'b00011: result = (b != 0) ? (a / b) : 32'b0;
            5'b00100: result = (b != 0) ? (a % b) : 32'b0;
            5'b00101: result = (a == b) ? 0 : ((a < b) ? -1 : 1);
            5'b00110: result = a & b;
            5'b00111: result = a | b;
            5'b01000: result = ~a;
            5'b01001: result = a<<b;
            5'b01010: result = a>>b;
            5'b01011: result = a>>>b;
            default: result = 32'b0;
        endcase

        if(a==b)
            assign flag = 0'b1;
        else if(a>b)
            assign flag = 1'b0;

        if flag == 0'b1
            assign flagsE = 1'b1;
        else if flag == 1'b0
            assign flagsGT = 1'b1;
    end
endmodule
