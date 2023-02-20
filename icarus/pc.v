`timescale 1ns / 1ps

module pc(
		input CLK,
		input [31:0] newInsAddress_fromPc,
		input hit,
		output reg [31:0] InsAddress_fromPc = 0
		// added 0 , not here
    );



		always @(negedge  CLK)
				if (hit == 1'b1)
					#1	InsAddress_fromPc <=  newInsAddress_fromPc;
						
endmodule
