module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B)

  output AandB,
  output nAandB,      // Single bit output, ~(A*B)

  output nAornB,      // Single bit output, (~A)+(~B)

  output AorB,
  output nAorB     // Single bit output, ~(A+B)
);

  wire nA;
  wire nB;
  wire AandB;
  wire AorB;

  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB

  and andgate(AandB, A, B);		// AND gate produces AandB from A and B
  not Cinv(nAandB, AandB);		// End inverter named Cinv produces nAandB

  or orgate(nAornB, nA, nB); 		// OR gate produces nAornB from nA and nB
	
  or orgate(AorB, A, B);		// OR gate produces AorB from A and B	
  not Cinv(nAorB, AorB);		// Cinv produces nAorB by inverting AorB

endmodule
