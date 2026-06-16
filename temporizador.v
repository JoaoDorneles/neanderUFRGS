module temporizador(
	input clk, rst, hlt, goto_t0,
	output t7, t6, t5, t4, t3, t2, t1, t0
);

	//estados atuais dos flip-flops
	wire q2, q1, q0;
	
	//proximos estados (entrada d do flip-flop)
	wire d2, d1, d0;
	
	wire inc2, inc1, inc0;
	
	//logica do incrementador
	assign inc0 = ~q0;
	assign inc1 = q1 ^ q0;
	assign inc2 = q2 ^ (q1 & q0);
	
	assign d0 = ~goto_t0 & ((hlt & q0) | (~hlt & inc0));
	assign d1 = ~goto_t0 & ((hlt & q1) | (~hlt & inc1));
	assign d2 = ~goto_t0 & ((hlt & q2) | (~hlt & inc2));
	
	flip_flop_d ff0(.clk(clk), .rst(rst), .d(d0), .q(q0));
	flip_flop_d ff1(.clk(clk), .rst(rst), .d(d1), .q(q1));
	flip_flop_d ff2(.clk(clk), .rst(rst), .d(d2), .q(q2));

	
	//decodificador de saida
	assign t7 =  q2 &  q1 &  q0;
	assign t6 =  q2 &  q1 & ~q0;
	assign t5 =  q2 & ~q1 &  q0;
	assign t4 =  q2 & ~q1 & ~q0;
	assign t3 = ~q2 &  q1 &  q0;
	assign t2 = ~q2 &  q1 & ~q0;
	assign t1 = ~q2 & ~q1 &  q0;
	assign t0 = ~q2 & ~q1 & ~q0;

endmodule
	