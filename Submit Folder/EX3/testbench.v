module testb(a,b,c,s,cout);
	output reg [3:0]a; 
	output reg [3:0]b; 
	output reg [3:0]c; 
	output wire [3:0]s; 
	output wire cout; 
	Adder utt(.a(a),.b(b),.c(c),.s(s),.cout(cout));
	initial
	begin
	a<=7;
	b<=8;
	c<=0;
	end
endmodule