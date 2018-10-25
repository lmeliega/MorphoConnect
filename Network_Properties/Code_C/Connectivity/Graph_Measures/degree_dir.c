//Function: density_dir (Average connection density)
//Description: Calcula la densidad de una matriz cuadrada vista como un 
//             grafo. 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical, logical)
//  Out:
//      den: (Data type: double)

#include "mex.h"
#include "isdiagzeroc.c"
#include "degreec.c"
//#include "density_dir_sp.c"

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

    if (nlhs > 2) 
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
        //degree_dir_sp(den, ma);
        mexErrMsgTxt("The matrix must not be sparse");
    
    else //Case: matrix
    {
        ma = mxGetPr(prhs[0]);
        
        // out...
        plhs[0] = mxCreateDoubleMatrix(n, 2, mxREAL); 
        deg = mxGetPr(plhs[0]);
        
        degreec(deg, ma, n, 1);        
    }
}