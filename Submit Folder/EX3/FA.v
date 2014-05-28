module FA(x,y,cin,s,co);
	input wire x,y,cin;
	output wire s,co;
	assign s=~x&&(~y&&cin||y&&~cin)||x&&(y&&cin||~y&&~cin);
	assign co=(x||y)&&cin||x&&y;
endmodule
