module PC(clk, reset, cargaPC, incrementaPC, d, q);
	input        clk, reset, cargaPC, incrementaPC;
	input  [7:0] d;
	output [7:0] q;
	
	wire [7:0] q_inc;     // saída do incrementador
	wire [7:0] d_mux1;    // saída do mux de incremento
	wire [7:0] d_final;   // entrada final nos flip-flops
	wire       enable;    // habilita os FFDs
	
	// incrementa o valor atual do PC
	incrementaPC inc(q, q_inc);
	
	// mux1: escolhe entre valor externo (d) ou valor incrementado
	// sel=0 -> d externo (cargaPC), sel=1 -> incrementado
	mux21 mux_inc(d, q_inc, incrementaPC, d_mux1);
	
	// mux2: escolhe entre manter (q atual) ou novo valor (d_mux1)
	// sel=0 -> mantém q, sel=1 -> carrega d_mux1
	mux21 mux_carga(q, d_mux1, cargaPC, d_final);
	
	// enable: habilita FFDs se cargaPC OU incrementaPC estiver ativo
	assign enable = cargaPC | incrementaPC;
	
	// 8 flip-flops D em paralelo
	ffd_enable ffd0(clk, reset, enable, d_final[0], q[0]);
	ffd_enable ffd1(clk, reset, enable, d_final[1], q[1]);
	ffd_enable ffd2(clk, reset, enable, d_final[2], q[2]);
	ffd_enable ffd3(clk, reset, enable, d_final[3], q[3]);
	ffd_enable ffd4(clk, reset, enable, d_final[4], q[4]);
	ffd_enable ffd5(clk, reset, enable, d_final[5], q[5]);
	ffd_enable ffd6(clk, reset, enable, d_final[6], q[6]);
	ffd_enable ffd7(clk, reset, enable, d_final[7], q[7]);
	
endmodule
