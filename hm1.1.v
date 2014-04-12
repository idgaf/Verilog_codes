module counter(reset, up_enable,clk,count,bcd);
	input reset,up_enable,clk;
	output count,[3:0]bcd;
	reg count,[3:0]bcd;

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



module test_bench(reset,up_enable,clk,count,bcd)
	output reset,up_enalbe,clk,count,[3:0] bcd;
	inital
	begin
	

