`timescale 1ns / 1ps



module SignExtendTest;

	// Inputs
	reg [15:0] value;

	// Outputs
	wire [31:0] valueSignExtend;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.value(value), 
		.valueSignExtend(valueSignExtend)
	);

	initial begin
		// Initialize Inputs
		value = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 value = 10000;

		#100;
        
		 value = 100000000;

	end
      
endmodule

