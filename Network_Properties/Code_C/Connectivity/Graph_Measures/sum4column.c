//Function: sum4column
//Description: Suma por columnas una matriz bidimensional.
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical)
//  Out:
//     vector_sumc: (Data type: numerical)

#include "mex.h"
#include "sum4columnc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int m, n;
    double * ma;
    double * vsc;
    
    //Chequed parameters...
    
    // number parameters input & output.
    if (nrhs != 1)
        mexErrMsgTxt("This function require exactly 1 arguments");

    if (nlhs > 1) 
        mexErrMsgTxt("Too many output arguments");
    
    // data type
    if (!(mxIsNumeric(prhs[0])))
        mexErrMsgTxt("Invalid data type (Only numerics)");
    
    //Algorithm...
    m = mxGetM(prhs[0]); //rows
    n  = mxGetN(prhs[0]); //columns
    ma = mxGetPr(prhs[0]);

    // out...
    plhs[0] = mxCreateDoubleMatrix(1, n, mxREAL); 
    vsc = mxGetPr(plhs[0]);
    
    sum4columnc(vsc, ma, m, n);    
}