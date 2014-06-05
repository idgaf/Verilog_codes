module testbench(A, clk,S,rst,ena);
	output reg [3:0]A;
	output wire [3:0]S;
	output reg clk,rst,ena;
	accumulator u0(A,clk,S,rst,ena);	
	initial 
	begin
		forever #5 clk<=~clk;
	end
	initial
	begin
		clk<=0;
		A=4'b0001;
		rst<=1;
		ena<=1;
	end
endmodule

module testbench2(A,B,S,clk,rst,enable);
	output reg [1:0]A;
	output reg [1:0]B;
	output wire [3:0]S;
	output reg clk,rst,enable;
	Multiplier u0(A,B,S,clk,rst,enable);	
	initial 
	begin
		forever #5 clk<=~clk;
	end
	initial
	begin
		clk<=0;
		A=2'b11;
		B=2'b11;
		rst<=1;
		ena<=0;
	end
endmodule
