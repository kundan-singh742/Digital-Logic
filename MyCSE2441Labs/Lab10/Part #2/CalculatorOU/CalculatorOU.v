module CalculatorOU
(
	input clock, clear, onoff,
	output [7:0]OUT,
	output [6:0]hex0,hex1,hex2,hex3 
);
	wire [7:0]TPG_OUT;

TPG TPG_inst
(
	.CLK(clock) ,	// input  CLK_sig
	.CLR(clear) ,	// input  CLR_sig
	.ONOFF(onoff) ,	// input  ONOFF_sig
	.OUT(TPG_OUT) 	// output [7:0] OUT_sig
);
assign OUT = TPG_OUT;

OutputUnit OutputUnit_inst
(
	.in(TPG_OUT) ,	// input [7:0] in_sig
	.hex0(hex0) ,	// output [6:0] hex0_sig
	.hex1(hex1) ,	// output [6:0] hex1_sig
	.hex2(hex2) ,	// output [6:0] hex2_sig
	.hex3(hex3) 	// output [6:0] hex3_sig
);
endmodule
