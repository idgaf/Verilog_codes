`timescale 1ns/1ns
module pcm(set,clk,q1,q2,q3);
	input set,clk;
	output q1,q2,q3;
	reg q1=0,q2=0,q3=0;
	reg [4:0]count;	
	always @(posedge clk)
	begin
		if(set==1) count=9;
		else
		  begin
			 if(count!=0) count<=count-1;
		  end
		if(count<10&&count>6&&set!=1)
		begin
			q1<=1;
			q2<=0;
			q3<=0;
		end
		if(count<7&&count>3)
		begin
			q1<=0;
			q2<=1;
			q3<=0;
		end
		if(count<4&&count>0)
		begin
			q1<=0;
			q2<=0;
			q3<=1;
		end
		if(count==0)
		begin
			q1<=0;
			q2<=0;
			q3<=0;
		end
	end
endmodule

module test_bench(set,clk,q1,q2,q3);
	output set,clk;
	output q1,q2,q3;
	reg set=0,clk=0;
	pcm utt(.set(set),.clk(clk),.q1(q1),.q2(q2),.q3(q3));
	initial
	begin
		#5 set<=1;
		#10 set<=0;
		#100 set<=1;
		#10 set<=0;
	end
	initial
	begin
		forever #5 clk<=~clk;
	end
endmodule


