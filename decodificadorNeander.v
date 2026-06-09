module decodificadorNeander(opcode, NOP, STA, LDA, ADD, OR, AND, NOT, JMP, JZ, JN, HLT);

	input [3:0] opcode;
	output reg NOP, STA, LDA, ADD, OR, AND, NOT, JMP, JN, JZ, HLT;
	
	always @(*) begin
	
		NOP = 1'b0;
		STA = 1'b0;
		LDA = 1'b0;
		ADD = 1'b0;
		OR  = 1'b0;
		AND = 1'b0;
		NOT = 1'b0;
		JMP = 1'b0;
		JN  = 1'b0;
		JZ  = 1'b0;
		HLT = 1'b0;

		case(opcode)
			4'b0000: NOP = 1'b1;
			4'b0001: STA = 1'b1;
			4'b0010: LDA = 1'b1;
			4'b0011: ADD = 1'b1;
			4'b0100: OR  = 1'b1;
			4'b0101: AND = 1'b1;
			4'b0110: NOT = 1'b1;
			4'b1000: JMP = 1'b1;
			4'b1001: JN  = 1'b1;
			4'b1010: JZ  = 1'b1;
			4'b1111: HLT = 1'b1;
			
			default: NOP = 1'b1;
		endcase
	end
endmodule
