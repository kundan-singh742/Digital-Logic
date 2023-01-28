module MultiplexedSevenSegmentDisplays
(
	input CLOCK, RESET, ONOFF,
	output [3:0]Controller_CAT,
	output [6:0] HEX0, HEX1, HEX2, HEX3,
	output [6:0] f_hex,
	output [1:0] Controller_SEL
);
	wire [3:0] wireO;

	wire [3:0] Signs, Ones, Tens, Hundreds;
	wire [3:0] signs_out, ones_out, tens_out, hundreds_out;
	wire [6:0] hexN;
	wire oneHz_fout, oneHz_out;
	wire [7:0] in;

TPG TPG_inst
(
	.CLK(CLOCK) ,		// input  CLK_sig
	.CLR(RESET) ,		// input  CLR_sig
	.ONOFF(ONOFF) ,	// input  ONOFF_sig
	.OUT(in) 			// output [7:0] OUT_sig
);
	
OutputUnit OutputUnit_inst
(
	.in(in) ,				// input [7:0] in_sig
	.out() ,					// output [7:0] out_sig
	.hex0(HEX0) ,			// output [6:0] hex0_sig
	.hex1(HEX1) ,			// output [6:0] hex1_sig
	.hex2(HEX2) ,			// output [6:0] hex2_sig
	.hex3(HEX3) ,			// output [6:0] hex3_sig
	.ones_out(Ones) ,		// output [3:0] ones_out_sig
	.tens_out(Tens) ,		// output [3:0] tens_out_sig
	.hundred_out(Hundreds) ,	// output [3:0] hundred_out_sig
	.sign_out(Signs) 		// output [3:0] sign_out_sig
);	

divideXN #(500000,23)divideXN_5MHz
(
	.CLK(CLOCK) ,				// input  CLK_sig
	.CLEAR(RESET) ,			// input  CLEAR_sig
	.COUNT(COUNT) ,		// output [M-1:0] COUNT_sig
	.OUT(oneHz_fout) 		// output  OUT_sig
);

divideXN #(10,4)divideXN_tenthHz
(
	.CLK(oneHz_fout) ,	// input  CLK_sig
	.CLEAR(CLR) ,			// input  CLEAR_sig
	.COUNT(COUNT) ,		// output [M-1:0] COUNT_sig
	.OUT(oneHz_out) 		// output  OUT_sig
);
	
FSM FSM_Controller
(
	.slow_clock(oneHz_fout) ,		// input  slow_clock_sig
	.reset(RESET) ,				// input  reset_sig
	.SEL(Controller_SEL) ,	// output [1:0] SEL_sig
	.CAT(Controller_CAT) 	// output [3:0] CAT_sig
);

PIPO BCDones_PIPO 	 (.D(Ones),.CLK(CLOCK),.CLR(RESET),.Q(ones_out));
PIPO BCDtens_PIPO 	 (.D(Tens),.CLK(CLOCK),.CLR(RESET),.Q(tens_out));
PIPO BCDhundreds_PIPO (.D(Hundreds),.CLK(CLOCK),.CLR(RESET),.Q(hundreds_out));
PIPO BCDsigns_PIPO	 (.D(Signs),.CLK(CLOCK),.CLR(RESET),.Q(signs_out));

Four2OneMUX Four2OneMUX_inst
(
	.S(Controller_SEL) ,	// input  S_sig
	.D0(ones_out) ,	// input [N-1:0] D0_sig
	.D1(tens_out) ,	// input [N-1:0] D1_sig
	.D2(hundreds_out) ,	// input [N-1:0] D2_sig
	.D3(signs_out) ,	// input [N-1:0] D3_sig
	.Y(wireO) 	// output [N-1:0] Y_sig
);

SignMagnitude SignMagnitude_inst
(
	.w(wireO[3]) ,	// input  w_sig
	.x(wireO[2]) ,	// input  x_sig
	.y(wireO[1]) ,	// input  y_sig
	.z(wireO[0]) ,	// input  z_sig
	.a(hexN[0]) ,	// output  a_sig
	.b(hexN[1]) ,	// output  b_sig
	.c(hexN[2]) ,	// output  c_sig
	.d(hexN[3]) ,	// output  d_sig
	.e(hexN[4]) ,	// output  e_sig
	.f(hexN[5]) ,	// output  f_sig
	.g(hexN[6]) 	// output  g_sig
);

assign f_hex = ~hexN;

endmodule
