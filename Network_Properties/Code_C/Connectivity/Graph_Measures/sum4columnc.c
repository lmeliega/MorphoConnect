#include "sum4columnc.h"

void sum4columnc(double * vector_sum, double * matrix, int r, int c)
{
    int i, j;
    double sum;
    
    for (i = 0; i < c; i++)
    {
        sum = 0;
        for (j = 0; j < r; j++)
            sum = sum + matrix[r * i + j];
        vector_sum[i] = sum;
    }
}