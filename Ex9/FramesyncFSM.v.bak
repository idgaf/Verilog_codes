module FramesyncFSM(clk,rst,DataIn,DataOut,DataOutEn,State);
	input wire clk,rst,DataIn;
	output reg DataOut,DataOutEn;
	output reg [1:0]State;
	wire inter;
	reg [1:0]MissCount;
	reg [1:0]RecCount;
	reg [7:0]Count;
	reg CountEn;
	Probe u0(DataIn,S,clk);
	Count256 u1(clk,CountEn,inter);
	initial
	begin
		Count<=8'd0;
		MissCount<=2'd0;
		RecCount<=2'd0;
		CountEn<=0;
	end
	
	always@(negedge rst or posedge S or posedge inter)
	begin
		if(rst==0) begin State<=2'd0; MissCount<=2'd0; Count<=8'd0; RecCount<=2'd0; CountEn<=0; end
		else if(inter==1)
		begin
			if(S==1) RecCount=RecCount+1;
			else 
			begin
				MissCount=MissCount+1;
				CountEn<=0;
			end
			case(State)
				2'b00:	
				begin
					if(RecCount==2'd1) begin State<=2'b01; RecCount<=2'd0; end
				end
				2'b01:
				begin
					if(RecCount==2'd2) begin State<=2'b10; RecCount<=2'd0; end
					if(MissCount==2'd1)begin MissCount<=2'd0; State<=2'b00;end
				end
				2'b10:
				begin
					if(MissCount==2'd1) begin MissCount<=2'd0;State<=2'b11;end
				end
				2'b11:
				begin
					if(RecCount==2'd1) begin State<=2'b10; RecCount<=2'd0; end
					if(MissCount==2'd3) begin State<=2'b00; MissCount<=2'd0;end
				end
			endcase
		end
		else if(S==1) CountEn<=1;	
	end
	
	always@(State)
	begin
		if(State==2'b10)
		begin
			DataOutEn<=1;
			DataOut<=DataIn;
		end
		else DataOutEn<=0;
	end
	
endmodule

		