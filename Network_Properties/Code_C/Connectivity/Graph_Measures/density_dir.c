//Function: density_dir (Average connection density)
//Description: Calcula la densidad de un grafo dirigido representado por 
//             una matriz de adyacencia (matriz cuadrada).
//             La densidad de un grafo dirigido es el numero de aristas o 
//             conexiones que tiene dividido entre el total de conexiones
//             que puede tener (n^2 - n). 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical). Can be sparse matrix.
//  Out:
//      den: (Data type: double)

#include "mex.h"
#include "isdiagzeroc.c"
#include "densityc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int n;
    double den;
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
    
    //Algorithm...    
    
    //Case: sparse matrix
    if(mxIsSparse(prhs[0]))
        /* NOTE: nnz is the actual number of nonzeros and is stored as the
        last element of the jc array where the size of the jc array is the
        number of columns + 1 */
        den = (double)mxGetJc(prhs[0])[mxGetN(prhs[0])] / (double)(n * n - n);
    
    else //Case: matrix
        den = densityc(ma, n, 1);
    
    // out...   
    plhs[0] = mxCreateDoubleScalar(den); 
}