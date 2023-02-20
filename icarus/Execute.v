`timescale 1ns / 1ps

// `include "mux64_32.v"
// `include "ALU_Control.v"
// `include "ALU.v"
// `include "mux64_32.v"

module Execute(
		
		input CLK,
		input [31:0] aluReadData1,
		input [31:0] aluReadData2,
		input [31:0] immediate,
		input [5:0] funct,
		input [2:0] aluOp,
		input aluSrc,
		input [31:0] nextPc,
		input [4:0] rd,
		input [4:0] rt,
		
		
		output [31:0] aluResult,
		output zero,
		output [31:0] aluReadData2out,
		output [4:0] rdOrRt 
		
    );
	 
	 //?
	 assign aluReadData2out = aluReadData2;
	 
	 
	 wire [31:0] alu_input2MUX;
	 wire [3:0] alu_control;
	 
	 
	 
	 
	 
	 mux64_32 mux64_32_execute(
								.a(aluReadData2),
								.b(immediate),
								.s(aluSrc),
								.c(alu_input2MUX)
								);
	 
	 
	 ALU_Control ALU_Control_Execute(
										.aluOp(aluOp),
										.funct(funct),
										
										.aluCnt(alu_control)
										);
	 
	 
	 
	 ALU ALU_Execute( 
					.aluCnt(alu_control),
					.input1(aluReadData1),
					.input2(alu_input2MUX),
					.shamt(immediate[10:6]),
					.result(aluResult),
					.zero(zero)
					);
					

	
	
	
	
	
	
	
	
	
	
	
	
	
	


endmodule
