/* Description del algoritmo:
 *
 */

#include "alg_m2D_sum4row.h"

void sum4row(double * vector_sum, double * matrix, int r, int c)
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