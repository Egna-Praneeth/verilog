module some_logic_component(c,a,b);
	output c;
	input a, b;
	wire d;
	and a1(d,a,b);
	not n1(c, d);
endmodule

