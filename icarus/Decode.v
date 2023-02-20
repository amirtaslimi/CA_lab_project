`timescale 1ns / 1ps

module Decode(

		input CLK,
		input [31:0] writeDataDecode,
		input regWriteDecode,
		input [4:0] writeRegDecode,
		input [31:0] instruction,
		output reg [5:0]opcode,
		output [31:0] readData1,
		output [31:0] readData2,
		output [31:0] signExtendedImmediate,
		output reg [4:0] rt,
		output reg [4:0] rd
    );

	reg [15:0] valueD;														
	reg [4:0] rs;
	
	
	always @(posedge CLK) begin
		opcode <= instruction[31:26];
		rs <= instruction[25:21];
		rt <= instruction[20:16];
		rd <= instruction[15:11];
		valueD <= instruction[15:0];
	end

	RegisterFile RegFileInstance (
		 .CLK(CLK), 
		 .regWrite(regWriteDecode), 
		 .writeReg(writeRegDecode), 
		 .writeData(writeDataDecode), 

		 .readReg1(rs), 
		 .readReg2(rt), 
		 
		 .readData1(readData1), 
		 .readData2(readData2)
		 );


	SignExtend SignExtendInstance (
		 .value(valueD), 
		 .valueSignExtend(signExtendedImmediate)
		 );








endmodule
