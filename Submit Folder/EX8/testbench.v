module testbench(sysclk,mode,sigin,control,H0,H1,H2,H3);
	output reg sysclk;
	output reg [1:0]mode;
	output reg control;
	output wire [6:0]H0;
	output wire [6:0]H1;
	output wire [6:0]H2;
	output wire [6:0]H3;
	signalinput u0(mode,sysclk,sigin);
	frequency u1(sigin,sysclk,control,H0,H1,H2,H3);
	initial
	begin
		forever #1 sysclk<=~sysclk;
	end
	initial
	begin
	sysclk<=0;
	mode<=0;
	control<=0;
	end
endmodule
	
	
	
	 
