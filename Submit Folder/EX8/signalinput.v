module signalinput(testmode,sysclk,sigin1);
	input[1:0]testmode;
	input sysclk;
	output sigin1;
	reg [20:0]state;
	reg [20:0]divided;
	reg sigin;
	assign sigin1=sigin;
	initial
	begin
		sigin=0;
		state=21'b000000000000000000000;
		divided=21'b000000_1111_1010_0000000;
	end
	always@(testmode)
	begin
		case(testmode)
		2'b00:	divided=21'd16000;
		2'b01:	divided=21'd8000;
		2'b10:	divided=21'd1000000;
		2'b11:	divided=21'd4000;
		endcase
	end
	always@(posedge sysclk)
	begin
		if(state==0)
			sigin=~sigin;
		state=state+21'b0_00_0000_0000_0000_0000_10;
		if(state==divided) state=27'd0;
	end
endmodule
