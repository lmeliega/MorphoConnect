//Floyd's algorithm. 

//Todos con todos, considerando k vertices. Si k = n, entonces Floyd 
//original.

#include "distanceFloydc.h"

void distanceFloydc(double * dist, double * matrix, int n, int * vertices, int v, double inf, bool d)
{
    int i, j, k;
    double dist_aux;
    
    //Not connection: inf
    for(i = 0; i < n * n; i++)
        if(IsNonZero(matrix[i]))
            dist[i] = matrix[i];
        else
            dist[i] = inf;    

    j = 0;
    for (i = 0; i < n; i++)
    {
        dist[n * i + j] = 0;
        j++;
     }
    
    dist_aux= 0;
    if(d)
    {
        for (k = 0; k < v; k++) //vertices
            for (i = 0; i < n; i++) //column
                for (j = 0; j < n; j++) //row
                {
                    dist_aux = dist[n * i + vertices[k]] + dist[n * vertices[k] + j];
                    if (dist_aux < dist[n * i + j])
                        dist[n * i + j] = dist_aux;
                }
    }
    else //undirected
    {
        for (k = 0; k < v; k++) //vertices
            for (i = 0; i < n; i++) //row
                for (j = i + 1; j < n; j++) //column
                {
                    dist_aux = dist[n * i + vertices[k]] + dist[n * vertices[k] + j];
                    if (dist_aux < dist[n * i + j])
                    {
                        dist[n * i + j] = dist_aux;
                        dist[n * j + i] = dist_aux;
                    }
                }         
    }
    
    //Not connection: inf
    for(i = 0; i < n * n; i++)
        if(dist[i] == inf)
            dist[i] = 0;    
}