`include "compare.v"
//also in lab2

module testb;
	reg [0:3]a;
	reg [0:3] b;
	wire G, L, E;
	wire signA, signB;
	
	/*
	comparator_4bit_beh c (a, b, G, L , E);
	initial
		begin
			// $dumpfile("tb_compare.vcd");
			// $dumpvars;
			$monitor(, $time, " a=%b | b=%b | G=%b | L=%b | E=%b ", a, b, G, L, E);
			a = 4'b0001; b= 4'b0000;
			#3 a = 4'b0000;
			#3 b = 4'b0001;
			#3 a = 4'b1101; b = 4'b1001;
		end
	*/
	
	//test bench as in lab2
	initial 
		begin
		a = 4'b0000;
		b = 4'b0000;
		end
	initial
		begin
			#1  a=-8;b=-5;
			#1 a =2; b=7;
			#1 a=5; b=-1;
		end
		comparator_4bit_beh c1(a, b, signA, signB ,G, L, E);
	initial
		begin
	$monitor(, $time, " a=%b | b=%b | G=%b | L=%b | E=%b ", a, b, G, L, E);
		end
	initial
	begin
	#5 $finish;
	end
endmodule