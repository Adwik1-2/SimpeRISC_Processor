module memory_unit_simple (
    input isLd,                     // Load control signal (1 to read from memory)
    input isSt,                     // Store control signal (1 to write to memory)
    input [31:0] aluResult,         // Memory address (from ALU)
    input [31:0] op2,               // Data to store in memory
    output reg [31:0] ldResult      // Data loaded from memory (if isLd is 1)
);

    // Memory Address Register and Data Register
    reg [31:0] mar;                 // Memory Address Register
    reg [31:0] mdr;                 // Memory Data Register

    // Simple data memory: 1024 words of 32-bit each
    reg [31:0] data_memory [0:1023];

    always @(*) begin
        // Step 1: Save address into MAR
        mar = aluResult;

        // Step 2: If store is active, save data into memory
        if (isSt) begin
            mdr = op2; // store op2 into data register
            data_memory[mar[11:2]] = mdr; // write data into memory
        end

        // Step 3: If load is active, read data from memory
        if (isLd) begin
            mdr = data_memory[mar[11:2]]; // read memory into data register
            ldResult = mdr; // output the loaded data
        end else begin
            ldResult = 32'b0; // no load? output is zero
        end
    end
endmodule
