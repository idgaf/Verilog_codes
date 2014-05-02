module Ex1(a,b,s,y,leda,ledb,leds);
	input	a,b,s;
	output y,leda,ledb,leds;
	wire a,b,s,y,leda,ledb,leds;
	assign y=(~s&&a)||(s&&b);
	assign leda=a;
	assign ledb=b;
	assign leds=s;
endmodule
