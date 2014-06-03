module main(H0,H1,H2,H3,H4,H5,H6,H7,SW,KEY,LED,sysclk,UART_TX,UART_RX,UART2_TX,UART2_RX,GPIO);
	input wire [3:0]KEY;
	input wire [17:0]SW;
	input wire sysclk;
	input wire UART_RX;
	input wire UART2_RX;
	output wire [6:0]H0;
	output wire [6:0]H1;
	output wire [6:0]H2;
	output wire [6:0]H3;
	output wire [6:0]H4;
	output wire [6:0]H5;
	output wire [6:0]H6;
	output wire [6:0]H7;
	output wire [17:0]LED;
	output wire UART_TX;
	output wire UART2_TX;
	output wire [4:0]GPIO;
	//output wire [7:0]GPIO;
	//CANCEL USELESS PINS
	assign H0=7'b1111111;
	assign H1=7'b1111111;
	assign H2=7'b1111111;
	assign H3=7'b1111111;
	assign H4=7'b1111111;
	assign H5=7'b1111111;
	assign H6=7'b1111111;
	assign H7=7'b1111111;
	

	wire datain,reset;
	wire dataout;
	wire w1,w2;
	wire [7:0]w3,w4;
	reg [7:0]count;
	reg my_clk;
	wire [7:0]d;
	assign datain=UART2_RX;
	assign UART2_TX=dataout;
	
	//assign datain=UART_RX;
	//assign UART_TX=dataout;
	
	//assign GPIO[0]=datain;
	//assign GPIO[2]=dataout;
	
	assign reset=KEY[0];
	assign LED[7:0]=w3;
	assign LED[17]=w1;
	assign LED[16]=w2;
	assign LED[15:8]=d;
	always@( posedge sysclk or negedge reset )
	begin
		if( reset==0 )
		begin
			count <= 0;
			my_clk <= 0;
		end
		else
		begin
			if( count == 8'd162 )
			begin
				count <= 0;
				my_clk <= ~my_clk;
			end
			else
				count <= count + 1;
		end
	end
	
	Rx r(datain,w3,reset,my_clk,w1);
	//Rx(DataIn,Data,reset,clk,DataEn);
	control c(w3,my_clk,reset,w4,w1,w2);
	//control(DataIn,clk,reset,Data,DataInEn,DataEn);
	Tx t(w4,w2,dataout,d,reset,my_clk);
	//Tx(DataIn,DataInEn,DataOut,reset,clk);
	//DEFINE INPUTS
	
	//LINK OUTPUT
	
	//PROGRAM START

	//OUTPUTDISPLAY

endmodule
	
	
	
	 