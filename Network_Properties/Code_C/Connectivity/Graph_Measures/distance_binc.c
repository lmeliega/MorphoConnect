#include "distance_binc.h"

void distance_binc(double * dist, double * matrix, int n, bool d)
{
    int i, j, k;
    double sum;
    double mind;
    
    //Inicializar matriz de distancias
    for(i = 0; i < n * n; i++)
        if(IsNonZero(matrix[i]))
            dist[i] = matrix[i];
     
    //Calcular distancia geodesica...
    for(i = 0; i < n; i++) // iterar por las filas
    { 
        //Buscar los elementos 0 de la fila y por casa uno...
        if(!d)
            j = i + 1;
        else
            j = 0;   
        mind = 0;
        while (j < n)
        {
            if(!IsNonZero(dist[j * n + i]) && j != i)
            {
                //1. Multiplicar la fila por la columna y quedarse con la 
                //minima distancia diferente de 0
                for(k = 0; k < n; k++)
                {
                    sum = dist[k * n + i] * dist[j * n + k];
                    
                    if(IsNonZero(sum))
                        if (mind == 0)
                            mind = sum;
                         else
                            if(mind > sum)
                                mind = sum;
                }
                //2. Actualizar matriz de distancias
                dist[j * n + i] = mind + 1;
                if (!d)
                    dist[i * n + j] = mind + 1;                    
            }
            j++;
        }        
    }
}
    


    
    
    