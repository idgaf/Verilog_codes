module FSM(A,r,clk,S,result);
	input wire A,r,clk;
	output reg [2:0]S;
	output reg result;
	always@(negedge r or posedge clk)
	begin
		if(r==0) S<=3'b000;
		else
		begin
			case(S)
			3'b000:	S<=(A==1)?3'b001:3'b000;	//start	A	start
			3'b001:	S<=(A==1)?3'b001:3'b010;	//A		A	B
			3'b010:	S<=(A==1)?3'b011:3'b000;	//B		C	start
			3'b011: S<=(A==1)?3'b001:3'b100;	//C		A	D
			3'b100: S<=(A==1)?3'b101:3'b000;	//D		E	start
			3'b101: S<=(A==1)?3'b110:3'b010;	//E		F	B
			3'b110:	S<=(A==1)?3'b001:3'b010;	//F		A	B
			endcase
			result<=(S==3'b110)?1:0;
		end
	end
endmodule