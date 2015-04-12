`timescale 1ns / 1ps
`include "abs.v"

module cnu(	cnu_en,
			msg_from_bit0, 
			msg_from_bit1, 
			msg_from_bit2, 
			msg_from_bit3, 
			msg_from_bit4, 
			msg_from_bit5, 
			msg_to_bit0, 
			msg_to_bit1, 
			msg_to_bit2, 
			msg_to_bit3, 
			msg_to_bit4, 
			msg_to_bit5,
			cnu_over
			);

//inputs - 5 msg from bit nodes from prev iter
//output - 5 msg to bit nodes in cur iter

input 			[7:0]msg_from_bit0;
input 			[7:0]msg_from_bit1;
input 			[7:0]msg_from_bit2;
input 			[7:0]msg_from_bit3;
input 			[7:0]msg_from_bit4;
input 			[7:0]msg_from_bit5;
input 			cnu_en;
output reg 		[7:0]msg_to_bit0;
output reg 		[7:0]msg_to_bit1;
output reg 		[7:0]msg_to_bit2;
output reg 		[7:0]msg_to_bit3;
output reg 		[7:0]msg_to_bit4;
output reg 		[7:0]msg_to_bit5;
output			cnu_over;
reg 			cnu_over;
wire 			[2:0]min;
wire 			[7:0]bit_min;
wire 			[2:0]secondmin;
wire 			[7:0]bit_secondmin;
wire 			[0:5]sign;
//wire sign_min, sign_secondmin;
reg sum_sign;
reg 			[7:0]msg_to_bit_reg_array[0:5];
integer 		i; 
//get values - take absolute - find min - find second min - find sign - send back with sign

abs min_sum_calc(msg_from_bit0, msg_from_bit1, msg_from_bit2, msg_from_bit3, msg_from_bit4, msg_from_bit5, min, bit_min, secondmin, bit_secondmin, sign);

always @(msg_from_bit5 or msg_from_bit4 or msg_from_bit3 or msg_from_bit2 or msg_from_bit1 or msg_from_bit0 or cnu_en)
begin
	//get min and second min values of the msgs from the bit node
	//abs min_sum_calc(clk, msg_from_bit0, msg_from_bit1, msg_from_bit2, msg_from_bit3, msg_from_bit4, min, bit_min, secondmin, bit_secondmin, sign);
		//msg_from_bit, min, bit_min, secondmin, bit_secondmin, sign);
	if(cnu_en == 1) begin

		sum_sign = sign[0] ^ sign[1] ^ sign[2] ^ sign[3] ^ sign[4] ^ sign[5];

		//send back the min or secondmin values along with correct sign representation
		for(i=0 ; i<6; i=i+1)
		begin
			if(i==min)
			begin
				if((sum_sign ^ sign[i]) == 0) //positive
				begin
					msg_to_bit_reg_array[i] = bit_secondmin;
				end
				else //negative
				begin
					msg_to_bit_reg_array[i] = 9'b100000000 - bit_secondmin; //2s complement of bit_secondmin to represent negative number
				end
			end
			else
			begin
				if((sum_sign ^ sign[i]) == 0) //positive
				begin
					msg_to_bit_reg_array[i] = bit_min;
				end
				else
				begin
					msg_to_bit_reg_array[i] = 9'b100000000 - bit_min; //2s complement of bit_min
				end
			end
		end

		msg_to_bit0 = msg_to_bit_reg_array[0];
		msg_to_bit1 = msg_to_bit_reg_array[1];
		msg_to_bit2 = msg_to_bit_reg_array[2];
		msg_to_bit3 = msg_to_bit_reg_array[3];
		msg_to_bit4 = msg_to_bit_reg_array[4];
		msg_to_bit5 = msg_to_bit_reg_array[5];
		cnu_over = 1;
	end
end
endmodule