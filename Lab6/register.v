module d_ff (q, d, clk, reset);
	input clk, reset, d;
	output  q;
	reg  q;
	
	always@(posedge clk)
	begin
		if(!reset) q <= 1'b0;
		else q <= d;
	end
endmodule

module reg_32bit(q, d, clk, reset);
	input [31:0] d;
	input clk, reset;
	output [31:0] q;
	reg [31:0] q;
	
	always@ (posedge clk)
	begin
		if(!reset) q <= 32'h0000_0000;
		else q <= d;
	end
endmodule

/*
module tb32reg;
	reg [31:0] d;
	reg clk, reset;
	wire [31:0] q;
	
	reg_32bit R (q, d, clk, reset);
	
	always@ (clk)
	#5 clk <= ~clk;
	initial
	begin
	$dumpfile("register.vcd");
	$dumpvars(0, tb32reg);
	clk = 1'b1;
	reset = 1'b0; 
	#20 reset = 1'b1;
	#20 d = 32'hAFAFAFAF;
	#20 reset = 1'b0;
	#20 reset = 1'b1;
	#200 $finish;
	end
	endmodule
*/