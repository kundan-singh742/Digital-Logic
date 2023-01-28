//N-bit, two to one MUX
module Multiplexer2To1 #(parameter N = 8)
(
		input [N-1:0] A, B,  	 //declare data inputs
		input S, 					 //declare select input
		output [N-1:0] Y			 //declare output
);
		assign Y = S==0 ? A : B; //select input
endmodule
