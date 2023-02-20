`timescale 1ns / 1ps



module IFID_test;

	// Inputs
	reg CLK;
	reg [31:0] next_pc;
	reg [31:0] ins;
	reg hit;

	// Outputs
	wire [31:0] ins_out;
	wire [31:0] next_pc_out;

	// Instantiate the Unit Under Test (UUT)
	IF_ID uut (
		.CLK(CLK), 
		.next_pc(next_pc), 
		.ins(ins), 
		.hit(hit), 
		.ins_out(ins_out), 
		.next_pc_out(next_pc_out)
	);
	always #20 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		next_pc = 0;
		ins = 0;
		hit = 0;


		#100;

		next_pc = 1;
		ins = 32'b01011;
		hit = 0;


		#100;	
		next_pc = 0;
		ins = 32'b01110011;
		hit = 1;


		#100;		
		next_pc = 1;
		ins = 32'b00010011;
		hit = 1;


		#100;		



	end
      
endmodule

