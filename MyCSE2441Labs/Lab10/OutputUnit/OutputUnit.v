module OutputUnit
(
	input[7:0]in,
	output[7:0]out, 
	output[6:0] hex0, hex1, hex2, hex3,
	output [3:0] ones_out, tens_out, hundred_out, sign_out
);
	wire[7:0] wireO;
	wire[3:0] ones;
	wire[3:0] tens;
	wire[1:0] hundreds;
	
TwosComplement twoscomplement
(
	.Ai(in) ,					// input 
	.Bo(wireO) 				   // output
);

Binary2BCD binary2BCD
(
	.A({1'b0,wireO[6:0]}) ,	// input 
	.ONES(ones) ,				// output 
	.TENS(tens) ,				// output 
	.HUNDREDS(hundreds) 		// output 
);

SignMagnitude OnesPlace
(
	.w(ones[3]) ,	// input  w_sig
	.x(ones[2]) ,	// input  x_sig
	.y(ones[1]) ,	// input  y_sig
	.z(ones[0]) ,	// input  z_sig
	.a(hex0[0]) ,	// output  a_sig
	.b(hex0[1]) ,	// output  b_sig
	.c(hex0[2]) ,	// output  c_sig
	.d(hex0[3]) ,	// output  d_sig
	.e(hex0[4]) ,	// output  e_sig
	.f(hex0[5]) ,	// output  f_sig
	.g(hex0[6]) 	// output  g_sig
);

SignMagnitude TensPlace
(
	.w(tens[3]) ,	// input  w_sig
	.x(tens[2]) ,	// input  x_sig
	.y(tens[1]) ,	// input  y_sig
	.z(tens[0]) ,	// input  z_sig
	.a(hex1[0]) ,	// output  a_sig
	.b(hex1[1]) ,	// output  b_sig
	.c(hex1[2]) ,	// output  c_sig
	.d(hex1[3]) ,	// output  d_sig
	.e(hex1[4]) ,	// output  e_sig
	.f(hex1[5]) ,	// output  f_sig
	.g(hex1[6]) 	// output  g_sig
);

SignMagnitude HundredsPlace
(
	.w(1'b0) ,			// input  w
	.x(1'b0) ,			// input  x
	.y(hundreds[1]) ,	// input  y
	.z(hundreds[0]) ,	// input  z
	.a(hex2[0]) ,	// output  a
	.b(hex2[1]) ,	// output  b
	.c(hex2[2]) ,	// output  c
	.d(hex2[3]) ,	// output  d
	.e(hex2[4]) ,	// output  e
	.f(hex2[5]) ,	// output  f
	.g(hex2[6]) 	// output  g
);

SignMagnitude SignsPlace
(
	.w(1'b1) ,	// input  w_sig
	.x(1'b1) ,	// input  x_sig
	.y(1'b1) ,	// input  y_sig
	.z(in[7]) ,	// input  z_sig
	.a(hex3[0]) ,	// output  a
	.b(hex3[1]) ,	// output  b
	.c(hex3[2]) ,	// output  c
	.d(hex3[3]) ,	// output  d
	.e(hex3[4]) ,	// output  e
	.f(hex3[5]) ,	// output  f
	.g(hex3[6]) 	// output  g
);

assign sign_out = {1'b1,1'b1,1'b1,in[7]};
assign ones_out = ones;
assign tens_out = tens;
assign hundreds_out = {1'b0,1'b0,hundreds};
endmodule
