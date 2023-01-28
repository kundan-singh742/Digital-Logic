module HalfAdder 
(
	input A,B,
	output sum, carry
);
 
  assign sum   = A ^ B;  // xor
  assign carry = A & B;  // and
 
endmodule 