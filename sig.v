`timescale 1ns / 1ps

module sig(msg_from_bit1, min, secondmin, sign_min, sign_secondmin);

input msg_from_bit[0:4];
input min, secondmin;
output sign_min, sign_secondmin;
wire sign;

always @(posedge clk)
begin
end
endmodule;