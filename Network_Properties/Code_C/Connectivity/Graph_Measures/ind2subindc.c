#include "ind2subindc.h"

void ind2subindc(double * r, double * c, int m, int n, double *indexs, int nelems)
{
    int i;
    double temp;
    
    for(i = 0; i < nelems; i++)
    {
        temp = fmod(indexs[i], m); //rows
        if (temp == 0)
            r[i] = m;
        else
            r[i] = temp;
        
        c[i] = (int)(indexs[i] / n); //columns
        temp = fmod(indexs[i], n);
        if (temp != 0)
            c[i]++;
    }    
}