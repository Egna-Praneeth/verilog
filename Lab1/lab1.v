// `timescale <time_unit>/<time_precision>
`timescale 10ms/1ps
module sample_component (c, a, b);
// declare port signals 
output c;
input a, b;
// declare internal wire wire d;
//instantiate structural logic gates
and (d, a, b); //d is output, a and b are inputs 
not (c, d); //c is output, d is input
endmodule


module testbench;

reg a, b;
wire c;

sample_component s(c,a,b);

initial
    begin
    $display($time," a=%b, b=%b, c=%b",a,b,c);
    #0 a=1'b1;b=1'b1;
    #2 a=1'b0;
    #5 b=1'b0;
    end
    
endmodule