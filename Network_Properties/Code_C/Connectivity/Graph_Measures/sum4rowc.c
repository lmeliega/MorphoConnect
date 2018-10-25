#include "sum4rowc.h"

void sum4rowc(double * vector_sum, double * matrix, int r, int c)
{
    int i, j;
    double sum;
    
    for (i = 0; i < r; i++)
    {
        sum = 0;
        for (j = 0; j < c; j++)
            sum = sum + matrix[r * j + i];
        vector_sum[i] = sum;
    }
}