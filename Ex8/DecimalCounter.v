module DecimalCounter(clk,rst,mod,r);
	input wire clk,rst,mod;
	output reg [15:0]r;
	reg [19:0]D;
	initial
	begin
		D<=20'b0000_0000_0000_0000_0000;
	end
	
	always@(posedge clk or negedge rst)
	begin
		if(rst==0) begin D<=20'b0000_0000_0000_0000_0000;  end
		else
		begin
			D[3:0]=D[3:0]+1;
			if(D[3:0]==4'b1010) begin D[3:0]=4'b0000; D[7:4]=D[7:4]+1; end 
			if(D[7:4]==4'b1010) begin D[7:4]=4'b0000; D[11:8]=D[11:8]+1; end 
			if(D[11:8]==4'b1010) begin D[11:8]=4'b0000; D[15:12]=D[15:12]+1; end 
			if(D[15:12]==4'b1010) begin D[15:12]=4'b0000; D[19:16]=D[19:16]+1; end 
			if(D[19:16]==4'b1010) begin D[19:16]=4'b0000; end
		end
	end
	always@(posedge clk)
	begin
		if(mod==1)  r<=D[19:4];
		else		r<=D[15:0];
	end
endmodule
