`timescale 1ns / 1ps

module abs(msg_from_bit0, msg_from_bit1, msg_from_bit2, msg_from_bit3, msg_from_bit4, msg_from_bit5, min, bit_min, secondmin, bit_secondmin, sign);

input 				[7:0]msg_from_bit0;
input 				[7:0]msg_from_bit1;
input 				[7:0]msg_from_bit2;
input 				[7:0]msg_from_bit3;
input 				[7:0]msg_from_bit4;
input 				[7:0]msg_from_bit5;
//wire 				sign[0:4];
output reg			[2:0]min;
output reg			[7:0]bit_min;
output reg			[2:0]secondmin;
output reg			[7:0]bit_secondmin;
output reg			[0:5]sign;
integer 			i,j;

reg 				[7:0]msg_from_bit_reg_array[0:5];

reg 				[7:0] a,b,c,d,sa,sb,sc,sd;
reg 				[2:0] min1, min2, min3, min4, smin1, smin2, smin3, smin4;


always @(msg_from_bit0 or msg_from_bit1 or msg_from_bit2 or msg_from_bit3 or msg_from_bit4 or msg_from_bit5)
begin

	msg_from_bit_reg_array[0] = msg_from_bit0;
	msg_from_bit_reg_array[1] = msg_from_bit1;
	msg_from_bit_reg_array[2] = msg_from_bit2;
	msg_from_bit_reg_array[3] = msg_from_bit3;
	msg_from_bit_reg_array[4] = msg_from_bit4;
	msg_from_bit_reg_array[5] = msg_from_bit5;

//get absolute values of all bit msgs and store respective sign bits
	if (msg_from_bit_reg_array[0][7] == 1) // last bit is 1 meaning negative value
	begin
		sign[0] = 1; //negative
		msg_from_bit_reg_array[0] = 9'b100000000 - msg_from_bit_reg_array[0]; // taking absolute by converting from 2s complement mode
	end
	else 
	begin
		sign[0] = 0; //positive
		msg_from_bit_reg_array[0] = msg_from_bit_reg_array[0]; // keeping the same value
	end

	if (msg_from_bit_reg_array[1][7] == 1) //  is negative)
	begin
		sign[1] = 1;
		msg_from_bit_reg_array[1] = 9'b100000000 - msg_from_bit_reg_array[1];
	end
	else 
	begin
		sign[1] = 0;
		msg_from_bit_reg_array[1] = msg_from_bit_reg_array[1];
	end

	if (msg_from_bit_reg_array[2][7] == 0) // is negative)
	begin
		sign[2] = 1;
		msg_from_bit_reg_array[2] = 9'b100000000 - msg_from_bit_reg_array[2];
	end
	else 
	begin
		sign[2] = 0;
		msg_from_bit_reg_array[2] = msg_from_bit_reg_array[2];
	end

	if (msg_from_bit_reg_array[3][7] == 1) // is negative)
	begin
		sign[3] = 1;
		msg_from_bit_reg_array[3] = 9'b100000000 - msg_from_bit_reg_array[3];
	end
	else 
	begin
		sign[3] = 0;
		msg_from_bit_reg_array[3] = msg_from_bit_reg_array[3];
	end

	if (msg_from_bit_reg_array[4][7] == 1) // is negative)
	begin
		sign[4] = 1;
		msg_from_bit_reg_array[4] = 9'b100000000 - msg_from_bit_reg_array[4];
	end
	else 
	begin
		sign[4] = 0;
		msg_from_bit_reg_array[4] = msg_from_bit_reg_array[4];
	end

	if (msg_from_bit_reg_array[5][7] == 1) // is negative)
	begin
		sign[5] = 1;
		msg_from_bit_reg_array[5] = 9'b100000000 - msg_from_bit_reg_array[5];
	end
	else 
	begin
		sign[5] = 0;
		msg_from_bit_reg_array[5] = msg_from_bit_reg_array[5];
	end

//finding min and second min value
	if(msg_from_bit_reg_array[0] < msg_from_bit_reg_array[1])
	begin
		a = msg_from_bit_reg_array[0];
		min1 = 3'd0;
		sa = msg_from_bit_reg_array[1];
		smin1 = 3'd1;

	end
	else 
	begin
		a = msg_from_bit_reg_array[1];
		min1 = 3'd1;
		sa = msg_from_bit_reg_array[0];	
		smin1 = 3'd0;
	end

	if(msg_from_bit_reg_array[2] < a)
	begin
		b = msg_from_bit_reg_array[2];
		min2 = 3'd2;
		sb = a;
		smin2 = min1;
	end
	else 
	begin
		b = a;
		min2 = min1;
		if(msg_from_bit_reg_array[2] < sa)
		begin
			sb = msg_from_bit_reg_array[2];
			smin2 = 3'd2;
		end
		else 
		begin
			sb = sa;
			smin2 = smin1;	
		end

	end

	if(msg_from_bit_reg_array[3] < b)
	begin
			c = msg_from_bit_reg_array[3];
			min3 = 3'd3;
			sc = b;
			smin3 = min2;
	end
	else 
	begin
		c = b;
		min3 = min2;
		if(msg_from_bit_reg_array[3] < sb)
		begin
			sc = msg_from_bit_reg_array[3];
			smin3 = 3'd3;
		end
		else 
		begin
			sc = sb;
			smin3 = smin2;
		end
	end

	if(msg_from_bit_reg_array[4] < c)
	begin
	 	d = msg_from_bit_reg_array[4];
	 	min4 = 3'd4;
	 	sd = c;
	 	smin4 = min3;
	end
	else 
	begin
		d = c;
		min4 = min3;
		if(msg_from_bit_reg_array[4] < sc)
		begin
		 	sd = msg_from_bit_reg_array[4];
		 	smin4 = 3'd4;
		end 
		else 
		begin
				sd = sc;
				smin4 = smin3;
		end	
	end 

	if(msg_from_bit_reg_array[5] < d)
	begin
	 	bit_min = msg_from_bit_reg_array[5];
	 	min = 3'd5;
	 	bit_secondmin = d;
	 	secondmin = min3;
	end
	else 
	begin
		bit_min = d;
		min = min4;
		if(msg_from_bit_reg_array[4] < sd)
		begin
		 	bit_secondmin = msg_from_bit_reg_array[5];
		 	secondmin = 3'd5;
		end 
		else 
		begin
			bit_secondmin = sd;
			secondmin = smin4;	
		end	
	end 
/*
//finding min value
	if(msg_from_bit_reg_array[0] < msg_from_bit_reg_array[1])
	begin
		a = msg_from_bit_reg_array[0];
		min1 = 3'd0;
	end
	else 
	begin
		a = msg_from_bit_reg_array[1];
		min1 = 3'd1;
	end

	if(msg_from_bit_reg_array[2] < msg_from_bit_reg_array[3])
	begin
		b = msg_from_bit_reg_array[2];
		min2 = 3'd2;
	end
	else 
	begin
		b = msg_from_bit_reg_array[3];
		min2 = 3'd3;
	end

	if(a < b)
	begin
		c = a;
		min3 = min1;
	end
	else 
	begin
		c = b;
		min3 = min2;
	end

	if(c < msg_from_bit_reg_array[4])
	begin
		bit_min = c;
		min = min3;
		smin = 3'd4;
	end
	else 
	begin
		bit_min = msg_from_bit_reg_array[4];
		min = 3'd4;	
		smin = min3;
	end

	if(smin < )

*/


//get min values amongst all the bit node msgs
/*	min = i;
	bit_min = msg_from_bit_reg_array[i];

	for (i=1 ; i < 5; i=i+1)
	begin
		if(msg_from_bit_reg_array[i] < bit_min)
		begin
			min = i;
			bit_min = msg_from_bit_reg_array[i];
		end
		else 
		begin
			min = min;
			bit_min = bit_min;
		end
	end



//get second min value amongst all ther remaining bit node msgs
	if(min == 0)
	begin
		secondmin = 1;
		bit_secondmin = msg_from_bit_reg_array[1];
	end
	else
	begin
		secondmin = 0;
		bit_secondmin = msg_from_bit_reg_array[0];
	end

	for (j=0 ; j < 5 ; j=j+1)
	begin
		if(j == min)
		begin
			j = j+1;
		end
		/*else
		begin
			if(msg_from_bit_reg_array[j] < bit_secondmin)
			begin
				secondmin = j;
				bit_secondmin = msg_from_bit_reg_array[j];
			end
			else 
			begin
				secondmin = secondmin;
				bit_secondmin = bit_secondmin;
			end
		end
	end*/

end
endmodule
