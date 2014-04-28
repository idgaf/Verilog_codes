`timescale 1ns/1ns
module mux(a,b,s,y);
	input	a,b,s;
	output y;
	wire a,b,s,y;
	assign y=(~s&&a)||(s&&b);
endmodule

module test_bench(a,b,s,y);
	output a,b,s,y;
	reg a=0,b=0,s=0;
	wire y;
	mux tst(.a(a),.b(b),.s(s),.y(y));
	initial
	begin
		#10 s<=0;
		#10 a<=1;
		#10 a<=0;
		#10 b<=1;
		#10 b<=0;
		#10 s<=1;
		#10 a<=1;
		#10 a<=0;
		#10 b<=1;
		#10 b<=0;
	end
endmodule
