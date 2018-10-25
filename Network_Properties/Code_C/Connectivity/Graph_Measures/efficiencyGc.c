//Function: degreec (Degree: Number of links connected to a node)
//Description: Calcula el grado de cada vertice de un grafo (matriz de
//             adyacencia).
//Comments: Para grafos dirigidos y no dirigidos,               
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical, logical)
//  Out:
//      deg: n x 2 (directed) or n x 1 (undirected)

#include "efficiencyGc.h"

double efficiencyGc(double * matrix, int n, bool d)
{
    int i, j;
    double sum;
    double effg;
    
    sum = 0;
    if (d) //directed
    {
        for(i = 0; i < n * n; i++)
            if(IsNonZero(matrix[i]))
                sum = sum + (double)1 / matrix[i];
    }
    else //undirected
    {
        for(i = 0; i < n; i++)
            for(j = i + 1; j < n; j++)
                if(IsNonZero(matrix[n * i + j]))
                    sum = sum + (double)1 / matrix[n * i + j];
        sum = 2 * sum;
    }
    
    effg = sum / (pow(n, 2) - (double)n);
    
    return effg;
}