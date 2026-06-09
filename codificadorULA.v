module codificadorULA(ULA_y, ULA_add, ULA_and, ULA_or, ULA_not, selULA);
    input ULA_y, ULA_add, ULA_and, ULA_or, ULA_not;
    output reg [2:0] selULA;
    
    always @ (*)
    begin
        if (ULA_add) begin
            selULA = 3'b000;
        end
        else if (ULA_and) begin
            selULA = 3'b001;
        end
        else if (ULA_or) begin
            selULA = 3'b010;
        end
        else if (ULA_not) begin
            selULA = 3'b011;
        end
        else if (ULA_y) begin
            selULA = 3'b100;
        end
        else begin
            selULA = 3'b000;
        end
    end
    
endmodule
