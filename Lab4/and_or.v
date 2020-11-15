module bit32AND (out, in1,in2);
	input [31:0] in1,in2;
	output [31:0] out;
	assign out = in1 & in2;
endmodule

module bit32OR (out, in1, in2);
	input [31:0] in1, in2;
	output [31:0] out;
	assign out = in1 | in2;
endmodule

/*
module tb32bitand;
	reg [31:0] in1, in2;
	wire [31:0] out;
	bit32AND a1(out, in1, in2);
	initial
	$monitor(" in1 = %b, in2 = %b, out=%b", in1, in2, out);
	initial
	begin
		in1 = 32'hA5A5;
		in2 = 32'h5A5A;
		#100 in1 = 32'h5A5A;
		#400 $finish;
	end
endmodule
*/

/*
module tb32bitor;
	reg [31:0] in1, in2;
	wire [31:0] out;
	bit32OR a1(out, in1, in2);
	initial
	$monitor(" in1 = %b, in2 = %b, out=%b", in1, in2, out);
	initial
	begin
		in1 = 32'hA5A5;
		in2 = 32'h5A5A;
		#100 in1 = 32'h5A5A;
		#400 $finish;
	end
endmodule
*/