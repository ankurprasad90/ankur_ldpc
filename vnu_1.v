`timescale 1ns / 1ps

//Iteration1 just pass intrinsic info to the check nodes
module vnu_1	(vnu_ien, 
				intrinsic_info, 
				msg_to_check0, 
				msg_to_check1, 
				msg_to_check2,
				vnu_over
				);

//inputs - inputs from check nodes in prev iter
//outputs - output to check nodes in cur iter

input 			[7:0]intrinsic_info;
input 			vnu_en;
output reg		[7:0] msg_to_check0;
output reg		[7:0] msg_to_check1;
output reg		[7:0] msg_to_check2;
output 			vnu_over;
reg				vnu_over;
reg 			[7:0]sum_of_msg_from_check;

always @(intrinsic_info or vnu_en)
begin 
		if(vnu_en == 1) begin

			msg_to_check0 = intrinsic_info;
			msg_to_check1 = intrinsic_info;
			msg_to_check2 = intrinsic_info;
			vnu_over = 1;

		end

end

endmodule