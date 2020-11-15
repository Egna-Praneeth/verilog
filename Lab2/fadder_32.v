`include "fadder_8.v"

module fadder_32 (S, carry , in1, in2, cin);
	output [0:31] S;
	output carry;
	input [0:31] in1;
	input [0:31] in2;
	wire [0:2] car;
	input cin;
	
	fadder_8 f1(S[24:31], car[0], in1[24:31], in2[24:31], cin);
	fadder_8 f2(S[16:23], car[1], in1[16:23], in2[16:23], car[0]);
	fadder_8 f3(S[8:15], car[2], in1[8:15], in2[8:15], car[1]);
	fadder_8 f4(S[0:7], carry, in1[0:7], in2[0:7], car[2]);
endmodule