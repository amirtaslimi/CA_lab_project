`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Cache(


		input [31:0] address,
		input [127:0] dataline,
		input CLK,
		output reg [31:0] Ins,
		output reg hit
	 );


		integer index;
		integer offset;
		reg [153:0] cache [7:0];
		

		
		//initial cache

initial begin 
			
			cache[0][153]=0;
			cache[1][153]=0;
			cache[2][153]=0;
			cache[3][153]=0;
			cache[4][153]=0;
			cache[5][153]=0;
			cache[6][153]=0;
			cache[7][153]=0;

	end
	always @(dataline)
	
			begin
						index = address[6:4];
						
						cache[index][127:0] = dataline[127:0];
						cache[index][152:128] = address[31:7]; //tag
						cache[index][153] = 1;   //valid

	
			end
	always @(posedge CLK)
	begin

		index = address[6:4];
		offset = address[3:2];
	
		if(cache[index][152:128] == address[31:7] && cache[index][153] == 1 )
				begin
						hit = 1;
						case(offset)
										2'b00 : Ins = cache[index][31:0];
										2'b01 : Ins = cache[index][63:32];
										2'b10 : Ins = cache[index][95:64];
										2'b11 : Ins = cache[index][127:96];	
						endcase

						if (Ins === 32'bx)
								hit = 0;
				end
		else
				begin
				hit = 0;
				Ins = 32'bx;
				end
		end








endmodule
