module mux4_1 (regData, q1, q2, q3, q4, reg_no);
	// reg_no are 0, 1, 2, 3
	output [31:0] regData;
	input [31:0] q1, q2, q3, q4;
	input [1:0] reg_no;
	reg [31:0] regData;
	
	always@(q1 or q2 or q3 or q4 or reg_no)
	begin
	case(reg_no)
		2'b00: regData = q1;
		2'b01: regData = q2;
		2'b10: regData = q3;
		2'b11: regData = q4;
	endcase
	end
endmodule

module mux32_5 (regData, all_reg, reg_no);
	output [31:0] regData;
	input [31:0] [31:0] all_reg;
	input [4:0] reg_no;
	reg [31:0] regData;

	
	always@(reg_no or all_reg)
	regData = all_reg[reg_no];
	
endmodule


module decoder2_4 (register, reg_no);
input [1:0] reg_no;
output [3:0] register;
reg [3:0] register;

always@(reg_no)
	begin
	register = 4'b0000;
	case(reg_no)
		2'b00: register[0] = 1;
		2'b01: register[1] = 1;
		2'b10: register[2] = 1;
		2'b11: register[3] = 1;
	endcase
	end
endmodule

module decoder5_32 (register, reg_no);
input [4:0] reg_no;
output [31:0] register;
reg [31:0] register;

always@(reg_no)
	begin
	register = 32'h0000_0000;
	register[reg_no] = 1;
	end
endmodule

/*
module tb_mux;

reg [31:0] q1, q2, q3, q4;
reg [1:0] reg_no;
wire [31:0] regData;

mux4_1 m1(regData, q1, q2, q3, q4, reg_no);

initial
begin 
q1 = 32'h0000_0000; q2 = 32'hFFFF_FFFF; q3 = 32'hFFFF; q4 = 32'hFFFF_0000;
end

initial
//$monitor( "q1 = %b, q2 = %b, q3 = %b, q4 = %b, reg_no = %b, regData = %b", q1, q2,q3,q4,reg_no, regData);
$display("q1 = %b, q2 = %b, q3 = %b, q4 = %b", q1, q2, q3, q4);
initial
$monitor( "reg_no = %b, regData = %b" ,reg_no, regData);
initial
begin
//q1 = 32'h0000_0000; q2 = 32'hFFFF_FFFF; q3 = 32'hFFFF; q4 = 32'hFFFF_0000; 
reg_no = 2'b00;
#20 reg_no = 2'b01;
#40 reg_no = 2'b10;
#50 reg_no = 2'b11;
#1 $finish;
end
endmodule
*/

/*
module tb_decoder;
reg [1:0] reg_no;
wire [3:0] register; 

decoder2_4 d(register, reg_no);

initial
$monitor("reg_no = %b, register=%b", reg_no, register);
initial
begin
reg_no = 2'b00;
#10 reg_no = 2'b01;
#20 reg_no = 2'b10;
#10 reg_no = 2'b11;
end
endmodule
*/

/*
module tb_mux32_5;

reg [31:0] [31:0]all_reg  ;
reg [4:0] reg_no;
wire [31:0] regData;
integer i;


mux32_5 m1(regData, all_reg, reg_no);

initial
begin 
//q1 = 32'h0000_0000; q2 = 32'hFFFF_FFFF; q3 = 32'hFFFF; q4 = 32'hFFFF_0000;

for (i = 0 ; i <= 31; i = i + 1)begin
	all_reg[i] = i;
	end

//all_reg[0] = 32'd1;
end


initial
$monitor( "reg_no = %b, regData = %b" ,reg_no, regData);
initial
begin
//q1 = 32'h0000_0000; q2 = 32'hFFFF_FFFF; q3 = 32'hFFFF; q4 = 32'hFFFF_0000; 
reg_no = 5'b00000;
for (i = 0 ;i <= 31; i = i + 1)begin: loop
#1 reg_no = i;
end
#1 $finish;
end
endmodule
*/

/*
module tb_decoder5_32;
reg [4:0] reg_no;
wire [31:0] register; 

decoder5_32 d(register, reg_no);

initial
$monitor("reg_no = %b, register=%b", reg_no, register);
initial
begin
reg_no = 5'b00;
#10 reg_no = 5'b01;
#20 reg_no = 5'b10;
#10 reg_no = 5'b11;
end
endmodule
*/