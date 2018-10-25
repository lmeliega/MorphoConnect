//Function: degreec (Degree: Number of links connected to a node)
//Description: Calcula el grado de cada vertice de un grafo (matriz de
//             adyacencia).
//Comments: Para grafos dirigidos y no dirigidos,               
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical, logical)
//  Out:
//      deg: n x 2 (directed) or n x 1 (undirected)

#include "degreec.h"

void degreec(double * deg, double * matrix, int n, bool d)
{
    int i, j;     
    
    if (d) //directed
    {
        for(i = 0; i < n; i++)
            for(j = 0; j < n; j++)
                if(IsNonZero(matrix[n * i + j]))
                {
                    deg[n + j]++; //out
                    deg[i]++; //in
                }
    }
    else //undirected
    {
        for(i = 0; i < n; i++)
            for(j = i + 1; j < n; j++)
                if(IsNonZero(matrix[n * i + j]))
                {
                    deg[j]++;
                    deg[i]++;
                }
    }
}