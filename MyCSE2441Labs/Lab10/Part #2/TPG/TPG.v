module TPG
(
	input CLK, CLR, ONOFF,
	output [7:0] OUT
);
	wire OneHz_OUT;

OnOffSwitch OnOffSwitch_inst
(
	.clock_sig(CLK) ,	// input  clock_sig_sig
	.reset_sig(CLR) ,	// input  reset_sig_sig
	.OnOff_sig(ONOFF) ,	// input  OnOff_sig_sig
	.OUT_sig(OneHz_OUT) 	// output  OUT_sig_sig
);


EightBitCounter EightBitCounter_inst
(
	.CLOCK(OneHz_OUT) ,	// input  COUNT_sig
	.CLEAR(CLR) ,	// input  CLEAR_sig
	.y(OUT) 	// output [N-1:0] y_sig
);
endmodule
