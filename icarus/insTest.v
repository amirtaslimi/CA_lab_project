`timescale 1ns / 1ps

`include "InstructionMemory.v"

module insTest;

	// Inputs
	reg [31:0] InsAddress;
	reg CLK;

	// Outputs
	wire [127:0] dataline;

	initial begin
		$dumpfile("insTest.vcd");
		$dumpvars(0, insTest);
	end

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.InsAddress(InsAddress), 
		.CLK(CLK), 
		.dataline (dataline)

	);
	always #20 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		//InsAddress = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		InsAddress = 0;
		$display("ins mem from ins file = %b",dataline);
		#100;
        
		 		InsAddress = 1;
		// Add stimulus here
		#100;
				InsAddress = 2;
						#100;
				InsAddress = 3;
	end
      
endmodule

