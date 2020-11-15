module mealy(clk, rst, inp, outp);
	input clk, rst, inp;
	output outp;
	reg [0:1] state;
	reg outp;
	
	always@(posedge clk, posedge rst) begin
	if (rst) begin
	state <= 2'b00;
	outp <= 0;
	end
	
	else begin
	case(state)
	
		2'b00:begin
			if(inp)begin
			state <= 2'b01;
			outp <= 0;
			end
			else begin
			state <= 2'b10;
			outp <= 0;
			end
			end
			
		2'b01:begin
			if(inp) begin
			state <= 2'b00;
			outp <= 1;
			end
			else begin
			state <= 2'b10;
			outp <= 0;
			end
			end
			
		2'b10: begin
			if(inp) begin
			state <= 2'b01;
			outp <= 0;
			end
			else begin
			state <= 2'b00;
			outp <= 1;
			end
		end
		
		default: begin
			state <= 2'b00;
			outp <= 0;
		end
	endcase
	
	end
	end
endmodule

//Test bench

module mealy_test;
	reg clk, rst, inp;
	wire outp;
	reg [15:0] seq;
	integer i;
	
	mealy duty(clk, rst, inp, outp);
	
	initial
	begin
	$dumpfile("mealy.vcd");
	$dumpvars(0, mealy_test);
	clk = 0;
	rst = 1;
	seq = 16'b0101_0111_0111_0010;
	#5 rst = 0;
	
	for(i = 0; i <= 15; i = i + 1)
	begin
	inp = seq[i];
	#2 clk = 1;
	#2 clk = 0;
	$display(" Input = ", inp, ", Output = ", outp, " State = ", duty.state);
	end
	testing;
	end
	
	task testing;
	for(i = 0; i <= 15; i = i + 1)
	begin
	inp = $random % 2;
	#2 clk = 1;
	#2 clk = 0;
	$display (" Input = ", inp, ", Output = ", outp, " State = ", duty.state);
	end
	endtask
endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	