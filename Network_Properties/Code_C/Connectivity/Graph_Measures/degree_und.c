//Function: degreee_und (Grado de cada vertice de un grafo no dirigido)
//Description: Calcula el grado de cada vertice de un grafo no dirigido
//             representado por una matriz de adyacencia (matriz cuadrada).
//             El grado de un vertice es la suma de todas las conexiones 
//             que tiene. 
//             La matriz tiene que ser simetrica, triagular superior o
//             triangular inferior. 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical)
//  Out:
//      vector_degree: (Data type: double)

#include "mex.h"
#include "isdiagzeroc.c"
#include "issimetricc.c"
#include "degreec.c"
//#include "density_und_sp.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int n;
    double * deg;
    double * ma;
    
    //Chequed parameters...
    
    // number parameters input & output.
    if (nrhs != 1)
        mexErrMsgTxt("This function require exactly 1 arguments");

    if (nlhs > 1) 
        mexErrMsgTxt("Too many output arguments");
    
    // data type
    if (!(mxIsNumeric(prhs[0])))
        mexErrMsgTxt("Invalid data type (Only numerics)");
    
    // dimention matrix.
    if (mxGetNumberOfDimensions(prhs[0]) != 2)
        mexErrMsgTxt("Input argument must be two dimensional\n");
    
    n = mxGetN(prhs[0]); //columns
    
    if(mxGetM(prhs[0]) != n)
        mexErrMsgTxt("The matrix must be a square");
    
    // diagonal with zeros (not autoconnections)
    ma = mxGetPr(prhs[0]); 
    if (!isdiagzeroc(ma, n))
         mexErrMsgTxt("Not allow autoconnections");
    
    // consistency (simetric mtrix)
    ma = mxGetPr(prhs[0]); 
    if (!issimetricc(ma, n))
         mexErrMsgTxt("Matrix must be simetric");    
    
    //Algorithm...
     
    //Case: sparse matrix
    if(mxIsSparse(prhs[0]))
        //degree_und_sp(den, ma);
         mexErrMsgTxt("The matrix must not be sparse");
    
    else //Case: matrix
    {
        ma = mxGetPr(prhs[0]);
        
        // out...
        plhs[0] = mxCreateDoubleMatrix(n, 1, mxREAL); 
        deg = mxGetPr(plhs[0]);
        
        degreec(deg, ma, n, 0);    
            
        
    }
}