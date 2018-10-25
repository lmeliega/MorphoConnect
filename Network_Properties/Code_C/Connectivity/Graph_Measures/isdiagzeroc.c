#include "isdiagzeroc.h"

bool isdiagzeroc(double * matrix, int n)
{
    int i, j;
    bool isdz;
    
    i = 0;
    j = 0;
    isdz = true;
    
    while (isdz && i < n)
    {          
        if(IsNonZero(matrix[n * i + j]))
            isdz = false;
            
        i ++;
        j ++;
    }
    
    return isdz;
}