module RI(clk, reset, cargaRI, d, q);
	input        clk, reset, cargaRI;
	input  [7:0] d;
	output [7:0] q;
	
	// apenas os 4 bits mais significativos são armazenados (opcode)
	ffd_enable ffd7(clk, reset, cargaRI, d[7], q[7]);
	ffd_enable ffd6(clk, reset, cargaRI, d[6], q[6]);
	ffd_enable ffd5(clk, reset, cargaRI, d[5], q[5]);
	ffd_enable ffd4(clk, reset, cargaRI, d[4], q[4]);
	
	// 4 bits menos significativos são don't care -> fixados em 0
	assign q[3] = 1'b0;
	assign q[2] = 1'b0;
	assign q[1] = 1'b0;
	assign q[0] = 1'b0;
	
endmodule
 