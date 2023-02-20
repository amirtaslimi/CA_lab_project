`timescale 1ns / 1ps



module ALU_test;

	// Inputs
	reg [3:0] aluCnt;
	reg [31:0] input1;
	reg [31:0] input2;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.aluCnt(aluCnt), 
		.input1(input1), 
		.input2(input2), 
		.shamt(shamt), 
		.result(result), 
		.zero(zero)
	);

	initial begin

		$dumpfile("ALU_test.vcd");
		

		// Initialize Inputs
		aluCnt = 4'b0000;
		input1 = 6;
		input2 = 3;
		shamt = 0;

		#100;
		
				aluCnt = 4'b0001;
		input1 = 10;
		input2 = 4;
		shamt = 0;

		#100;
		
		
				aluCnt = 4'b0011;
		input1 = 4;
		input2 = 12;
		shamt = 2;

		#100;
		
		
				aluCnt = 0;
		input1 = 0;
		input2 = 0;
		shamt = 0;

		#100;



	end
      
endmodule

