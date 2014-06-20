module top;

   wire[17:0]A[1:3][1:3];    // the matrices
   wire[17:0]B[1:3][1:3];
   wire[17:0]C[1:3][1:3];

   wire[(9*18)-1:0] Abits;   // bit-decomposed versions of the above
   wire[(9*18)-1:0] Bbits;
   wire[(9*18)-1:0] Cbits;

   genvar i,j;

   // set A and B with initial values
   generate 
      for(i=0; i<3; i=i+1)
         for(j=0; j<3; j=j+1) begin
            assign A[i+1][j+1] = i*3 + j;
            assign B[i+1][j+1] = i*3 + j + 1;
         end
   endgenerate

   // decompose A and B, set C
   generate 
      for(i=1; i<=3; i=i+1)
         for(j=1; j<=3; j=j+1) begin
            assign Abits[(((i-1)*3 + (j-1)) * 18)+17 -:18] = A[i][j];
            assign Bbits[(((i-1)*3 + (j-1)) * 18)+17 -:18] = B[i][j];
            assign C[i][j] = Cbits[(((i-1)*3 + (j-1)) * 18)+17 -:18];
         end
   endgenerate

   initial
      #1 $display("%4d %4d %4d\n%4d %4d %4d\n%4d %4d %4d\n",
                  C[1][1], C[1][2],C[1][3],
                  C[2][1], C[2][2],C[2][3],
                  C[3][1], C[3][2],C[3][3]);

   mmult3x3 U1(Abits, Bbits, Cbits);
endmodule

module mmult3x3
   (input  wire[(9*18)-1:0] AI,
    input  wire[(9*18)-1:0] BI,
    output wire[(9*18)-1:0] CO);

   wire[17:0]A[1:3][1:3];
   wire[17:0]B[1:3][1:3];
   wire[17:0]C[1:3][1:3];

   genvar i,j;

   generate 
      for(i=1; i<=3; i=i+1)
         for(j=1; j<=3; j=j+1) begin
            assign A[i][j] = AI[(((i-1)*3 + (j-1)) * 18)+17 -:18];
            assign B[i][j] = BI[(((i-1)*3 + (j-1)) * 18)+17 -:18];
            assign CO[(((i-1)*3 + (j-1)) * 18)+17 -:18] = C[i][j];
         end
   endgenerate

   generate
      for(i=1; i<=3; i=i+1)
         for(j=1; j<=3; j=j+1)
            assign C[i][j] = A[i][1]*B[1][j] + A[i][2]*B[2][j] + A[i][3]*B[3][j];
   endgenerate
endmodule
