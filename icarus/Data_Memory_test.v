`timescale 1ns / 1ps

`include "Data_Memory.v"

module Data_Memory_test;
	reg CLK;
	reg [31:0] address;
	reg [31:0] writeData;
	reg memWrite;
	reg memRead;
	
	// Outputs
	wire [31:0] readData;
	initial begin
		$dumpfile("Data_Memory_test.vcd");
		$dumpvars(0, Data_Memory_test);
	end
	// Instantiate the Unit Under Test (UUT)
	Data_Memory uut (
		.CLK(CLK), 
		.address(address), 
		.writeData(writeData), 
		.memWrite(memWrite), 
		.memRead(memRead),
		.readData(readData)
	);
	
	initial 
		begin
			CLK = 0;
		end
	
	always #50 CLK = ~CLK; // T=100 ns

	initial begin

		address = 32'b0000_0000_0000_0000_0000_0000_0000_1110; // 14
		writeData = 0;
		memWrite =  0;
		memRead =   1;

		#100;
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 8
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0100; // 4
		memWrite  = 1;
		memRead   = 1;
		
		#100;



	end
      
endmodule 