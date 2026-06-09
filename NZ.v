module NZ(clk, reset, cargaNZ, flagN, flagZ, qN, qZ);
	input  clk, reset, cargaNZ;
	input  flagN, flagZ;
	output qN, qZ;
	
	// flag N -> bit de sinal (negativo)
	ffd_enable ffd_N(clk, reset, cargaNZ, flagN, qN);
	
	// flag Z -> bit de zero
	ffd_enable ffd_Z(clk, reset, cargaNZ, flagZ, qZ);
	
endmodule
