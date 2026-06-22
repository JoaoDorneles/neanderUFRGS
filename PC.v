module PC(clk, reset, cargaPC, incrementaPC, d, q);
	input        clk, reset, cargaPC, incrementaPC;
	input  [7:0] d;
	output [7:0] q;
	
	wire [7:0] q_inc;    // saída do incrementador
	wire [7:0] d_final;  // entrada final nos flip-flops
	wire       enable;   // habilita os FFDs quando alguma operação está ativa
	
	// incrementa o valor atual do PC (PC + 1)
	incrementaPC inc(q, q_inc);
	
	// mux: escolhe O QUE carregar nos FFDs
	//   cargaPC = 0 -> seleciona q_inc (caminho natural, incremento)
	//   cargaPC = 1 -> seleciona d     (carga do RDM, ex: desvio/jump)
	mux21 mux_sel(q_inc, d, cargaPC, d_final);
	
	// enable: habilita os FFDs somente quando há uma operação ativa
	//   incrementaPC = 1 -> PC avança normalmente pelo código
	//   cargaPC      = 1 -> PC recebe valor externo do RDM
	//   ambos = 0        -> PC mantém valor atual (hold)
	assign enable = cargaPC | incrementaPC;
	
	// 8 flip-flops D em paralelo formam o registrador PC de 8 bits
	ffd_enable ffd0(clk, reset, enable, d_final[0], q[0]);
	ffd_enable ffd1(clk, reset, enable, d_final[1], q[1]);
	ffd_enable ffd2(clk, reset, enable, d_final[2], q[2]);
	ffd_enable ffd3(clk, reset, enable, d_final[3], q[3]);
	ffd_enable ffd4(clk, reset, enable, d_final[4], q[4]);
	ffd_enable ffd5(clk, reset, enable, d_final[5], q[5]);
	ffd_enable ffd6(clk, reset, enable, d_final[6], q[6]);
	ffd_enable ffd7(clk, reset, enable, d_final[7], q[7]);
	
endmodule
