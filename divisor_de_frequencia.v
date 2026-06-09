module divisor_de_frequencia #(parameter N = 27)(
	input clk, reset,
	output freq_div
	
);

	wire [N-1:0] q;
	wire [N-1:0] d;
	
	assign d = ~q;
	assign rst = ~reset;

	//flip_flop_d(input clk, rst, d, output reg q);
	flip_flop_d ff0(clk, rst, d[0], q[0]);

	generate
		genvar i;
			for(i=0; i < N-1; i=i+1)
				begin: gen_for
				flip_flop_d ffN(q[i], rst, d[i+1], q[i+1]);
				end
	endgenerate
	
	assign freq_div = ~q[N-1];

endmodule
