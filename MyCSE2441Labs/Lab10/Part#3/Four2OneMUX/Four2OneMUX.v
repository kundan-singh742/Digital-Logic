//Four-to-one, N-bit multiplexer
module Four2OneMUX #(parameter N = 4)
(
		input S, //declare select inputs
		input [N-1:0] D0,D1,D2,D3,     //declare data inputs
		output reg [N-1:0] Y //declare data outputs
);
	always @ (S,D0,D1,D2,D3) //detect input change
		case (S) //derive the output
				2'b00: Y = D0;
				2'b01: Y = D1;
				2'b10: Y = D2;
				2'b11: Y = D3;
		endcase
endmodule
