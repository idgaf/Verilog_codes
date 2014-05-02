module 4x1mux(c0,c1,c2,c3,s1,s0,z);
	input c0,c1,c2,c3,s1,s0;
	output z;
	wire c0,c1,c2,c3,s1,s0,z;
	assign z=(~s1&&~s0)&&c0 || (~s1&&s0)&&c1 ||(s1&&~s0)&&c2 || (s1&&s0)&&c3;
endmodule

module testbench(c0,c1,c2,c3,s1,s0,z)
	output c0,c1,c2,c3,s1,s0,z;
	reg c0=0,c1=0,c2=0,c3=0,s1=0,s0=0;
	wire z;
	4x1mux tst(.c0(c0),.c1(c1),.c2(c2),.c3(c3),.s1(s1),.s0(s0),.z(z));
	initial
	begin
		#10 c0<=1; 
		#10 c0<=0; 
		#10 c1<=1; 
		#10 c1<=0; 
		#10 c2<=1; 
		#10 c2<=0; 
		#10 c3<=1; 
		#10 c3<=0; 
		#10 s0<=1;
		#10 c0<=1; 
		#10 c0<=0; 
		#10 c1<=1; 
		#10 c1<=0; 
		#10 c2<=1; 
		#10 c2<=0; 
		#10 c3<=1; 
		#10 c3<=0; 
		#10 s1<=1;
		s0<=0;
		#10 c0<=1; 
		#10 c0<=0; 
		#10 c1<=1; 
		#10 c1<=0; 
		#10 c2<=1; 
		#10 c2<=0; 
		#10 c3<=1; 
		#10 c3<=0; 
		#10 s0<=1;
		#10 c0<=1; 
		#10 c0<=0; 
		#10 c1<=1; 
		#10 c1<=0; 
		#10 c2<=1; 
		#10 c2<=0; 
		#10 c3<=1; 
		#10 c3<=0; 
	end
endmodule

