`timescale 1ns / 1ps
`include "Write_Back.v"
module Write_Back_test;

	// Inputs
	reg MemtoReg;
	reg [31:0] readData;
	reg [31:0] ALUResult;

	// Outputs
	wire [31:0] writeData;
	initial begin
		$dumpfile("Write_Back_test.vcd");
		$dumpvars(0, Write_Back_test);
	end
	// Instantiate the Unit Under Test (UUT)
	Write_Back uut (
		.MemtoReg(MemtoReg), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeData(writeData)
	);

	initial begin

		MemtoReg   = 0;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_0010; // 2
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0000_0011; // 3

		#50;
		
		MemtoReg   = 1;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_1011; // 11
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0000_1110; // 14
        
        #50;

	end
      
endmodule