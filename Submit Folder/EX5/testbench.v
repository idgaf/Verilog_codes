module testbench(clk,r,Q);
	output reg clk,r;
	output wire [3:0]Q;
	postCounter u0(clk,r,Q);
	initial
	begin
		forever #5 clk<=5;
	end
	initial
	begin
		clk<=0;
		r<=1;
		#100 r<=0;
		#5   r<=1;
	end
endmodule

module testbench2(clk,r,Q);
	output reg clk,r;
	output wire [3:0]Q;
	negCounter u0(clk,r,Q);
	initial
	begin
		forever #5 clk<=5;
	end
	initial
	begin
		clk<=0;
		r<=1;
		#100 r<=0;
		#5   r<=1;
	end
endmodule

