`include "mux4to1.v"
module mux16to1_gate(out, in, sel);
	input [0:15] in;
	input [0:3] sel;
	output out;
	
	wire [0:3] bet;
	
	mux4to1_gate mux1(bet[0], in[0:3], sel[2:3]);
	mux4to1_gate mux2(bet[1], in[4:7], sel[2:3]);
	mux4to1_gate mux3(bet[2], in[8:11], sel[2:3]);
	mux4to1_gate mux4(bet[3], in[12:15], sel[2:3]);
	mux4to1_gate mux5(out, bet, sel[0:1]);
endmodule