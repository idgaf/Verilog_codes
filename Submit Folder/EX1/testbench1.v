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
