module Count256(clk,enable,inter);
	input wire clk,enable;
	output reg inter;
	reg [7:0]count;
	initial begin inter<=0; count<=8'd0;end
	always@(posedge clk)
	begin
		if(count==8'b1111_1111) begin inter<=1;count<=0;end
		else
		begin
			inter<=0;
			if(enable==1) count<=count+1;
			else count<=8'b0000_0000;
		end
	end
endmodule
