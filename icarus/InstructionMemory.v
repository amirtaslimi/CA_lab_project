`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(
		input [31:0] InsAddress,
		input CLK,
		output reg [127:0] dataline

    );
	 
	 // mem
	reg [7:0] mem [1023:0];
	reg [2:0] counter;
	
	initial begin
	$readmemh("E:/University/computer_architecture_lab/icarus/ins_Rtype.txt",mem);
	dataline = 0;
	counter = 0;
	end
	
	always @(posedge CLK)
	begin
			if (counter == 5)
				begin
					// dataline = (first ins, second ins)
					//dataline <=  {mem[InsAddress], mem[InsAddress+1], mem[InsAddress+2], mem[InsAddress+3], mem[InsAddress+4], mem[InsAddress+5], mem[InsAddress+6], mem[InsAddress+7], mem[InsAddress+8], mem[InsAddress+9], mem[InsAddress+10], mem[InsAddress+11], mem[InsAddress+12], mem[InsAddress+13], mem[InsAddress+14], mem[InsAddress+15]};
					//dataline <=   {mem[InsAddress], mem[InsAddress+1]};
					$display(InsAddress);
					dataline = {mem[InsAddress+12],mem[InsAddress+13],mem[InsAddress+14],mem[InsAddress+15],
							 mem[InsAddress+8],mem[InsAddress+9],mem[InsAddress+10],mem[InsAddress+11],
							 mem[InsAddress+4],mem[InsAddress+5],mem[InsAddress+6],mem[InsAddress+7],
							 mem[InsAddress],mem[InsAddress+1],mem[InsAddress+2],mem[InsAddress+3]} ;
					counter = 0;
				end
			else 
				counter = counter + 1;
	end


endmodule



// 00430800  ==>  add $1, $2, $3 
// 00A62001  ==>  sub $4, $5, $6
// 01093802  ==>  and $7, $8, $9
// 016C5003  ==>  or $10, $11, $12
// 02208007  ==>  not $16, $17
// 0320C0C5  ==>  lsl $24, $25, 3
// 0360D0C6  ==>  lsr $26, $27, 3
// 01CF6804  ==>  slt $13, $14, $15

// 16720004  ==>  sw $18, 4($19)
// 12720004  ==>  lw $18, 4($19)
// 1EB40015  ==>  addi $20, $21, 21
// 06F60017  ==>  slti $22, $23, 23 ////
// 1800FFF3  ==>  beq $0, $0, -13 







