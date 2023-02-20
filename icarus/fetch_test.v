`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:29:02 11/03/2022
// Design Name:   Fetch
// Module Name:   E:/University/computer_architecture_lab/mips/fetch_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fetch_test;

	// Inputs
	reg CLK;
	reg [31:0] branchTarget;
	reg pcSourse;

	// Outputs
	wire [31:0] nextPC;
	wire [31:0] Ins_out;
	wire hit_out;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.CLK(CLK), 
		.branchTarget(branchTarget), 
		.pcSourse(pcSourse), 
		.nextPC(nextPC), 
		.Ins_out(Ins_out), 
		.hit_out(hit_out)
	);
	always #20 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		branchTarget = 0;
		pcSourse = 1;

		// Wait 100 ns for global reset to finish
		#10;
        pcSourse = 0;
		// Add stimulus here

	end
      
endmodule

