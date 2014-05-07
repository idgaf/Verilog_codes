module MUX3bit3to1(X,Y,Z,C,O);
	input wire [3:0]X;
	input wire [3:0]Y;
	input wire [3:0]Z;
	input wire [1:0]C;
	output reg [3:0]O;
	always @(X,Y,Z,C)
	begin
		case(C)
			2'b00: O<=X;
			2'b01: O<=Y;
			2'b10: O<=Z;
			2'b11: O<=0;
		endcase
	end
endmodule

module MUX1bit3to1(X,Y,Z,C,O);
	input wire X;
	input wire Y;
	input wire Z;
	input wire [1:0]C;
	output reg O;
	always @(X,Y,Z,C)
	begin
		case(C)
			2'b00: O<=X;
			2'b01: O<=Y;
			2'b10: O<=Z;
			2'b11: O<=0;
		endcase
	end
endmodule
