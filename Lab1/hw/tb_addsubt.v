`include "addsubt.v"


module tb_addsubt;
	reg [0:3] A;
	reg [0:3] B;
	reg Sel;
	wire [0:3] S;
	wire Cout;
	
	addsubt f (S, Cout, A, B, Sel);
	initial
		begin
			$monitor(, $time, " A=%b | B=%b | Sel=%b || S=%b | Cout=%b", A,B,Sel,S,Cout);
			A= 4'b0000; B=4'b0000;Sel =1'b0;
			#3 A= 4'b0001; B=4'b0000;Sel =1'b0;
			#3 A= 4'b0001; B=4'b0001;Sel =1'b0;
			#3 A= 4'b0001; B=4'b0001;Sel =1'b1;
			#3 A= 4'b0100; B=4'b0100;Sel =1'b1;
			#3 A= 4'b1001; B=4'b1001;Sel =1'b0;
			#3 A= 4'b1000; B=4'b0001;Sel =1'b0;
			#3 A= 4'b0001; B=4'b0100;Sel =1'b1;
			#3 A= 4'b0111; B=4'b0001;Sel =1'b0;
			#3 A= 4'b1111; B=4'b1111;Sel =1'b0;
			//#3 A= 4'b1111; B=4'b1111;Cin =1'b0;
			#6 $finish;
		end
endmodule