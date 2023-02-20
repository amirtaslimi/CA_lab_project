`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:49:01 10/24/2022
// Design Name:   pc
// Module Name:   E:/University/computer_architecture_lab/mips/pc_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_test;

	// Inputs
	reg CLK;
	reg [31:0] newInsAddress;

	// Outputs
	wire [31:0] InsAddress;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.CLK(CLK), 
		.newInsAddress(newInsAddress), 
		.InsAddress(InsAddress)
	);
	always #20 CLK = ~CLK;

	initial begin
		// Initialize Inputs
		CLK = 0;
		newInsAddress = 0;


		// Wait 100 ns for global reset to finish
		#100;
        
		newInsAddress = 1;
		
		#100
		
		newInsAddress = 2;
		
				#100
		
		newInsAddress = 3;

	end
      
endmodule

