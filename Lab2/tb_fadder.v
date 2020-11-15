`include "fadder.v"

module testbench;
	reg [0:2] in;
	wire sum, carry;
	
	fadder f1(sum, carry, in[0], in[1], in[2]);
	
	initial
		begin
			$monitor(,$time, " in=%b | sum=%b | carry=%b",in,sum,carry);
			   in=3'b000;
			#3 in=3'b001;
			#3 in=3'b010;
			#3 in=3'b011;
			#3 in=3'b100;
			#3 in=3'b101;
			#3 in=3'b110;
			#3 in=3'b111;
		end
endmodule