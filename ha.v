module ha(x,y,cout,result);
	input x,y;
	output cout,result;
	
	assign result = x ^ y;
	assign cout = x & y;
	
endmodule
