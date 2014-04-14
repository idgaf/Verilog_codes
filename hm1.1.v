`timescale 1ns/1ns
module counter(reset,up_enable,clk,count,bcd);
	input reset,up_enable,clk;
	output count;
	output [3:0]bcd;
	reg count;
	reg [3:0]bcd;

	always @(reset)
	begin
		if(reset==0)
		begin
			count<=0;
			bcd<=4'b0000;
		end
	end
	
	always @(posedge clk)
	begin 
		if(up_enable==1 && reset==1)
		begin
			if(bcd==4'b1001)
			begin
				bcd<=4'b0000;
			end
			else
			begin
				bcd<=bcd+1;
			end
		end
	end

	always @(bcd)
	begin
		if(bcd==4'b1001)
		begin
			count<=1;
		end
		else
		begin
			count<=0;
		end
	end

endmodule



module 	test_bench(reset,up_enable,clk,count,bcd);
 	output reset,up_enable,clk;
	output count;
	output [3:0]bcd;
	reg reset=0,up_enable=0,clk=0;
	wire count;
	wire [3:0]bcd;

	counter uut(.reset(reset),.clk(clk),.up_enable(up_enable),.count(count),.bcd(bcd));
	initial
	begin
		#5 reset =1;
		#20 reset=0;
		#30 reset=1;
		#30 up_enable=1;
		#110 up_enable=0;	
		#200 up_enable=1;
	end
	initial
	begin
	  	forever #5 clk<= ~clk;
	end  		
endmodule
