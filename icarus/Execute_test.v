`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:24:40 12/13/2022
// Design Name:   Execute
// Module Name:   E:/University/computer_architecture_lab/mips/Execute_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Execute_test;

	// Inputs
	reg CLK;
	reg [31:0] aluReadData1;
	reg [31:0] aluReadData2;
	reg [31:0] immediate;
	reg [5:0] funct;
	reg [2:0] aluOp;
	reg aluSrc;
	reg [31:0] nextPc;
	reg [4:0] rd;
	reg [4:0] rt;


	// Outputs
	wire [31:0] aluResult;
	wire zero;
	wire [31:0] addResult;
	wire [31:0] aluReadData2out;
	wire [4:0] rdOrRt;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.CLK(CLK), 
		.aluReadData1(aluReadData1), 
		.aluReadData2(aluReadData2), 
		.immediate(immediate), 
		.funct(funct), 
		.aluOp(aluOp), 
		.aluSrc(aluSrc), 
		.nextPc(nextPc), 
		.rd(rd), 
		.rt(rt), 
		.aluResult(aluResult), 
		.zero(zero), 
		.addResult(addResult), 
		.aluReadData2out(aluReadData2out), 
		.rdOrRt(rdOrRt)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		aluReadData1 = 5;
		aluReadData2 = 4;
		immediate = 0;
		funct = 0;
		aluOp = 1;
		aluSrc = 0;
		nextPc = 0;
		rd = 0;
		rt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

