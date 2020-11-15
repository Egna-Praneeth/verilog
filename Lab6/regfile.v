`include "register.v"
`include "mux_decoder.v"

module ICG(regclk, regwrite, decoderout, gatedclk);
	input regclk, regwrite;
	input decoderout;
	output gatedclk;
	and (gatedclk, regwrite, regclk, decoderout);
endmodule
	
	
module RegFile(clk, reset, ReadReg1, ReadReg2, WriteData, WriteReg, RegWrite, ReadData1, ReadData2);
	input clk, reset, RegWrite;
	input [1:0] ReadReg1, ReadReg2, WriteReg;
	input [31:0] WriteData;
	output [31:0] ReadData1, ReadData2;
	wire [31:0] ReadData1, ReadData2;
	wire [3:0] register;
	wire [3:0] gatedclk;
	wire [31:0] r1, r2, r3, r4;
	
	decoder2_4 d1 (register, WriteReg);
	ICG i1 (clk, RegWrite, register[0], gatedclk[0]);
	ICG i2 (clk, RegWrite, register[1], gatedclk[1]);
	ICG i3 (clk, RegWrite, register[2], gatedclk[2]);
	ICG i4 (clk, RegWrite, register[3], gatedclk[3]);
	
	reg_32bit r11 (r1, WriteData, gatedclk[0], reset);
	reg_32bit r22 (r2, WriteData, gatedclk[1], reset);
	reg_32bit r33 (r3, WriteData, gatedclk[2], reset);
	reg_32bit r44 (r4, WriteData, gatedclk[3], reset);
	
	mux4_1 m1(ReadData1, r1, r2, r3, r4, ReadReg1);
	mux4_1 m2(ReadData2, r1, r2, r3, r4, ReadReg2);
endmodule

module RegFile_32(clk, reset, ReadReg1, ReadReg2, WriteData, WriteReg, RegWrite, ReadData1, ReadData2);
	input clk, reset, RegWrite;
	input [4:0] ReadReg1, ReadReg2, WriteReg;
	input [31:0] WriteData;
	output [31:0] ReadData1, ReadData2;
	wire [31:0] ReadData1, ReadData2;
	wire [31:0] register;
	wire [31:0] gatedclk;
	wire [31:0] [31:0] all_reg;
	genvar i;
	decoder5_32 d1 (register, WriteReg);

	for(i = 0 ; i <= 31; i = i + 1)begin: icgloop
	ICG i1 (clk, RegWrite, register[i], gatedclk[i]);
	end
	
	for (i = 0 ; i <= 31; i = i + 1)begin: regloop
	reg_32bit r1(all_reg[i], WriteData, gatedclk[i], reset);
	end
	
	mux32_5 m1(ReadData1, all_reg, ReadReg1);
	mux32_5 m2(ReadData2, all_reg, ReadReg2);
endmodule
/*
module tb_regfile;
//reg [31:0] reg1, reg2, reg3, reg4;
	reg [1:0] read1, read2, write1;
	reg clk, reset, RegWrite;
	reg [31:0] writedata;
	wire [31:0] data1, data2;
	
	RegFile r1(clk, reset, read1, read2, writedata, write1, RegWrite, data1, data2);
	
	always @(clk)
	#5 clk <= ~clk;
	initial
		$monitor($time, "clk = %b", clk, ", reset = %b", reset, ", read1 = %b", read1, ", read2 = %b", read2, ", writedata = %b, write1 =%b, RegWrite=%b, data1 = %b, data2=%b", writedata, write1, RegWrite, data1, data2);
		initial
		begin
			clk = 1'b1; reset = 1'b0; read1 = 2'b11; read2 = 2'b10;
			#5 reset = 1'b1;
			#15 RegWrite = 1'b1; writedata= 32'h0000; write1 = 2'b00; 
			#15 writedata = 32'hFFFF; write1 = 2'b01;
			#15 writedata = 32'hFFFF_0000; write1 = 2'b10;
			#15 writedata = 32'hFFFF_FFFF; write1 = 2'b11;
			#15 RegWrite = 1'b0; 
			#20 read1 = 2'b00; read2 = 2'b01;
			#10 read1 = 2'b10; read2 = 2'b11;
			
			#20 $finish;
		end
endmodule
*/

/*
module tb_regfile;
//reg [31:0] reg1, reg2, reg3, reg4;
	reg [4:0] read1, read2, write1;
	reg clk, reset, RegWrite;
	reg [31:0] writedata;
	wire [31:0] data1, data2;
	integer i;
	
	RegFile_32 r1(clk, reset, read1, read2, writedata, write1, RegWrite, data1, data2);
	
	always @(clk)
	#5 clk <= ~clk;
	initial
		$monitor($time, "clk = %b", clk, ", reset = %b", reset, ", read1 = %b", read1, ", read2 = %b", read2, ", writedata = %b, write1 =%b, RegWrite=%b, data1 = %b, data2=%b", writedata, write1, RegWrite, data1, data2);
		initial
		begin
			clk = 1'b1; reset = 1'b0; read1 = 5'b11; read2 = 5'b10;
			#5 reset = 1'b1;
			#15 RegWrite = 1'b1; 
			for (i = 0 ; i <= 31; i = i + 1)begin: initloop
			#10 writedata = i; write1 = i;
			end
			#15 RegWrite = 1'b0; 
			#20 read1 = 5'b00; read2 = 5'b01;
			#10 read1 = 5'b10; read2 = 5'b11;
			for(i = 0 ; i <= 31; i = i + 2)begin: readloop
			#10 read1 = i; read2 = i + 1;
			end
			#20 $finish;
		end
endmodule
/*