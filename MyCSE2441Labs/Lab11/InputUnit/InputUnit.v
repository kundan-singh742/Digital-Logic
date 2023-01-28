module InputUnit
(
	input CLK, CLR,
	input [3:0]ROW, 
	output [3:0]COLUMN,
	output [7:0]OUTPUT,
	output reg check
);

	wire[15:0] OUT;
	wire[7:0] binarySM_out;

keypad_input keypad_input_inst
(
	.clk(CLK) ,								// input  clk_sig
	.reset(CLR) ,							// input  reset_sig
	.row(ROW) ,								// input [3:0] row_sig
	.col(COLUMN) ,							// output [3:0] col_sig
	.out(OUT) ,								// output [DIGITS*4-1:0] out_sig
	.value(VALUE) ,						// output [3:0] value_sig
	.trig(TRIG) 							// output  trig_sig
);

BCD2BinarySM BCD2BinarySM_inst
(
	.BCD(OUT) ,								// input [15:0] BCD_sig
	.binarySM(binarySM_out) 			// output [N-1:0] binarySM_sig
);

TwosComplement TwosComplement_inst
(
	.Ai(binarySM_out) ,					// input [7:0] Ai_sig
	.Bo(OUTPUT) 							// output [7:0] Bo_sig
);

always @(OUT)
		begin
			if(OUT[11:0] > 16'b000100100111)
				 check = 1'b1;
			else
				 check = 1'b0;
		end

endmodule
