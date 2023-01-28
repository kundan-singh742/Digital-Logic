//Verilog behavioral model of a half adder
module HAbehav 
(
	input ai,bi,
	output reg si, couti
);
	always @ (ai,bi)
		case ({ai,bi})
			2'b00: begin couti = 1'b0; si = 1'b0; end
			2'b01: begin couti = 1'b0; si = 1'b1; end
			2'b10: begin couti = 1'b0; si = 1'b1; end
			2'b11: begin couti = 1'b1; si = 1'b0; end
		endcase
endmodule
	