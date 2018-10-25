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

#include "mex.h"
#include "isdiagzeroc.c"
#include "distanceFloydc.c"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    //Variables...
    int n, k, i;
    double * ma;
    int * verts;
    double * dist;
    double inf;
       
    //Chequed parameters...
    
    // number parameters input & output.
    if (nrhs > 2)
        mexErrMsgTxt("This function require no more 2 arguments");

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
    ma = mxGetPr(prhs[0]); 
    if (!isdiagzeroc(ma, n))
         mexErrMsgTxt("Not allow autoconnections");
    
    //Algorithm...    
    ma = mxGetPr(prhs[0]);
     
    //Case: sparse matrix
    if(mxIsSparse(prhs[0]))
         mexErrMsgTxt("The matrix not be a square");
        //shorestpath_dir_sp(ma);
    
    else //Case: matrix
    {
        inf = mxGetInf();
        
        if(nrhs == 2)
        {
            double  * temp;
            
            k = mxGetNumberOfElements(prhs[1]);
            temp = mxGetPr(prhs[1]);
            
            verts = (int *)calloc(n, 4);
            for(i = 0; i < n; i++)
                verts[i] = (int)temp[i]--;;
        }
        else
        {
            k = n;
            verts = (int *)calloc(n, 4);
            for(i = 0; i < n; i++)
                verts[i] = i;
        }
            
        plhs[0] = mxCreateDoubleMatrix(n, n, mxREAL);
        dist = mxGetPr(plhs[0]);
        
        distanceFloydc(dist, ma, n, verts, k, inf, 0);
    }
}