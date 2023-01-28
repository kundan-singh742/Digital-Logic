module CalculatorFSM
(
		input ENTR, CLK, CLR, RST, Function,
		input [3:0]Row,
		output [3:0] Column,
		output OVR, check,
		output [6:0] HEX0, HEX1, HEX2, HEX3, HEX3P
);

		wire Slow_Clock, E_C_SYNC;
		wire [7:0] InputValue,  sout, OUT;
		parameter S0 = 2'b00,  S1 = 2'b01,  S2 = 2'b10,  S3 = 2'b11; 
		reg RESET,loadA, loadB, loadR, loadOU, iUAU; 
		reg[1:0] state, nextstate;
	
	//divides the clock from 50MHz to 20Hz	
clock_div #(32,2500000) slow_clock
(
		.clk(CLK) ,					// input 50MHz
		.reset(~CLR) ,				// input CLEAR
		.clk_out(Slow_Clock) 	// output 20Hz CLOCK 
);
	
EdgeDetect EdgeDetect_inst
(
		.in(ENTR) ,					// input ENTER 
		.clock(Slow_Clock) ,		// input 20Hz CLOCK
		.out(E_C_SYNC) 			// Filtered output clock for operation  
);
	
	always @(posedge E_C_SYNC, negedge CLR)
		if(CLR == 1'b0) state <= S0;   //pressing Clear takes to State Zero
				else state <= nextstate; //else to Nextstate
				
	always @(state)
		case (state)
			S0: begin RESET = 1'b1; loadA = 1'b0; loadB = 1'b0; loadR = 1'b0;
						 iUAU = 1'b0; loadOU = 1'b1; nextstate <= S1; end
						 
			S1: begin RESET = 1'b1; loadA = 1'b1; loadB = 1'b0; loadR = 1'b0; 
						 iUAU = 1'b0; loadOU = 1'b0; nextstate <= S2; end
						 
			S2: begin RESET = 1'b0; loadA = 1'b0; loadB = 1'b1; loadR = 1'b0;
						 iUAU = 1'b0; loadOU = 1'b0; nextstate <= S3; end
			
			S3: begin RESET = 1'b0; loadA = 1'b0; loadB = 1'b0; loadR = 1'b1;
						 iUAU = 1'b1; loadOU = 1'b0; end
		endcase
	
InputUnit IU
(
		.CLK(CLK) ,				// input  
		.CLR(RESET) ,			// input  
		.ROW(Row) ,				// input 
		.COLUMN(Column) ,		// output 
		.OUTPUT(InputValue) ,// output  
		.check(check) 				// output  
		 			  
);

EightBitAU AU
(
	.inputValue(InputValue) ,	// input 
	.CLKA(loadA) ,					// input  
	.CLKB(loadB) ,					// input  
	.CLKO(loadR) ,					// input  
	.clear(~loadOU) ,				// input RESET 
	.AddorSubtract(Function) ,	// input  AddorSubtract
	.hex0() ,						// output 									
	.hex1() ,						// output 
	.hex2() ,						// output 
	.hex3() ,						// output 
	.hex4() ,						// output 
	.hex5() ,						// output 
	.Aout() ,						// output 
	.Bout() ,						// output 
	.Sout(sout) ,					// output RESULT
	.OVERFLOW(OVR) ,				// output OVERFLOW
	.CARRY() 						// output 
);

	//2To1 MULTIPLEXER
assign OUT = (iUAU == 0)? InputValue: sout; 


OutputUnit ou
(
	
	.in(OUT) ,						// Load the Result  
	.out() ,							// DISPLAY output
	.hex0(HEX0) ,					// DISPLAY output
	.hex1(HEX1) ,					// DISPLAY output
	.hex2(HEX2) ,					// DISPLAY output
	.hex3(HEX3) ,					// output
	.ones_out() ,					// output
	.tens_out() ,					// output
	.hundred_out() ,				// output
	.sign_out() 					// output
);	

endmodule


