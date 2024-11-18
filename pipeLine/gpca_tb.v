module p_5_rows_tb;

	// Inputs
	reg X;
	reg [1:5] P;
	reg [1:7] B;
	reg [1:7] C;
	reg [1:10] A;

	// Outputs
	wire [1:5] F;
	wire [1:11] S;

	// Instantiate the Unit Under Test (UUT)
	gpca uut (
		.X(X), 
		.P(P), 
		.B(B), 
		.C(C), 
		.A(A), 
		.F(F), 
		.S(S)
	);

	initial begin
	// Initialize Inputs
	X = 0;		P = 0;		B = 0;		C = 0;	A = 0;	#200;
	// Multiplication 7*5, P=5 (Right justified), B=7 (Left justified)
	X = 0;P=5'b00101; A=0; B=7'b1110000; C=7'b1110000; #200;
	//X = 0;P=5'b00101; A=0; B=7'b0000111; C=7'b0000111; #200;
      
	// Squaring 5^2, P =5 (Right justified), B= first two bits 0's and all others 1, C= first bit 0, second bit 1, all others 0, A=0
	X = 0;P=5'b00101; A=0; B=7'b0011_111; C=7'b0100_000; #200;
		
	// Square Root of 25, P=0, B= first two bits 0's and all others 1, C= first bit 0, second bit 1, all others 0, Input in A (as right justified)
	// Input is A
	X = 1;	P=5'b0000_0; A=10'b0000_0110_01; B=7'b0011_111; C=7'b0100_000; #200;
		
	// Division 25/5; A = 25 (left justified, B=C=5, P=0)
	X = 1;	P=5'b00000; A=10'b0110_0100_00 ; B=7'b0101_000; C=7'b0101_000; #200;
	//X = 1;	P=5'b00000; A=10'b1100_0100_00; B=7'b1010_000; C=7'b1010_000; #200; // for 35
	end
endmodule
