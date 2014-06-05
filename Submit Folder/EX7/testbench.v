module testbench(A,r,clk,S,result);
	output reg A,r,clk;
	output wire [2:0]S;
	output wire result;
 	FSM u0(A,r,clk,S,result);
 	initial
 	begin
 	  forever  #10  clk<=~clk;
 	 end
 	initial
 	begin
 	  clk<=0;
 	  r<=0;
 	  A<=0;
 	  #25 r<=1;
 	  #5 A<=1;
 	  #20 A<=0;
 	  #20 A<=1;
 	  #20 A<=0;
 	  #20 A<=1;
 	  #20 A<=1;
 	  #20 A<=0;
 	  #20 A<=1;
 	  #20 A<=0;
 	  #20 A<=1;
 	  #20 A<=1;
 	 end
 	endmodule