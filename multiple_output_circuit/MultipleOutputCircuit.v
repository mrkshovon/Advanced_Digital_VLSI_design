`timescale 1ns / 1ps
module MultipleOutputCircuit(Falpha, Fbeta, Fgamma, A, B, C, D);
input A, B, C, D;
output Falpha, Fbeta, Fgamma;
wire [0:8] W;
// NOT GATES
not g1(W[0],A); // A'
not g2(W[1],B); // B'
not g3(W[2],C); // C'
not g4(W[3],D); // D'
// AND GATES
and g5(W[4],W[0],W[2],D); // A'C'D = W[4]
and g6(W[5],A,W[2],D); // AC'D = W[5]
and g7(W[6],B,C,D); // BCD = W[6]
and g8(W[7],W[0],W[1]); // A'B' = W[7]
and g9(W[8],A,W[1]); // AB' = W[8]
// FINAL OR GATES
or g10(Falpha,W[4],W[5],W[6]); //Falpha = A'C'D+AC'D+BCD
or g11(Fbeta,W[7],W[4],W[7]); //Fbeta = A'B'+A'C'D+BCD
or g12(Fgamma,W[8],W[5],W[6]); //Fgamma = AB'+AC'D+BCD
endmodule
