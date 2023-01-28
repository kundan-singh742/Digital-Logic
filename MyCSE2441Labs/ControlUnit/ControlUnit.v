module ControlUnit
(
	input clk, ENTER, CLR,
	output reg RESET, LoadA, LoadB, LoadR, LoadOU, IUAU,
	output [1:0]LEDR
	
);
	reg [1:0]state,nextstate;
	parameter S0 = 2'b00,  S1 = 2'b01,  S2 = 2'b10,  S3 = 2'b11; 
	assign LEDR = state;
	
	always @(posedge clk, negedge CLR)
		begin 
			if(CLR == 1'b0)
				begin
					state <= S0;
				end
			else
				begin
					state <= nextstate;
				end
		end
	always @(state, ENTER)
		begin
			case(state)
			   S0: if (ENTER) begin  RESET = 1'b1; LoadA = 1'b0; LoadB = 1'b0; LoadR = 1'b0; LoadOU = 1'b1; IUAU = 1'b0; nextstate = S1; end else nextstate = S0;
				S1: if (ENTER) begin  RESET = 1'b1; LoadA = 1'b1; LoadB = 1'b0; LoadR = 1'b0; LoadOU = 1'b0; IUAU = 1'b0; nextstate = S2; end else nextstate = S1;
				S2: if (ENTER) begin  RESET = 1'b0; LoadA = 1'b0; LoadB = 1'b1; LoadR = 1'b0; LoadOU = 1'b0; IUAU = 1'b0; nextstate = S3; end else nextstate = S2;
				S3: if (ENTER) begin  RESET = 1'b0; LoadA = 1'b0; LoadB = 1'b0; LoadR = 1'b1; LoadOU = 1'b0; IUAU = 1'b1; nextstate = S3; end	else nextstate = S3;
			endcase	
		end
endmodule
