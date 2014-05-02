module Ex2(A,D);
	input wire [2:0]A;
	output wire [7:0]D;
	assign D[7]=A[2]&&A[1]&&A[0];	
	assign D[6]=A[2]&&A[1]&&~A[0];	
	assign	D[5]=A[2]&&~A[1]&&A[0];	
	assign D[4]=A[2]&&~A[1]&&~A[0];	
	assign D[3]=~A[2]&&A[1]&&A[0];	
	assign D[2]=~A[2]&&A[1]&&~A[0];	
	assign D[1]=~A[2]&&~A[1]&&A[0];	
	assign D[0]=~A[2]&&~A[1]&&~A[0];	
endmodule
