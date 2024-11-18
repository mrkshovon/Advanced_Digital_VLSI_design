module p_7_rows_tb;

	// Inputs
	reg X;
	reg [1:7] P;
	reg [1:9] B;
	reg [1:9] C;
	reg [1:14] A;

	// Outputs
	wire [1:7] F;
	wire [1:15] S;

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
	X = 0;	P = 0;	B = 0;	C = 0;	A = 0;	#200;
     // Multiplication 7*5, P=5 (Right justified), B=7 (Left justified)
	X = 0;P=7'b0000101;A=0;B=9'b111000000;C=9'b111000000; #200;
      
	// Squaring 5^2, P =5 (Right justified), B= first two bits 0's and all others 1, C= first bit 0, second bit 1, all others 0, A=0
	X = 0;P=7'b0000101;A=0;B=9'b001111111;C=9'b010000000; #200;
		
	// Square Root of 25, P=0, B= first two bits 0's and all others 1, C= first bit 0, second bit 1, all others 0, Input in A (as right justified)
	X = 1; P=7'b0000000; A=14'b00000000011001; B=9'b001111111; C=9'b010000000; #200;
		
	// Division 35/5; A = 35 (left justified, B=C=5, P=0
	X = 1;	P=7'b0000000; A=14'b11000100000000; B=9'b101000000; C=9'b101000000; #200;
	end 
endmodule
