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
	assign H1[5:0]=6'b111111;
	assign H2=7'b1111111;
	assign H3=7'b1111111;
	assign H5=7'b1111111;
	assign H7=7'b1111111;
	//DEFINE INPUTS
	wire [3:0]A;
	wire [3:0]B;
	wire [3:0]S;
	wire CIN,COUT;
	assign A[3:0]=SW[3:0];
	assign B[3:0]=SW[7:4];
	assign CIN=KEY[0];
	//LINK OUTPUT
	assign LED[3:0]=S[3:0];
	assign LED[4]=COUT;
	assign LED[17]=SW[17];
	assign LED[16]=SW[16];
	//PROGRAM START
	wire [14:0]temp;
	RippieAdder u0(A,B,CIN,temp[3:0],temp[4]);
	SuperAdder u1(A,B,CIN,temp[8:5],temp[9]);
	Subtractor u2(A,B,temp[13:10],temp[14]);
	MUX3bit3to1(temp[3:0],temp[8:5],temp[13:10],SW[17:16],S);
	MUX1bit3to1(temp[4],temp[9],temp[14],SW[17:16],COUT);
	assign H1[6]=~(SW[17]&&~COUT);
	//OUTPUTDISPLAY
	translator t0(SW[3:0],H4);
	translator t1(SW[7:4],H6);
	translator t2(S,H0);
endmodule
	
	
	
	 