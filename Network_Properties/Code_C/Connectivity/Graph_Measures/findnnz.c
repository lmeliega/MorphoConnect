#include "mex.h"
#include "findnnzc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int m, n, i, nelems, contz;
    double  * matrix, * indnnz, * nnz;

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
    
    //Algorithm...
    
    // out ...
    contz = 0;
    nelems = mxGetNumberOfElements(prhs[0]);
    matrix = mxGetPr(prhs[0]);
    for(i = 0; i < nelems; i++)
         if(IsNonZero(matrix[i]))
             contz++;    
    
    plhs[0] = mxCreateDoubleMatrix(contz, 1, mxREAL); 
    indnnz = mxGetPr(plhs[0]);
    
    if(nlhs == 2)
    {
        plhs[1] = mxCreateDoubleMatrix(contz, 1, mxREAL);
        nnz = mxGetPr(plhs[1]);
    }
    else
        nnz = 0; 
    
    m = mxGetM(prhs[0]); //rows
    n = mxGetN(prhs[0]); //columns
     
    matrix = mxGetPr(prhs[0]);
    findnnzc(indnnz, nnz, matrix, m, n);
}