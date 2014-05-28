module test_bench(a,b,s,y);
	output a,b,s,y;
	reg a=0,b=0,s=0;
	wire y;
	mux tst(.a(a),.b(b),.s(s),.y(y));
	initial
	begin
		    s<=1;
		    a<=1;
		    b<=1;
		
#10 s<=0;

	end
endmodule