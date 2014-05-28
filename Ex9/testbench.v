module testbench(Clock,DataIn,DataOut,DataOutEn,State,Reset,sysclk,Mode,inter,S);
        output wire Clock,DataIn,DataOut,DataOutEn,inter,S;
        output wire [1:0]State;       
        output reg Reset,sysclk;
        output reg [1:0]Mode;
        
  FrameTrans u0(Reset,sysclk,Mode,Clock,DataIn);
//	Probe u1(DataIn,S,Clock);
	FramesyncFSM u1(Clock,Reset,DataIn,DataOut,DataOutEn,State,inter,S);
	//FrameDataCheck u2(Reset, Clock, DataOut, DataOutEn, DataWrong);
	
	initial
	begin
	Mode<=2'b10;
	Reset<=1;
	sysclk<=0;
	#10 Reset<=0;
	#5  Reset<=1;
	end
	initial
	begin
	       forever #5 sysclk<=~sysclk;
	end
endmodule
