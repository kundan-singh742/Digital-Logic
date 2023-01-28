module Calculator
(
	input Clock, Clear, Enter, Function,
	input [3:0] Row,
	output [3:0]Column,
	output [6:0] Hex0, Hex1, Hex2, Hex3,
	output [1:0] ledr
	
);
	wire Slow_Clock, E_C_SYNC;
	wire [7:0] InputValue;
	wire [7:0] Aout, Bout, Rout,sout;
	wire iUAU;
	wire [7:0] MUX_out;
	wire Reset;

/*
	clock_div #(64,50000000) slow_clock
(
	.clk(Clock) ,	// input  clk_sig
	.reset(~Clear) ,	// input  reset_sig
	.clk_out(Slow_Clock) 	// output  clk_out_sig
);
*/
EdgeDetect EdgeDetect_inst
(
	.in(~Enter) ,	// input  in_sig
	.clock(Clock) ,	// input  clock_sig
	.out(E_C_SYNC) 	// output  out_sig
);

ControlUnit ControlUnit_inst
(
	.clk (Clock),
	.ENTER(E_C_SYNC) ,	// input  ENTER_sig
	.CLR(Clear) ,	// input  CLR_sig
	.RESET(Reset) ,	// output  RESET_sig
	.LoadA(Aout) ,	// output  LoadA_sig
	.LoadB(Bout) ,	// output  LoadB_sig
	.LoadR(Rout) ,	// output  LoadR_sig
	.LoadOU(loadOU) ,	// output  LoadOU_sig
	.IUAU(iUAU) ,	// output  IUAU_sig
	.LEDR(ledr)
);

InputUnit IU
(
	.CLK(Clock) ,	// input  CLK_sig
	.CLR(Reset) ,	// input  CLR_sig
	.ROW(Row) ,	// input [3:0] ROW_sig
	.COLUMN(Column) ,	// output [3:0] COLUMN_sig
	.OUTPUT(InputValue) ,	// output [7:0] OUTPUT_sig
	.check() 	// output  check_sig	
);

EightBitAU AU
(
	.inputValue(InputValue) ,	// input [7:0] inputValue_sig
	.CLKA(Aout) ,	// input  CLKA_sig
	.CLKB(Bout) ,	// input  CLKB_sig
	.CLKO(Rout) ,	// input  CLKO_sig
	.clear(~loadOU) ,	// input  clear_sig
	.AddorSubtract(Function) ,	// input  AddorSubtract_sig
	.hex0() ,	// output [6:0] hex0_sig
	.hex1() ,	// output [6:0] hex1_sig
	.hex2() ,	// output [6:0] hex2_sig
	.hex3() ,	// output [6:0] hex3_sig
	.hex4() ,	// output [6:0] hex4_sig
	.hex5() ,	// output [6:0] hex5_sig
	.Aout() ,	// output [7:0] Aout_sig
	.Bout() ,	// output [7:0] Bout_sig
	.Sout(sout) ,	// output [7:0] Sout_sig
	.OVERFLOW() ,	// output  OVERFLOW_sig
	.CARRY() 	// output  CARRY_sig
);

Multiplexer2To1 Mux2TO1
(
	.A(InputValue) ,	// input [N-1:0] A_sig
	.B(sout) ,	// input [N-1:0] B_sig
	.S(iUAU) ,	// input  S_sig
	.Y(MUX_out) 	// output [N-1:0] Y_sig
);

OutputUnit OutputUnit_inst
(
	.in(MUX_out) ,	// input [7:0] in_sig
	.out() ,	// output [7:0] out_sig
	.hex0(Hex0) ,	// output [6:0] hex0_sig
	.hex1(Hex1) ,	// output [6:0] hex1_sig
	.hex2(Hex2) ,	// output [6:0] hex2_sig
	.hex3(Hex3) ,	// output [6:0] hex3_sig
	.ones_out() ,	// output [3:0] ones_out_sig
	.tens_out() ,	// output [3:0] tens_out_sig
	.hundred_out() ,	// output [3:0] hundred_out_sig
	.sign_out() 	// output [3:0] sign_out_sig
);

endmodule
