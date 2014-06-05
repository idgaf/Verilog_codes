module FramesyncFSM(clk,rst,DataIn,DataOut,DataOutEn,State,inter,S);
	input wire clk,rst,DataIn;
	output reg DataOut,DataOutEn;
	output reg [1:0]State;
	output wire S;
	output  reg inter;
	reg [1:0]MissCount;
	reg [1:0]RecCount;
	reg [7:0]count;
	reg CountEn;
	Probe u0(DataIn,S,clk);
	//Count256 u1(clk,CountEn,inter);
	initial 
	begin
	State<=2'd0;
	MissCount<=2'd0; count<=8'd0; RecCount<=2'd0; 
	end
	always@(posedge clk)
	begin
	 
		if(count==8'b1111_1111) begin inter<=1;count<=0;end
		else
		begin
			inter<=0;
			if(CountEn==1) count<=count+1;
			else count<=8'b0000_0000;
		end
		if(rst==0)count<=8'd0;
		

	end
	always@(negedge clk)
	begin
			if(rst==0) begin State<=2'd0; MissCount<=2'd0;  RecCount<=2'd0; end
	  		case(State)
			2'b00:	
			begin
				if(S==1) begin State<=2'b01;CountEn<=1; end
				DataOutEn<=0;
			end
			2'b01:
			begin
				if(inter==1&&S==1) 
				begin 
					if(RecCount==2'd1) begin State<=2'b10; RecCount<=2'd0; end
					else RecCount<=RecCount+1;
				end
				else if(inter==1&&S==0)begin  State<=2'b00;DataOutEn<=1;RecCount<=0; CountEn<=0;end
				DataOutEn<=0;
			end
			2'b10:
			begin
				if(inter==1&&S==0) State<=2'b11;
				if(count<8'd247)
				begin
					DataOutEn<=1;
					DataOut<=DataIn;
				end
				else DataOutEn<=0;
			end
			2'b11:
			begin
				if(inter==1&&S==1) State<=2'b10; 
				else if(inter==1&&S==0) 
				begin 
					if(MissCount==2'd2) begin State<=2'b00; MissCount<=2'd0;CountEn<=0;end
					else MissCount<=MissCount+1;
				end
				DataOutEn<=0;
			end
			endcase

	end
endmodule

		