
module FA_dataflow (Cout, Sum, in1, in2, Cin);
	input [31:0] in1, in2;
	input Cin;
	output Cout;
	output [31:0] Sum;
	assign {Cout, Sum} = in1 + in2 + Cin;
endmodule
/*
module FA_dataflow (Cout, Sum, in1, in2, Cin);
	input in1, in2;
	input Cin;
	output Cout;
	output Sum;
	assign {Cout, Sum} = in1 + in2 + Cin;
endmodule
*/
/*
module tb_fa;
	reg [31:0] in1, in2;
	wire cout;
	wire [31:0] sum;
	reg cin;
	FA_dataflow f1 (cout, sum, in1, in2, cin);
	initial 
	$monitor("in1 = %b, in2 = %b, cin = %b, cout = %b, sum=%b", in1, in2, cin , cout, sum);
	initial
	begin
	in1 = 32'h0000; in2 = 32'h0001;cin = 1;
	#10 in1 = 32'h0001 ; in2 = 32'h0002; cin = 1;
	#20 in1 = 32'hFFFFFFFF; in2 = 32'h0000; cin = 1;
	end
endmodule
*/