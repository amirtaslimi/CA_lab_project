`timescale 1ns / 1ps

module IF_ID(

		input CLK, 
		input [31:0] next_pc,
		input [31:0] ins,
		input hit,
		output reg [31:0] ins_out,
		output reg [31:0] next_pc_out

    );
	// initial begin
	// 		next_pc_out = 0;
	// 		ins_out =0 ;
	// end

	
	
		always @(negedge CLK ) 
	begin
			if (hit == 1'b1) begin
				ins_out = ins;
				next_pc_out = next_pc;
			end
	end
	

endmodule
