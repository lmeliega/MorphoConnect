//Function: 
//Description: 
//            
//Parameters:
//  In:
//      
//  Out:
//      

#include "mex.h"
#include "isdiagzeroc.c"
#include "distance_binc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int n;
    double * ma;
    double * dist;
    
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
        //degree_dir_sp(den, ma);
        mexErrMsgTxt("The matrix must not be sparse");
    
    else //Case: matrix
    {
        ma = mxGetPr(prhs[0]);
        
        // out...
        plhs[0] = mxCreateDoubleMatrix(n, n, mxREAL); 
        dist = mxGetPr(plhs[0]);
        
        distance_binc(dist, ma, n, 1);
    }
}