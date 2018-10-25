//Function: shorestpath_dir (Caminos minimos) 
//Description: Calcula la longitud de los caminos minimos entre todos los 
//             pares de vertices de un grafo dirigido o no(en cuyo caso la 
//             matriz de salida es simetrica), pesado o binario (en cuyo 
//             caso cuando no exista conexion entre 2 vertices i, j, 
//             m[i, j] = NaN o Inf, no 0, puesto que se contempla un grafo 
//             pesado con costo 0.
//             Floyd's algorithm. 
//Parameters:
//  In:
//      matrix: n x n (Data type: numerical)
//  Out:
//      matrix_mp: n x n (Data type: numerical). Simetrica para grafos no 
//                       dirigidos

#include "matrix.h"
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int n, i, j, k;
    double * ma;
    double * sp;
    double inf;
    mxArray * temp;
    
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
    
    n = mxGetM(prhs[0]);
    if(n != mxGetN(prhs[0]))
        mexErrMsgTxt("The matrix must be a square");
    
    // diagonal with zeros (not autoconnections)
//     isdiagzero(1, temp, 1, prhs);
//     if (!(bool *)mxGetPr(temp))
//          mexErrMsgTxt("Not allow autoconnections");
    
    //Algorithm...    
    ma = mxGetPr(prhs[0]);
     
    //Case: sparse matrix
    if(mxIsSparse(prhs[0]))
         mexErrMsgTxt("The matrix not be a square");
        //shorestpath_dir_sp(ma);
    
    else //Case: matrix
    {
        inf = mxGetInf();
        plhs[0] = mxCreateDoubleMatrix(n, n, mxREAL);
        sp = mxGetPr(plhs[0]);
	
        for (i = 0; i < n * n; i++)
            if ((!mxIsInf(ma[i]) &&(!mxIsNaN(ma[i]))))
                sp[i] = ma[i];
            else
                sp[i] = inf;
            
        j = 0;
        for (i = 0; i < n; i++)
        {
            sp[n * i + j] = 0;
            j++;
        }
        
        for (k = 0; k < n; k++) //nodes
            for (i = 0; i < n; i++) //row
                for (j = 0; j < n; j++) //column
                    if (sp[n * i + k] + sp[n * k + j] < sp[n * i + j])
                        sp[n * i + j] = sp[n * i + k] + sp[n * k + j];
    }
}