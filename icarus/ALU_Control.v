`timescale 1ns / 1ps

module ALU_Control(

		input [2:0] aluOp,
		input [5:0] funct,
		output reg [3:0] aluCnt
    );

		always @(aluOp or funct)
			begin 
				aluCnt = aluOp == 3'b000 ? (funct == 6'b000000 ? 4'b0000:
																funct == 6'b000001 ? 4'b0001:
																funct == 6'b000010 ? 4'b0101:
																funct == 6'b000011 ? 4'b0110:
																funct == 6'b000100 ? 4'b0111:
																funct == 6'b000101 ? 4'b0011:
																funct == 6'b000110 ? 4'b0100:
																funct == 6'b010111 ? 4'b0111:
																funct == 6'b000111 ? 4'b0010: 4'b0000): //b0000 --> b0111
																
																
																
									aluOp == 3'b001 ? 4'b0001:
									aluOp == 3'b010 ? 4'b0111:
									aluOp == 3'b011 ? 4'b0000: 4'bxxxx;




			end

endmodule
