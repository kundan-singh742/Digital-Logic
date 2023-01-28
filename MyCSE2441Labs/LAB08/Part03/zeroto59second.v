module zeroto59second
(
	input clock_sig, reset_sig, OnOff_sig,
	output [6:0]hex0,hex1
);
	wire [3:0]count1, count2;
	wire output1, output2, output3;
	
	//instantiations for onehz switched
	OnOffSwitch OnOffSwitch_inst
	(
		.clock_sig(clock_sig) ,	// input  
		.reset_sig(reset_sig) ,	// input  
		.OnOff_sig(OnOff_sig) ,	// input  
		.OUT_sig(output1) 		// output  
	);
	
	//instantiations for divide 10
	divideXN #(4'd10, 3'd4) divideXN_inst1
	(
		.CLK(output1) ,			// input  
		.CLEAR(reset_sig) ,		// input  
		.COUNT(count1) ,			// output count1[3:0] 
		.OUT(output2) 				// output  
	);
	
	////instantiations for divide 6
	divideXN #(3'd6, 3'd4) divideXN_inst2
	(
		.CLK(output2) ,			// input  
		.CLEAR(reset_sig) ,		// input  
		.COUNT(count2) ,			// output count2[3:0]
		.OUT(output3) 				// output  
	);
	
	//for least significant bit of second (0-9)
	BinaryToNine BinaryToNine_inst1
	(
		.w0(count1[3]) ,			// input  
		.w1(count1[2]) ,			// input  
		.w2(count1[1]) ,			// input  
		.w3(count1[0]) ,			// input  
		.a(hex0[0]) ,				// output  a
		.b(hex0[1]) ,				// output  b
		.c(hex0[2]) ,				// output  c
		.d(hex0[3]) ,				// output  d
		.e(hex0[4]) ,				// output  e
		.f(hex0[5]) ,				// output  f
		.g(hex0[6]) 				// output  g
	);
	
	//for most significant bit of second (0-5)
	BinaryToNine BinaryToNine_inst2
	(
		.w0(count2[3]) ,			// input  
		.w1(count2[2]) ,			// input  
		.w2(count2[1]) ,			// input  
		.w3(count2[0]) ,			// input  
		.a(hex1[0]) ,				// output  a
		.b(hex1[1]) ,				// output  b
		.c(hex1[2]) ,				// output  c
		.d(hex1[3]) ,				// output  d
		.e(hex1[4]) ,				// output  e
		.f(hex1[5]) ,				// output  f
		.g(hex1[6]) 				// output  g
	);
	
	endmodule
	