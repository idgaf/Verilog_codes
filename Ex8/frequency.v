module frequency(sigin,sysclk,modecontrol,H0,H1,H2,H3);
	input wire sigin,sysclk,modecontrol;
	output wire[6:0] H0;
	output wire[6:0] H1;
	output wire[6:0] H2;
	output wire[6:0] H3;
	reg rst;
	reg [25:0]count;
	reg [15:0]R;
	wire [15:0]D;
	DecimalCounter(sigin,rst,modecontrol,D);
	translator(R[3:0],H0);
	translator(R[7:4],H1);
	translator(R[11:8],H2);
	translator(R[15:12],H3);
	initial count<=26'd0;
	always@(posedge sysclk)
	begin
		if(rst==0) rst<=1;
		else
		begin
			count=count+1;
			if(count==26'd50000000)
			begin
				rst<=0;
				count<=26'd0;
			end
		end
	end
	always@(negedge rst)	R<=D;
	
endmodule

	
		
	