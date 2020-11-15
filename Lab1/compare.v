module signa(neg, A);
	input [0:3] A;
	output neg;
	reg neg;
	always @ (A)
		if (A[0] ==1)
			begin
			neg = 1;
			end
		else
		neg =0;
endmodule


module comparator_4bit_gate (a, b, G, L , E);
	input [0:3] a;
	input [0:3] b;
	output G, L, E;
	wire x3, x2, x1, x0;
	wire [0:3] na;
	wire [0:3] nb;
	wire g1, g2, g3, g4, l1, l2, l3, l4;
	
	xnor xn (x3, a[0], b[0]);
	xnor xn2 (x2, a[1], b[1]);
	xnor xn3 (x1, a[2], b[2]);
	xnor xn4 (x0, a[3], b[3]);
	
	not(na[0], a[0]);
	not(na[1], a[1]);
	not (na[2], a[2]);
	not (na[3], a[3]);
	not (nb[0], b[0]);
	not (nb[1], b[1]);
	not (nb[2], b[2]);
	not (nb[3], b[3]);
	
	//equal
	and a1( E, x3, x2, x1, x0);
	
	//greater
	and (g1, a[0], nb[0]);
	and(g2, x3, a[1], nb[1]);
	and (g3, x3, x2, a[2], nb[2]);
	and (g4, x3, x2, x1, a[3], nb[3]);
	or o1 (G, g3, g2, g1, g4);
	
	//less 
	and (l1, na[0], b[0]);
	and (l2, x3, na[1], b[1]);
	and (l3, x3, x2, na[2], b[2]);
	and (l4, x3, x2, x1, na[3], b[3]);
	or o2 (L, l3, l2, l1, l4);

endmodule

module comparator_4bit_df (a, b, G, L , E);
	input [0:3] a;
	input [0:3] b;
	output G, L, E;
	
	assign G = a > b;
	assign L = a < b;
	assign E = a == b;
endmodule

module comparator_4bit_beh (a, b, signA, signB, G, L , E);
	input [0:3] a;
	input [0:3] b;
	output G, L, E;
	reg G, L , E;
	output signA, signB;
	
	signa forA(signA, a);
	signa forB(signB, b);
	
	always@ (a or b or signA or signB)
		if(signA == 1 && signB==0)
		begin
		G = 0;
		E = 0;
		L = 1;
		end
		else if(signA == 0 && signB == 1)
		begin
		G = 1;
		E = 0;
		L = 0;
		end 
		
		else if(a > b)
		begin
			G = 1;
			L = 0;
			E = 0;
		end
		else if( a < b)
		begin
			G = 0;
			L = 1;
			E = 0;
		end
		else 
		begin
			G = 0;
			L = 0;
			E = 1;
		end

endmodule
	
	