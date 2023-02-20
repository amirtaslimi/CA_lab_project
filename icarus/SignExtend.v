`timescale 1ns / 1ps

module SignExtend(

		input [15:0] value,
		output [31:0] valueSignExtend
    );
		assign valueSignExtend = {{16{value[15]}}, value[15:0]};

endmodule
