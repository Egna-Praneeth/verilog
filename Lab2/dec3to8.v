module decoder(out, sel);
	input [0:2] sel;
	output [0:7] out;
	wire [0:2] nsel;
	
	not n1(nsel[0], sel[0]);
	not n2(nsel[1], sel[1]);
	not n3(nsel[2], sel[2]);
	
	and a1(out[0], nsel[0], nsel[1], nsel[2]);
	and a2(out[1], nsel[0], nsel[1], sel[2]);
	and a2(out[2], nsel[0], sel[1], nsel[2]);
	and a2(out[3], nsel[0], sel[1], sel[2]);
	and a2(out[4], sel[0], nsel[1], nsel[2]);
	and a2(out[5], sel[0], nsel[1], sel[2]);
	and a2(out[6], sel[0], sel[1], nsel[2]);
	and a2(out[7], sel[0], sel[1], sel[2]);
	
endmodule