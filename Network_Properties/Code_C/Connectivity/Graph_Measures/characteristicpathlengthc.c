#include "characteristicpathlengthc.h"

double characteristicpathlengthc(double * matrix, int n, bool d)
{
    int i, j;
    double sum;
    double l;
    
    sum = 0;
    if (d) //directed
    {
        for(i = 0; i < n * n; i++)
            if(IsNonZero(matrix[i]))
                sum = sum + matrix[i];
    }
    else //undirected
    {
        for(i = 0; i < n; i++)
            for(j = i + 1; j < n; j++)
                if(IsNonZero(matrix[n * i + j]))
                    sum = sum + matrix[n * i + j];
        sum = 2 * sum;
    }
    
    l = sum / (pow(n, 2) - (double)n);
    
    return l;
}