module nonblocking(in, clk, out);
	input in, clk;
	output out;
	reg q1, q2, out;
	
	always@ (posedge clk)
	begin
	q1 <= in;
	q2 <= q1;
	out <= q2;
	end 
endmodule

module blocking(in, clk, out);
	input in, clk;
	output out;
	reg q1, q2, out;
	
	always@ (posedge clk)
	begin
	q1 = in;
	q2 = q1;
	out = q2;
	end
endmodule

module testbench;
	reg in, clk;
	wire out;
	blocking n(in, clk, out);
	
	always @(posedge clk) begin
	$display ("in=%b, clk=%b, out=%b\n" ,in, clk, out);
	end
	
	initial begin
	forever begin
	clk = 0;
	#5 
	clk = 1;
	#5 clk = 0;
	end
	end
	
	initial begin
	$dumpfile("block_nonblock.vcd");
	$dumpvars(0, testbench);
	in = 1;
	#10
	in = 0;
	#50 
	in = 1;
	#50
	in = 0;
	end 
endmodule