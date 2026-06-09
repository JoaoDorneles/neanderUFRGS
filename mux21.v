module mux21(x, y, sel, saida);
	input [7:0] x, y;
	input sel;
	output [7:0] saida;
	
	assign saida = (sel == 1'b0) ? x : y;
	
endmodule
