`timescale 1ns / 1ps
module MultipleOutputCircuits_tb;
reg A,B,C,D; // INPUTS
wire Falpha,Fbeta,Fgamma; // OUTPUTS
// Instantiate the Unit Under Test (UUT)
MultipleOutputCircuit uut (
.Falpha(Falpha),
.Fbeta(Fbeta),
.Fgamma(Fgamma),
.A(A),
.B(B),
.C(C),
.D(D)
);
initial begin
A = 0; B = 0; C = 0; D = 0;
#100 A = 0; B = 0; C = 0; D = 1;
#100 A = 0; B = 0; C = 1; D = 0;
#100 A = 0; B = 0; C = 1; D = 1;
#100 A = 0; B = 1; C = 0; D = 0;
#100 A = 0; B = 1; C = 0; D = 1;
#100 A = 0; B = 1; C = 1; D = 0;
#100 A = 0; B = 1; C = 1; D = 1;
#100 A = 1; B = 0; C = 0; D = 0;
#100 A = 1; B = 0; C = 0; D = 1;
#100 A = 1; B = 0; C = 1; D = 0;
#100 A = 1; B = 0; C = 1; D = 1;
#100 A = 1; B = 1; C = 0; D = 0;
#100 A = 1; B = 1; C = 0; D = 1;
#100 A = 1; B = 1; C = 1; D = 0;
#100 A = 1; B = 1; C = 1; D = 1;
end
endmodule
