module mux4to1_gate(out, in , sel);
	input [0:3] in;
	input [0:1] sel;
	output out;
	wire [0:1] nsel;
	wire [0:4] andin;
	
	not n1 (nsel[0], sel[0]);
	not n2 (nsel[1], sel[1]);
	
	and a1 (andin[0], in[0], nsel[0], nsel[1]);
	and a2 (andin[1], in[1], nsel[0], sel[1]);
	and a3  (andin[2], in[2], nsel[1], sel[0]);
	and a4 (andin[3], in[3], sel[1], sel[0]);
	
	or or1 (out, andin[0], andin[1], andin[2], andin[3]);
endmodule
	
	
