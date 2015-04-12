`timescale 1ns / 1ps

//for all iterations after first and before the last hard decoding iteration
module vnu	(vnu_en,
			intrinsic_info, 
			msg_from_check0, 
			msg_from_check1, 
			msg_from_check2, 
			msg_to_check0, 
			msg_to_check1, 
			msg_to_check2,
			vnu_over
			);

//inputs - inputs from check nodes in prev iter
//outputs - output to check nodes in cur iter

input 			[7:0]intrinsic_info;
input 			[7:0] msg_from_check0;
input 			[7:0] msg_from_check1;
input 			[7:0] msg_from_check2;
input 			vnu_en;
output reg		[7:0] msg_to_check0;
output reg		[7:0] msg_to_check1;
output reg		[7:0] msg_to_check2;
reg 			[7:0]sum_of_msg_from_check;
output 			vnu_over;
reg				vnu_over;

always @(msg_from_check0 or msg_from_check1 or msg_from_check2 or vnu_en)
begin 
	if(vnu_en == 1) begin
		sum_of_msg_from_check = msg_from_check0 + msg_from_check1 + msg_from_check2; 
		msg_to_check0 = intrinsic_info + sum_of_msg_from_check - msg_from_check0;
		msg_to_check1 = intrinsic_info + sum_of_msg_from_check - msg_from_check1;
		msg_to_check2 = intrinsic_info + sum_of_msg_from_check - msg_from_check2;
		vnu_over = 1;
	end
end

endmodule