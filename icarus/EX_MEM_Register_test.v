`timescale 1ns / 1ps

`include "EX_MEM_Register.v"
module EX_MEM_Register_test;

	// Inputs
	reg CLK;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg [31:0] ALUResult;
	reg [31:0] readData2;
	reg [4:0] writeReg;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire [31:0] branchTargetOut;
	wire zeroFlagOut;
	wire [31:0] ALUResultOut;
	wire [31:0] readData2Out;
	wire [4:0] writeRegOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire RegWriteOut;
	wire MemToRegOut;
	wire hitOut;
	initial begin
		$dumpfile("EX_MEM_Register_test.vcd");
		$dumpvars(0, EX_MEM_Register_test);
	end
	// Instantiate the Unit Under Test (UUT)
	EX_MEM_Register uut (
		.CLK(CLK), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.ALUResult(ALUResult), 
		.readData2(readData2), 
		.writeReg(writeReg), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.branchTargetOut(branchTargetOut), 
		.zeroFlagOut(zeroFlagOut), 
		.ALUResultOut(ALUResultOut), 
		.readData2Out(readData2Out), 
		.writeRegOut(writeRegOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.BranchOut(BranchOut), 
		.RegWriteOut(RegWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.hitOut(hitOut)
	);
	
	initial 
		begin
			CLK = 0;
		end
	
	always # 50 CLK = ~CLK; 

	initial begin


		hit          = 1;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_1000_0100; 
		zeroFlag     = 0;
		ALUResult    = 32'b0000_0000_0000_0000_0000_0000_0010_0000; 
		readData2  = 32'b0000_0000_0000_0000_0000_0000_0000_0011; 
		writeReg 	 = 5'b01010;
		MemRead      = 0;
		MemWrite     = 0;
		Branch       = 1;
		RegWrite     = 0;
		MemToReg     = 1;

		#100;

        

	end
      
endmodule