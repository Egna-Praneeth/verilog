module mux2to1(out, sel, in1, in2);
	input in1, in2, sel;
	output out;
	wire not_set, a1, a2;
	not(not_sel, sel);
	and(a1, sel, in2);
	and (a2, not_sel, in1);
	or(out, a1, a2);
endmodule

module mux4to1(out, sel, in0, in1, in2, in3);
	input in0, in1, in2, in3;
	output out;
	input [1:0] sel;
	reg out;
	always @( in0 or in1 or in2 or in3 or sel)
		if(sel == 2'b00) out = in0;
		else if (sel == 2'b01) out = in1;
		else if (sel == 2'b10) out = in2;
		else if(sel == 2'b11) out = in3;
		else;

endmodule
	
module bit8_2to1mux(out, sel, in1, in2);
	input [7:0] in1, in2;
	output [7:0] out;
	input sel;
	/*
	mux2to1 m0(out[0], sel, in1[0], in2[0]);
	mux2to1 m1(out[1], sel, in1[1], in2[1]);
	mux2to1 m2(out[2], sel, in1[2], in2[2]);
	mux2to1 m3(out[3], sel, in1[3], in2[3]);
	mux2to1 m4(out[4], sel, in1[4], in2[4]);
	mux2to1 m5(out[5], sel, in1[5], in2[5]);
	mux2to1 m6(out[6], sel, in1[6], in2[6]);
	mux2to1 m7(out[7], sel, in1[7], in2[7]);
	*/
	
	//using generate blocks
	genvar j;
	generate for(j = 0; j < 8 ; j = j + 1) begin: mux_loop
	//mux_loop is the name of the loop
	mux2to1 m1(out[j], sel, in1[j], in2[j]);
	end
	endgenerate
endmodule

module bit8_4to1mux(out, sel, in1, in2, in3, in4);
	input [7:0] in1, in2, in3, in4;
	output [7:0] out;
	input [1:0] sel;
	genvar j;
	generate for(j =0 ; j < 8 ; j = j + 1) begin: mux_loop
	mux4to1 m2( out[j], sel, in1[j], in2[j], in3[j], in4[j]);
	end
	endgenerate
endmodule

module bit32_2to1mux(out, sel, in1, in2);
	input [31:0] in1, in2;
	output [31:0] out;
	input sel;
	bit8_2to1mux b1( out[7:0], sel, in1[7:0], in2[7:0]);
	bit8_2to1mux b2(out[15:8], sel , in1[15:8], in2[15:8]);
	bit8_2to1mux b3(out[23:16], sel, in1[23:16], in2[23:16]);
	bit8_2to1mux b4(out[31:24], sel, in1[31:24], in2[31:24]);
	endmodule

module bit32_4to1mux(out, sel, in1, in2, in3, in4);
	input [31:0] in1, in2, in3, in4;
	output [31:0] out;
	input [1:0] sel;
	genvar j;
	generate for(j = 0 ; j < 4 ; j = j + 1) begin: looop
		bit8_4to1mux b1(out[(j + 1)*8 - 1 :j*8], sel, in1[(j + 1)*8 - 1 :j*8], in2[(j + 1)*8 - 1 :j*8], in3[(j + 1)*8 - 1 :j*8], in4[(j + 1)*8 - 1 :j*8]);
	end
	endgenerate
endmodule

/*
module tb_32_2to1mux;
	reg[31:0] INP1, INP2;
	reg SEL;
	wire [31:0] out;
	bit32_8to1mux M1(out, SEL, INP1, INP2);
	initial
	$monitor("INP1 = %b, INP2 = %b, SEL = %b, OUT=%b", INP1, INP2, SEL, out);
	initial
	begin
		INP1 = 32'b10101010_00000001_10110011_00001111;
		INP2 = 32'b01010101_11001100_00110011_11100011;
		SEL = 1'b0;
		#100 SEL = 1'b1;
		#1000 $finish;
	end
endmodule
*/

/*
module tb_32_4to1mux;
	reg[31:0] INP1, INP2, INP3, INP4;
	reg [1:0] SEL;
	wire [31:0] out;
	bit32_4to1mux M1(out, SEL, INP1, INP2, INP3, INP4);
	initial
	$monitor("INP1 = %b, INP2 = %b, INP3 = %b, INP4 = %b, SEL = %b, OUT=%b", INP1, INP2, INP3, INP4 ,SEL, out);
	initial
	begin
		INP1 = 32'b10101010_00000001_10110011_00001111;
		INP2 = 32'b01010101_11001100_00110011_11100011;
		INP3 = 32'b00000000_00000000_00000000_00111111;
		INP4 = 32'b11111111_11111111_00010010_11010101;
		SEL = 2'b00;
		#100 SEL = 2'b11;
		#200 SEL = 2'b01;
		#300 SEL = 2'b10;
		#1000 $finish;
	end
endmodule
*/