`timescale 1ns/1ns
module translator(A,D);
	input [2:0]A;
	output [7:0]D;
	wire [2:0]A;
	wire [7:0]D;
	assign D[7]=A[2]&&A[1]&&A[0];	
	assign D[6]=A[2]&&A[1]&&~A[0];	
	assign	D[5]=A[2]&&~A[1]&&A[0];	
	assign D[4]=A[2]&&~A[1]&&~A[0];	
	assign D[3]=~A[2]&&A[1]&&A[0];	
	assign D[2]=~A[2]&&A[1]&&~A[0];	
	assign D[1]=~A[2]&&~A[1]&&A[0];	
	assign D[0]=~A[2]&&~A[1]&&~A[0];	
endmodule

module testbench(A,D);
	output A,D;
	reg [2:0]A;
	wire [7:0]D;
	translator utt(.A(A),.D(D));
	initial
	begin
		A[0]<=0;
		A[1]<=0;
		A[2]<=0;
		#5 A[0]<=1;
		#5 A[0]<=0;
		   A[1]<=1;
		#5 A[0]<=1;
		#5 A[0]<=0; 
		   A[1]<=0;
		   A[2]<=1;
		#5 A[0]<=1;
		#5 A[0]<=0;
		   A[1]<=1;
		#5 A[0]<=1;
	end
endmodule
