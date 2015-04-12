`timescale 1ns / 1ps

//for all iterations after first and before the last hard decoding iteration
module vnu_h	(vnu_en,
				intrinsic_info, 
				msg_from_check0, 
				msg_from_check1, 
				msg_from_check2, 
				data_out,
				get_output
				);

//inputs - inputs from check nodes in prev iter
//outputs - output to check nodes in cur iter

input 			[7:0] intrinsic_info;
input 			[7:0] msg_from_check0;
input 			[7:0] msg_from_check1;
input 			[7:0] msg_from_check2;
input 			vnu_en;
output reg 			  data_out;
output 			get_output;
reg 			get_output;
reg 			[7:0] vnu_data_out;

//if the total sum is = zero => decoded bit is 0
//if the total sum > zero => decoded bit is 1
always @(msg_from_check0 or msg_from_check1 or msg_from_check2 or vnu_en)
begin 
	if(vnu_en == 1) begin
		vnu_data_out = intrinsic_info + msg_from_check0 + msg_from_check1 + msg_from_check2; 
		if(vnu_data_out[7] == 1 || vnu_data_out == 8'b0) begin //negative number
			data_out = 0;
		end
		else begin //positive number
			data_out = 1;
		end
		get_output = 1;
	end
end

endmodule