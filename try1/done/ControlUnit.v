module control_unit (
    input [4:0] opcode,          // 5-bit opcode
    output reg isRet,
    output reg isSt,
    output reg isWb,
    output reg isImmediate,
    output reg isBeq,
    output reg isBgt,
    output reg isUBranch,
    output reg isLd,
    output reg isCall
);

    always @(*) begin
        // Default: all signals off
        isRet       = 0;
        isSt        = 0;
        isWb        = 0;
        isImmediate = 0;
        isBeq       = 0;
        isBgt       = 0;
        isUBranch   = 0;
        isLd        = 0;
        isCall      = 0;

        case (opcode)
            5'b00000: begin // R-type instruction
                isWb = 1;
            end

            5'b00001: begin // Immediate ALU instruction
                isImmediate = 1;
                isWb = 1;
            end

            5'b00010: begin // Load
                isLd = 1;
                isWb = 1;
            end

            5'b00011: begin // Store
                isSt = 1;
            end

            5'b00100: begin // BEQ
                isBeq = 1;
                isUBranch = 1;
            end

            5'b00101: begin // BGT
                isBgt = 1;
                isUBranch = 1;
            end

            5'b00110: begin // CALL
                isCall = 1;
            end

            5'b00111: begin // RETURN
                isRet = 1;
            end

            default: begin
                // All signals remain 0
            end
        endcase
    end

endmodule
