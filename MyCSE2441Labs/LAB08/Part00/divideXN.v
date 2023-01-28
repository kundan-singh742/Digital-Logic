//divide by N counter using M state variables
module divideXN #(parameter N = 10, parameter M = 4)
	(
	input CLK, CLEAR, //input
	output reg [M-1:0] COUNT, //output
	output reg OUT
	);
	always @ (negedge CLK, negedge CLEAR)
		if(CLEAR == 1'b0)		COUNT <= 0;
			else
			begin
				if(COUNT == N-2'd2)
					begin
						OUT <= 1'b1; COUNT <= N-1'd1;
					end
						else
							if(COUNT == N-1'd1) 
								begin
									OUT <= 1'b0; COUNT <=0; 
								end
									else
										begin
											//increase the count by one
											OUT <= 1'b0; COUNT <= COUNT + 1'b1; 
										end
			end
	endmodule
	