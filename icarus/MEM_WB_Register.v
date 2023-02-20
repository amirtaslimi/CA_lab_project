`timescale 1ns / 1ps

module MEM_WB_Register (
    input CLK, 
    input hit, 
    input [31:0] readData, 
    input [31:0] ALUResult, 
    input [4:0] writeReg, 
    input RegWrite, 
    input MemtoReg,

    output hitOut, 
    output reg [31:0] readDataOut, 
    output reg [31:0] ALUResultOut, 
    output reg [4:0] writeRegOut, 
    output reg RegWriteOut,
    output reg MemtoRegOut
);


        // initial begin
        //         readDataOut =0 ; 
        //         ALUResultOut =0 ; 
        //     writeRegOut =0 ; 
        //         RegWriteOut =0 ;
        //         MemtoRegOut =0 ;       
        //              end


    	assign hitOut = hit;
	
	always @(negedge CLK)
		begin
			if(hit) 
				begin 
					MemtoRegOut  <= MemtoReg;
					RegWriteOut  <= RegWrite;
					writeRegOut  <= writeReg;
					readDataOut  <= readData;
					ALUResultOut <= ALUResult;		
				end
		end

endmodule