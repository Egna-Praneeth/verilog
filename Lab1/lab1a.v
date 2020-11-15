module sample_component2 (c, a);
// declare port signals 
output c;
input [1:0] a;

and (d, a[0], a[1]);  
assign c = ~d; 

@always()
begin

end
endmodule


module testbench;

reg [1:0] a;
wire c;

sample_component2 s(c,a);

initial
    begin
    $monitor($realtime," a=%2b, c=%b",a,c);
   // #0 a[0]=1'b1;a[1]=1'b1;
   // #2 a[0]=1'b0;
   // #5 a[1]=1'b0;
	
	#0 a = 2'b00;
	repeat(3)
	#2 a = a + 2'b01;
	
	
    end
    
endmodule