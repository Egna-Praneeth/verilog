module fadder_1bit_gate ( S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;
	wire ab, cab, xab;
	
	xor x1(S, A, B, Cin);
	xor x2 (xab, A, B);
	and a(cab, xab, Cin);
	and a2(ab, A, B);
	or o1(Cout, ab, cab);
	
endmodule

module fadder_1bit_df (S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;
	//wire s1, s2, ab;
	
	assign S = A^B^Cin;
	//assign s2 = s1 & Cin;
	//assign ab = A & B;
	assign Cout = (A & B) | (Cin &(A^B));
	
endmodule

module fadder_1bit_beh (S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;
	reg S, Cout;
	always@( A or B or Cin)
	begin
		{Cout, S} = A + B + Cin;
	end
	/*
		begin
		S = A^B^Cin;
		Cout = A&B | (A^B) & Cin;
		end
	*/
	/*
		begin
			case (A | B | Cin)
			3'b000: begin S = 0; Cout = 0; end 
			3'b001: begin S = 1; Cout = 0; end 
			3'b010: begin S = 1; Cout = 0; end 
			3'b011: begin S = 0; Cout = 1; end 
			3'b100: begin S = 1; Cout = 0; end 
			3'b101: begin S = 0; Cout = 1; end 
			3'b110: begin S = 0; Cout = 1; end 
			3'b111: begin S = 1; Cout = 1; end 
			endcase 
		end
	*/
		
endmodule

module fadder_4bit_beh (S, Cout,V, A, B, Cin);
	input [0:3] A;
	input [0:3] B;
	input Cin;
	output [0:3] S;
	output Cout, V;
	reg V;
	wire c1, c2, c3;
	
	fadder_1bit_beh f1(S[3], c1, A[3], B[3], Cin);
	fadder_1bit_beh f2(S[2], c2, A[2], B[2], c1);
	fadder_1bit_beh f3 (S[1], c3, A[1], B[1], c2);
	fadder_1bit_beh f4 (S[0], Cout, A[0], B[0], c3);
	
	always@ (c3 or Cout)
	begin
	if(c3^Cout) 
		V = 1;
	else
		V = 0;
		
	end
endmodule

