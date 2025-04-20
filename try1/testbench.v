`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [31:0] a, b;
    reg [4:0] alu_control;

    // Outputs
    wire [31:0] result;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result)
    );

    // Dump signals for GTKWave
    initial begin
        $dumpfile("dump.vcd"); // File name for the waveform
        $dumpvars(0, ALU_tb);   // Referencing your testbench module to dump all signals
    end

    initial begin
        // Display header
        $display("Time\tControl\t\tA\t\tB\t\tResult");

        // Monitor values
        $monitor("%0t\t%05b\t%0d\t%0d\t%0d", $time, alu_control, a, b, result);

        // Test Addition
        a = 15; b = 10; alu_control = 5'b00000; #10;

        // Test Subtraction
        a = 15; b = 10; alu_control = 5'b00001; #10;

        // Test Multiplication
        a = 5; b = 3; alu_control = 5'b00010; #10;

        // Test Division
        a = 20; b = 4; alu_control = 5'b00011; #10;

        // Test Modulus
        a = 20; b = 6; alu_control = 5'b00100; #10;

        // Test CMP
        a = 7; b = 7; alu_control = 5'b00101; #10;
        a = 5; b = 8; alu_control = 5'b00101; #10;
        a = 9; b = 2; alu_control = 5'b00101; #10;

        // Test AND
        a = 8'hF0; b = 8'h0F; alu_control = 5'b00110; #10;

        // Test OR
        a = 8'hF0; b = 8'h0F; alu_control = 5'b00111; #10;

        // Test NOT
        a = 32'hFFFF0000; b = 0; alu_control = 5'b01000; #10;

        // Test Logical Shift Left
        a = 32'h0000000F; b = 2; alu_control = 5'b01001; #10;

        // Test Logical Shift Right
        a = 32'hF0000000; b = 4; alu_control = 5'b01010; #10;

        // Test Arithmetic Shift Right
        a = 32'hF0000000; b = 4; alu_control = 5'b01011; #10;

        $finish;
    end

endmodule
