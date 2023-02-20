`timescale 1ns / 1ps


module EX_MEM_Register ( 
    input CLK, 
    input hit, 
    input [31:0] branchTarget, 
    input zeroFlag, 
    input [31:0] ALUResult,
    input [31:0] readData2,
    input [4:0] writeReg, 
    input MemRead, 
    input MemWrite, 
    input Branch, 
    input RegWrite, 
    input MemToReg,

    output reg [31:0] branchTargetOut, 
    output reg zeroFlagOut, 
    output reg [31:0] ALUResultOut, 
    output reg [31:0] readData2Out,
    output reg [4:0] writeRegOut, 
    output reg MemReadOut, 
    output reg MemWriteOut, 
    output reg BranchOut, 
    output reg RegWriteOut,
    output reg MemToRegOut, 
    output hitOut
);


 initial begin
//     branchTargetOut = 0; 
     zeroFlagOut = 0; 
//     ALUResultOut = 0; 
//     readData2Out = 0;
//     writeRegOut = 0; 
//     MemReadOut = 0; 
//     MemWriteOut = 0; 
     BranchOut = 0; 
//     RegWriteOut = 0;
//     MemToRegOut = 0; 
 end


	assign hitOut = hit;

	always @(negedge CLK) 
		begin
		  if(hit) 
				begin 
				  writeRegOut    <= writeReg;
				  branchTargetOut<= branchTarget;
				  ALUResultOut   <= ALUResult;
				  readData2Out <= readData2;
				  zeroFlagOut    <= zeroFlag;
				  MemReadOut     <= MemRead;
				  MemWriteOut    <= MemWrite;
				  BranchOut      <= Branch;
				  RegWriteOut    <= RegWrite;
				  MemToRegOut    <= MemToReg;
				end
		end
    
endmodule