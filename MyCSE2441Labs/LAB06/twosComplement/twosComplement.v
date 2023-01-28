//Verilog model for full adder/subtracter with Overflow
module twosComplement(
	input [3:0]A,B,     //declare input ports
	input Cxor,         //declare input for C0
	output [3:0]S,      //declare output ports for Sum
	output Cout,OVR);   //declare cary-out port and overflow
	wire [4:0] C;       //declare internal wires
	assign C[0] = Cxor; //assigning C[0] to Cinput

//instantiate the full addder/subtractor module for each stage of the Full adder/subtractor	
			FAbehav s0 (.ai(A[0]),.bi(Cxor^B[0]),.cini(C[0]),.si(S[0]),.couti(C[1]));//Stage 0
			FAbehav s1 (.ai(A[1]),.bi(Cxor^B[1]),.cini(C[1]),.si(S[1]),.couti(C[2]));//Stage 1
			FAbehav s2 (.ai(A[2]),.bi(Cxor^B[2]),.cini(C[2]),.si(S[2]),.couti(C[3]));//Stage 2
			FAbehav s3 (.ai(A[3]),.bi(Cxor^B[3]),.cini(C[3]),.si(S[3]),.couti(C[4]));//Stage 3
					assign Cout = C[4];     //assigning C[4] to Carry out
					assign OVR = C[3]^C[4]; //for checking overflow with XOR
		endmodule
		