//Verilog model for full adder/subtracter with Overflow
module FAbehavadderandsubtract
(
	input [7:0]A,B,     //declare input ports
	input Cxor,         //declare input for C0
	output [7:0]S,      //declare output ports for Sum
	output Cout,OVR	  //declare carry-out port and overflow
);   
	wire [8:0] C;       //declare internal wires
	assign C[0] = Cxor; //assigning C[0] to Cinput

		//instantiate the full addder/subtractor module for each stage of the Full adder/subtractor	
		FAbehav s0 (.ai(A[0]),.bi(Cxor^B[0]),.cini(C[0]),.si(S[0]),.couti(C[1]));//Stage 0
		FAbehav s1 (.ai(A[1]),.bi(Cxor^B[1]),.cini(C[1]),.si(S[1]),.couti(C[2]));//Stage 1
		FAbehav s2 (.ai(A[2]),.bi(Cxor^B[2]),.cini(C[2]),.si(S[2]),.couti(C[3]));//Stage 2
		FAbehav s3 (.ai(A[3]),.bi(Cxor^B[3]),.cini(C[3]),.si(S[3]),.couti(C[4]));//Stage 3
		FAbehav s4 (.ai(A[4]),.bi(Cxor^B[4]),.cini(C[4]),.si(S[4]),.couti(C[5]));//Stage 4
		FAbehav s5 (.ai(A[5]),.bi(Cxor^B[5]),.cini(C[5]),.si(S[5]),.couti(C[6]));//Stage 5
		FAbehav s6 (.ai(A[6]),.bi(Cxor^B[6]),.cini(C[6]),.si(S[6]),.couti(C[7]));//Stage 6
		FAbehav s7 (.ai(A[7]),.bi(Cxor^B[7]),.cini(C[7]),.si(S[7]),.couti(C[8]));//Stage 7
				assign Cout = C[8];     //assigning C[4] to Carry out
				assign OVR = C[7]^C[8]; //for checking overflow with XOR
endmodule
		