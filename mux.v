module mux(pc,rdm,sel,saida);
	input [7:0] pc,rdm;
	input sel;
	output reg [7:0] saida;
	
	always @ (*)
	begin
		
		if (sel == 1'b0)
			saida = pc;
		else
			saida = rdm;
			
	end
	
endmodule
