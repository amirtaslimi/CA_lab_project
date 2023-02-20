`timescale 1ns / 1ps

module ALU(
		
		input [3:0] aluCnt,
		input [31:0] input1,
		input [31:0] input2,
		input [4:0] shamt,
		output reg [31:0] result,
		output reg zero

    );
	  initial 
    begin
      $display("Hello, World");

    end

	 always @(*)
		begin 
			if (aluCnt == 4'b0000)
				 result = input1 + input2;

			else if (aluCnt == 4'b0001)
				 result = input1 - input2;

			else if (aluCnt == 4'b0010)
				 result = ~ input1;
			else if (aluCnt == 4'b0011)
				 result = input1 << shamt;
			else if (aluCnt == 4'b0100)
				 result = input1 >> shamt;
			else if (aluCnt == 4'b0101)
				 result = input1 & input2;
			else if (aluCnt == 4'b0110)
				 result = input1 | input2;
			else if (aluCnt == 4'b0111)
				 result = (input1 < input2) ? 32'b1 : 32'b0;
	 
			else 
				 result = 32'bx;
	  zero = (result == 32'b0)? 1 : 0;
	 end


endmodule
