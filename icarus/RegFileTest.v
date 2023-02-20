`timescale 1ns / 1ps



module RegFileTest;

	// Inputs
	reg CLK;
	reg regWrite;
	reg [4:0] writeReg;
	reg [31:0] writeData;
	reg [4:0] readReg1;
	reg [4:0] readReg2;

	// Outputs
	wire [41:0] readData1;
	wire [41:0] readData2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.CLK(CLK), 
		.regWrite(regWrite), 
		.writeReg(writeReg), 
		.writeData(writeData), 
		.readReg1(readReg1), 
		.readData1(readData1), 
		.readReg2(readReg2), 
		.readData2(readData2)
	);
	always #20 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		regWrite = 0;
		writeReg = 0;
		writeData = 0;
		readReg1 = 11;
		readReg2 = 0;

		#100;
		
				CLK = 0;
		regWrite = 1;
		writeReg = 3;
		writeData = 22;
		readReg1 = 12;
		readReg2 = 10;

		#100;
		
		
				CLK = 0;
		regWrite = 1;
		writeReg = 0;
		writeData = 0;
		readReg1 = 8;
		readReg2 = 4;

		#100;
		
		
				CLK = 0;
		regWrite = 0;
		writeReg = 0;
		writeData = 0;
		readReg1 = 9;
		readReg2 = 10;

		#100;


	end
      
endmodule

