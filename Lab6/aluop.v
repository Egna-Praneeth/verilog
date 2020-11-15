module ALUcontrol(ALUOp1, ALUOp0, Funct, Op);	
	input ALUOp0, ALUOp1;
	input [5:0] Funct;
	output [2:0] Op;
	
	assign Op[2] = (ALUOp1 & Funct[1]) | ALUOp0;
	assign Op[1] = ALUOp1 ~& Funct[2];
	assign Op[0] = ALUOp1 & ( Funct[0] | Funct[3]);
	/*
	case({ALUOp1 ALUOp0})
	
		2'b00: assign Op = 3'b010;
		2'b01: assign Op = 3'b110;
		default: begin
		case(Funct[3:0])
			4'b0000: assign Op = 3'b010;
			4'b0010: assign Op = 3'b110;
			4'b0100: assign Op = 3'b000;
			4'b0101: assign Op = 3'b001;
			4'b1010: assign Op = 3'b111;
			
		endcase
		end
	endcase
	*/
endmodule
			

module tb_ALUCONTROL;
	wire [2:0] Op;
	reg [5:0] funct;
	reg aluop0, aluop1;
	
	ALUcontrol a1(aluop1, aluop0, funct, Op);
	
	initial
	$display("aluop1 aluop0 ||  FUNCT FIELD   || Operation");
	initial
	$monitor("  %b     %b   ||  %b           || %b", aluop1, aluop0, funct, Op);
	initial
	begin
		aluop0 = 1'b0; aluop1 = 1'b0; funct = 6'b000111;
	#10 aluop1 = 1'b0 ; aluop0 = 1; funct = 6'b001100;
	#20 aluop1 = 1'b1; aluop0 = 1'b0; funct = 6'bxx0000;
	#30 aluop1 = 1'b1; aluop0 = 1'b0; funct = 6'bxx0010;
	#40 aluop1 = 1'b1; aluop0 = 1'b0; funct = 6'bxx0100;
	#50 aluop1 = 1'b1; aluop0 = 1'b0; funct = 6'bxx0101;
	#60 aluop1 = 1'b1; aluop0 = 1'b0; funct = 6'bxx1010;
	end

endmodule	
	
	
	