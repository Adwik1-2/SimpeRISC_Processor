module InstructionFetch (
    input wire clk,                           // Clock signal
    input wire reset,                        // Reset signal
    input wire [31:0] branchPC,               // Branch target PC
    input wire [31:0] isBranchTaken,          // LSB decides if branch is taken
    output wire [31:0] inst,                  // Fetched instruction
    output wire [31:0] pc_out                 // Current PC (for pipeline use)
);

    reg [31:0] pc;                            // Program counter

    wire [31:0] pc_plus4;
    wire [31:0] next_pc;

    assign pc_out = pc;

    // PC + 4 logic
    assign pc_plus4 = pc + 32'd4;

    // MUX for next PC
    assign next_pc = isBranchTaken[0] ? branchPC : pc_plus4;

    // Instruction memory (assuming synchronous read here)
    InstructionMemory imem (
        .addr(pc),
        .inst(inst)
    );

    // PC update logic on negative edge
    always @(negedge clk or posedge reset) begin
        if (reset)
            pc <= 32'b0;
        else
            pc <= next_pc;
    end

endmodule
