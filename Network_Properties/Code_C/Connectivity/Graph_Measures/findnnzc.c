#include "findnnzc.h"

findnnzc(double * indnnz, double * nnz, double * matrix, int mr, int nc)
{
    int i, cont;
    
    cont = 0;
    for(i = 0; i < mr * nc; i++)
        if(IsNonZero(matrix[i]))
        {
            indnnz[cont] = i + 1;
            if (nnz != 0)
                nnz[cont] = matrix[i];
            cont++;
                
        }
}