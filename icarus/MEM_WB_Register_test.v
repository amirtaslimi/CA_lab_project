`timescale 1ns / 1ps

`include "MEM_WB_Register.v"
module MEM_WB_Register_test;

	// Inputs
	reg CLK;
	reg hit;
	reg [31:0] readData;
	reg [31:0] ALUResult;
	reg [4:0] writeReg;
	reg RegWrite;
	reg MemtoReg;

	// Outputs
	wire hitOut;
	wire [31:0] readDataOut;
	wire [31:0] ALUResultOut;
	wire [4:0] writeRegOut;
	wire RegWriteOut;
	wire MemtoRegOut;
	initial begin
		$dumpfile("MEM_WB_Register_test.vcd");
		$dumpvars(0, MEM_WB_Register_test);
	end
	// Instantiate the Unit Under Test (UUT)
	MEM_WB_Register uut (
		.CLK(CLK), 
		.hit(hit), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeReg(writeReg), 
		.RegWrite(RegWrite), 
		.MemtoReg(MemtoReg), 
		.hitOut(hitOut), 
		.readDataOut(readDataOut), 
		.ALUResultOut(ALUResultOut), 
		.writeRegOut(writeRegOut), 
		.RegWriteOut(RegWriteOut), 
		.MemtoRegOut(MemtoRegOut)
	);
	
	initial 
		begin
			CLK = 0;
		end
	
	always # 50 CLK = ~CLK; 


	initial begin

		hit       = 1;
		readData  = 5'b01110;
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0000_0111; // 7
		writeReg  = 1;
		RegWrite  = 0;
		MemtoReg  = 1;

		#100;
		



	end
      
endmodule