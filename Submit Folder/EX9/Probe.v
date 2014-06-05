module Probe(D,S,clk);
  input wire D,clk;
  output reg S;
  reg [7:0]temp;
  initial 
  begin
  S<=0;
  temp<=8'd0;
  end
  always@(posedge clk)
  begin
    temp[6]<=temp[5];
    temp[5]<=temp[4];
    temp[4]<=temp[3];
    temp[3]<=temp[2];
    temp[2]<=temp[1];
    temp[1]<=temp[0];
    temp[0]<=D;
    if(temp==7'b1001101&&D==1) S<=1;
    else S<=0;
  end
endmodule
