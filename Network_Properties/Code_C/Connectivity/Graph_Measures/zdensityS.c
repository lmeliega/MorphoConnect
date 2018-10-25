#include "matrix.h"
#include "mex.h"
//#include "fulltosparse.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int m, n, ac;
    double den;
    double * sm;
    mxArray * temp;
    
    
    //Chequed parameters...
    
    // number parameters input & output.
    if (nrhs != 1)
        mexErrMsgTxt("This function require exactly 1 arguments");

    if (nlhs > 1) 
        mexErrMsgTxt("Too many output arguments");
    
    // dimention matrix
    m  = mxGetM(prhs[0]); //rows
    n  = mxGetN(prhs[0]); // columns
    
    if(m != n)
        mexErrMsgTxt("The matrix must be a square");
    
    // sparse matrix
    if (!mxIsSparse(prhs[0]))
    {
        //fulltosparse(1, plhs, 1, prhs);
        sm = (double*)plhs[0];
        //mexErrMsgTxt("Matrix is not sparse");
    }
    else
        sm = prhs[0];
    
    //Verificar que [i, j] = 0;!!!!!!!!!
   
    //Density...
    
    // all connections (directed graph)
/*
    ac = m * m - m;
    nnz = *(mxGetJc(sm) + n);
*/
    ac = m * m - m;
    /* NOTE: nnz is the actual number of nonzeros and is stored as the
       last element of the jc array where the size of the jc array is the
       number of columns + 1 */
    den = (double)mxGetJc(sm)[mxGetN(sm)] / (double)ac;
   
    plhs[0] = mxCreateDoubleScalar(den);  
   
    plhs[1] = mxCreateDoubleScalar(mxGetJc(sm)[mxGetN(sm)]);
    plhs[2] = mxCreateDoubleScalar(ac);  
    plhs[3] = mxCreateDoubleScalar(m);  
    plhs[4] = mxCreateDoubleScalar(n); 
}
       
/*
    // topology matrix of the graph (sparse matrices representation)
    double * matrix, * matrix_sum;
    // the dimensions dim(n, p).
    int n, p;
    
    // To check input & output.
    if (nrhs != 1)
        mexErrMsgTxt("This program require exactly 1 arguments");
    if (nlhs > 1) 
        mexErrMsgTxt("Too many output arguments");
    
    // 1st argument is the matrix to sum.
    n = mxGetM(prhs[0]);
    p = mxGetN(prhs[0]);
    if ((mxGetNumberOfDimensions(prhs[0]) != 2) ||
        (mxGetClassID(prhs[0]) != mxDOUBLE_CLASS))
        mexErrMsgTxt("The first argument must be a square matrix \n(use double precision)");
    matrix = mxGetPr(prhs[0]);
    
    // RETURN MATRICES
    plhs[0] = mxCreateDoubleMatrix(n, p, mxREAL);
    matrix_sum = mxGetPr(plhs[0]);
    
    sum4column(matrix_sum, matrix, n, p);
}

void sum4column(double * matrix_sum, double * matrix, int n, int p)
{
    int i, j;
    
    for (i = 0; i < n; i++)
    {
        matrix_sum[i] = matrix[i];
    }
    
    for (i = 0; i < n; i++)
    {
        for (j = 1; j < p; j++)
        {
            matrix_sum[j*n + i] = matrix_sum[(j-1)*n + i] + matrix[j*n + i];
        }
    }
}
*/

