//Function: isdiagzero
//Description: Verifica si todos los elementos de la diagonal de una 
//             matriz 2D y numerica son cero o no. 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical)
//  Out:
//      isdz: (Data type: logical)

#include "mex.h"
#include "ind2subindc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    double * m, *n;
    int nelems;
    double * indexs;
    double * r;
    double * c;
    
    //Chequed parameters...
    
    // number parameters input & output.
    if (nrhs != 3)
        mexErrMsgTxt("This function require exactly 3 arguments");

    if (nlhs > 2) 
        mexErrMsgTxt("Too many output arguments");
    
    // data type
    if (!(mxIsNumeric(prhs[0])) || !(mxIsNumeric(prhs[1])) || !(mxIsNumeric(prhs[2])))
        mexErrMsgTxt("Invalid data type (Only numerics)");
    
    // dimention matrix.
    if (mxGetNumberOfDimensions(prhs[0]) != 2)
        mexErrMsgTxt("Input argument must be two dimensional\n");
    
    //Algorithm...    
    m = mxGetPr(prhs[0]); //rows
    n = mxGetPr(prhs[1]); //columns
    
    nelems = mxGetNumberOfElements(prhs[2]);
    indexs = mxGetPr(prhs[2]);
      
    // out...  
    plhs[0] = mxCreateDoubleMatrix(nelems, 1, mxREAL); 
    plhs[1] = mxCreateDoubleMatrix(nelems, 1, mxREAL);
    
    r = mxGetPr(plhs[0]);
    c = mxGetPr(plhs[1]);
       
    ind2subindc(r, c, m[0], n[0], indexs, nelems);
}