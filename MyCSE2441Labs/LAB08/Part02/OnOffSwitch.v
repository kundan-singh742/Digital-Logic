 module OnOffSwitch
(
	input clock_sig, reset_sig, OnOff_sig,
	output OUT_sig
);
	wire IN_sig;
	
	oneHzclock oneHzclock_inst
	(
		.clock(clock_sig) ,	// input  clock_sig
		.reset(reset_sig) ,	// input  reset_sig
		.OneHz(IN_sig) 	// output  OneHz_sig
	);
	
	OnOffToggle OnOffToggle_inst
	(
		.OnOff(OnOff_sig) ,	// input  OnOff_sig
		.IN(IN_sig) ,			// input  IN_sig
		.OUT(OUT_sig) 			// output  OUT_sig
	);
	endmodule
	