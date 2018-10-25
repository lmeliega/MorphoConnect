#include "istrilc.h"

bool istrilc(double * matrix, int n)
{
    int i, j;
    bool istl;
    
    i = 1;
    istl = true;
    
    while (istl && i < n)
    {
        j = 0;
        while (istl &&  j < i)
        {
            if(IsNonZero(matrix[n * i + j]))
                istl = false;
             j ++;
        }
        i ++;
    }
    
    return istl;
}