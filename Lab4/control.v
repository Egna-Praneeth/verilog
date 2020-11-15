module ANDarray(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1, Op);
input [5:0] Op;
output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1;
wire Rformat, lw, sw, beq;

assign Rformat = (~Op[0]) & (~Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
assign lw = (Op[0]) & (Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (Op[5]);
assign sw = (Op[0]) & (Op[1]) & (~Op[2]) & (Op[3]) & (~Op[4]) & (Op[5]);
assign beq = (~Op[0]) & (~Op[1]) & (Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
assign RegDst = Rformat;
assign ALUSrc = lw | sw;
assign MemtoReg = lw;
assign RegWrite = Rformat | lw;
assign MemRead = lw;
assign MemWrite = sw;
assign Branch = beq;
assign ALUOp0 = Rformat;
assign ALUOp1 = beq;

endmodule

module test_ANDarray;
reg [5:0] Op;
wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1;

ANDarray a1 (RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1, Op);
initial
$monitor( "Op =%b, RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b,  MemRead=%b, MemWrite=%b, Branch=%b, ALUOp0=%b, AlUOp1=%b", Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1);
initial begin
Op = 6'b000000;
#10 Op = 6'b100011;
#20 Op = 6'b101011; 
# 40 Op = 6'b00100;
end
endmodule