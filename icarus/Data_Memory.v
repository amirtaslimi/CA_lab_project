`timescale 1ns / 1ps

module Data_Memory (
    input CLK,
    input [31:0] address,
    input [31:0] writeData,
	input memWrite,
	input memRead,
	output reg [31:0] readData
);



	// 1024 row & 8 column
	reg [7:0] mem [1023:0];
	
	integer i;
	initial
		begin
			for(i = 0;i<=1023;i = i+1)
				mem[i] = i;
		end
	always @ (posedge CLK)
		begin
			if (memRead)
				begin

					// byte addressable memory
					readData [7:0]   = mem[address];
					readData [15:8]  = mem[address+1];
					readData [23:16] = mem[address+2];
					readData [31:24] = mem[address+3];
					$display("After read readData is = %b",readData[address]);

				end
			
			if (memWrite) 
				begin
					mem[address]   = writeData[7:0];
					mem[address+1] = writeData[15:8];
					mem[address+2] = writeData[23:16];
					mem[address+3] = writeData[31:24];
					$display("After Write mem[address] is = %b",mem[address]);
				end	
		end




    
endmodule