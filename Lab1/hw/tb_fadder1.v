`include "fadder1.v"

module tb_fadder1;
	reg A, B, Cin;
	wire Cout, S;
	
	fadder_1bit_df f1(S, Cout, A, B, Cin);
	initial
		begin
			$monitor(, $time, "A=%b | B=%b| Cin=%b | Cout=%b | S=%b", A, B, Cin, Cout, S);
			A = 1'b0;B=1'b0; Cin=1'b0;
			#3 A = 1'b0;B=1'b0; Cin=1'b1;
			#3 A = 1'b0;B=1'b1; Cin=1'b0;
			#3 A = 1'b0;B=1'b1; Cin=1'b1;
			#3 A = 1'b1;B=1'b0; Cin=1'b0;
			#3 A = 1'b1;B=1'b0; Cin=1'b1;
			#3 A = 1'b1;B=1'b1; Cin=1'b0;
			#3 A = 1'b1;B=1'b1; Cin=1'b1;
			#6 $finish;
		end
endmodule
			