//Verilog Model of N-bit register with active-low asynchronous clear
module register(D,Q,CLK,CLR);
	parameter N=8;			//declare default value of 8
	input [N-1:0]D;		//declare 8-bit data input
	input CLK,CLR;			//declare clock and clear input 
	output reg[N-1:0]Q;	//declare 8-bit data output
		always @ (posedge CLK, negedge CLR)
			begin
				if(CLR==1'b0) Q<=0;			//register loaded with all 0's
				else if(CLK==1'b1) Q<=D;	//data input values loaded in register
	end
endmodule
