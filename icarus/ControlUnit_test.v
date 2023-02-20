`timescale 1ns / 1ps



module ControlUnit_test;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire regDst;
	wire aluSrc;
	wire memtoReg;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire branch;
	wire [2:0] aluOp;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opcode(opcode), 
		.regDst(regDst), 
		.aluSrc(aluSrc), 
		.memtoReg(memtoReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.aluOp(aluOp)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;


		#100;
        
		opcode = 6'b000100;


		#100;
        		opcode = 6'b000111;


		#100;
        		opcode = 6'b000110;


		#100;
        		opcode = 6'b000101;


		#100;
        		opcode = 6'b000001;


		#100;
		        		opcode = 6'b110001;
        

	end
      
endmodule

