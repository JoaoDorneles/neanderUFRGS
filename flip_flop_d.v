module flip_flop_d(input clk, rst, d,
							output reg q);
							
	//always@(posedge clk) <-- deixa o reset sincrono
	
	always@(posedge clk or posedge rst) //reset assincrono
	begin
		if(rst == 1'b1)
			q <= 1'b0;
		else
			q <= d; //p/ registradores usamos "<=" (non-blocking statement)
	
	end
			
							
endmodule
