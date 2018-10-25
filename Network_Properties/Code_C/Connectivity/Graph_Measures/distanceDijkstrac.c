//Dijkstra's algorithm. 

#include "distanceDijkstrac.h"

void distanceDijkstrac(double * dist, int * path, double * matrix, int n, int v, bool d)
{
    int i, w, v; 
    
    //Poner en infinito las no conexiones.
    for(i = 0; i < n * n; i++)
        if(!IsNonZero(matrix[i]))
            matrix[i] = inf;
    
    //Inicializar vector de distancias
    for(i = 0; i < n; i++)
        dist[i * n + v] = matrix[ i * n + v];
    
    if(d) //directed
    {
        
    }
    else //undirected
    {
        
    }
    S.Agregar(1); # tomando el nodo 1 como nodo origen
Para i ¬2 hasta N hacer
D[i] ¬ C[1][i]; # asignando valores iniciales a D
Fpara
Para i ¬ 1 hasta N-1 hacer
w ¬ nodo en V-S tal que D[w] sea un mínimo
S.Agregar(w);
Para cada nodo v Î V-S hacer
15
D[v] ¬ min (D[v], D[w]+C[w,v]);
Fpara
P[v] ¬ w;
Fpara
    Inicializar S = { 1 }
Para las i entre 2 y n hacer: 
Asignar C[1,i] a D[i] o infinito si no existe un arco [1, i]
Para i de 1 a n-1 hacer: 
-Elige un vértice w en V – S tal que D[w]
 sea el mínimo de todos los D[i]
    -Agrega w a S
    -Para cada vértice v adyacente a w en V-S
     hacer: 
      		If D[w] + C[w,v] < D[v] entonces
                           D[v] = D[w] + C[w,v]					  P[v]  = w ( Actualizar P[i] )

    double dist_aux;
    
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
}