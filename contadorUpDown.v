module contadorUpDown(
	input clk,
	input rst,
	input [1:0] sel,
	input [7:0] d,

	output reg [7:0] q
);

	always@(posedge clk or negedge rst)
	begin 

		if (~rst==1'b1)
			q<=8'b0;
		else
			begin
			
				case(sel)
					2'b00: q <= d;
					2'b01: q <= q;
					2'b10: q <= q + 1;
					2'b11: q <= q - 1;
					default: q<=q;
				
				endcase
			end
	end


endmodule
