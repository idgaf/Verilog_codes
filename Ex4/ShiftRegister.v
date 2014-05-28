module ShiftRegister(clk,D,Q);
	input wire clk,D;
	output wire [3:0]Q;
	wire temp[3:0];
	Dflipflop u0(1'b1,1'b1,clk,D,temp[0],);
	Dflipflop u1(1'b1,1'b1,clk,temp[0],temp[1],);
	Dflipflop u2(1'b1,1'b1,clk,temp[1],temp[2],);
	Dflipflop u3(1'b1,1'b1,clk,temp[2],Q[3],);
	assign Q[0]=temp[0];
	assign Q[1]=temp[1];
	assign Q[2]=temp[2];
endmodule
