`include "fadder.v"

module fadder_8(sum, carry, in1, in2, cin);
	output [0:7] sum;
	output carry;
	 wire [0:6] car; 
	input [0:7] in1;
	input [0:7] in2;
	input cin;
	
	fadder f0(sum[7], car[0], in1[7], in2[7], cin);
	fadder f1(sum[6], car[1], in1[6], in2[6], car[0]);
	fadder f2(sum[5], car[2], in1[5], in2[5], car[1]);
	fadder f3(sum[4], car[3], in1[4], in2[4], car[2]);
	fadder f4(sum[3], car[4], in1[3], in2[3], car[3]);
	fadder f5(sum[2], car[5], in1[2], in2[2], car[4]);
	fadder f6(sum[1], car[6], in1[1], in2[1], car[5]);
	fadder f7(sum[0], carry, in1[0], in2[0], car[6]);
	
endmodule