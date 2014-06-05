module control(DataIn,clk,reset,Data,DataInEn,DataEn);
	input [7:0]DataIn;
	input clk,reset,DataInEn;
	output reg DataEn;
	output reg [7:0]Data;
	reg [7:0]data;
	reg [3:0]count;
	reg outready;
	
	always@(posedge clk,negedge reset)
	begin
		if(reset==0)
		begin
			count<=15;
			Data<=0;
			DataEn<=0;
			outready<=0;
		end
		
		else if(DataInEn)
		begin
				outready<=1;
				data<=DataIn;
		end
		else if(outready)
		begin
			count<=count-1;
			if(count==0)
			begin
				DataEn<=0;
				outready<=0;
			end
			else
			begin			
				DataEn<=1;
				if(data[7]==1)
					Data<=data^8'b11111111;
				else
					Data<=data;
			end
			
		end
	end
	/*
	always@(negedge clk)
	begin
		if(reset==0) begin outready<=0; end
		else if(DataInEn) begin outready<=1;data<=DataIn; end
		else if(outready==1&&count==0) begin outready<=0;end
	end
	*/
endmodule
