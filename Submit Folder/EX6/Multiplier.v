module Multiplier(A,B,S,clk,rst,enable);
	input wire [1:0]A;
	input wire [1:0]B;
	output wire [3:0]S;
	input wire clk,rst,enable;
	reg ena;
	wire [3:0]Q;
	accumulator (B, clk,S,rst,ena||enable);
	postCounter (clk,rst,Q);
	always@(clk or Q or rst)
	begin
		if(rst==1'b0) ena<=1;
		else if(ena==1'b1) ena<=((A[0]^Q[0]) || (A[1]^Q[1]));
	end
endmodule
