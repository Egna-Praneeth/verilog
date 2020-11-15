module counter(CLK, Q);
	input CLK;
	output [3:0] Q;
	reg [3:0] Q;
	
	initial 
	Q = 4'b0000;
	always @(posedge CLK)
	begin 
		Q = (Q + 1)%16;
	end
endmodule

module tester;
	wire [3:0] Q;
	reg CLK;
	
	counter c(CLK, Q);
	initial
	begin
	CLK = 0;
	end
	
	always 
	#2 CLK = ~CLK;
	initial 
	$monitor ($time, " Q=%b\n", Q);
	initial
	begin
	#70
	#3 $finish;
	end
endmodule
	
	