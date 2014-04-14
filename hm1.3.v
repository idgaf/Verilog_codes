`timescale 1ns/1ns
module gys(clk,a,b,c);
	input clk;
	input [8:0]a;
	input [8:0]b;
	output [8:0]c;
	wire [8:0]a;
	wire [8:0]b;
	reg [8:0]a_t=0;
	reg [8:0]b_t=0;
	reg [8:0]c=0;
	always@(a,b)
	begin 
	  a_t<=a;
	  b_t<=b;
	end
	
	always @(posedge clk)
	begin
		if(a_t>b) a_t<=a_t-b_t;
		else
		begin
			if(b_t>a_t) b_t<=b_t-a_t;
			else c<=a_t;
		end
	end
endmodule

module test_bench(clk,a,b,c);
	output clk;
	output [8:0]a;
	output [8:0]b;
	output [8:0]c;
	reg clk=0;
	reg [8:0]a;
	reg [8:0]b;
	wire [8:0]c;
	gys utt(.clk(clk),.a(a),.b(b),.c(c));
	//gys utt(clk,a,b,c);
	initial
	begin
		a<=35;
		b<=15;
		#5 clk<=1;
		#100 a<=23;
	end
	initial
	begin
		forever #5 clk<=~clk;	
	end
endmodule
