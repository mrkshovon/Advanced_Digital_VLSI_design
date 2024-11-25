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
input wire [1:9] P,
input wire [1:19] B, C,
input wire [1:18] A,
output wire [1:9] F,
output wire [1:19] S
);

wire [1:9]  FI;    
wire [1:3]  C1;
wire [1:5]  C2;
wire [1:7]  C3;
wire [1:9]  C4;
wire [1:11] C5;
wire [1:13] C6;
wire [1:15] C7;
wire [1:17] C8;
wire [1:19] C9;
   
wire [1:3]  S1;
wire [1:5]  S2;
wire [1:7]  S3;
wire [1:9]  S4;
wire [1:11] S5;
wire [1:13] S6;
wire [1:15] S7;
wire [1:17] S8;
wire [1:19] S9;

wire [1:3]  D1;
wire [1:5]  D2;
wire [1:7]  D3;
wire [1:9]  D4;
wire [1:11] D5;
wire [1:13] D6;
wire [1:15] D7;
wire [1:17] D8;

   
wire [1:3]  E1;
wire [1:5]  E2;
wire [1:7]  E3;
wire [1:9]  E4;
wire [1:11] E5;
wire [1:13] E6;
wire [1:15] E7;
wire [1:17] E8;

   
assign F[1] =  C1[1];   
assign F[2] =  C2[1];
assign F[3] =  C3[1];
assign F[4] =  C4[1];
assign F[5] =  C5[1];
assign F[6] =  C6[1];
assign F[7] =  C7[1];
assign F[8] =  C8[1];
assign F[9] =  C9[1];


//
assign S = S9;


//control cells (X,P,C0 / F)
cc cc1(X, P[1], C1[1], FI[1]);
cc cc2(X, P[2], C2[1], FI[2]);
cc cc3(X, P[3], C3[1], FI[3]);
cc cc4(X, P[4], C4[1], FI[4]);
cc cc5(X, P[5], C5[1], FI[5]);
cc cc6(X, P[6], C6[1], FI[6]);
cc cc7(X, P[7], C7[1], FI[7]);
cc cc8(X, P[8], C8[1], FI[8]);
cc cc9(X, P[9], C9[1], FI[9]);


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
ac ac51(.A(S4[1]), .B(1'b0),.C(1'b0),.X(X),.F(FI[5]), .C1(C5[2]), .S(S5[1]), .D(D5[1]), .E(E5[1]),.C0(C5[1]));
ac ac52(.A(S4[2]), .B(D4[1]), .C(E4[1]), .X(X),.F(FI[5]), .C1(C5[3]), .S(S5[2]), .D(D5[2]), .E(E5[2]),.C0(C5[2]));
ac ac53(.A(S4[3]), .B(D4[2]), .C(E4[2]), .X(X),.F(FI[5]), .C1(C5[4]), .S(S5[3]), .D(D5[3]), .E(E5[3]),.C0(C5[3]));
ac ac54(.A(S4[4]), .B(D4[3]), .C(E4[3]), .X(X),.F(FI[5]), .C1(C5[5]), .S(S5[4]), .D(D5[4]), .E(E5[4]),.C0(C5[4]));
ac ac55(.A(S4[5]), .B(D4[4]), .C(E4[4]), .X(X),.F(FI[5]), .C1(C5[6]), .S(S5[5]), .D(D5[5]), .E(E5[5]),.C0(C5[5]));
ac ac56(.A(S4[6]), .B(D4[5]), .C(E4[5]), .X(X),.F(FI[5]), .C1(C5[7]), .S(S5[6]), .D(D5[6]), .E(E5[6]),.C0(C5[6]));
ac ac57(.A(S4[7]), .B(D4[6]), .C(E4[6]), .X(X),.F(FI[5]), .C1(C5[8]), .S(S5[7]), .D(D5[7]), .E(E5[7]),.C0(C5[7]));
ac ac58(.A(S4[8]), .B(D4[7]), .C(E4[7]), .X(X),.F(FI[5]), .C1(C5[9]), .S(S5[8]), .D(D5[8]), .E(E5[8]),.C0(C5[8]));
ac ac59(.A(S4[9]), .B(D4[8]), .C(E4[8]), .X(X),.F(FI[5]), .C1(C5[10]),.S(S5[9]), .D(D5[9]), .E(E5[9]),.C0(C5[9]));
ac ac5a(.A(A[9]), .B(D4[9]), .C(E4[9]), .X(X),.F(FI[5]),.C1(C5[11]),.S(S5[10]), .D(D5[10]), .E(E5[10]),.C0(C5[10]));
ac ac5b(.A(A[10]), .B(B[7]),.C(C[7]),.X(X),.F(FI[5]), .C1(X),.S(S5[11]), .D(D5[11]), .E(E5[11]),.C0(C5[11]));

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
ac ac71(.A(S6[1]), .B(1'b0),.C(1'b0),.X(X),.F(FI[7]), .C1(C7[2]), .S(S7[1]), .D(), .E(),.C0(C7[1]));
ac ac72(.A(S6[2]), .B(D6[1]), .C(E6[1]), .X(X),.F(FI[7]), .C1(C7[3]), .S(S7[2]), .D(), .E(),.C0(C7[2]));
ac ac73(.A(S6[3]), .B(D6[2]), .C(E6[2]), .X(X),.F(FI[7]), .C1(C7[4]), .S(S7[3]), .D(), .E(),.C0(C7[3]));
ac ac74(.A(S6[4]), .B(D6[3]), .C(E6[3]), .X(X),.F(FI[7]), .C1(C7[5]), .S(S7[4]), .D(), .E(),.C0(C7[4]));
ac ac75(.A(S6[5]), .B(D6[4]), .C(E6[4]), .X(X),.F(FI[7]), .C1(C7[6]), .S(S7[5]), .D(), .E(),.C0(C7[5]));
ac ac76(.A(S6[6]), .B(D6[5]), .C(E6[5]), .X(X),.F(FI[7]), .C1(C7[7]), .S(S7[6]), .D(), .E(),.C0(C7[6]));                                    
ac ac77(.A(S6[7]), .B(D6[6]), .C(E6[6]), .X(X),.F(FI[7]), .C1(C7[8]), .S(S7[7]), .D(), .E(),.C0(C7[7]));                                    
ac ac78(.A(S6[8]), .B(D6[7]), .C(E6[7]), .X(X), .F(FI[7]), .C1(C7[9]), .S(S7[8]), .D(),.E(),.C0(C7[8]));                                    
ac ac79(.A(S6[9]), .B(D6[8]), .C(E6[8]), .X(X), .F(FI[7]), .C1(C7[10]),.S(S7[9]), .D(),.E(),.C0(C7[9]));
ac ac7a(.A(S6[10]), .B(D6[9]), .C(E6[9]), .X(X),.F(FI[7]), .C1(C7[11]),.S(S7[10]), .D(),.E(),.C0(C7[10]));                                     
ac ac7b(.A(S6[11]), .B(D6[10]), .C(E6[10]),  .X(X), .F(FI[7]), .C1(C7[12]),.S(S7[11]), .D(),    .E(),.C0(C7[11]));                                     
ac ac7c(.A(S6[12]), .B(D6[11]), .C(E6[11]),  .X(X),.F(FI[7]), .C1(C7[13]),.S(S7[12]), .D(),    .E(),.C0(C7[12]));                                     
ac ac7d(.A(S6[13]), .B(D6[12]), .C(E6[12]),  .X(X),.F(FI[7]), .C1(C7[14]),.S(S7[13]), .D(),    .E(),.C0(C7[13]));
ac ac7e(.A(A[13]), .B(D6[13]), .C(E6[13]),    .X(X),.F(FI[7]), .C1(C7[15]),.S(S7[14]), .D(),    .E(),.C0(C7[14]));
ac ac7f(.A(A[14]), .B(B[9]),  .C(C[9]),       .X(X),.F(FI[7]), .C1(X),		.S(S7[15]),	.D() , 	.E(),.C0(C7[15]));

// arithmetic cells of row 8(A,B,C,X,F,C1/S,D,E,C0)
ac ac81(.A(S7[1]),.B(1'b0),.C(1'b0),.X(X),.F(FI[8]),.C1(C8[2]),.S(S8[1]),.D(D8[1]),.E(E8[1]),.C0(C8[1]));
ac ac82(.A(S7[2]),.B(D7[1]),.C(E7[1]),.X(X),.F(FI[8]),.C1(C8[3]),.S(S8[2]),.D(D8[2]),.E(E8[2]),.C0(C8[2]));
ac ac83(.A(S7[3]),.B(D7[2]),.C(E7[2]),.X(X),.F(FI[8]),.C1(C8[4]),.S(S8[3]),.D(D8[3]),.E(E8[3]),.C0(C8[3]));
ac ac84(.A(S7[4]),.B(D7[3]),.C(E7[3]),.X(X),.F(FI[8]),.C1(C8[5]),.S(S8[4]),.D(D8[4]),.E(E8[4]),.C0(C8[4]));
ac ac85(.A(S7[5]),.B(D7[4]),.C(E7[4]),.X(X),.F(FI[8]),.C1(C8[6]),.S(S8[5]),.D(D8[5]),.E(E8[5]),.C0(C8[5]));
ac ac86(.A(S7[6]),.B(D7[5]),.C(E7[5]),.X(X),.F(FI[8]),.C1(C8[7]),.S(S8[6]),.D(D8[6]),.E(E8[6]),.C0(C8[6]));
ac ac87(.A(S7[7]),.B(D7[6]),.C(E7[6]),.X(X),.F(FI[8]),.C1(C8[8]),.S(S8[7]),.D(D8[7]),.E(E8[7]),.C0(C8[7]));
ac ac88(.A(S7[8]),.B(D7[7]),.C(E7[7]),.X(X),.F(FI[8]),.C1(C8[9]),.S(S8[8]),.D(D8[8]),.E(E8[8]),.C0(C8[8]));
ac ac89(.A(S7[9]),.B(D7[8]),.C(E7[8]),.X(X),.F(FI[8]),.C1(C8[10]),.S(S8[9]),.D(D8[9]),.E(E8[9]),.C0(C8[9]));
ac ac8a(.A(S7[10]),.B(D7[9]),.C(E7[9]),.X(X),.F(FI[8]),.C1(C8[11]),.S(S8[10]),.D(D8[10]),.E(E8[10]),.C0(C8[10]));
ac ac8b(.A(S7[11]),.B(D7[10]),.C(E7[10]),.X(X),.F(FI[8]),.C1(C8[12]),.S(S8[11]),.D(D8[11]),.E(E8[11]),.C0(C8[11]));
ac ac8c(.A(S7[12]),.B(D7[11]),.C(E7[11]),.X(X),.F(FI[8]),.C1(C8[13]),.S(S8[12]),.D(D8[12]),.E(E8[12]),.C0(C8[12]));
ac ac8d(.A(S7[13]),.B(D7[12]),.C(E7[12]),.X(X),.F(FI[8]),.C1(C8[14]),.S(S8[13]),.D(D8[13]),.E(E8[13]),.C0(C8[13]));
ac ac8e(.A(S7[14]),.B(D7[13]),.C(E7[13]),.X(X),.F(FI[8]),.C1(C8[15]),.S(S8[14]),.D(D8[14]),.E(E8[14]),.C0(C8[14]));
ac ac8f(.A(S7[15]),.B(D7[14]),.C(E7[14]),.X(X),.F(FI[8]),.C1(C8[16]),.S(S8[15]),.D(D8[15]),.E(E8[15]),.C0(C8[15]));
ac ac810(.A(A[16]),.B(D7[15]),.C(E7[15]),.X(X),.F(FI[8]),.C1(C8[17]),.S(S8[16]),.D(D8[16]),.E(E8[16]),.C0(C8[16]));
ac ac811(.A(A[17]),.B(B[10]),.C(C[10]),.X(X),.F(FI[8]),.C1(X),.S(S8[17]),.D(D8[17]),.E(E8[17]),.C0(C8[17]));
 
// arithmetic cells of row 9(A,B,C,X,F,C1/S,D,E,C0)
ac ac91(.A(S8[1]),.B(1'b0),.C(1'b0),.X(X),.F(FI[9]),.C1(C9[2]),.S(S9[1]),.D(),.E(),.C0(C9[1]));
ac ac92(.A(S8[2]),.B(D8[1]),.C(E8[1]),.X(X),.F(FI[9]),.C1(C9[3]),.S(S9[2]),.D(),.E(),.C0(C9[2]));
ac ac93(.A(S8[3]),.B(D8[2]),.C(E8[2]),.X(X),.F(FI[9]),.C1(C9[4]),.S(S9[3]),.D(),.E(),.C0(C9[3]));
ac ac94(.A(S8[4]),.B(D8[3]),.C(E8[3]),.X(X),.F(FI[9]),.C1(C9[5]),.S(S9[4]),.D(),.E(),.C0(C9[4]));
ac ac95(.A(S8[5]),.B(D8[4]),.C(E8[4]),.X(X),.F(FI[9]),.C1(C9[6]),.S(S9[5]),.D(),.E(),.C0(C9[5]));
ac ac96(.A(S8[6]),.B(D8[5]),.C(E8[5]),.X(X),.F(FI[9]),.C1(C9[7]),.S(S9[6]),.D(),.E(),.C0(C9[6]));
ac ac97(.A(S8[7]),.B(D8[6]),.C(E8[6]),.X(X),.F(FI[9]),.C1(C9[8]),.S(S9[7]),.D(),.E(),.C0(C9[7]));
ac ac98(.A(S8[8]),.B(D8[7]),.C(E8[7]),.X(X),.F(FI[9]),.C1(C9[9]),.S(S9[8]),.D(),.E(),.C0(C9[8]));
ac ac99(.A(S8[9]),.B(D8[8]),.C(E8[8]),.X(X),.F(FI[9]),.C1(C9[10]),.S(S9[9]),.D(),.E(),.C0(C9[9]));
ac ac9a(.A(S8[10]),.B(D8[9]),.C(E8[9]),.X(X),.F(FI[9]),.C1(C9[11]),.S(S9[10]),.D(),.E(),.C0(C9[10]));
ac ac9b(.A(S8[11]),.B(D8[10]),.C(E8[10]),.X(X),.F(FI[9]),.C1(C9[12]),.S(S9[11]),.D(),.E(),.C0(C9[11]));
ac ac9c(.A(S8[12]),.B(D8[11]),.C(E8[11]),.X(X),.F(FI[9]),.C1(C9[13]),.S(S9[12]),.D(),.E(),.C0(C9[12]));
ac ac9d(.A(S8[13]),.B(D8[12]),.C(E8[12]),.X(X),.F(FI[9]),.C1(C9[14]),.S(S9[13]),.D(),.E(),.C0(C9[13]));
ac ac9e(.A(S8[14]),.B(D8[13]),.C(E8[13]),.X(X),.F(FI[9]),.C1(C9[15]),.S(S9[14]),.D(),.E(),.C0(C9[14]));
ac ac9f(.A(S8[15]),.B(D8[14]),.C(E8[14]),.X(X),.F(FI[9]),.C1(C9[16]),.S(S9[15]),.D(),.E(),.C0(C9[15]));
ac ac910(.A(S8[16]),.B(D8[15]),.C(E8[15]),.X(X),.F(FI[9]),.C1(C9[17]),.S(S9[16]),.D(),.E(),.C0(C9[16]));
ac ac911(.A(S8[17]),.B(D8[16]),.C(E8[16]),.X(X),.F(FI[9]),.C1(C9[18]),.S(S9[17]),.D(),.E(),.C0(C9[17]));
ac ac912(.A(A[17]),.B(D8[17]),.C(E8[17]),.X(X),.F(FI[9]),.C1(C9[19]),.S(S9[18]),.D(),.E(),.C0(C9[18]));
ac ac913(.A(A[18]),.B(B[19]),.C(C[19]),.X(X),.F(FI[9]),.C1(X),.S(S9[19]),.D(),.E(),.C0(C9[19]));
endmodule
