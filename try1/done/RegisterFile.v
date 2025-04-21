module RegisterFile (
    input clk,
    input reg_write,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] write_data,
    output [31:0] reg_data1,
    output [31:0] reg_data2
);

    reg [31:0] registers[0:31];

    assign reg_data1 = registers[rs];
    assign reg_data2 = registers[rt];

    always @(posedge clk) begin
        if (reg_write)
            registers[rd] <= write_data;
    end

endmodule
