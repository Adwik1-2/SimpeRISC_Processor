module MUX_4_BIT(
    input [3:0] ip0
    input [3:0] ip1,
    input sel,
    output [3:0] op
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
