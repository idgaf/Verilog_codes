module Tx(DataIn,DataInEn,DataOut,data,reset,clk);
	input wire [7:0]DataIn;
	input wire DataInEn,reset,clk;
	output reg DataOut;
	output reg [7:0]data;
	reg [4:0]count1,count2;
	reg outready;
	
	always@(negedge reset or posedge clk)
	begin
		if(reset==0)
		begin
			data<=0;
			count1<=0;
			count2<=0;
			DataOut<=1;
			outready<=0;
		end
		else if(DataInEn)
		begin
				data<=DataIn;
				outready<=1;
				count1<=0;
				count2<=0;
		end
		else if(outready)
		begin
			count2<=count2-1;
			if(count2==0)
			begin
				count1<=count1+1;
				if(count1==0)
					DataOut<=0;
				else if(count1==9)
				begin
					DataOut<=1;
					outready<=0;
				end
				else
					DataOut<=data[count1-1];
			end
		end
	end
endmodule
