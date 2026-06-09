module fa(x,y,cin,result,cout);

	input x,y,cin;
	output cout, result;
	
	assign result = x ^ y ^ cin;
	assign cout = ((x ^ y) & cin) | (x & y);
	
endmodule
