module TwosComplement
(
	input [7:0]Ai,
	output [7:0]Bo
);
	wire[7:0]C;
	
	HAbehav s0 (.ai(Ai[0]^Ai[7]),.bi(Ai[7]),.si(Bo[0]),.couti(C[0]));
	HAbehav s1 (.ai(Ai[1]^Ai[7]),.bi(C[0]),.si(Bo[1]),.couti(C[1]));
	HAbehav s2 (.ai(Ai[2]^Ai[7]),.bi(C[1]),.si(Bo[2]),.couti(C[2]));
	HAbehav s3 (.ai(Ai[3]^Ai[7]),.bi(C[2]),.si(Bo[3]),.couti(C[3]));
	HAbehav s4 (.ai(Ai[4]^Ai[7]),.bi(C[3]),.si(Bo[4]),.couti(C[4]));
	HAbehav s5 (.ai(Ai[5]^Ai[7]),.bi(C[4]),.si(Bo[5]),.couti(C[5]));
	HAbehav s6 (.ai(Ai[6]^Ai[7]),.bi(C[5]),.si(Bo[6]),.couti(C[6]));
	HAbehav s7 (.ai(Ai[7]),.bi(0),.si(Bo[7]),.couti(C[7]));
	
endmodule
