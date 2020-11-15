// Egna Praneeth Gummana
// 2018A7PS0284P

module RSff(Q, Qbar, S, R, clk, clear);
	output Q, Qbar;
	input S, R, clk, clear;
	reg Q, Qbar;
	always@(posedge clk)begin
		if(clear) begin
		Q <= 0;
		Qbar <= 1;
		end
		else begin
			case ({S, R})
				2'b01: begin
						Q <= 0;
						Qbar <= 1;
						end
				2'b10: begin 
						Q <= 1;
						Qbar <= 0;
					end
				2'b11:begin 
						Q <= 1;
						Qbar <= 0;
					end
			endcase
		end
		
	end
endmodule

module Dff ( Q, Qbar, D, clk, clear);
	input D, clk, clear;
	output Q, Qbar;
	wire Dnot;
	
	not n1 (Dnot, D);
	RSff r1 (Q, Qbar, D, Dnot, clk, clear);
endmodule

module Ripple_Counter(Q, clk, clear);
	input clear, clk;
	output [3:0] Q;
	wire q0, q1, q2, q3;
	
	Dff d1 (Q[0], q0, q0, clk, clear); 
	Dff d2 (Q[1], q1, q1, q0, clear);
	Dff d3 (Q[2] , q2, q2, q1, clear);
	Dff d4 (Q[3], q3, q3, q2, clear);
	
endmodule


module MEM1(out, Addr);
	input [2:0] Addr;
	output [8:0] out;
	reg [7:0] mem [8:0] ;
	reg [8:0] out;
	
	initial
	begin
	mem[0] = 9'b0001_1111_1;
	mem[1] = 9'b0011_0001_1;
	mem[2] = 9'b0101_0011_1;
	mem[3] = 9'b0111_0101_1;
	mem[4] = 9'b1001_0111_1;
	mem[5] = 9'b1011_1001_1;
	mem[6] = 9'b1101_1011_1;
	mem[7] = 9'b1111_1101_1;
	end
	
	always@(Addr)
	begin
	out = mem[Addr]; 
	end
	
	endmodule
	
module MEM2(out, Addr);
	input [2:0] Addr;
	output [8:0] out;
	reg [7:0] mem [8:0] ;
	reg [8:0] out;
	
	initial
	begin
	mem[0] = 9'b0000_0000_0;
	mem[1] = 9'b0010_0010_0;
	mem[2] = 9'b0100_0100_0;
	mem[3] = 9'b0110_0110_0;
	mem[4] = 9'b1000_1000_0;
	mem[5] = 9'b1010_1010_0;
	mem[6] = 9'b1100_1100_0;
	mem[7] = 9'b1110_1110_0;
	end
	
	always@(Addr)
	begin
	out = mem[Addr]; 
	end
	
	endmodule



module MUX2To1(out, in1, in2, sel);
	output out;
	input in1, in2, sel;
	assign out = sel ? in2 : in1;
endmodule

module MUX16to8( out, in1, in2, sel);
	output [7:0] out;
	input [7:0] in1, in2;
	input sel;
	genvar j;
	generate for (j = 0 ; j < 8; j = j + 1) begin: mux_loop
	MUX2To1 m1(out[j], in1[j], in2[j], sel);
	end
	endgenerate
endmodule

module Fetch_Data(Data,P,Q);
	output [7:0] Data;
	output P;
	input [3:0] Q;
	wire [7:0] in1, in2;
	wire p1, p2;
	
	MEM1 m1 ({in1, p1}, Q[2:0]);
	MEM2 m2 ({in2, p2}, Q[2:0]);
	
	MUX16to8 mux1(Data, in1, in2, Q[3]);
	MUX2To1 mux2(P, p1, p2, Q[3]);
endmodule

module Parity_Checker(Data, P,  out);
	output out;
	input [7:0] Data;
	input P;
	wire dparity;
	
	assign dparity = Data[0] ^ Data[1] ^ Data[2] ^ Data[3] ^ Data[4] ^ Data[5] ^ Data[6] ^ Data[7];
	assign out = (dparity == P);
endmodule
	
	
module Design(out, clk, clear);
	output out;
	input clk, clear;
	wire [3:0] Q;
	wire [7:0] Data;
	wire P;
	
	Ripple_Counter r1 (Q, clk, clear);
	Fetch_Data  f1 (Data,P,Q);
	Parity_Checker p1 (Data, P , out);
	
endmodule
	
module TestBench;
	reg clk, clear;
	wire out;
	
	Design d1 (out, clk, clear);
	
	always 
	#1 clk = ~clk;
	
	initial 
	$monitor ($time, " clk = %b, clear = %b, out = %b ", clk, clear, out);
	initial begin
	$dumpfile("file.vcd");
	$dumpvars;
	clk = 1'b1; clear = 1'b1;
	#5 clear = 1'b0;
	#100 $finish;
	end
endmodule

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
