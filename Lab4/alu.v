`include "mux.v"
`include "and_or.v"
`include "fadder.v"

module ALU (a, b, Binvert_cin, op, result, Cout);
	output [31:0] result;
	output Cout;
	input [31:0] a, b;
	input Binvert_cin;
	input [1:0] op;
	wire [31:0] andwire, orwire, sumwire, nb, notout;
	bit32AND a1(andwire, a,b);
	bit32OR a2(orwire, a, b);
	assign nb = ~b;
	bit32_2to1mux m1(notout, Binvert_cin, b, nb); 
	FA_dataflow f1 (Cout, sumwire, a, notout, Binvert_cin);
	
	bit32_4to1mux m2(result, op, andwire, orwire, sumwire, 32'b1);
endmodule


module tbALU;
reg Binvert_cin;
reg [1:0] Operation;
reg [31:0] a,b;
wire [31:0] Result;
wire CarryOut;
ALU a1212(a,b,Binvert_cin,Operation,Result,CarryOut);
initial
$monitor( "a=%b  , b=%b,  Binvert_cin = %b, Operation = %b, result=%b, cout=%b", a, b, Binvert_cin, Operation, Result, CarryOut);
initial 
begin
a=32'ha5a5a5a5;
b=32'h5a5a5a5a;
Operation=2'b00;
Binvert_cin=1'b0; //must perform AND resulting in zero
#100 Operation=2'b01; //OR
#100 Operation=2'b10; //ADD
#100 Binvert_cin=1'b1; a = 32'hFFFFFFFF; b = 32'h00000001;//su
#200 $finish;
end
endmodule