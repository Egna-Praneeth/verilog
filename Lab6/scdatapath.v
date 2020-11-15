
module pcinit(PC);
	output [31:0] PC;
	reg [31:0] PC;
	always@(PC)
	PC = 32'h0000_0000;
endmodule

module instrucMem(pc, rst, instr);
	input [4:0] pc;
	input rst;
	output [31:0] instr;
	
	reg [31:0] mem[31:0];
	
	always@(pc)
		instr = mem[pc];
		
	always@(rst)begin
		if(rst)begin
			mem[0] = 32'h0000_0200;
			mem[1] = 32'h0000_0201;
			mem[2] = 32'h0000_0204;
			mem[3] = 32'h0000_0108;
			end
	end
endmodule 

module SCDataPath(ALU_output, PC, reset, clk);
	input [31:0] PC;
	input reset, clk;
	
	output [31:0] ALU_output;
	reg [31:0] instr;

	instrucMem(PC, reset, instr);