module bcdtogrey_gate (in , out);
	input [0:3] in;
	output [0:3] out;
	
	buf b(out[0], in[0]);
	xor x1( out[1], in[0], in[1]);
	xor x2(out[2], in[1], in[2]);
	xor x3 (out[3], in[2], in[3]);
endmodule


module bcdtogrey_df(in , out);
	output [0:3] out;
	input [0:3] in;
	assign out[0] = in[0];
	assign out[1] = in[0] ^ in[1];
	assign out[2] = in[1] ^ in[2];
	assign out[3] = in[2] ^ in[3];
	
endmodule