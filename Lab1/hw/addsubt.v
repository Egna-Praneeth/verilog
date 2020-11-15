`include "fadder1.v"

module mux2to1_df(a,b,s,f);
	input a,b,s;
	output f;
	assign f = s ? a : b;
endmodule

module addsubt (S, Cout,V, A, B, Sel);
	input [0:3] A;
	input [0:3] B;
	input Sel;
	output Cout, V;
	output [0:3] S;
	
	wire [0:3] f;
	wire [0:3] nB;
	
	not n1( nB[0], B[0]);
	not n1( nB[1], B[1]);
	not n1( nB[2], B[2]);
	not n1( nB[3], B[3]);
	
	mux2to1_df m(nB[0], B[0], Sel, f[0]);
	mux2to1_df m1(nB[1], B[1], Sel, f[1]);
	mux2to1_df m2(nB[2], B[2], Sel, f[2]);
	mux2to1_df m3(nB[3], B[3], Sel, f[3]);
	
	fadder_4bit f1(S, Cout,V, A, f, Sel);

endmodule
	