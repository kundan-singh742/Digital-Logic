// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.


// Generated by Quartus Prime Version 20.1 (Build Build 720 11/11/2020)
// Created on Thu Nov 10 20:26:18 2022

Four2OneMUX Four2OneMUX_inst
(
	.A(A_sig) ,	// input [N-1:0] A_sig
	.B(B_sig) ,	// input [N-1:0] B_sig
	.S(S_sig) ,	// input  S_sig
	.Y(Y_sig) 	// output [N-1:0] Y_sig
);

defparam Four2OneMUX_inst.N = 4;
