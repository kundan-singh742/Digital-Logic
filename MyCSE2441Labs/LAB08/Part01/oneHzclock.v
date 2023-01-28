//One Hz clock, Input clock is 50Mhz
module oneHzclock
(
		input clock, reset, //input
		output OneHz		  //output
);
wire TenMHz, OneMHz, OneKHz; //wires

//dividing 1MHz by 5
divideXN #(3'd5,3'd3) div5
(
	.CLK(clock),  
	.CLEAR(reset),
	.OUT(TenMHz),
	.COUNT(count)
);

//divide b 10
divideXN #(4'd10,4'd4) div10
(
	.CLK(TenMHz),  
	.CLEAR(reset),
	.OUT(OneMHz),
	.COUNT(count)
);

//divide by 1000
divideXN #(10'd1000,4'd10) div1000L
(
	.CLK(OneMHz),  
	.CLEAR(reset),
	.OUT(OneKHz),
	.COUNT(count)
);

//divide by 1000
divideXN #(10'd1000,4'd10) div1000H
(
	.CLK(OneKHz),  
	.CLEAR(reset),
	.OUT(OneHz),
	.COUNT(count)
);
endmodule
