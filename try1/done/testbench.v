`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg rst;

    // Instantiate the processor
    SimpleRISC_Processor uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period => 100 MHz clock
    end

    // Reset and simulation sequence
    initial begin
        $display("Starting simulation...");

        // === VCD DUMP SETUP ===
        $dumpfile("cpu.vcd");                    // Name of the VCD file
        $dumpvars(0, testbench);                 // Dump everything under this module
        // Optional: $dumpvars(1, uut);           // Or dump signals under processor only
        // =======================

        rst = 1;
        #10;
        rst = 0;

        #200;  // Simulation run time

        $display("Simulation finished.");
        $finish;
    end

endmodule
