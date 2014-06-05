module testbench(s,r,clk,D,Q,Qr);
	output reg s,r,clk,D;
	output wire Q,Qr;
	Dflipflop u0(s,r,clk,D,Q,Qr);
	initial
	begin
		forever #5 clk<=~clk;
	end
	initial
	begin
		clk<=0;
		s<=1;
		r<=1;
		D<=0;
		#20 D<=1;
		#20 D<=0;
		#20 s<=0;
		#20 s<=1;
		#20 r<=0;
	end
endmodule

module testbench2(clk,D,Q,Qr);
	output reg clk,D;
	output wire Q,Qr;
	DflipflopDescibe u1(clk,D,Q,Qr);
	initial
	begin
		forever #5 clk<=~clk;
	end
	initial
	begin
		clk<=0;
		D<=0;
		#20 D<=1;
		#20 D<=0;
	end
endmodule

module testbench3(clk,D,Q);
	output reg clk,D;
	output wire [3:0]Q;
	ShiftRegister u2(clk,D,Q);
	initial
	begin
		forever #5 clk<=~clk;
	end
	initial
	begin
		clk<=0;
		D<=1;
		#40 D<=0;
	end
endmodule
