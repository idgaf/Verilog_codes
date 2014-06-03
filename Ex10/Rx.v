module Rx(DataIn,Data,reset,clk,DataEn);
	input wire DataIn,reset,clk;
	output reg [7:0]Data;
	output reg DataEn;
	reg [4:0]sample;
	reg [2:0]count;
	reg status;
	
	always@(posedge clk,negedge reset)
	begin
		if(reset==0)
		begin
			sample<=0;
			Data<=0;
			status<=0;
			DataEn<=0;
			count<=0;
		end
		else if(status==0)
		begin			
			if(sample!=0)
				sample <= sample - 1;
			else
			begin
				DataEn<=0;
				if(DataIn==0)
				begin
					status<= 1;
					sample<= 23;
				end
			end
		end
		else
		begin			
			if(sample==0)
			begin		
				sample<= 15;
				Data[7:0]<={DataIn,Data[7:1]};
				count<=count+1;
				if(count==7)
				begin
					status<= 0;
					DataEn<= 1;
				end
			end
			else
				sample<=sample-1;
		end
	end
endmodule
