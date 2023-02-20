`timescale 1ns / 1ps
`include "ControlUnit.v"
`include "Decode.v"
`include "Data_Memory.v"
`include "Execute.v"
`include "Fetch.v"
`include "ID_EX.v"
`include "IF_ID.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "Write_Back.v"
`include "ALU.v"
`include "ALU_Control.v"
`include "Cache.v"
`include "InstructionMemory.v"
`include "mux64_32.v"
`include "pc.v"
`include "MEM_WB_Register.v"
`include "EX_MEM_Register.v"

/// delete assignment from Alu control
module MIPS(
		
		input CLK

    );
	 
	 
	 // wires
	 
	 //decode 
	wire [5:0]  opcodeDecodeOut;
	wire [31:0] ReadData1DecodeOut;
	wire [31:0] ReadData2DecodeOut;
	wire [31:0] SignExtendedDecodeOut;
	wire [4:0] rtDecodeOut;
	wire [4:0] rdDecodeOut;
	 
	 
	//fetch
	wire [31:0] NextPcFetchOut;
	wire [31:0] InsFetchOut;
	wire hitFetchOut;


	//IFID

	wire [31:0] InsIFIDOut;
	wire [31:0] NextPcIFIDOut;
	wire HitIFIDOut;
	

	
	
	//controlUnit

	wire RegDstCuOut;
	wire AluSrcCuOut;
	wire MemToRegCuOut;
	wire RegWriteCuOut;
	wire MemReadCuOut;
	wire MemWriteCuOut;
	wire BranchCuOut;
	wire [2:0] AluOpCuOut;
	 
	 
		Decode mips_decode(
			.CLK(CLK),
			.instruction(InsIFIDOut),
			.writeDataDecode(writeDataOut_wire_writeBack),
			.regWriteDecode(RegWriteOut_wire_MEM_WB),
			.writeRegDecode(writeRegOut_wire_MEM_WB),
			
			.opcode(opcodeDecodeOut),
			.readData1(ReadData1DecodeOut),
			.readData2(ReadData2DecodeOut),
			.signExtendedImmediate(SignExtendedDecodeOut),
			.rt(rtDecodeOut),
			.rd(rdDecodeOut)
	 );
	 
		IF_ID mips_ifid(
			.CLK(CLK),
			.next_pc(NextPcFetchOut),
			.hit(hitFetchOut),
			.ins(InsFetchOut),
			
			.ins_out(InsIFIDOut),
			.next_pc_out(NextPcIFIDOut)
	 );
	 
	 
		Fetch mips_fetch(
			.CLK(CLK),
			.branchTarget(branchTargetOut_wire_ex),
			.pcSourse(PcSource_execute),
			
			.nextPC(NextPcFetchOut),
			.Ins_out(InsFetchOut),
			.hit_out(hitFetchOut)
		);
		
		ControlUnit mips_controlUnit(
			.opcode(opcodeDecodeOut),
			
			.regDst(RegDstCuOut),
			.aluSrc(AluSrcCuOut),
			.memtoReg(MemToRegCuOut),
			.regWrite(RegWriteCuOut),
			.memRead(MemReadCuOut),
			.memWrite(MemWriteCuOut),
			.branch(BranchCuOut),
			.aluOp(AluOpCuOut)
	 );
	 
//wires for Execute

wire [31:0] aluResult_execute;
wire zero_execute;
wire [31:0] aluReadData2_execute;
wire [4:0] rdOrRt_execute;

	 
	 
		Execute mips_Execute(
			.CLK(CLK), 
			.aluReadData1(readData1_IDEXout), 
			.aluReadData2(readData2_IDEXout), 
			.immediate(immediate_IDEXout), 
			.funct(funct_IDEXout), 
			.aluOp(aluOp_IDEXout), 
			.aluSrc(aluSrc_IDEXout), 
			.nextPc(nextPc_IDEXout), 
			.rd(rd_IDEXout), 
			.rt(rt_IDEXout), 
			
			.aluResult(aluResult_execute), 
			.zero(zero_execute), 
			.aluReadData2out(aluReadData2_execute), 
			.rdOrRt(rdOrRt_execute) // must delete, write reg
			);

			// mux for write reg in execute
wire [4:0] writeReg_execute_mux;
assign writeReg_execute_mux = (regDstOut_IDEXout == 0) ? rt_IDEXout : 
								(regDstOut_IDEXout == 1) ? rd_IDEXout : 
								5'bxxxxx;


	 //wires for ID_EX
	wire regDstOut_IDEXout ;
	wire memToRegOut_IDEXout ;
	wire regWriteOut_IDEXout ;
	wire memReadOut_IDEXout ;
	wire memWriteOut_IDEXout ;
	wire branchOut_IDEXout ;
	 wire [31:0] readData1_IDEXout;
	wire [31:0] readData2_IDEXout;
	wire [31:0] immediate_IDEXout;
	wire [2:0]  aluOp_IDEXout;
	wire aluSrc_IDEXout;
	wire [31:0] nextPc_IDEXout;
	wire [4:0] rt_IDEXout;
	wire [4:0] rd_IDEXout;
	wire [5:0] funct_IDEXout;	 

		ID_EX mips_ID_EX(
				.CLK(CLK), 
			.hit(hitFetchOut), 
			.readData1(ReadData1DecodeOut), 
			.readData2(ReadData2DecodeOut), 
			.signExImmediate(SignExtendedDecodeOut), 
			.regDst(RegDstCuOut), 
			.aluSrc(AluSrcCuOut), 
			.memToReg(MemToRegCuOut), 
			.regWrite(RegWriteCuOut), 
			.memRead(MemReadCuOut), 
			.memWrite(MemWriteCuOut), 
			.branch(BranchCuOut), 
			.aluOp(AluOpCuOut), 
			.rt(rtDecodeOut), 
			.rd(rdDecodeOut), 
			.funct(SignExtendedDecodeOut[5:0]), 
			.nextPc(NextPcIFIDOut), 
			
			.readData1Out(readData1_IDEXout), 
			.readData2Out(readData2_IDEXout), 
			.signExImmediateOut(immediate_IDEXout), 
			.regDstOut(regDstOut_IDEXout), 
			.aluSrcOut(aluSrc_IDEXout), 
			.memToRegOut(memToRegOut_IDEXout), 
			.regWriteOut(regWriteOut_IDEXout), 
			.memReadOut(memReadOut_IDEXout), 
			.memWriteOut(memWriteOut_IDEXout), 
			.branchOut(branchOut_IDEXout), 
			.aluOpOut(aluOp_IDEXout), 
			.rtOut(rt_IDEXout), 
			.rdOut(rd_IDEXout), 
			.functOut(funct_IDEXout), 
			.nextPcOut(nextPc_IDEXout)
			);
	 
	 


// wires for Write_Back and Data_Memory
	wire [31:0] writeDataOut_wire_writeBack;
	wire [31:0] readDataOut_wire_dataMem;

	Write_Back mips_Write_Back (
    .MemtoReg(MemtoRegOut_wire_MEM_WB),
    .readData(readDataOut_wire_MEM_WB),
    .ALUResult(ALUResultOut_wire_MEM_WB),

    .writeData(writeDataOut_wire_writeBack)
);

Data_Memory mips_Data_Memory (
    .CLK(CLK),
    .address(ALUResultOut_wire_ex),
    .writeData(readData2Out_wire_ex ),
	.memWrite(MemWriteOut_wire_ex),
	.memRead(MemReadOut_wire_ex),

	.readData(readDataOut_wire_dataMem)
);

//wires for ex mem

	wire [31:0] readData2Out_wire_ex;
	wire [31:0] ALUResultOut_wire_ex;
	wire MemReadOut_wire_ex;
	wire MemWriteOut_wire_ex;
	wire [4:0] writeRegOut_wire_ex;
	wire RegWriteOut_wire_ex;
	wire MemToRegOut_wire_ex;
	wire [31:0] branchTargetOut_wire_ex;
	wire zeroFlagOut_wire_ex;

wire BranchOut_wire_ex; ;
wire [31:0] addResult_execute;
assign addResult_execute = (immediate_IDEXout << 2) + nextPc_IDEXout;
wire PcSource_execute;
assign PcSource_execute = (zeroFlagOut_wire_ex & BranchOut_wire_ex );

// addResult_execute => branchTargetOut_wire_ex


EX_MEM_Register mips_EX_MEM_Register ( 
    .CLK(CLK), 
    .hit(hitFetchOut), 
    .branchTarget(addResult_execute), 
    .zeroFlag(zero_execute), 
    .ALUResult(aluResult_execute),
    .readData2(aluReadData2_execute),
    .writeReg(writeReg_execute_mux), 
    .MemRead(memReadOut_IDEXout), 
    .MemWrite(memWriteOut_IDEXout), 
    .Branch(branchOut_IDEXout), 
    .RegWrite(regWriteOut_IDEXout), 
    .MemToReg(memToRegOut_IDEXout),

    .branchTargetOut(branchTargetOut_wire_ex), 
    .zeroFlagOut(zeroFlagOut_wire_ex), 
    .ALUResultOut(ALUResultOut_wire_ex),
    .readData2Out(readData2Out_wire_ex),
    .writeRegOut(writeRegOut_wire_ex), 
    .MemReadOut(MemReadOut_wire_ex), 
    .MemWriteOut(MemWriteOut_wire_ex), 
    .BranchOut(BranchOut_wire_ex), 
    .RegWriteOut(RegWriteOut_wire_ex),
    .MemToRegOut(MemToRegOut_wire_ex)
	//hit
);


	wire [31:0] readDataOut_wire_MEM_WB;
	wire [31:0] ALUResultOut_wire_MEM_WB;
	wire MemtoRegOut_wire_MEM_WB;
	wire [4:0] writeRegOut_wire_MEM_WB;
	wire RegWriteOut_wire_MEM_WB;

MEM_WB_Register mips_MEM_WB_Register (
	.CLK(CLK), 
	.hit(hitFetchOut), 
	.readData(readDataOut_wire_dataMem), 
	.ALUResult(ALUResultOut_wire_ex), 
	.writeReg(writeRegOut_wire_ex), 
	.RegWrite(RegWriteOut_wire_ex), 
	.MemtoReg(MemToRegOut_wire_ex),

	.hitOut(), 
	.readDataOut(readDataOut_wire_MEM_WB), 
	.ALUResultOut(ALUResultOut_wire_MEM_WB), 
	.writeRegOut(writeRegOut_wire_MEM_WB), 
	.RegWriteOut(RegWriteOut_wire_MEM_WB),
	.MemtoRegOut(MemtoRegOut_wire_MEM_WB)
);



endmodule
