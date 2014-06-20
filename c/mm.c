#include "mm.h"

int main(int argc, const char *argv[])
{
    // Create the Arrays
    int **A;
    int **B;
    int **C;
    int i, j, k, sum;

    int *A_DATA = allocate_mem(&A, M_SIZE);
    int *B_DATA = allocate_mem(&B, M_SIZE);
    int *C_DATA = allocate_mem(&C, M_SIZE);

    if(!A || !B || !C){
        fprintf(stderr, "Arrays Not Allocated");
        exit(EXIT_FAILURE);
    }

    // Populate the Arrays

    for (i = 0; i < M_SIZE; i++){
        for (j = 0; j < M_SIZE; j++){
            A[i][j] = i*M_SIZE + j;
            B[i][j] = i*M_SIZE + j;
        }
    }
    // Calculate C
    for (i = 0; i < M_SIZE; i++) {
        for (j = 0; j < M_SIZE; j++) {
            sum = 0;
            for (k = 0; k < M_SIZE; k++) {
                sum += A[i][k] + B[k][j];
            }
            C[i][j] = sum;
        }
    }

    // Print C
    for (i = 0; i < M_SIZE; i++){
        for (j = 0; j < M_SIZE; j++){
            printf("%d\t", C[i][j]);
        }
        printf("\n");
    }

    deallocate_mem(&A, A_DATA);
    deallocate_mem(&B, B_DATA);
    deallocate_mem(&C, C_DATA);

    exit(EXIT_SUCCESS);
}

int* allocate_mem(int*** arr, int n) {
    *arr = (int**)malloc(n * sizeof(int*));
    int *arr_data = malloc( n * n * sizeof(int));
    for(int i=0; i<n; i++)
        (*arr)[i] = arr_data + i * n ;
    return arr_data; //free point
}

void deallocate_mem(int*** arr, int* arr_data) {
    free(arr_data);
    free(*arr);
}
