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
	//assign H0=7'b1111111;
	//assign H1=7'b1111111;
	//assign H2=7'b1111111;
	//assign H3=7'b1111111;
	assign H4=7'b1111111;
	assign H5=7'b1111111;
	assign H6=7'b1111111;
	assign H7=7'b1111111;
	//DEFINE INPUTS
	wire control;
	wire [1:0]mode;
	assign control=SW[7];
	assign mode[1:0]=SW[1:0];
	assign LED[7]=SW[7];
	wire sigin;

	//LINK OUTPUT
	
	//PROGRAM START
	signalinput u0(mode,sysclk,sigin);
	frequency u1(sigin,sysclk,control,H0,H1,H2,H3);
	//OUTPUTDISPLAY

endmodule
	
	
	
	 