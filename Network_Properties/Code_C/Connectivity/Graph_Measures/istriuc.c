#include "istriuc.h"

bool istriuc(double * matrix, int n)
{
    int i, j;
    bool istu;
    
    i = 0;
    istu = true;
    
    while (istu && i < n)
    {
        j = i + 1;
        while (istu &&  j < n)
        {
            if(IsNonZero(matrix[n * i + j]))
                istu = false;
             j ++;
        }
        i ++;
    }
    
    return istu;
}
