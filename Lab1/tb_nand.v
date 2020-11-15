`include "nand.v" 

module testbench;
	reg a, b;
	wire c;
	//some_logic_component comp(.c(c), .a(a), .b(b));
	some_logic_component comp(c, a, b);
	initial
		begin
			$monitor(,$time," a = %b, b = %b, c = %b", a, b, c);
			#0 a=1'b0;b=1'b1;
			#2 a=1'b1;b=1'b0;
			#5 a=1'b0;b=1'b0;
			#10 a=1'b1; b=1'b1;
			#20 $finish;
		end
endmodule