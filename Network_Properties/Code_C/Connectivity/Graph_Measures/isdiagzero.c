//Function: isdiagzero
//Description: Verifica si todos los elementos de la diagonal de una 
//             matriz 2D y numerica son cero o no. 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical)
//  Out:
//      isdz: (Data type: logical)

#include "mex.h"
#include "isdiagzeroc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int n;
    bool isdz;
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
    
    n  = mxGetN(prhs[0]); //columns
    
    if(mxGetM(prhs[0]) != n)
        mexErrMsgTxt("The matrix must be a square");    
    
    //Algorithm...    
    ma = mxGetPr(prhs[0]);
    isdz = isdiagzeroc(ma, n);
  
    // out...   
    plhs[0] = mxCreateLogicalScalar(isdz); 
}