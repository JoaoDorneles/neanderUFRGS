module runStepMode(clkDiv,runDebug, sel, clkOut);

	input clkDiv,runDebug,sel;
	output reg clkOut;
	
	always@(*)begin
	
		if(sel)
			clkOut <= runDebug;
		else
			clkOut <= clkDiv;
	
	end
	
endmodule
