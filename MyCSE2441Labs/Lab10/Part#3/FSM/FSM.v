module FSM 
(
	input slow_clock, reset,
	output reg[1:0] SEL,
	output reg[3:0] CAT
);
	reg[1:0] state, nextstate;
always @(negedge slow_clock, negedge reset)
	if(reset==0) state <=2'b00; else state <= nextstate;
always @(state)
	case ({state})
		2'b00: begin nextstate = 2'b01; SEL=2'b00; CAT=4'b1000; end
		2'b01: begin nextstate = 2'b10; SEL=2'b01; CAT=4'b0100; end
		2'b10: begin nextstate = 2'b11; SEL=2'b10; CAT=4'b0010; end
		2'b11: begin nextstate = 2'b00; SEL=2'b11; CAT=4'b0001; end
	endcase
endmodule
