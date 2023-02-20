`timescale 1ns / 1ps


module ControlUnit(

		input [5:0] opcode,
		output reg regDst,
		output reg aluSrc,
		output reg memtoReg,
		output reg regWrite,
		output reg memRead,
		output reg memWrite,
		output reg branch,
		output reg [2:0] aluOp
    );


		always @(opcode)
			begin 
			
			
			assign regDst = 0;
			assign aluSrc = 0;
			assign memtoReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 000;

			if (opcode == 6'b000000)
				begin
				assign regDst = 1;
				assign aluSrc = 0;
				assign memtoReg = 0;
				assign regWrite = 1;
				assign memRead = 0;
				assign memWrite = 0;
				assign branch = 0;
				assign aluOp = 000;
				end
			if (opcode == 6'b000100)
				begin
				assign regDst = 0;
				assign aluSrc = 1;
				assign memtoReg = 1;
				assign regWrite = 1;
				assign memRead = 1;
				assign memWrite = 0;
				assign branch = 0;
				assign aluOp = 011;
					end
			if (opcode == 6'b000101)
					begin
				assign regDst = 0;
				assign aluSrc = 1;
				assign memtoReg = 0;
				assign regWrite = 0;
				assign memRead = 0;
				assign memWrite = 1;
				assign branch = 0;
				assign aluOp = 011;
					end
			if (opcode == 6'b000111)
					begin
				assign regDst = 0;
				assign aluSrc = 1;
				assign memtoReg = 0;
				assign regWrite = 1;
				assign memRead = 0;
				assign memWrite = 0;
				assign branch = 0;
				assign aluOp = 011;
					end
			if (opcode == 6'b000110)
					begin
				assign regDst = 0;
				assign aluSrc = 0;
				assign memtoReg = 0;
				assign regWrite = 0;
				assign memRead = 0;
				assign memWrite = 0;
				assign branch = 1;
				assign aluOp = 001;
					end
		if (opcode == 6'b000001) begin // slti
			assign regDst = 0;
			assign aluSrc = 1;
			assign memtoReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 010;
			end


					

end




endmodule
