module mux(a,b,s,y);
	input a,b,s;
	output y;
	wire a,b,s,y;
	assign #1 t1=~s;
	assign #1 t2=t1&&a;
	assign #1 t3=s&&b;
	assign #1 y=t2||t3;
endmodule