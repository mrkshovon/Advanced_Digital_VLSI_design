`timescale 1ns / 1ps
module d_flip_flop (
    input wire D, // Data input
    input wire clk, // Clock input
    input wire reset, // Asynchronous reset input
    output reg Q, // Q output
    output reg notQ // notQ output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 0;
            notQ <= 1;
        end else begin
            Q <= D;
            notQ <= ~D;
        end
    end

endmodule
