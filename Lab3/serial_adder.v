`include "shiftreg.v"

module serial_adder(A, B, S, C);
input [3:0] A;
input [3:0] B;
output [3:0] S;
output C;
reg in;
reg CLK, Q1, Q2;

shiftreg s1(EN, in, CLK, Q1);
shiftreg s2(EN, in, CLK, Q2);

initial
repeat (4) @(posedge CLK)
begin


end
endmodule