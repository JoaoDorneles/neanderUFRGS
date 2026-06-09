module ULA(selULA, x, y, result, flagZ, flagN);
	
	input  [2:0] selULA;
	input  [7:0] x, y;
	output [7:0] result;
	output flagZ, flagN;
	
	wire        cout;
	wire [7:0]  passThrough;
	wire [7:0]  AND8bits;
	wire [7:0]  OR8bits;
	wire [7:0]  NOT8bits;
	wire [7:0]  saidaRCA;
	wire [7:0]  saidaMux1;   
	wire [7:0]  saidaMux2;   
	wire [7:0]  saidaMux4;  
	
	RCA8 rca8_ULA(x, y, cout, saidaRCA);
	
	assign AND8bits   = x & y;
	assign OR8bits    = x | y;
	assign NOT8bits   = ~x;
	assign passThrough = y;
	


	mux21 mux1(saidaRCA,  AND8bits, selULA[0], saidaMux1);  
	mux21 mux2(OR8bits,   NOT8bits, selULA[0], saidaMux2);  
	
	mux21 mux4(saidaMux1, saidaMux2, selULA[1], saidaMux4); 
	
	mux21 mux5(saidaMux4, passThrough, selULA[2], result); 
	
	assign flagZ = (result == 8'b00000000) ? 1'b1 : 1'b0;
	assign flagN = (result[7] == 1'b1)     ? 1'b1 : 1'b0;
	
endmodule
