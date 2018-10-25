//Function: density_dir (Average connection density)
//Description: Calcula la densidad de una matriz cuadrada vista como un 
//             grafo. 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical, logical)
//  Out:
//      den: (Data type: double)

#include "matrix.h"
#include "mex.h"
#include "density_dir_sp.c"
#include "isdiagzero.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int m, n, elems, nnz;
    double den;
    double * ma;
    mxArray * temp[];
    
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
    
    m = mxGetM(prhs[0]); //rows
    n = mxGetN(prhs[0]); //columns
    
    if(m != n)
        mexErrMsgTxt("The matrix must be a square");
    
    // diagonal with zeros (not autoconnections)
    isdiagzero(1, temp, 1, prhs)
    if (!(bool)temp[0])
         mexErrMsgTxt("Not allow autoconnections");
    
    //Algorithm...
    
    ma = mxGetPr(prhs[0]);
     
    //Case: sparse matrix
    if(mxIsSparse(prhs[0]))
        shorestpath_und_sp(den, ma);
    
    else //Case: matrix
    {
        elems = m * n;
    
        for(i = 0; i < elems; i ++)
            if(IsNonZero(ma(i)))
                nnz ++;
	
        den = nnz / (elems * elems - elems);
    }
    
    //Out...
   
    plhs[0] = mxCreateDoubleScalar(den); 
}