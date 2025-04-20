module MUX(
    input [31:0] ip0
    input [31:0] ip1,
    input sel,
    output [31:0] op
);
    if(sel) 
        begin
            assign op = ip1;
        end 
    else 
        begin
            assign op = ip0;
        end
endmodule
