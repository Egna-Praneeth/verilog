`include "fadder_8.v"
module testbench;
	reg [0:7] in1;
	reg [0:7] in2;
	wire [0:7] sum;
	wire carry;
	
	fadder_8 f1(sum, carry, in1, in2);
	
	initial
		begin
			$monitor(,$time, " in1=%b | in2=%b | sum=%b | carry=%b ", in1, in2, sum, carry);
			#0 in1=8'b00000000; in2=8'b00000000;
			#3 in1=8'b00000001; in2=8'b00000000;
			#5 in1=8'b00001111; in2=8'b00000000;
			#7 in1=8'b00000011; in2=8'b00000000;
			#9 in1=8'b00000011; in2=8'b00000011;
			#10 in1=8'b00000111; in2=8'b00000010;
			#15 in1=8'b00000000; in2=8'b00000000;
			#20 in1=8'b11111111; in2=8'b11111111;
		end
endmodule