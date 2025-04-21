# SimpleRISC Processor

## Overview
This project implements a SimpleRISC Processor using Verilog. The processor is designed to execute a subset of RISC instructions and includes various modules for instruction decoding, execution, memory access, and write-back stages. The design is modular, making it easy to understand and extend.

## Project Structure
The project is organized into the following files and modules:

### Core Modules
- **SimpleRISC_Processor.v**: The top-level module that integrates all components of the processor.
- **ControlUnit.v**: Handles the control signals for the processor.
- **ALU.v**: Performs arithmetic and logical operations.
- **BranchEXECU.v**: Handles branch execution logic.
- **InstructionMemory.v**: Stores the program instructions.
- **DataMemory.v**: Handles data storage and retrieval.
- **RegisterFile.v**: Implements the register file for the processor.

### Supporting Modules
- **4_bit_mux.v**: A 4-bit multiplexer.
- **add.v / adder.v**: Modules for addition operations.
- **subtract.v / subtractor.v**: Modules for subtraction operations.
- **mux.v / mux0-3.v**: Multiplexer modules for data selection.
- **pc_plus_4.v**: Calculates the next program counter value.
- **PC.v**: Program counter module.
- **memory_unit.v**: Handles memory operations.
- **immediate_branch.v**: Calculates branch target addresses.
- **immx_op1.v / immx_op2.v**: Immediate value extraction modules.

### Testbench
- **testbench.v**: Contains the testbench for simulating and verifying the processor's functionality.

### Additional Files
- **program.hex**: Contains the machine code for the program to be executed by the processor.
- **cpu.vcd**: Value Change Dump file for waveform analysis.

## Features
- Modular design for easy understanding and extension.
- Implements a subset of RISC instructions.
- Includes a testbench for simulation and verification.
- Supports branching, arithmetic, and memory operations.

## How to Use
1. Open the project in a Verilog-compatible IDE or simulator.
2. Load the `testbench.v` file to simulate the processor.
3. Use the `program.hex` file to load custom instructions for execution.
4. Analyze the output using the `cpu.vcd` file in a waveform viewer.

## Future Work
- Extend the instruction set to include more RISC instructions.
- Optimize the design for better performance.
- Add support for pipelining.

## Author
This project was developed by [Your Name].