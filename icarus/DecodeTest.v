`timescale 1ns / 1ps


module DecodeTest;

	// Inputs
	reg CLK;
	reg [31:0] instruction;

	// Outputs
	wire [6:0] opcode;
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] signExtendedImmediate;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	Decode uut (
		.CLK(CLK), 
		.instruction(instruction), 
		.opcode(opcode), 
		.readData1(readData1), 
		.readData2(readData2), 
		.signExtendedImmediate(signExtendedImmediate), 
		.rt(rt), 
		.rd(rd)
	);
	always #20 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		instruction = 32'b01110111011101110111001101110111;

		// Wait 100 ns for global reset to finish
		#100;
        
		  

		instruction = 32'b01110111001101110111101101000111;

		// Wait 100 ns for global reset to finish
		#100;


	end
      
endmodule

