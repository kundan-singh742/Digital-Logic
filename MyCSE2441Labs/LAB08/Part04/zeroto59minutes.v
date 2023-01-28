module zeroto59minutes
(
	input clock_sig, reset_sig, OnOff_sig,   //input variables
	output [6:0]hex0,hex1,hex2,hex3          //output variables
);
	wire [3:0]count1, count2,count3,count4;
	wire output1, output2, output3,output4,output5;
	
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
	
	//instantiations for divide 6
	divideXN #(3'd6, 3'd4) divideXN_inst2
	(
		.CLK(output2) ,			// input  
		.CLEAR(reset_sig) ,		// input  
		.COUNT(count2) ,			// output count2[3:0]
		.OUT(output3) 				// output  
	);
	
	//for least significant bit of seconds (0-9)
	BinaryToNine BinaryToNine_inst1
	(
		.w0(count1[3]) ,			// input  w0
		.w1(count1[2]) ,			// input  w1
		.w2(count1[1]) ,			// input  w2
		.w3(count1[0]) ,			// input  w3
		.a(hex0[0]) ,				// output  a
		.b(hex0[1]) ,				// output  b
		.c(hex0[2]) ,				// output  c
		.d(hex0[3]) ,				// output  d
		.e(hex0[4]) ,				// output  e
		.f(hex0[5]) ,				// output  f
		.g(hex0[6]) 				// output  g
	);
	
	//for most significant bit of seconds (0-5)
	BinaryToNine BinaryToNine_inst2
	(
		.w0(count2[3]) ,			// input  w0
		.w1(count2[2]) ,			// input  w1
		.w2(count2[1]) ,			// input  w2
		.w3(count2[0]) ,			// input  w3
		.a(hex1[0]) ,				// output  a
		.b(hex1[1]) ,				// output  b
		.c(hex1[2]) ,				// output  c
		.d(hex1[3]) ,				// output  d
		.e(hex1[4]) ,				// output  e
		.f(hex1[5]) ,				// output  f
		.g(hex1[6]) 				// output  g
	);
	
	//instantiations for divide 10
	divideXN #(4'd10, 3'd4) divideXN_inst3
	(
		.CLK(output3) ,			// input  
		.CLEAR(reset_sig) ,		// input  
		.COUNT(count3) ,			// output count1[3:0] 
		.OUT(output4) 				// output  
	);
	
	////instantiations for divide 6
	divideXN #(3'd6, 3'd4) divideXN_inst4
	(
		.CLK(output4) ,			// input  
		.CLEAR(reset_sig) ,		// input  
		.COUNT(count4) ,			// output count2[3:0]
		.OUT(output5) 				// output  
	);
	
	//for least significant bit of minutes (0-9)
	BinaryToNine BinaryToNine_inst3
	(
		.w0(count3[3]) ,			// input  w0
		.w1(count3[2]) ,			// input  w1
		.w2(count3[1]) ,			// input  w2
		.w3(count3[0]) ,			// input  w3
		.a(hex2[0]) ,				// output  a
		.b(hex2[1]) ,				// output  b
		.c(hex2[2]) ,				// output  c
		.d(hex2[3]) ,				// output  d
		.e(hex2[4]) ,				// output  e
		.f(hex2[5]) ,				// output  f
		.g(hex2[6]) 				// output  g
	);
	
	//for most significant bit of minutes (0-5)
	BinaryToNine BinaryToNine_inst4
	(
		.w0(count4[3]) ,			// input  w0
		.w1(count4[2]) ,			// input  w1
		.w2(count4[1]) ,			// input  w2
		.w3(count4[0]) ,			// input  w3
		.a(hex3[0]) ,				// output  a
		.b(hex3[1]) ,				// output  b
		.c(hex3[2]) ,				// output  c
		.d(hex3[3]) ,				// output  d
		.e(hex3[4]) ,				// output  e
		.f(hex3[5]) ,				// output  f
		.g(hex3[6]) 				// output  g
	);
	endmodule
	