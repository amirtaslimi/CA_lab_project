`timescale 1ns / 1ps




module ID_EX(

			input CLK,
			input hit,
			input [31:0] readData1,
			input [31:0] readData2,
			input [31:0] signExImmediate,
			input regDst,
			input aluSrc,
			input memToReg,
			input regWrite,
			input memRead,
			input memWrite,
			input branch,
			input [2:0] aluOp,
			input [4:0] rt,
			input [4:0] rd,
			input [5:0] funct,
			input [31:0] nextPc,
			
			output reg [31:0] readData1Out,
			output reg [31:0] readData2Out,
			output reg [31:0] signExImmediateOut,
			output reg regDstOut,
			output reg aluSrcOut,
			output reg memToRegOut,
			output reg regWriteOut,
			output reg memReadOut,
			output reg memWriteOut,
			output reg branchOut,
			output reg [2:0] aluOpOut,
			output reg [4:0] rtOut,
			output reg [4:0] rdOut,
			output reg [5:0] functOut,
			output reg [31:0] nextPcOut
			);
			
			// initial begin
			// readData1Out = 0 ;
			// readData2Out = 0 ;
			// signExImmediateOut = 0 ;
			// regDstOut = 0 ;
			// aluSrcOut = 0 ;
			// memToRegOut = 0 ;
			// regWriteOut = 0 ;
			// memReadOut = 0 ;
			// memWriteOut = 0 ;
			// branchOut = 0 ;
			// aluOpOut = 0 ;
			// rtOut = 0 ;
			// rdOut = 0 ;
			// functOut = 0 ;
			// 	nextPcOut = 0 ;

			// end

			
			
			always @ (negedge CLK)
				begin
					if (hit) 
						begin
							readData1Out	  <= readData1;
							readData2Out   <= readData2;
							signExImmediateOut		  <= signExImmediate;
							regDstOut <= regDst;
							aluSrcOut      <= aluSrc;
							memToRegOut		  <= memToReg;
							regWriteOut		  <= regWrite;
							memReadOut	     <= memRead;
							memWriteOut		  <= memWrite;
							branchOut 			  <= branch;
							aluOpOut   <= aluOp;
							rtOut 				  <= rt; 
							rdOut 				  <= rd;
							functOut 		  <= funct;
							nextPcOut 		  <= nextPc;
						end
				end
			
			

			
			
			
			
			
			
			
			
			
			
			
			
			







  


endmodule
