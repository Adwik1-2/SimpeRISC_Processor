module Immediate_Branch_Target(
    input  wire [31:0] pc,
    input  wire [31:0] instruction,
    output reg  [31:0] immx,
    output reg  [31:0] output2
);

    always @(*) begin
        begin
            
            immx = {{14{instruction[17]}}, instruction[17:0]};  
            output2 = pc + {{3{instruction[26]}}, instruction[26:0], 2'b00};  
        end
    end

endmodule
