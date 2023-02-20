`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:05:23 11/03/2022
// Design Name:   Cache
// Module Name:   E:/University/computer_architecture_lab/mips/Cache_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Cache
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Cache_test;

	// Inputs
	reg [31:0] address;
	reg [127:0] dataline;
	reg CLK;

	// Outputs
	wire [31:0] Ins;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	Cache uut (
		.address(address), 
		.dataline(dataline), 
		.CLK(CLK), 
		.Ins(Ins), 
		.hit(hit)
	);
	

	
	always #50 CLK = ~CLK;
	
	initial begin
		// Initialize Inputs
		CLK = 0;
        
		address = 32'b0;


		#500;

		dataline = 128'b00001111000011101010000010010000100000000111000011000000100001100001101001100000000001000000100000010000010000000011000100000000;


		#100;
		address = 32'b01;
		
		#100;
		address = 32'b0000100;
		
		#100;
		address = 32'b0010100;
		
				#100;
		address = 32'b0100;



	end
      
endmodule

