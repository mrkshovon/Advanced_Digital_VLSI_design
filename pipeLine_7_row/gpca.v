// Arithmetic Cell

module ac
(
input wire A, B, C, X, F, C1,
output wire S, D, E, C0
);

assign S = ((A ^ (B ^ X) ^ C1) & F) | (A & ~F);
assign C0 = ((B ^ X) & (A | C1)) | (A & C1);
assign D = C & (B | F);
assign E = B | (C & F);

endmodule


// Control Cell
module cc
(
input wire X, P, C0,
output wire F
);
assign F = (C0 & X) | (P & ~X);

endmodule

module gpca
(
input wire X,
input wire [1:7] P,
input wire [1:9] B, C,
input wire [1:14] A,
output wire [1:7] F,
output wire [1:15] S
);

wire [1:7]  FI;    
wire [1:3]  C1;
wire [1:5]  C2;
wire [1:7]  C3;
wire [1:9]  C4;
wire [1:11] C5;
wire [1:13] C6;
wire [1:15] C7;
   
wire [1:3]  S1;
wire [1:5]  S2;
wire [1:7]  S3;
wire [1:9]  S4;
wire [1:11] S5;
wire [1:13] S6;
wire [1:15] S7;

wire [1:3]  D1;
wire [1:5]  D2;
wire [1:7]  D3;
wire [1:9]  D4;
wire [1:11] D5;
wire [1:13] D6;

   
wire [1:3]  E1;
wire [1:5]  E2;
wire [1:7]  E3;
wire [1:9]  E4;
wire [1:11] E5;
wire [1:13] E6;

   
assign F[1] =  C1[1];   
assign F[2] =  C2[1];
assign F[3] =  C3[1];
assign F[4] =  C4[1];
assign F[5] =  C5[1];
assign F[6] =  C6[1];
assign F[7] =  C7[1];


//
assign S = S7;


//control cells (X,P,C0 / F)
cc cc1(X, P[1], C1[1], FI[1]);
cc cc2(X, P[2], C2[1], FI[2]);
cc cc3(X, P[3], C3[1], FI[3]);
cc cc4(X, P[4], C4[1], FI[4]);
cc cc5(X, P[5], C5[1], FI[5]);
cc cc6(X, P[6], C6[1], FI[6]);
cc cc7(X, P[7], C7[1], FI[7]);


//_______________________________________________________________
// arithmetic cells of row 1(A,B,C,X,F,C1/S,D,E,C0)
ac ac11(.A(1'b0), .B(B[1]),.C(C[1]),.X(X),.F(FI[1]),.C1(C1[2]), .S(S1[1]), .D(D1[1]), .E(E1[1]),.C0(C1[1]));
ac ac12(.A(A[1]), .B(B[2]),.C(C[2]),.X(X),.F(FI[1]),.C1(C1[3]), .S(S1[2]), .D(D1[2]), .E(E1[2]),.C0(C1[2]));
ac ac13(.A(A[2]), .B(B[3]),.C(C[3]),.X(X),.F(FI[1]),.C1(X),.S(S1[3]), .D(D1[3]), .E(E1[3]),.C0(C1[3]));

// arithmetic cells of row 2(A,B,C,X,F,C1/S,D,E,C0)
ac ac21(.A(S1[1]), .B(1'b0),.C(1'b0),.X(X),.F(FI[2]), .C1(C2[2]), .S(S2[1]), .D(D2[1]), .E(E2[1]),.C0(C2[1]));
ac ac22(.A(S1[2]), .B(D1[1]), .C(E1[1]), .X(X),.F(FI[2]), .C1(C2[3]), .S(S2[2]), .D(D2[2]), .E(E2[2]),.C0(C2[2]));
ac ac23(.A(S1[3]), .B(D1[2]), .C(E1[2]), .X(X),.F(FI[2]), .C1(C2[4]), .S(S2[3]), .D(D2[3]), .E(E2[3]),.C0(C2[3]));
ac ac24(.A(A[3]), .B(D1[3]), .C(E1[3]), .X(X),.F(FI[2]),.C1(C2[5]), .S(S2[4]), .D(D2[4]), .E(E2[4]),.C0(C2[4]));
ac ac25(.A(A[4]), .B(B[4]),.C(C[4]),.X(X),.F(FI[2]),.C1(X),.S(S2[5]), .D(D2[5]), .E(E2[5]),.C0(C2[5]));

// arithmetic cells of row 3(A,B,C,X,F,C1/S,D,E,C0)
ac ac31(.A(S2[1]),.B(1'b0),.C(1'b0),.X(X),.F(FI[3]), .C1(C3[2]), .S(S3[1]), .D(D3[1]), .E(E3[1]),.C0(C3[1]));
ac ac32(.A(S2[2]), .B(D2[1]), .C(E2[1]), .X(X),.F(FI[3]), .C1(C3[3]), .S(S3[2]), .D(D3[2]), .E(E3[2]),.C0(C3[2]));
ac ac33(.A(S2[3]), .B(D2[2]), .C(E2[2]), .X(X),.F(FI[3]), .C1(C3[4]), .S(S3[3]), .D(D3[3]), .E(E3[3]),.C0(C3[3]));
ac ac34(.A(S2[4]), .B(D2[3]), .C(E2[3]), .X(X),.F(FI[3]), .C1(C3[5]), .S(S3[4]), .D(D3[4]), .E(E3[4]),.C0(C3[4]));
ac ac35(.A(S2[5]), .B(D2[4]), .C(E2[4]), .X(X),.F(FI[3]), .C1(C3[6]), .S(S3[5]), .D(D3[5]), .E(E3[5]),.C0(C3[5]));
ac ac36(.A(A[5]), .B(D2[5]), .C(E2[5]), .X(X),.F(FI[3]),.C1(C3[7]), .S(S3[6]), .D(D3[6]), .E(E3[6]),.C0(C3[6]));
ac ac37(.A(A[6]), .B(B[5]),.C(C[5]),.X(X),.F(FI[3]),.C1(X),.S(S3[7]), .D(D3[7]), .E(E3[7]),.C0(C3[7]));

// arithmetic cells of row 4(A,B,C,X,F,C1/S,D,E,C0)
ac ac41(.A(S3[1]), .B(1'b0),.C(1'b0),.X(X),.F(FI[4]), .C1(C4[2]), .S(S4[1]), .D(D4[1]), .E(E4[1]),.C0(C4[1]));
ac ac42(.A(S3[2]), .B(D3[1]), .C(E3[1]), .X(X),.F(FI[4]), .C1(C4[3]), .S(S4[2]), .D(D4[2]), .E(E4[2]),.C0(C4[2]));
ac ac43(.A(S3[3]), .B(D3[2]), .C(E3[2]), .X(X),.F(FI[4]), .C1(C4[4]), .S(S4[3]), .D(D4[3]), .E(E4[3]),.C0(C4[3]));
ac ac44(.A(S3[4]), .B(D3[3]), .C(E3[3]), .X(X),.F(FI[4]), .C1(C4[5]), .S(S4[4]), .D(D4[4]), .E(E4[4]),.C0(C4[4]));
ac ac45(.A(S3[5]), .B(D3[4]), .C(E3[4]), .X(X),.F(FI[4]), .C1(C4[6]), .S(S4[5]), .D(D4[5]), .E(E4[5]),.C0(C4[5]));
ac ac46(.A(S3[6]), .B(D3[5]), .C(E3[5]), .X(X),.F(FI[4]), .C1(C4[7]), .S(S4[6]), .D(D4[6]), .E(E4[6]),.C0(C4[6]));
ac ac47(.A(S3[7]), .B(D3[6]), .C(E3[6]), .X(X),.F(FI[4]), .C1(C4[8]), .S(S4[7]), .D(D4[7]), .E(E4[7]),.C0(C4[7]));
ac ac48(.A(A[7]), .B(D3[7]), .C(E3[7]), .X(X),.F(FI[4]),.C1(C4[9]), .S(S4[8]), .D(D4[8]), .E(E4[8]),.C0(C4[8]));
ac ac49(.A(A[8]), .B(B[6]),.C(C[6]),.X(X),.F(FI[4]),.C1(X),.S(S4[9]), .D(D4[9]), .E(E4[9]),.C0(C4[9]));

// arithmetic cells of row 5(A,B,C,X,F,C1/S,D,E,C0)
ac ac51(.A(S4[1]), .B(1'b0),.C(1'b0),.X(X),.F(FI[5]), .C1(C5[2]), .S(S5[1]), .D(D5[1]), .E(E5[1]),    .C0(C5[1]));
ac ac52(.A(S4[2]), .B(D4[1]), .C(E4[1]), .X(X),.F(FI[5]), .C1(C5[3]), .S(S5[2]), .D(D5[2]), .E(E5[2]), .C0(C5[2]));
ac ac53(.A(S4[3]), .B(D4[2]), .C(E4[2]), .X(X),.F(FI[5]), .C1(C5[4]), .S(S5[3]), .D(D5[3]), .E(E5[3]), .C0(C5[3]));
ac ac54(.A(S4[4]), .B(D4[3]), .C(E4[3]), .X(X),.F(FI[5]), .C1(C5[5]), .S(S5[4]), .D(D5[4]), .E(E5[4]), .C0(C5[4]));
ac ac55(.A(S4[5]), .B(D4[4]), .C(E4[4]), .X(X),.F(FI[5]), .C1(C5[6]), .S(S5[5]), .D(D5[5]), .E(E5[5]), .C0(C5[5]));
ac ac56(.A(S4[6]), .B(D4[5]), .C(E4[5]), .X(X),.F(FI[5]), .C1(C5[7]), .S(S5[6]), .D(D5[6]), .E(E5[6]), .C0(C5[6]));
ac ac57(.A(S4[7]), .B(D4[6]), .C(E4[6]), .X(X),.F(FI[5]), .C1(C5[8]), .S(S5[7]), .D(D5[7]), .E(E5[7]), .C0(C5[7]));
ac ac58(.A(S4[8]), .B(D4[7]), .C(E4[7]), .X(X),.F(FI[5]), .C1(C5[9]), .S(S5[8]), .D(D5[8]), .E(E5[8]), .C0(C5[8]));
ac ac59(.A(S4[9]), .B(D4[8]), .C(E4[8]), .X(X),.F(FI[5]), .C1(C5[10]),.S(S5[9]), .D(D5[9]), .E(E5[9]), .C0(C5[9]));
ac ac5a(.A(A[9]),  .B(D4[9]), .C(E4[9]), .X(X),.F(FI[5]), .C1(C5[11]),.S(S5[10]),.D(D5[10]), .E(E5[10]),.C0(C5[10]));
ac ac5b(.A(A[10]), .B(B[7]),  .C(C[7]),  .X(X),.F(FI[5]), .C1(X),     .S(S5[11]),.D(D5[11]), .E(E5[11]),.C0(C5[11]));

// arithmetic cells of row 6(A,B,C,X,F,C1/S,D,E,C0)
ac ac61(.A(S5[1]), .B(1'b0),.C(1'b0),.X(X),.F(FI[6]), .C1(C6[2]), .S(S6[1]), .D(D6[1]), .E(E6[1]),.C0(C6[1]));
ac ac62(.A(S5[2]), .B(D5[1]), .C(E5[1]), .X(X),.F(FI[6]), .C1(C6[3]), .S(S6[2]), .D(D6[2]), .E(E6[2]),.C0(C6[2]));
ac ac63(.A(S5[3]), .B(D5[2]), .C(E5[2]), .X(X),.F(FI[6]), .C1(C6[4]), .S(S6[3]), .D(D6[3]), .E(E6[3]),.C0(C6[3]));
ac ac64(.A(S5[4]), .B(D5[3]), .C(E5[3]), .X(X),.F(FI[6]), .C1(C6[5]), .S(S6[4]), .D(D6[4]), .E(E6[4]),.C0(C6[4]));
ac ac65(.A(S5[5]), .B(D5[4]), .C(E5[4]), .X(X),.F(FI[6]), .C1(C6[6]), .S(S6[5]), .D(D6[5]), .E(E6[5]),.C0(C6[5]));
ac ac66(.A(S5[6]), .B(D5[5]), .C(E5[5]), .X(X),.F(FI[6]), .C1(C6[7]), .S(S6[6]), .D(D6[6]), .E(E6[6]),.C0(C6[6]));
ac ac67(.A(S5[7]), .B(D5[6]), .C(E5[6]), .X(X),.F(FI[6]), .C1(C6[8]), .S(S6[7]), .D(D6[7]), .E(E6[7]),.C0(C6[7]));
ac ac68(.A(S5[8]), .B(D5[7]), .C(E5[7]), .X(X),.F(FI[6]), .C1(C6[9]), .S(S6[8]), .D(D6[8]), .E(E6[8]),.C0(C6[8]));
ac ac69(.A(S5[9]), .B(D5[8]), .C(E5[8]), .X(X),.F(FI[6]), .C1(C6[10]),.S(S6[9]), .D(D6[9]), .E(E6[9]),.C0(C6[9]));
ac ac6a(.A(S5[10]), .B(D5[9]), .C(E5[9]), .X(X),.F(FI[6]), .C1(C6[11]),.S(S6[10]), .D(D6[10]), .E(E6[10]),.C0(C6[10]));
ac ac6b(.A(S5[11]), .B(D5[10]), .C(E5[10]), .X(X),.F(FI[6]), .C1(C6[12]),.S(S6[11]), .D(D6[11]), .E(E6[11]),.C0(C6[11]));
ac ac6c(.A(A[11]), .B(D5[11]), .C(E5[11]), .X(X),.F(FI[6]), .C1(C6[13]),.S(S6[12]), .D(D6[12]), .E(E6[12]),.C0(C6[12]));
ac ac6d(.A(A[12]), .B(B[8]),.C(C[8]),.X(X),.F(FI[6]), .C1(X),.S(S6[13]), .D(D6[13]), .E(E6[13]),.C0(C6[13]));

// arithmetic cells of row 7(A,B,C,X,F,C1/S,D,E,C0)
ac ac71(.A(S6[1]), .B(1'b0),.C(1'b0),        .X(X),.F(FI[7]), .C1(C7[2]), .S(S7[1]), .D(), .E(),.C0(C7[1]));
ac ac72(.A(S6[2]), .B(D6[1]), .C(E6[1]),     .X(X),.F(FI[7]), .C1(C7[3]), .S(S7[2]), .D(), .E(),.C0(C7[2]));
ac ac73(.A(S6[3]), .B(D6[2]), .C(E6[2]),      .X(X),.F(FI[7]), .C1(C7[4]), .S(S7[3]), .D(), .E(),.C0(C7[3]));
ac ac74(.A(S6[4]), .B(D6[3]), .C(E6[3]),     .X(X),.F(FI[7]), .C1(C7[5]), .S(S7[4]), .D(), .E(),.C0(C7[4]));
ac ac75(.A(S6[5]), .B(D6[4]), .C(E6[4]),     .X(X),.F(FI[7]), .C1(C7[6]), .S(S7[5]), .D(), .E(),.C0(C7[5]));
ac ac76(.A(S6[6]), .B(D6[5]), .C(E6[5]),      .X(X),.F(FI[7]), .C1(C7[7]), .S(S7[6]), .D(), .E(),.C0(C7[6]));                                    
ac ac77(.A(S6[7]), .B(D6[6]), .C(E6[6]),      .X(X),.F(FI[7]), .C1(C7[8]), .S(S7[7]), .D(), .E(),.C0(C7[7]));                                    
ac ac78(.A(S6[8]), .B(D6[7]), .C(E6[7]),     .X(X), .F(FI[7]), .C1(C7[9]), .S(S7[8]), .D(),.E(),.C0(C7[8]));                                    
ac ac79(.A(S6[9]), .B(D6[8]), .C(E6[8]),      .X(X), .F(FI[7]), .C1(C7[10]),.S(S7[9]), .D(),.E(),.C0(C7[9]));
ac ac7a(.A(S6[10]), .B(D6[9]), .C(E6[9]),    .X(X),.F(FI[7]), .C1(C7[11]),.S(S7[10]), .D(),.E(),.C0(C7[10]));                                     
ac ac7b(.A(S6[11]), .B(D6[10]), .C(E6[10]),      .X(X), .F(FI[7]), .C1(C7[12]),.S(S7[11]), .D(),    .E(),.C0(C7[11]));                                     
ac ac7c(.A(S6[12]), .B(D6[11]), .C(E6[11]),      .X(X),.F(FI[7]), .C1(C7[13]),.S(S7[12]), .D(),    .E(),.C0(C7[12]));                                     
ac ac7d(.A(S6[13]), .B(D6[12]), .C(E6[12]),      .X(X),.F(FI[7]), .C1(C7[14]),.S(S7[13]), .D(),    .E(),.C0(C7[13]));
ac ac7e(.A(A[13]), .B(D6[13]), .C(E6[13]),    .X(X),.F(FI[7]), .C1(C7[15]),.S(S7[14]), .D(),    .E(),.C0(C7[14]));
ac ac7f(.A(A[14]), .B(B[9]),  .C(C[9]),       .X(X),.F(FI[7]), .C1(X),		.S(S7[15]),	.D() , 	.E(),.C0(C7[15]));

endmodule
