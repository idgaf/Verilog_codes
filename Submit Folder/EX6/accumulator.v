module accumulator(A, clk,S,rst,ena);
	input wire [3:0]A;
	output wire [3:0]S;
	input wire clk,rst,ena;
	reg [3:0]r=0;
	wire [3:0]inner;
	SuperAdder(A,r,0,inner,);
	always@(posedge clk or negedge rst)
	begin
		if(rst==1'b0)
		begin
			r[0]<=0;
			r[1]<=0;
			r[2]<=0;
			r[3]<=0;
		end
		else if(clk==1'b1 && ena==1'b1)
		begin
			r[0]<=inner[0];
			r[1]<=inner[1];
			r[2]<=inner[2];
			r[3]<=inner[3];
		end
	end
	
	assign S[0]=r[0];
	assign S[1]=r[1];
	assign S[2]=r[2];
	assign S[3]=r[3];
	
endmodule
