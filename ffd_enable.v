module ffd_enable(clk, reset, enable, d, q);
	input  clk, reset, enable, d;
	output reg q;
	
	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			q <= 1'b0;
		else if (enable)
			q <= d;
	end
	
endmodule
