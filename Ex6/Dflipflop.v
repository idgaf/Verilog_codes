module Dflipflop(s,r,clk,D,Q,Qr);
	input wire s,r,clk,D;
	output wire Q,Qr;
	nand(L1,s,L4,L2);
	nand(L2,L1,r,clk);
	nand(L3,L2,clk,L4);
	nand(L4,L3,r,D);
	nand(Q,s,L2,Qr);
	nand(Qr,Q,r,L3);
endmodule

module DflipflopDescibe(clk,r,D,Q,Qr);
	input wire clk,D,r;
	reg temp;
	output wire Q,Qr;
	always@(posedge clk or negedge r)
	begin
		if(r==1'b0) temp<=4'b0000;
		else temp<=D;
	end
	assign Q=temp;
	assign Qr=~temp;
endmodule
