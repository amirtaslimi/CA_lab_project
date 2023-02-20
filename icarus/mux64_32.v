`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:04:57 10/22/2022 
// Design Name: 
// Module Name:    mux64_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux64_32(
	input [31:0] a,
	input [31:0] b,
	input s,
	output [31:0] c
);

	assign c[31:0] = s ? b[31:0] : a[31:0] ;

endmodule
