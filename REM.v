module REM(clk, rst, cargaREM, d, q);
	input        clk, rst, cargaREM;
	input  [7:0] d;
	output [7:0] q;
	
	// 8 flip-flops D em paralelo, um por bit
	ffd_enable ffd0(clk, rst, cargaREM, d[0], q[0]);
	ffd_enable ffd1(clk, rst, cargaREM, d[1], q[1]);
	ffd_enable ffd2(clk, rst, cargaREM, d[2], q[2]);
	ffd_enable ffd3(clk, rst, cargaREM, d[3], q[3]);
	ffd_enable ffd4(clk, rst, cargaREM, d[4], q[4]);
	ffd_enable ffd5(clk, rst, cargaREM, d[5], q[5]);
	ffd_enable ffd6(clk, rst, cargaREM, d[6], q[6]);
	ffd_enable ffd7(clk, rst, cargaREM, d[7], q[7]);
	
endmodule
