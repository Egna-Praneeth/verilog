`include "bcdtogrey.v"

module testbench;
	reg [0:3] in;
	wire [0:3] out;
	
	bcdtogrey_df g(in, out);
	initial
		begin
			$dumpfile("tb_bcdtogrey.vcd");
			$dumpvars;
			$monitor(, $time," in=%b | out=%b ", in, out);
			in = 4'b0000;
			#3 in = 4'b0001;
			#3 in = 4'b0010;
			#3 in = 4'b0011;
			#3 in = 4'b0100;
			#3 in = 4'b0101;
			#3 in = 4'b0110;
			#3 in = 4'b0111;
			#3 in = 4'b1000;
			#3 in = 4'b1001;
			#6 $finish;
		end
	
endmodule
			