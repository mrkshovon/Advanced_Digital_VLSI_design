`timescale 1ns / 1ps
module threshold2(
input [31:0] x1,
input [31:0] w1,
input [31:0] x2,
input [31:0] w2,
input [31:0] th,
output [1:0] F
);
wire [31:0] s;
assign s = w1*x1 + w2*x2;
assign F=(s>=th)? 1:0;
endmodule
