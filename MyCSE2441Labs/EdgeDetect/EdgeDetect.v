//Edge detector circuit
module EdgeDetect
( 	input in, clock,
	output out
);
	reg in_delay;
	always @ (posedge clock)
		in_delay <= in;
	assign out = in & ~in_delay;
endmodule
