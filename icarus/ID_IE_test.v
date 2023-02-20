`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:25:41 12/13/2022
// Design Name:   ID_EX
// Module Name:   E:/University/computer_architecture_lab/mips/ID_IE_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ID_IE_test;

	// Inputs
	reg CLK;
	reg hit;
	reg [31:0] readData1;
	reg [31:0] readData2;
	reg [31:0] signExImmediate;
	reg regDst;
	reg aluSrc;
	reg memToReg;
	reg regWrite;
	reg memRead;
	reg memWrite;
	reg branch;
	reg [2:0] aluOp;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [5:0] funct;
	reg [31:0] nextPc;

	// Outputs
	wire [31:0] readData1Out;
	wire [31:0] readData2Out;
	wire [31:0] signExImmediateOut;
	wire regDstOut;
	wire aluSrcOut;
	wire memToRegOut;
	wire regWriteOut;
	wire memReadOut;
	wire memWriteOut;
	wire branchOut;
	wire [2:0] aluOpOut;
	wire [4:0] rtOut;
	wire [4:0] rdOut;
	wire [5:0] functOut;
	wire [31:0] nextPcOut;

	// Instantiate the Unit Under Test (UUT)
	ID_EX uut (
		.CLK(CLK), 
		.hit(hit), 
		.readData1(readData1), 
		.readData2(readData2), 
		.signExImmediate(signExImmediate), 
		.regDst(regDst), 
		.aluSrc(aluSrc), 
		.memToReg(memToReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.aluOp(aluOp), 
		.rt(rt), 
		.rd(rd), 
		.funct(funct), 
		.nextPc(nextPc), 
		.readData1Out(readData1Out), 
		.readData2Out(readData2Out), 
		.signExImmediateOut(signExImmediateOut), 
		.regDstOut(regDstOut), 
		.aluSrcOut(aluSrcOut), 
		.memToRegOut(memToRegOut), 
		.regWriteOut(regWriteOut), 
		.memReadOut(memReadOut), 
		.memWriteOut(memWriteOut), 
		.branchOut(branchOut), 
		.aluOpOut(aluOpOut), 
		.rtOut(rtOut), 
		.rdOut(rdOut), 
		.functOut(functOut), 
		.nextPcOut(nextPcOut)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		hit = 1;
		readData1 = 0;
		readData2 = 0;
		signExImmediate = 0;
		regDst = 0;
		aluSrc = 0;
		memToReg = 0;
		regWrite = 0;
		memRead = 0;
		memWrite = 0;
		branch = 0;
		aluOp = 0;
		rt = 0;
		rd = 0;
		funct = 0;
		nextPc = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

