#include "issimetricc.h"

bool issimetricc(double * matrix, int n)
{
    int i, j;
    bool iss;
    
    i = 0;
    iss = true;
    
    while (iss && i < n)
    {
        j = i + 1;
        while (iss && j < n)
        {
            if (matrix[n * i + j] != matrix [n * j + i])
                iss = false;
            j++;
        }
        i++;
    }
    
    return iss;
}