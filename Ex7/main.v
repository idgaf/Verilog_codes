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
	assign H0=7'b1111111;
	assign H1=7'b1111111;
	assign H2=7'b1111111;
	assign H3=7'b1111111;
	assign H4=7'b1111111;
	assign H5=7'b1111111;
	assign H6=7'b1111111;
	assign H7=7'b1111111;
	//DEFINE INPUTS
	wire A,clk,r;
	wire [2:0]S;
	wire result;
	assign A=SW[0];
	assign r=KEY[1];
	assign clk=KEY[0];
	assign LED[7:5]=S;
	assign LED[0]=result;
	//LINK OUTPUT
	FSM u0(A,r,clk,S,result);
	//PROGRAM START

	//OUTPUTDISPLAY

endmodule
	
	
	
	 