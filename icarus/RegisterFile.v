`timescale 1ns / 1ps

module RegisterFile(
		input CLK,
		input regWrite,
		input [4:0]writeReg,
		input [31:0]writeData,
		input [4:0]readReg1,
		output [31:0]readData1,
		
		input [4:0]readReg2,
		output [31:0]readData2
    );
		reg [31:0] registers [31:0];
		
		integer i;
		initial begin
			for (i=0; i<32; i=i+1)
				registers[i] = i;
		end


		assign readData1 = registers[readReg1];
		assign readData2 = registers[readReg2];
		
		always @(posedge CLK)
			begin
				if (regWrite == 1)
					begin 
					
						if (writeReg == 0)
							begin
							
								$display("zero register, can not write data");
							
							end
							
						else
							begin
							
								registers[writeReg] = writeData;
								$display("write data in ", registers[writeReg]);
								$display("write reg is  ", writeReg);
							end
					end
					
					
				else
					$display("can not write data");
			
			end
			
			
			
			
			
			
			

endmodule
