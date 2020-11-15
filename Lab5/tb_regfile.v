`include "regfile.v"
	
module tb_regfile;
//reg [31:0] reg1, reg2, reg3, reg4;
	reg [1:0] read1, read2, write1;
	reg clk, reset, RegWrite;
	reg [31:0] writedata;
	wire [31:0] data1, data2;
	
	RegFile r1(clk, reset, read1, read2, writedata, write1, RegWrite, data1, data2);
	
	always @(clk)
	#5 clk = ~clk;
	initial
		$monitor($time, "clk = %b", clk, ", reset = %b", reset, ", read1 = %b", read1, ", read2 = %b", read2, ", writedata = %b, write1 =%b, RegWrite=%b, data1 = %b, data2=%b", writedata, write1, RegWrite, data1, data2);
		initial
		begin
			clk = 1'b1; reset = 1'b0;
			#5 reset = 1'b1;
			#15 RegWrite = 1'b1; writedata= 32'h0000; write1 = 2'b00; 
			#15 writedata = 32'h1111; write1 = 2'b01;
			#15 writedata = 32'h1111_0000; write1 = 2'b10;
			#15 writedata = 32'h1111_1111; write1 = 2'b11;
			#15 RegWrite = 1'b0; read1 = 2'b00; read2 = 2'b01;
			#200 $finish;
		end
endmodule
	