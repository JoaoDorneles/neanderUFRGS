module incrementaPC(x, result);
	input  [7:0] x;
	output [7:0] result;
	
	wire [7:0] c;
	
	// bit 0: x[0] + 1 (carry fixo = 1)
	ha ha0(x[0], 1'b1, c[0], result[0]);
	
	// bits 1 a 7: x[i] + carry anterior
	ha ha1(x[1], c[0], c[1], result[1]);
	ha ha2(x[2], c[1], c[2], result[2]);
	ha ha3(x[3], c[2], c[3], result[3]);
	ha ha4(x[4], c[3], c[4], result[4]);
	ha ha5(x[5], c[4], c[5], result[5]);
	ha ha6(x[6], c[5], c[6], result[6]);
	ha ha7(x[7], c[6], c[7], result[7]);
	
	// c[7] seria o overflow do PC, ignorado
	
endmodule
