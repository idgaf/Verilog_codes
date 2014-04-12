module pcm(set,clk,q1,q2,q3);
	input set,clk;
	output q1,q2,q3;
	reg q1,q2,q3;
	reg count;	
	always @(posedge clk)
	begin
		if(set==1)
		begin
			count=9;
			
