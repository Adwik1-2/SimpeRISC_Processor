module ControlUnit (
    input [4:0] opcode,
    output reg [1:0] reg_dst, alu_src, mem_to_reg,
    output reg reg_write, mem_read, mem_write, branch, jump, isRet,
    output reg [3:0] alu_control
);
    always @(*) begin
        // Default
        reg_dst = 2'b00; alu_src = 2'b00; mem_to_reg = 2'b00;
        reg_write = 0; mem_read = 0; mem_write = 0; branch = 0; jump = 0; isRet = 0;
        alu_control = 4'b0000;

        case(opcode)
            8'h01: begin // ADD
                reg_dst = 2'b01; alu_src = 2'b00; alu_control = 4'b0000;
                reg_write = 1;
            end
            8'h02: begin // SUB
                reg_dst = 2'b01; alu_src = 2'b00; alu_control = 4'b0001;
                reg_write = 1;
            end
            8'h03: begin // LW
                reg_dst = 2'b00; alu_src = 2'b01; alu_control = 4'b0000;
                mem_read = 1; mem_to_reg = 2'b01; reg_write = 1;
            end
            8'h04: begin // SW
                alu_src = 2'b01; alu_control = 4'b0000;
                mem_write = 1;
            end
            8'h05: begin // BEQ
                alu_control = 4'b0001;
                branch = 1;
            end
            8'h06: begin // JUMP
                jump = 1;
            end
            8'h07: begin // RET
                isRet = 1;
            end
        endcase
    end
endmodule
