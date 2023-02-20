`include "MIPS.v"
module MIPS_test;

	// Inputs
	reg CLK;

	initial begin
		$dumpfile("MIPS_test.vcd");
		$dumpvars(0, MIPS_test);
	end
	MIPS uut (
		.CLK(CLK)
	);
	always #50 CLK = ~CLK;
	initial begin
		CLK = 0;
	end
	


	
      
endmodule