#include <stdio.h>
#include <stdlib.h>

#define M_SIZE 3

int* allocate_mem(int*** arr, int n);
void deallocate_mem(int*** arr, int* arr_data);
