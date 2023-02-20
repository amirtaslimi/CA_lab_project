`timescale 1ns / 1ps


module ALU_Control_test;

	// Inputs
	reg [2:0] aluOp;
	reg [5:0] funct;

	// Outputs
	wire [3:0] aluCnt;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.aluOp(aluOp), 
		.funct(funct), 
		.aluCnt(aluCnt)
	);

	initial begin
		// Initialize Inputs
		aluOp = 3'b000;
		funct = 6'b000001;

		// Wait 100 ns for global reset to finish
		#100;
		
				aluOp = 3'b000;
		funct = 6'b000011;

		// Wait 100 ns for global reset to finish
		#100;
		
		
				aluOp = 3'b000;
		funct = 6'b000000;

		// Wait 100 ns for global reset to finish
		#100;
		
				aluOp = 3'b000;
		funct = 6'b000010;

		// Wait 100 ns for global reset to finish
		#100;

	end
      
endmodule

