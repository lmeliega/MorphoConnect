#include "densityc.h"

double densityc(double * matrix, int n, bool d)
{
    int i, nnz;
    double den, e;
    
    nnz = 0;
    for(i = 0; i < n * n; i ++)
        if(IsNonZero(matrix[i]))
            nnz ++;

    e = (double)(n * n - n);
    if(d) //directed
        den = (double)(nnz) / e;
    else //undirected
        den = (double)(nnz) / (double)(e / 2);
    
    return den;
}