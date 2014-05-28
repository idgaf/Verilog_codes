module mux(c0,c1,c2,c3,s1,s0,z);
	input wire c0,c1,c2,c3,s1,s0;
	output wire z;
	assign z=(~s1&&~s0)&&c0 || (~s1&&s0)&&c1 ||(s1&&~s0)&&c2 || (s1&&s0)&&c3;
endmodule
