#include "question1.h"

int main(int argc, const char *argv[])
{
    // Create the Vectors
    int A[M_SIZE];
    int B[M_SIZE];
    int C, i;

    // Populate the Arrays
    for (i = 0; i < M_SIZE; i++){
        A[i] = i*M_SIZE;
        B[i] = i*M_SIZE;
    }
    // Calculate C
    for (i = 0; i < M_SIZE; i++) {
        C += A[i] + B[i];
    }

    // Print C
    printf("%d\n", C);
    exit(EXIT_SUCCESS);
}
