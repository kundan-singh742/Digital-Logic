module TwoFunctionAU
(
	input [7:0]inputValue,
	input CLKA, CLKB, CLKO, clear, AddorSubtract,
	output [6:0] hex0, hex1, hex2, hex3, hex4, hex5, 
	output [7:0] Aout, Bout, Sout,
	output OVERFLOW, CARRY
);
	wire [7:0]wireA, wireB, wireO, wireRO;
	
	register #(4'd8) registerA
	(
		.D(inputValue) ,	// input [7:0]inputA
		.Q(wireA) ,			// output [7:0]wireA
		.CLK(CLKA) ,		// input  CLKA
		.CLR(clear) 		// input  clear
	);
assign Aout = wireA;
	
		BinaryToHex MSbofinputA
	(
		.w(wireA[7]) ,	// input  
		.x(wireA[6]) ,	// input  
		.y(wireA[5]) ,	// input  
		.z(wireA[4]) ,	// input  
		.a(hex5[0]) ,  // output  a
		.b(hex5[1]) ,	// output  b
		.c(hex5[2]) ,	// output  c
		.d(hex5[3]) ,	// output  d
		.e(hex5[4]) ,	// output  e
		.f(hex5[5]) ,	// output  f
		.g(hex5[6]) 	// output  g
	);
	
		BinaryToHex LSbofinputA
	(
		.w(wireA[3]) ,	// input  
		.x(wireA[2]) ,	// input  
		.y(wireA[1]) ,	// input  
		.z(wireA[0]) ,	// input  
		.a(hex4[0]) ,	// output  a
		.b(hex4[1]) ,	// output  b
		.c(hex4[2]) ,	// output  c
		.d(hex4[3]) ,	// output  d
		.e(hex4[4]) ,	// output  e
		.f(hex4[5]) ,	// output  f
		.g(hex4[6]) 	// output  g
	);
	
	
	register #(4'd8) registerB
	(
		.D(inputValue) ,	// input [7:0]inputB
		.Q(wireB) ,			// output [7:0]wireB
		.CLK(CLKB) ,		// input  CLKB
		.CLR(clear) 		// input  clear
	);
assign Bout = wireB;
	
		BinaryToHex MSbofinputB
	(
		.w(wireB[7]) ,	// input  
		.x(wireB[6]) ,	// input  
		.y(wireB[5]) ,	// input  
		.z(wireB[4]) ,	// input  
		.a(hex3[0]) ,	// output  a
		.b(hex3[1]) ,	// output  b
		.c(hex3[2]) ,	// output  c
		.d(hex3[3]) ,	// output  d
		.e(hex3[4]) ,	// output  e
		.f(hex3[5]) ,	// output  f
		.g(hex3[6]) 	// output  g
	);
	
		BinaryToHex LSbofinputB
	(
		.w(wireB[3]) ,	// input  
		.x(wireB[2]) ,	// input  
		.y(wireB[1]) ,	// input  
		.z(wireB[0]) ,	// input  
		.a(hex2[0]) ,	// output  a
		.b(hex2[1]) ,	// output  b
		.c(hex2[2]) ,	// output  c
		.d(hex2[3]) ,	// output  d
		.e(hex2[4]) ,	// output  e
		.f(hex2[5]) ,	// output  f
		.g(hex2[6]) 	// output  g
	);
	
	FAbehavadderandsubtract ArithmeticUnit
	(
		.A(wireA) ,					// input [7:0]registerA
		.B(wireB) ,					// input [7:0]registerB
		.Cxor(AddorSubtract) ,	// input Add/Subtract
		.S(wireO) ,					// output [7:0] SUM
		.Cout(CARRY) ,				// output CarryOut
		.OVR(OVERFLOW) 			// output Overflow
	);	

	register #(4'd8) registerO
	(
		.D(wireO) ,			// input [7:0] D
		.Q(wireRO) ,		// output [7:0] Q
		.CLK(CLKO) ,			// input  1
		.CLR(clear) 		// input  clear
	);	

assign Sout = wireRO;

	BinaryToHex BinaryToHexMSb
	(
		.w(wireRO[7]) ,	// input  
		.x(wireRO[6]) ,	// input  
		.y(wireRO[5]) ,	// input  
		.z(wireRO[4]) ,	// input  
		.a(hex1[0]) ,			// output  a
		.b(hex1[1]) ,			// output  b
		.c(hex1[2]) ,			// output  c
		.d(hex1[3]) ,			// output  d
		.e(hex1[4]) ,			// output  e
		.f(hex1[5]) ,			// output  f
		.g(hex1[6])  			// output  g
	);
	
		BinaryToHex BinaryToHexLSb
	(
		.w(wireRO[3]) ,	// input  
		.x(wireRO[2]) ,	// input  
		.y(wireRO[1]) ,	// input  
		.z(wireRO[0]) ,	// input  
		.a(hex0[0]) ,		   // output  a
		.b(hex0[1]) ,			// output  b
		.c(hex0[2]) ,			// output  c
		.d(hex0[3]) ,			// output  d
		.e(hex0[4]) ,			// output  e
		.f(hex0[5]) ,			// output  f
		.g(hex0[6]) 		   // output  g
	);

endmodule	
	