`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// `include "Cache.v"
// `include "InstructionMemory.v"
// `include "mux64_32.v"
// `include "pc.v"
module Fetch(


	input CLK,
	input [31:0] branchTarget,
	input pcSourse , 
	output [31:0] nextPC ,
	output [31:0] Ins_out, 
	output reg hit_out =1
	
	);
	

	// zero added to mux
	wire[31:0] mux_address =0;
	wire[31:0] pc_outAddress;
	wire[127:0] dataline_net;
	wire hit_net;

	
	
	initial begin 
			hit_out = 1'b1;
			//pc_outAddress = 0;
	end
	
	
	
	always @(hit_net) hit_out <= hit_net;
	assign nextPC = pc_outAddress + 4;
	// assign??
	
		mux64_32 fetch_mux64_32 (
		.a(nextPC), 
		.b(branchTarget), 
		.s(0), 
		.c(mux_address)
	);
	////todo
	pc fetch_pc (
		.newInsAddress_fromPc(nextPC), 
		.CLK(CLK), 
		.hit(hit_out), 
		.InsAddress_fromPc(pc_outAddress)
	);
	
	
	
		InstructionMemory fetch_Instructionmemory(
		.InsAddress(pc_outAddress), 
		.CLK(CLK), 
		.dataline(dataline_net)
    );
	
		Cache fetch_Cache (
		 .dataline(dataline_net), 
		 .CLK(CLK), 
		 .address(pc_outAddress), 
		 .Ins(Ins_out), 
		 .hit(hit_net)
		 );

	
endmodule
