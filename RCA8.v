module RCA8(x,y,cout,result);
	
	parameter WIDTH = 8;
	
	input [WIDTH-1:0] x,y;
	output [WIDTH-1:0] result;
	output cout;
	
	wire [WIDTH:0] c;
	
	ha u_ha0(x[0],y[0],c[0],result[0]);
	
	generate
		genvar i;
	
		for (i=1; i < WIDTH; i = i+1) 
		begin : gen_for
				fa u_fa(x[i],y[i],c[i-1],result[i],c[i]);
		end
	
	endgenerate
	
	assign cout = c[WIDTH-1];
	
		
endmodule

