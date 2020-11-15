`include "dec3to8.v"

module fadder_gate(sum, carry, in);
	input [0:2] in ;
	output sum, carry;
	wire [0:7] out;
	
	decoder d1(out, in);
	or o1(sum, out[1], out[2], out[4], out[7]);
	or o2(carry, out[3], out[5], out[6], out[7]);
	
endmodule

module fadder(sum, carry, a, b, c);
	input a, b, c;
	output sum,carry;
	wire [0:7] out;
	wire [0:2] in;
	assign in[0] = a;
	assign in[1] = b;
	assign in[2] = c;
	
	decoder d1(out, in);
	assign sum = out[1]|out[2]|out[4]|out[7];
	assign carry = out[3]|out[5]|out[6]|out[7];

endmodule
	
