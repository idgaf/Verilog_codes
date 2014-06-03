module main(H0,H1,H2,H3,H4,H5,H6,H7,SW,KEY,LED,sysclk);
	input wire [3:0]KEY;
	input wire [17:0]SW;
	input wire sysclk;
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
	
	reg [1:0]model;
	reg [1:0]Mode;
	always@(posedge KEY[0]) model<=model+1;
	always@(posedge KEY[1]) Mode<=model;
	wire Reset;	assign Reset=KEY[2];
	wire [1:0]State;
	wire DataWrong;
	wire DataOut;
	wire DataOutEn;
	assign LED[1:0]=model;
	assign LED[2]=DataWrong;
	assign LED[3]=DataOutEn;
	assign LED[5:4]=State;
	
	reg led;
	assign LED[17]=led;
	initial led<=0;
	always@(posedge inter) led<=~led;
	
	reg led2;
	assign LED[16]=led2;
	initial led2<=0;
	always@(posedge S) led2<=~led2;
	
	reg led3;
	assign LED[15]=led3;
	initial led3<=0;
	always@(posedge DataIn) led3<=~led3;
	//DEFINE INPUTS
	
	//LINK OUTPUT
	
	//PROGRAM START
	FrameTrans(Reset,sysclk,Mode,Clock,DataIn);
	FramesyncFSM(Clock,Reset,DataIn,DataOut,DataOutEn,State,inter,S);
	FrameDataCheck(Reset,
					  Clock,
					  DataOut,
					  DataOutEn,
					  DataWrong);
	//OUTPUTDISPLAY

endmodule
	
	
	
	 