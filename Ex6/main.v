module main(H0,H1,H2,H3,H4,H5,H6,H7,SW,KEY,LED);
	input wire [3:0]KEY;
	input wire [17:0]SW;
	output wire [6:0]H0;
	output wire [6:0]H1;
	output wire [6:0]H2;
	output wire [6:0]H3;
	output wire [6:0]H4;
	output wire [6:0]H5;
	output wire [6:0]H6;
	output wire [6:0]H7;
	output wire [17:0]LED;
	//CANCEL USELESS PINS
	//assign H0=7'b1111111;
	assign H1=7'b1111111;
	assign H2=7'b1111111;
	assign H3=7'b1111111;
	//assign H4=7'b1111111;
	assign H5=7'b1111111;
	//assign H6=7'b1111111;
	assign H7=7'b1111111;
	//DEFINE INPUTS
	wire [3:0]A;
	wire [3:0]B;
	wire [3:0]S;
	wire [3:0]dig;
	wire clk,r,ena;
	assign A[3:0]=SW[3:2];
	assign B[1:0]=SW[1:0];
	assign LED[3:0]=S[3:0];
	assign dig[3:0]=S[3:0];
	assign clk=KEY[0];
	assign r=KEY[1];
	assign ena=SW[4];
	//LINK OUTPUT
	translator(B,H4);
	translator(A,H6);
	translator(S,H0);
	//PROGRAM START
	Multiplier(A[1:0],B[1:0],S,clk,r,SW[17]);
	//OUTPUTDISPLAY

endmodule
	
	
	
	 