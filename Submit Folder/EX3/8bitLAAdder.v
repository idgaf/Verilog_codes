module EightBitLAAder(a,b,cin,s,cout);
	input wire [7:0]a;
	input wire [7:0]b;
	input wire cin;
	output wire [7:0]s;
	output wire cout;
	wire temp;
	LookAheadAdder (a[3:0],b[3:0],cin,s[3:0],temp);
	LookAheadAdder (a[7:4],b[7:4],temp,s[7:4],cout);
endmodule
	