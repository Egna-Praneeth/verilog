`include "fadder1.v"

module tb_fadder4;
	reg [0:3] A;
	reg [0:3] B;
	reg Cin;
	wire [0:3] S;
	wire Cout;
	wire V;
	
	fadder_4bit_beh f (S, Cout, V, A, B, Cin);
	initial
		begin
			$monitor(, $time, " A=%b | B=%b | Cin=%b || S=%b | Cout=%b | V=%b", A,B,Cin,S,Cout, V);
			A= 4'b0000; B=4'b0000;Cin =1'b0;
			#3 A= 4'b0001; B=4'b0000;Cin =1'b0;
			#3 A= 4'b0001; B=4'b0001;Cin =1'b0;
			#3 A= 4'b0001; B=4'b0001;Cin =1'b1;
			#3 A= 4'b0100; B=4'b0100;Cin =1'b1;
			#3 A= 4'b1001; B=4'b1001;Cin =1'b0;
			#3 A= 4'b1000; B=4'b0001;Cin =1'b0;
			#3 A= 4'b0001; B=4'b0100;Cin =1'b1;
			#3 A= 4'b0111; B=4'b0001;Cin =1'b0;
			#3 A= 4'b1111; B=4'b1111;Cin =1'b0;
			//#3 A= 4'b1111; B=4'b1111;Cin =1'b0;
			#6 $finish;
		end
endmodule