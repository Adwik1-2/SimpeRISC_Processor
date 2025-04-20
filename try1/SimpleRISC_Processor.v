module SimpleRISC_Processor(
    input clk,
    input reset
);
    wire [31:0] pc, next_pc, pc_plus4, instruction;
    wire [31:0] imm_ext, reg_data1, reg_data2, alu_in2, alu_out;
    wire [31:0] mem_data_out, write_data;
    wire [31:0] branch_target;
    wire [3:0] alu_control;
    wire [1:0] mem_to_reg, reg_dst, alu_src;
    wire reg_write, mem_read, mem_write, branch, jump, isRet;
    wire [4:0] reg_write_dest;

    // PC register
    PC pc_reg (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc(pc)
    );

    // Instruction Memory
    InstructionMemory imem (
        .addr(pc),
        .instruction(instruction)
    );

    assign pc_plus4 = pc + 4;

    // Control Unit

    
    ControlUnit cu (
        .opcode(instruction[31:24]),
        .reg_dst(reg_dst),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .jump(jump),
        .alu_control(alu_control),
        .isRet(isRet)
    );

    // Register File
    RegisterFile rf (
        .clk(clk),
        .reg_write(reg_write),
        .rs(instruction[23:19]),
        .rt(instruction[18:14]),
        .rd(reg_write_dest),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );

    // Immediate generator
    assign imm_ext = {{16{instruction[15]}}, instruction[15:0]};  // Sign extend

    // ALU source mux
    assign alu_in2 = (alu_src == 2'b00) ? reg_data2 :
                     (alu_src == 2'b01) ? imm_ext :
                     32'bx;

    // ALU
    ALU alu (
        .a(reg_data1),
        .b(alu_in2),
        .alu_control(alu_control),
        .result(alu_out)
    );

    // Memory Unit
    DataMemory dmem (
        .clk(clk),
        .addr(alu_out),
        .write_data(reg_data2),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .read_data(mem_data_out)
    );

    // Writeback mux
    assign write_data = (mem_to_reg == 2'b00) ? alu_out :
                        (mem_to_reg == 2'b01) ? mem_data_out :
                        (mem_to_reg == 2'b10) ? pc_plus4 :
                        32'bx;

    // RegDst Mux
    assign reg_write_dest = (reg_dst == 2'b00) ? instruction[18:14] :
                            (reg_dst == 2'b01) ? instruction[13:9] :
                            (reg_dst == 2'b10) ? 5'b11111 : // return addr
                            5'bx;

    // Branch logic
    assign branch_target = pc + imm_ext;
    assign next_pc = isRet ? reg_data1 :
                     branch ? branch_target :
                     pc_plus4;

endmodule
