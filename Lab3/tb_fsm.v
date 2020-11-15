`include "fsm.v"
//sequence to detect is 10110
module test;
	reg clk, rst, inp;
	wire outp;
	reg[15:0] seq;
	integer i;
	mealy_detector duty(clk, rst, inp, outp);
	
	initial
	begin
	clk = 0;
	rst = 1;
	seq = 16'b0110_1100_1011_0110;
	#5 rst = 0;
	
	for(i = 15; i >= 0 ; i = i - 1)
	begin
	inp = seq[i];
	#2 clk = 1;
	#2 clk = 0;
	$display("State = ", duty.state, " Input = ", inp, ", Output = ", outp);
	end
	$display("\n below is for rand0m input\n");
	testing;
	end
	
	task testing;
	for(i = 0; i <= 15; i = i + 1)
	begin
	inp = $random %2;
	#2 clk = 1;
	#2 clk = 0;
	$display("State = ", duty.state, " Input = ", inp, ", Output = ", outp);
	end
	endtask
	endmodule