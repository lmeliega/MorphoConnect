#include "mex.h"
//#include "surface_neighborVerticesc.c"

//Hacerlo despues utilizando matriz sparse...Queda mucho mas optimo...

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    /*Variables */
    
    //In
    double * faces;
    int nV;
    int nF;
    
    //Out
    double * vv;
    double * fv;
    double * nvv;
    double * nfv;
    
    //Temp
    int temp;
    int i, j;
    bool c; 
    int ind;
    double * indv1;
    double * indv2;
    int * contf;
    int * contv;
    mxArray * tempArr[4];
          
    /*Chequed parameters*/
    
    // number parameters input & output.
    if (nrhs != 2)
        mexErrMsgTxt("Too many input arguments");
    else if (nlhs > 4)
        mexErrMsgTxt("Too many output arguments");
    
    // data type
    if (!(mxIsNumeric(prhs[0]))|| !(mxIsNumeric(prhs[1])))
        mexErrMsgTxt("Invalid data type (Only numerics)");
        
    /*Algorithm...*/
    
    nF = mxGetM(prhs[0]);
    faces = mxGetPr(prhs[0]);
    
    nV = (int)mxGetScalar(prhs[1]);
        
    //Ver el numero de triangulos vecinos de cada vertice.Eso sirve para 
    //decir el numero maximo de vertices vecinos (a lo sumo el doble  de 
    //los triangulos).Mejorar todo este algoritmo usando matrices sparse.
        
    tempArr[0] = mxCreateDoubleMatrix(nV, 1, mxREAL); 
    nfv = mxGetPr(tempArr[0]); //numero de faces vecinas a cada vertice
    
    for(i = 0; i < nF; i++)
    {
       nfv[(int)faces[i] - 1]++;
       nfv[(int)faces[i + nF] - 1]++;
       nfv[(int)faces[i + nF * 2] - 1]++;
    }   
    
    temp = (int)nfv[0]; //numero maximo de faces vecinos
    for(i = 1; i < nV; i++)
        if (nfv[i] > temp)
            temp = (int)nfv[i];
       
    plhs[0] = mxCreateDoubleMatrix(nV, temp * 2, mxREAL); 
    vv = mxGetPr(plhs[0]); //vertices vecinos de cada vertice
    
    plhs[1] = mxCreateDoubleMatrix(nV, temp, mxREAL); 
    fv = mxGetPr(plhs[1]); //faces vecinas de cada vertice
    
    plhs[2] = mxCreateDoubleMatrix(nV, 1, mxREAL); 
    nvv = mxGetPr(plhs[2]); //numero de vertices vecinos de cada vertice
    
    plhs[3] = tempArr[0]; //numero de faces vecinas de cada vertice
    
    contf = (int *)malloc(4 * nV);
    contv = (int *)malloc(4 * nV);
    
    for(i = 0; i < nV; i++)
    {
        contv[i] = 0;
        contf[i] = 0; 
    }
    
    indv1 = (double *)malloc(8 * 6);
    indv2 = (double *)malloc(8 * 6);
    
    for(i = 0; i < 6; i++)
    {
        indv1[i] = 0;
        indv2[i] = 0; 
    }

    for(i = 0; i < nF; i++)
    {         
       //faces       
       fv[(int)faces[i] - 1 + nV * (int)contf[(int)faces[i] - 1]] = i + 1;
       contf[(int)faces[i] - 1]++;
       
       fv[(int)faces[i + nF] - 1 + nV * (int)contf[(int)faces[i + nF] - 1]] = i + 1;
       contf[(int)faces[i + nF] - 1]++;
       
       fv[(int)faces[i + nF * 2] - 1 + nV * (int)contf[(int)faces[i + nF * 2] - 1]] = i + 1;
       contf[(int)faces[i + nF * 2] - 1]++;
       
       //vertices
       indv1[0] = faces[i];
       indv1[1] = faces[i];
       indv1[2] = faces[i + nF];
       indv1[3] = faces[i + nF];
       indv1[4] = faces[i + nF * 2];
       indv1[5] = faces[i + nF * 2];
       
       indv2[0] = faces[i + nF];
       indv2[1] = faces[i + nF * 2];
       indv2[2] = faces[i];
       indv2[3] = faces[i + nF * 2];
       indv2[4] = faces[i];
       indv2[5] = faces[i + nF];
        
       //mexPrintf("%s%d\t%s%d\n", "Faces: ", i, " :", i);
       
       for(j = 0; j < 6; j++)
       {
           ind = 0;
           c = true;
           while(ind < contv[(int)indv1[j] - 1])
           {              
               if (vv[(int)(indv1[j] - 1 + nV * ind)] == indv2[j])
               {
                    c = false;
                    break;
               }
               ind++;
           }
           
           if(c)
           {
               nvv[(int)indv1[j] - 1]++;
               vv[(int)(indv1[j] - 1 + nV * (int)contv[(int)indv1[j] - 1])] = indv2[j];
               contv[(int)indv1[j] - 1]++; 
           }
       }
    }
}